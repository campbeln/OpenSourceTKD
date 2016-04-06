<?php

$mysql = mysql_connect("localhost", "root", "");
if (!$mysql) {
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("fusionmartialart", $mysql);

// $oTechniques = mysql_query("SELECT ID, OfficialName FROM Techniques ORDER BY OfficialName");
$oTechniquesLeg = mysql_query("SELECT ID, OfficialName AS Name FROM Techniques WHERE Appendage = 'Leg' OR Appendage IS NULL ORDER BY OfficialName");
$oTechniquesArm = mysql_query("SELECT ID, OfficialName AS Name FROM Techniques WHERE Appendage = 'Arm' OR Appendage IS NULL ORDER BY OfficialName");

$oMovements = mysql_query("SELECT ID, Name FROM Movements ORDER BY Name");
$oPatterns = mysql_query("SELECT ID, CONCAT(Name, ' (', GupLevel, ')') AS Name FROM Patterns ORDER BY SortOrder");
$oMotions = mysql_query("SELECT ID, Name FROM Motions ORDER BY Name");
$aDirection = array('12:00','1:00','2:00','3:00','4:00','5:00','6:00','7:00','8:00','9:00','10:00','11:00');
$aDiagramDirection = array('A','B','C','D','E','F','AC','AD','BC','BD','BF','CE','CF','DE','DF','~A','~B','~C','~D','~E','~F');

$aToolLeg = array('Ball of Foot','Heel','Back of Heel','Instep','Side Instep','Foot Sword','Knee');
$aToolArm = array('Forefist','Side Fist','Backfist','Middle-Knuckle Fist','Foreknuckle Fist','Open Fist','X-Fist','Inner Forearm','Outer Forearm','Knife-Hand','Reverse Knife-Hand','X-Knife-Hand','Palm','Palm Heel','Alternate Palm','X-Palm','Arch Hand','Backhand','Elbow','Side Elbow','Back Elbow','Fingertip','Straight Fingertip','Flat Fingertip','Upset Fingertip','Double Finger');

$aLR = array('L','R');
$aSectionLeg = array('Low','Mid','High');
$aSectionArm = array('Low','Mid','High','L Mid/R High','R Mid/L High');
$aFacing = array('F','H','S','RH','RS');

$bPrintLabel = false;

//# 
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	$aColumnNames = array('Count', 'CountOrder', 'Counted', 'MotionID', 'BodyMovementID', 'EyesTo', 'EyesDiagramDirection', 'FeetInMotion', 'LegLR', 'LegSection', 'LegTechniqueID', 'LegTo', 'LegDiagramDirection', 'LegTool', 'Facing', 'ArmLR', 'ArmSection', 'ArmTechniqueID', 'ArmTo', 'ArmDiagramDirection', 'ArmTool', 'ArmToolIsTwin', 'Note');
	$sSQL = "INSERT INTO PatternCount (PatternID, " . join(',', $aColumnNames) . ") VALUES\n";
	$iPatternID = $_POST['PatternID'];
	$i = 1;

	while (strlen($_POST['Tracker_' . $i]) > 0 && strlen($_POST['Count_' . $i]) > 0) {
		$sSQL .= "(" . $iPatternID;
		
		for ($j = 0; $j < sizeof($aColumnNames); $j++) {
			$sValue = $_POST[$aColumnNames[$j] . '_' . $i];
			$sSQL .= "," . (strlen($sValue) > 0 ? "'" . mysql_real_escape_string($sValue) . "'" : "NULL");
		}
		
		$sSQL .= "),\n";
		$i++;
	}

	print("<pre>" . substr($sSQL, 0, -2) . ";</pre>");
}

// mysql_query(substr($sSQL, 0, -2) . ";");
// mysql_close($mysql);


function SQLToJSON($oData, $sName) {
	$aColumns = array();

	$sReturn = "var " . $sName . " = [\n";

	if (is_resource($oData) && mysql_num_rows($oData)) {
		//# Traverse the passed $oData as a recordset
		while ($row = mysql_fetch_assoc($oData)) {
			if (empty($columns)) {
				$columns = array_keys($row);
			}

			$sReturn .= "	{";

			for ($i = 0; $i < count($columns); $i++) {
				$sReturn .= "'" . $columns[$i] . "': '" . str_replace("'", "\'", $row[$columns[$i]]) . "', ";
			}

			$sReturn .= "},\n";
		}
		mysql_data_seek($oData, 0);
	}

	$sReturn .= "];\n";
	return $sReturn;
}

