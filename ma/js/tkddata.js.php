<?php

//#
$mysql = mysqli_connect('localhost', 'root', '', 'fusionmartialart');
if (!$mysql || $mysql->connect_error) { die('Connect Error (' . $mysqli->connect_errno . ') ' . $mysqli->connect_error); }

//mysql_select_db('fusionmartialarts', $mysql);
$mysql->query("set character_set_client='utf8'");
$mysql->query("set character_set_results='utf8'");
$mysql->query("set collation_connection='utf8_general_ci'");

$oEncyclopediaCount = $mysql->query('SELECT `PatternID`, `Count`, `Text` FROM `EncyclopediaCount` WHERE EncyclopediaID = 3 ORDER BY `PatternID`, `Count`');
$oPatternCount = $mysql->query('SELECT `PatternID`, `Count`, `CountOrder`, `Counted`, `Motion`, `BodyMovement`, `EyesTo`, `EyesDiagramDirection`, `FeetInMotion`, `LegLR`, `LegSection`, `LegTechniqueOfficial` AS `LegTechnique`, `IsLegTechniqueFlying`, `LegTo`, `LegDiagramDirection`, `LegTool`, `LegLineOfAttack`, `ArmLR`, `ArmSection`, `ArmTechniqueOfficial` AS `ArmTechnique`, `ArmTo`, `ArmDiagramDirection`, `ArmTool`, `ArmLineOfAttack`, `IsArmToolTwin`, `Facing`, `MotionID`, `BodyMovementID`, `LegTechniqueID`, `ArmTechniqueID`, `LegTechniqueType`, `ArmTechniqueType`, `OriginalTechniqueID`, `OriginalTechniqueAppendage`, `OriginalTechniqueOfficial` AS `OriginalTechnique`, `IsToFacing`, `MotionID`, `Note` FROM `viewPattern` ORDER BY `PatternID`, `Count`, `CountOrder`');
$oPattern = $mysql->query('SELECT * FROM `Patterns` WHERE `GupLevel` IS NOT NULL ORDER BY `SortOrder`');
$oTechniquesUsed = $mysql->query('SELECT * FROM `viewPatternTechniqueCounts` ORDER BY SortOrder, Kind, PreviousUseCountAll, PreviousSectionUseCount, PreviousToolUseCount, PreviousUseCount');
$oLegTechniques = $mysql->query("SELECT `ID`, `OfficialName` AS `Name` FROM `Techniques` WHERE `Appendage` = 'Leg' OR `Appendage` IS NULL ORDER BY `OfficialName`");
$oArmTechniques = $mysql->query("SELECT `ID`, `OfficialName` AS `Name` FROM `Techniques` WHERE `Appendage` = 'Arm' OR `Appendage` IS NULL ORDER BY `OfficialName`");
$oBodyMovements = $mysql->query('SELECT `ID`, `Name` FROM `Movements` ORDER BY `Name`');
$oMotions = $mysql->query('SELECT `ID`, `Name` FROM `Motions` ORDER BY `Name`');
$oPatternList = $mysql->query('SELECT `ID`, `Key`, `Name`, `Diagram` FROM `Patterns` WHERE `IsOfficial` = 1 OR `IsOfficial` IS NULL ORDER BY `SortOrder`');
$oStances = $mysql->query('SELECT * FROM `viewStances` ORDER BY `SortOrder`');

function SQLToJSON($oData) {
	$aColumns = array();

	$sReturn = "[\n";

	if (is_resource($oData) && mysqli_num_rows($oData)) {
		//# Traverse the passed $oData as a recordset
		while ($row = $oData->fetch_array(MYSQLI_ASSOC)) {
			if (empty($aColumns)) {
				$aColumns = array_keys($row);
			}

			$sReturn .= '	{';

			for ($i = 0; $i < count($aColumns); $i++) {
				$sReturn .= '"' . $aColumns[$i] . '": "' . str_replace('"', '\"', $row[$aColumns[$i]]) . '", ';
			}

			$sReturn .= "},\n";
		}
		$oData->data_seek(0);
	}

	$sReturn .= "]\n";
	return $sReturn;
}


function SQL2JSON($oData) {
	$sReturn = "[\n";

	if (is_resource($oData) && mysqli_num_rows($oData)) {
		//# Traverse the passed $oData as a recordset
		while ($row = $oData->fetch_array(MYSQLI_ASSOC)) {
			$sReturn .= '	' + json_encode($row) + ",\n";
		}
		$oData->data_seek(0);
	}

	return $sReturn . "]\n";
}


function SQLToFn($oData) {
	//#
	return JavaScriptDataFn('inline', SQL2JavaScriptData($oData));
}

function SQL2JavaScriptData($oData) {
	$sReturn = '{$type:"datagrid",names:[],length:0}';

	if ($oData && mysqli_num_rows($oData)) {
		$sReturn = "{";

		//#
		if ($row = $oData->fetch_array(MYSQLI_ASSOC)) {
			//#
			$sReturn .= 'names:' . strtolower(json_encode(array_keys($row))) . ',';
			$i = 0;
			$oData->data_seek(0);

			//# Traverse the passed $oData as a recordset
			while ($row = $oData->fetch_array(MYSQLI_NUM)) {
				$sReturn .= $i++ . ':' . json_encode($row) . ',';
			}
			$oData->data_seek(0);
		}

		$sReturn .= 'length:' . $i . '}';
	}

	return $sReturn;
}

function JavaScriptDataFn($type, $sJSData) {
	$sReturn = '';
    //# R=row, C=column, V=value, d=data (either via {{arg}}ument or injected into the source as a {{var}}iable)
	$sJS = 'function(R,C,V{{arg}}){' .
                'var i,j,v,' .                          //# "Default" our return v(alue) to undefined
                	'{{var}}' .
                	'n=(C+"").toLowerCase(),' .         //# .toLowerCase the C(olumn) n(ame) (if any)
					'r=parseInt(R,10),' .               //# parseInt the R(ow) number (if any)
                    'c=parseInt(C,10),' .               //# parseInt the C(olumn) number (if any)
					'h=function(D){' .                  //# Setup the h(ash) builder function, with D=data
						'if(!D){return;};' .
						'var H={};' .
						'for(j=0;j<D.length;j++){' .
							'H[d.names[j]]=D[j];' .
						'}' .
						'return H;' .
					'}' .
                ';' .

                'if(isNaN(r)){r=-1;}' .                 //# If the parseInt of the R(ow) number failed, set r = -1
                'if(isNaN(c)){c=d.names.indexOf(n);}' . //# If the parseInt of the C(olumn) number failed, assume its a ColumnName and get its index

				'if(d&&d.length>0&&d.names){' .         //# If the {{arg}} or {{var}} d(ata) is valid
				     'if(r>-1){' .                      //# If we have a r(ow) number
				         'if(C===undefined){' .         //# If the caller didn't pass in a C(olumn) identifier, then return the entire row as a h(ash)
				             'v=h(d[r]);' .
				         '}' .
				 		'else if(c>-1){' .              //# Else if the caller did pass in a C(olumn) identifier, then return the R(ow).C(olumn) value
				     		'v=d[r][c];' .
				 		'}' .
				     '}' .
				     'else if(R===undefined){' .        //# Else if the didn't pass in a R(ow) identifier, then return all of our d(ata) as a h(ash)
				 		'v=[];' .
				 		'for(i=0;i<d.length;i++){' .
				         	'v.push(h(d[i]));' .
				         '}' .
				     '}' .
				     'else if(R=="?"){' .               //# Else if the caller passed in a "?" for the R(ow) identifier
						'v=[];' .
				        'if(V!==undefined){' .          //# If a search V(alue) was passed in, .toLowerCase it and .push any non-case-sensetive matches into our return v(alue) as a h(ash)
					        'V=(V+"").toLowerCase();' .
				        	'for(i=0;i<d.length;i++){' .
				            	'if((d[i][c]+"").toLowerCase()==V){' .
				                	'v.push(h(d[i]));' .
				        		'}' .
				        	'}' .
				    	'}' .
				    	'else if(c>-1){' .              //# Else if a C(olumn) identifier was passsed in, .push all of those C(olumn)s into our reutrn v(alue)
				        	'for(i=0;i<d.length;i++){' .
				                'v.push(d[i][c]);' .
				        	'}' .
				    	'}' .
				    '}' .
				    'else if(R=="!"){' .                //# Else if the caller passed in a "!" for the R(ow) identifier, return our d(ata) in its raw format
				    	'v=d;' .
				    '}' .
				    'else if(R=="{}"){' .               //# Else if the caller passed in a "{}" for the R(ow) identifier, return a blank row
						  'v={};' .
						  'for(j=0;j<d.names.length;j++){' .
							  'v[d.names[j]]=null;' .
						  '}' .
				    '}' .
				'}' .

                'return v;' .
            '}'
	;

	//#
	switch(strtolower($type)) {
		case 'callcentral':
			$sReturn = 'function(R,C,V){return this.$find(R,C,V,' . $sJSData . ')}';
			break;
		case 'central':
			$sReturn = '$find:' . str_replace('{{arg}}', ',d', $sJS);
			$sReturn = str_replace('{{var}}', '', $sReturn);
			break;
		case 'inline':
			$sReturn = str_replace('{{arg}}', '', $sJS);
			$sReturn = str_replace('{{var}}', "d=$sJSData,", $sReturn);
			break;
	}

	return $sReturn;
}


function ArrayToJSON($aData) {
	$sReturn = '[';

	for ($i = 0; $i < count($aData); $i++) {
		$sReturn .= '"' . str_replace('"', '\"', $aData[$i]) . "\",\n";
	}

	return $sReturn . ']';
}


//header('Content-Type: application/json');
//echo json_encode($oPatternCount);
//echo json_encode($oPatternCount);

header('Content-Type: application/javascript');
echo $_GET['var'] . " = {\n";
echo '    $version:"' . $_GET['version'] . "\",\n";
echo '    ' . JavaScriptDataFn('central', '') . ",\n";
echo '    patterns:' . JavaScriptDataFn('callcentral', SQL2JavaScriptData($oPattern)) . ",\n";
echo '    patterncounts:' . JavaScriptDataFn('callcentral', SQL2JavaScriptData($oPatternCount)) . ",\n";
echo '    techniquecounts:' . JavaScriptDataFn('callcentral', SQL2JavaScriptData($oTechniquesUsed)) . ",\n";

echo '    legtechniques:' . JavaScriptDataFn('callcentral', SQL2JavaScriptData($oLegTechniques)) . ",\n";
echo '    armtechniques:' . JavaScriptDataFn('callcentral', SQL2JavaScriptData($oArmTechniques)) . ",\n";

echo '    bodymovements:' . JavaScriptDataFn('callcentral', SQL2JavaScriptData($oBodyMovements)) . ",\n";
echo '    motions:' . JavaScriptDataFn('callcentral', SQL2JavaScriptData($oMotions)) . ",\n";

echo '    patternlist:' . JavaScriptDataFn('callcentral', SQL2JavaScriptData($oPatternList)) . ",\n";
echo '    stances:' . JavaScriptDataFn('callcentral', SQL2JavaScriptData($oStances)) . ",\n";

echo '    encyclopedia:' . JavaScriptDataFn('callcentral', SQL2JavaScriptData($oEncyclopediaCount)) . "\n";
echo "};\n";

?>