function ArrayToJSON($aData, $sName) {
	$sReturn = "var " . $sName . " = [\n";

	for ($i = 0; $i < count($aData); $i++) {
		$sReturn .= "	'" . str_replace("'", "\'", $aData[$i]) . "',\n";
	}

	$sReturn .= "];\n";
	return $sReturn;
}


function Select($sName, $oData, $sValue, $sDescription) {
	//# Setup the start of the SELECT tag (including a LABEL and empty option)
	$sReturn = ($bPrintLabel ? "<label for='" . $sName . "'>" . $sName . "</label>\n" : "");
	$sReturn .= "<select name='" . $sName . "' id='" . $sName . "'>\n";
	$sReturn .= "    <option value=''></option>\n";
	
	//# Collect the POST'd value (if any)
	$sPostedValue = $_POST[$sName];

	//# 
	if (strlen($sValue) > 0 && strlen($sDescription) > 0) {
		if (is_resource($oData) && mysql_num_rows($oData)) {
			//# Traverse the passed $oData as a recordset, appending a new OPTION for each entry (testing for SELECTED as we go)
			while ($row = mysql_fetch_array($oData)) {
				$sSelected = ($sPostedValue == $row[$sValue] ? " selected='selected'" : "");
				$sReturn .= "    <option value='" . $row[$sValue] . "'" . $sSelected . ">" . $row[$sDescription] . "</option>\n";
			}
			mysql_data_seek($oData, 0);
		}
	}
	//# 
	else {
		for ($i = 0; $i < sizeof($oData); $i++) {
			$sSelected = ($sPostedValue == $oData[$i] ? " selected='selected'" : "");
			$sReturn .= "    <option value='" . $oData[$i] . "'" . $sSelected . ">" . $oData[$i] . "</option>\n";
		}
	}
	
	//# Return the above determined sReturn (plus the ending SELECT tag) to the caller
	return $sReturn . "\n</select>";
}

function Text($sName) {
	//# Pass the call off to TextBox() to do the actual work
	return Textbox($sName, '');
}

function Numeric($sName) {
	//# Pass the call off to TextBox() to do the actual work
	return Textbox($sName, "datatype='numeric'");
}

function ReadOnly($sName) {
	//# Pass the call off to TextBox() to do the actual work
	return Textbox($sName, "readonly='readonly'");
}

function Textbox($sName, $sAttributes) {
	//# Build and return the INPUT tag to the caller (including a LABEL and the POST'd value, if any)
	return ($bPrintLabel ? "<label for='" . $sName . "'>" . $sName . "</label>\n" : "") .
		"<input type='text' name='" . $sName . "' id='" . $sName . "' value='" . htmlspecialchars($_POST[$sName]) . "' " . $sAttributes . ">\n"
	;
}

function TextArea($sName) {
	//# Build and return the INPUT tag to the caller (including a LABEL and the POST'd value, if any)
	return ($bPrintLabel ? "<label for='" . $sName . "'>" . $sName . "</label>\n" : "") .
		"<textarea name='" . $sName . "' id='" . $sName . "'>" . htmlspecialchars($_POST[$sName]) . "</textarea>\n"
	;
}

function Check($sName) {
	return ($bPrintLabel ? "<label for='" . $sName . "'>" . $sName . "</label>\n" : "") .
		"<input type='checkbox' name='" . $sName . "' id='" . $sName . "' " . (htmlspecialchars($_POST[$sName]) == 1 ? "checked" : "") . $sAttributes . ">\n"
	;
}


?>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	<!-- Fusion Scripts -->
    <script type="text/javascript" src="js/jquery-2.0.3.min.js"></script>

	<script type="text/javascript">
        $(document).ready(function () {
			$("[id^=FeetInMotion]").keyup(function() {
				$(this).val(
					$(this).val().replace(/([a-z])/, function(s) {
						return s.toUpperCase();
					})
				);
			});

            $('#GenSQL').click(function() {
                var j, sValue,
					a_sColumnNames = ['Count', 'CountOrder', 'Counted', 'MotionID', 'BodyMovementID', 'EyesTo', 'EyesDiagramDirection', 'FeetInMotion', 'LegLR', 'LegSection', 'LegTechniqueID', 'LegTo', 'LegDiagramDirection', 'LegTool', 'Facing', 'ArmLR', 'ArmSection', 'ArmTechniqueID', 'ArmTo', 'ArmDiagramDirection', 'ArmTool', 'ArmToolIsTwin', 'Note'],
					sSQL = "INSERT INTO PatternCount (`PatternID`, `" +  a_sColumnNames.join('`, `') + "`) VALUES\n",
					iPatternID = $('#PatternID').val(),
					i = 0
				;

				for (i = 1; i < 100; i++) {
					if ($('#Tracker_' + i).val() == '' || $('#Count_' + i).val() == '') {
						break;
					}
					
					sSQL += "(" + iPatternID;

					for (j = 0; j < a_sColumnNames.length; j++) {
						sValue = $('#' + a_sColumnNames[j] + '_' + i).val() + '';
						sSQL += ", " + (sValue.length > 0 && sValue != 'undefined' ? "'" + mysql_real_escape_string(sValue) + "'" : "NULL");
					}
					
					sSQL += "),\n";
				}

				$('#sql').html('<pre>' + sSQL.substr(0, sSQL.length - 2) + ';</pre>');

                return false;
            });
        });

		function mysql_real_escape_string(str) {
			return str.replace(/[\0\x08\x09\x1a\n\r"'\\\%]/g, function (char) {
				switch (char) {
					case "\0":
						return "\\0";
					case "\x08":
						return "\\b";
					case "\x09":
						return "\\t";
					case "\x1a":
						return "\\z";
					case "\n":
						return "\\n";
					case "\r":
						return "\\r";
					case "\"":
					case "'":
					case "\\":
					case "%":
						return "\\"+char; // prepends a backslash to backslash, percent,
										  // and double/single quotes
				}
			});
		}
	</script>

	<style type="text/css">
		.destroy {
			display: none;
		}
	
		SELECT[id^=MotionID_],
		SELECT[id^=BodyMovmentID_],
		SELECT[id^=LegTechniqueID_],
		SELECT[id^=ArmTechniqueID_] {
		}
	
		#DoSan_Example {
			font-size: 70%;
			line-height: 100%;
			width: 97%;
			margin: 15px auto 0 auto;
		}
			#DoSan_Example SELECT,
			#DoSan_Example TEXTAREA,
			#DoSan_Example INPUT {
				width: 30px;
				border: 1px solid gray;
				float: none !important;
			}
				#DoSan_Example SELECT {
					height: 16px;
					font-size: 80% !important;
					width: auto;
				}
				#DoSan_Example TEXTAREA {
					height: 16px;
					font-size: 80% !important;
					width: 99%;
					height: 40px !important;
				}
				#DoSan_Example .FeetInMotion INPUT {
					width: 60px;
				}
			#DoSan_Example .count {
				font-weight: bold;
			}
			#DoSan_Example TH {
				padding: 0 10px 5px 0;
			}
				#DoSan_Example TH:last-child {
					padding: 0;
				}
			#DoSan_Example TD {
				white-space: nowrap;
			}
			#DoSan_Example TBODY.even {
				background-color: #dddddd;
			}
				#DoSan_Example TBODY.odd {
					background-color: white;
				}
				#DoSan_Example TBODY,
				#DoSan_Example THEAD {
					border-bottom: 3px solid black;
				}
            #DoSan_Example SPAN {
                color: #C0504D;
                border-bottom: dashed 1px #C0504D;
            }
			#DoSan_Example TR:hover {
				background: lightyellow;
			}
	</style>
</head>
<body>
	<div id='sql'></div>
    
	<form method='POST' action='index.php'>
        <table id="DoSan_Example">
            <thead>
                <tr>
                    <th>
                        <strong>Verbal</strong> Count
                    </th>
                    <th>
                        Body Movement (Eyes To; Diagram Direction)
                    </th>
                    <th>
                        Feet In Motion
                    </th>
                    <th>
                        Leg &nbsp; Section &nbsp; <strong>Leg Technique</strong> (Stance To; Diagram Direction)
                    </th>
                    <th>
                        Arm &nbsp; Section &nbsp; <strong>Arm Technique</strong> (Arm Technique To; Diagram Direction)
                    </th>
                    <th class="primary">
                        <strong class="face">☺</strong>ing
                    </th>
                </tr>
            </thead>
		<tfoot>
            	<tr colspan='99'>
					<? print(Select('PatternID', $oPatterns, 'ID', 'Name')); ?>
					<input id='GenSQL' type="button" value='Gen SQL' />
            	</tr>
			</tfoot>

			<? for ($i = 1; $i < 2; $i++) { ?>
            <tbody <? print($i % 2 ? "class='odd'" : "class='even'") ?>>
                <tr>
                    <td class="count"><? print(Numeric('Count_' . $i)); print(Numeric('CountOrder_' . $i)); print(Check('Counted_' . $i)); ?></td>
                    <td><? print(Select('MotionID_' . $i, $oMotions, 'ID', 'Name')); print(Select('BodyMovementID_' . $i, $oMovements, 'ID', 'Name')); ?><br/>(<? print(Select('EyesTo_' . $i, $aDirection, '', '')); ?> ; <? print(Select('EyesDiagramDirection_' . $i, $aDiagramDirection, '', '')); ?> )</td>
                    <td class='FeetInMotion'><? print(Text('FeetInMotion_' . $i)); ?></td>
                    <td><? print(Select('LegLR_' . $i, $aLR, '', '')); print(Select('LegSection_' . $i, $aSectionLeg, '', '')); ?> <strong><? print(Select('LegTechniqueID_' . $i, $oTechniquesLeg, 'ID', 'Name')); ?></strong><br/><? print(Select('ToolLeg_' . $i, $aToolLeg, '', '')); ?> ( <? print(Select('LegTo_' . $i, $aDirection, '', '')); ?> ; <? print(Select('LegDiagramDirection_' . $i, $aDiagramDirection, '', '')); ?> )</td>
                    <td><? print(Select('ArmLR_' . $i, $aLR, '', '')); print(Select('ArmSection_' . $i, $aSectionArm, '', '')); ?> <strong><? print(Select('ArmTechniqueID_' . $i, $oTechniquesArm, 'ID', 'Name')); ?></strong><br/><? print(Select('ToolArm_' . $i, $aToolArm, '', '')); print(Check('ArmToolIsTwin_' . $i)); ?> ( <? print(Select('ArmTo_' . $i, $aDirection, '', '')); ?> ; <? print(Select('ArmDiagramDirection_' . $i, $aDiagramDirection, '', '')); ?> )</td>
                    <td class="facing"><? print(Select('Facing_' . $i, $aFacing, '', '')); ?></td>
                </tr>
            </tbody>
			<? } ?>
        </table>
		

	<textarea>
<? print(SQLToJSON($oTechniquesLeg, 'TechniquesLeg')) ?>
<? print(SQLToJSON($oTechniquesArm, 'TechniquesArm')) ?>
<? print(SQLToJSON($oMovements, 'Movements')) ?>
<? print(SQLToJSON($oPatterns, 'Patterns')) ?>
<? print(SQLToJSON($oMotions, 'Motions')) ?>


<? print(ArrayToJSON($aDirection, 'Direction')) ?>
<? print(ArrayToJSON($aDiagramDirection, 'DiagramDirection')) ?>
<? print(ArrayToJSON($aToolLeg, 'ToolLeg')) ?>
<? print(ArrayToJSON($aToolArm, 'ToolArm')) ?>
<? print(ArrayToJSON($aLR, 'LR')) ?>
<? print(ArrayToJSON($aSectionLeg, 'SectionLeg')) ?>
<? print(ArrayToJSON($aSectionArm, 'SectionArm')) ?>
<? print(ArrayToJSON($aFacing, 'Facing')) ?>
	</textarea>

		
		<!-- fieldset>
			<legend>Pattern Count</legend>
			
			<?
			//print(ReadOnly('ID'));
			print(Select('PatternID', $oPatterns, 'ID', 'Name'));
			print(Numeric('Count'));
			print(Numeric('CountOrder'));

			print(Select('Motion', $oMotions, 'ID', 'Name'));
			//print(Select('Note', $oNotes, 'ID', 'Description'));
			print(Select('BodyMovementID', $oMovements, 'ID', 'Name'));
			print(Select('EyesTo', $aDirection, '', ''));
			print(Select('EyesDiagramDirection', $aDiagramDirection, '', ''));
			print(Text('FeetInMotion'));

			print(Select('LegLR', $aLR, '', ''));
			print(Select('LegSection', $aSection, '', ''));
			print(Select('LegTechniqueID', $oTechniques, 'ID', 'Name'));
			print(Select('LegTo', $aDirection, '', ''));
			print(Select('LegDiagramDirection', $aDiagramDirection, '', ''));

			print(Select('Facing', $aFacing, '', ''));

			print(Select('ArmLR', $aLR, '', ''));
			print(Select('ArmSection', $aSection, '', ''));
			print(Select('ArmTechniqueID', $oTechniques, 'ID', 'Name'));
			print(Select('ArmTo', $aDirection, '', ''));
			print(Select('ArmDiagramDirection', $aDiagramDirection, '', ''));
			
			print(TextArea('Encyclopedia'));
			print(TextArea('Littleton'));
			?>
		</fieldset -->
	</form>
</body>
</html>