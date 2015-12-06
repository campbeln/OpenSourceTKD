<?php

$mysql = mysql_connect("localhost", "root", "");
if (!$mysql) {
	die('Could not connect: ' . mysql_error());
}

mysql_select_db("fusionmartialarts", $mysql);
mysql_query("SET NAMES utf8;");
$oViewPattern = mysql_query("SELECT * FROM viewPattern WHERE PatternID = " . (int)$_GET['pattern']);
$oPattern = mysql_fetch_array(mysql_query("SELECT * FROM Patterns WHERE ID = " . (int)$_GET['pattern']));
mysql_close($mysql);


function FormatLine($a_oRows, $sColumn, $bIncludeNULLs) {
	$a_sColumn = GetColumnsAsArray($a_oRows, $sColumn, $bIncludeNULLs);
	$sReturn = "";
	
	if (sizeof($a_sColumn) > 1 || (sizeof($a_sColumn) == 1 && strlen($a_sColumn[0]) > 0)) {
		$sReturn = "<div>" . join("</div><br/><div>", $a_sColumn) . "</div>";
	}
	
	return $sReturn;
}

function GetColumnsAsArray($a_oRows, $sColumn, $bIncludeNULLs) {
	$a_oReturn = array();
	
	//# Traverse the passed $a_oRows
	for ($i = 0; $i < sizeof($a_oRows); $i++) {
		//# If the current value isn't NULL, append it into our $a_oReturn value
		if ($bIncludeNULLs || ! is_null($a_oRows[$i][$sColumn])) {
			array_push($a_oReturn, $a_oRows[$i][$sColumn]);
		}
	}
	
	return $a_oReturn;
}


function FormatTechnique($a_oRows, $sTechnique, $sType, $sTool, $sTo, $sDiagramDirection, $sLR, $sSection, $sSectionInferred, $sLineOfAttack, $sIsArmToolTwin) {
	$sReturn = "";
	$sTwin = '';
	$iLength = sizeof($a_oRows);
	
	//# Traverse the passed $a_oRows, appending each entry onto our $sReturn value (handling the last entry seperate to avoid the last </br>)
	for ($i = 0; $i < $iLength; $i++) {
		//# Reset the $a_sTemp for this loop, filling it with the present data
		$a_sTemp = array();
		if (strlen($a_oRows[$i][$sLR]) > 0)			{ array_push($a_sTemp, $a_oRows[$i][$sLR]); }
		
		if (strlen($a_oRows[$i][$sSection]) > 0)	{
			if ($a_oRows[$i][$sSectionInferred]) {
				array_push($a_sTemp, '<span>' . $a_oRows[$i][$sSection] . '</span>');
			}
			else {
				array_push($a_sTemp, $a_oRows[$i][$sSection]);
			}
		}
		
		if (strlen($a_oRows[$i][$sTechnique]) > 0) {
			if (strtolower(trim($a_oRows[$i][$sType])) == 'action') {
				array_push($a_sTemp, $a_oRows[$i][$sTechnique]);
			}
			else {
				array_push($a_sTemp, "<strong>" . FormatTechniqueText($a_oRows[$i][$sTechnique]) . "</strong>");
			}
		}
		
		if (strlen($a_oRows[$i][$sTool]) > 0 || strlen($a_oRows[$i][$sLineOfAttack]) > 0) {
			$sTwin = ($a_oRows[$i][$sIsArmToolTwin] ? 'Twin ' : '');
			
			array_push($a_sTemp, FormatDirection($sTwin . $a_oRows[$i][$sTool], $a_oRows[$i][$sLineOfAttack], true));
		}
		
		if (strlen($a_oRows[$i][$sTo]) > 0 || strlen($a_oRows[$i][$sDiagramDirection]) > 0) {
			array_push($a_sTemp, FormatDirection($a_oRows[$i][$sTo], $a_oRows[$i][$sDiagramDirection], false));
		}

		//# If we have data to render, append it onto our $sReturn value
		if (sizeof($a_sTemp) > 0) {
			$sReturn = $sReturn . "<div>" . join(" ", $a_sTemp) . "</div>" . ($i < $iLength - 1 ? "\n<br/>" : "");
		}
	}
	
	return $sReturn;
}


function FormatTechniqueText($sTechnique) {
	//# Replace {}'s with <span/> so the text is properly formatted
	return str_replace('{', '<span>', str_replace('}', '</span>', $sTechnique));
}

function FormatBodyMovement($a_oRows, $sMotion, $sBodyMovement, $sTo, $sDiagramDirection) {
	$sReturn = "";
	$iLength = sizeof($a_oRows);
	
	//# Traverse the passed $a_oRows, appending each entry onto our $sReturn value (handling the last entry differently to avoid the last </br>)
	for ($i = 0; $i < $iLength; $i++) {
		//# Reset the $a_sTemp for this loop, filling it with the present data
		$a_sTemp = array();
		
		if (strlen($a_oRows[$i][$sMotion]) > 0)			{ array_push($a_sTemp, $a_oRows[$i][$sMotion]); }
		
		if (strlen($a_oRows[$i][$sBodyMovement]) > 0)	{ array_push($a_sTemp, '<strong>' . $a_oRows[$i][$sBodyMovement] . '</strong>'); }
		
		if (strlen($a_oRows[$i][$sTo]) > 0 || strlen($a_oRows[$i][$sDiagramDirection]) > 0) {
			array_push($a_sTemp, FormatDirection($a_oRows[$i][$sTo], $a_oRows[$i][$sDiagramDirection], false));
		}

		//# If we have data to render, append it onto our $sReturn value
		if (sizeof($a_sTemp) > 0) {
			$sReturn = $sReturn . "<div>" . join(" ", $a_sTemp) . "</div>" . ($i < $iLength - 1 ? "\n<br/>" : "");
		}
	}

	return $sReturn;
}



function FormatDirection($sPrefix, $sSuffix, $bUseSquare) {
	$sReturn = "";

	//# 
	if ($sPrefix != "") {
		$sReturn = $sPrefix;
	}
	
	//# 
	if ($sSuffix != "") {
		if (substr($sSuffix, 0, 1) == '~') { $sSuffix = '<span>' . $sSuffix . '</span>'; }
		$sReturn = ($sReturn != "" ? $sReturn . "; " . $sSuffix : $sSuffix);
	}
	
	//# 
	if ($bUseSquare) {
		return ($sReturn != "" ? "[" . $sReturn . "]" : "");
	}
	else {
		return ($sReturn != "" ? "(" . $sReturn . ")" : "");
	}
}

?>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	<!-- Fusion Scripts -->
    <script type="text/javascript" src="/js/jquery-1.7.1min.js"></script>
    <script type="text/javascript" src="/js/jquery.cn.js"></script>
    <script type="text/javascript" src="/js/cn.fusion.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <!--[if lte IE 8]> <link rel="stylesheet" type="text/css" href="/css/main.lte_ie8.css"> <![endif]-->

	<style>
        .rotate270 > DIV {       
            -moz-transform: rotate(270deg);                 /*FF*/
            -moz-transform-origin: left bottom;
            -o-transform: rotate(270deg);                   /*Opera*/
            -o-transform-origin: left bottom;
            -webkit-transform: rotate(270deg);              /*Safari, Chrome*/
            -webkit-transform-origin: left bottom;
            -ms-transform: rotate(270deg);                  /*IE9*/
            -ms-transform-origin: left bottom;
            transform: rotate(270deg);                      /*CSS3 default*/
            transform-origin: left bottom;

            background-color: transparent;
            white-space: nowrap;
            zoom: 1;

            position: absolute;
        }

		/* Generic Table Styles */
		TABLE {
            border-width: 0px;
            border-spacing: 0px;
            border-collapse: collapse;
            background-color: white;
            font-family: Calibri, Arial;
		}
		    TABLE THEAD TH {
		        padding-right: 5px;
		        padding-left: 5px;
		    }
		    TABLE TD,
		    TABLE TH {
	            padding: 3px;
	            font-weight: normal;
		    }


		/* Patterns Table Styles */
		.patterns {
		    margin: 50px 0 0 50px;
            position: relative;
		}
            .patterns THEAD {
                font-size: 80%;
                font-style: italic;
                color: gray;
                text-align: left;
                border-bottom: 1px solid black !important;
            }
                .patterns THEAD .face {
                    font-size: 150%;
                    line-height: 10px;
                }
                .patterns TD {
                    font-style: italic;
                    color: gray;
                }
                	.patterns TD DIV {
						display: inline;
						white-space: nowrap;
					}
            .patterns CAPTION DIV {
                top: 520px;
		        width: 580px;
		        font-family: Calibri, Arial, Helvetica, sans-serif;
		        text-align: right;
	        }
                .patterns CAPTION STRONG {
    		        font-size: 200%;
                }


            .patterns .count,
            .patterns .facing,
            .patterns .primary,
            .patterns STRONG {
                font-style: normal;
                font-weight: normal;
                color: black;
            }
                .patterns .count,
                .patterns .number,
                .patterns .facing {
                    text-align: center;
                }
            .patterns .addedtext,
            .patterns SPAN {
                color: #C0504D;
                border-bottom: dashed 1px #C0504D;
            }
		    .patterns .junbi {
		        font-weight: bold;
                font-style: normal !important;
                color: black !important;
		    }
		    .patterns .even {
                border-bottom: 1px solid #E6E6E6;
		    }
		    .patterns .odd {
		        background-color: #E6E6E6;
                border-bottom: 1px solid #E6E6E6;
		    }
		
		/* Stance Chart Styles */
		.stancechart {}
		    .stancechart TD,
		    .stancechart TH {
	            border-width: 1px;
	            border-style: inset;
	            border-color: black;
	            text-align: center;
		    }
		    .stancechart THEAD {
		        background-color: #5A6879;
		        color: white;
		    }
		        .stancechart THEAD TH {
		            font-weight: bold;
		        }
		        .stancechart THEAD P {
		            margin-top: 0;
		            padding-top: 0;
		            font-size: 80%;
		        }
		    .stancechart TBODY TH {
		        font-style: italic;
		    }
		    .stancechart TFOOT TH {
		        font-size: 80%;
		        text-align: left !important;
		    }

		    .stancechart .attention {
		        font-weight: bold;
		    }

		    .stancechart .realtive {
		        font-style: normal;
		    }
		    .stancechart .parent {
		        font-style: normal;
		        font-weight: bold;
		    }
		        .stancechart .orphans .parent {
		            background-color: white;
		        }
		        .stancechart .parallel .parent {
		            background-color: #D99594;
		        }
		            .stancechart .parallel TH {
		                background-color: #F2DBDB;
		            }
		        .stancechart .sitting .parent {
		            background-color: #FABF8F;
		        }
		            .stancechart .sitting TH {
		                background-color: #FBD4B4;
		            }
		        .stancechart .bending .parent {
		            background-color: #C2D69B;
		        }
		            .stancechart .bending TH {
		                background-color: #D6E3BC;
		            }
		        .stancechart .walking .parent {
		            background-color: #B2A1C7;
		        }
		            .stancechart .walking TH {
		                background-color: #CCC0D9;
		            }
		        .stancechart .l .parent {
		            background-color: #8DB3E2;
		        }
		            .stancechart .l TH {
		                background-color: #C6D9F1;
		            }
	</style>

    <script>
		$(document).ready(function() {
			// $("table.patterns tr:even").addClass("even");
			// $("table.patterns tr:odd").addClass("odd");
		});
	</script>
</head>
<body>
	
	<table id="Pattern" class="patterns">
	    <caption class="rotate270">
	        <div>
		        <strong><? print($oPattern['Name']); ?></strong>
		        <br/><!-- div><? print($oPattern['AKA']); ?></div -->
		        <div><? print($oPattern['GupLevel'] . " Pattern; " . $oPattern['Belt'] . "; " . $oPattern['MovementCount'] . " Movements"); ?></div>
	        </div>
	    </caption>
	    <thead>
			<tr>
			    <th>
				    <strong>Verbal</strong>
				    <br/>Count
			    </th>
			    <th>
				    Motion [Method] &nbsp; <strong>Body Movement</strong>
				    <br/>(Eyes To; Diagram Direction)
			    </th>
			    <th>
				    Feet In
				    <br/>Motion
			    </th>
			    <th>
				    Leg &nbsp; Section &nbsp; <strong>Stance/Leg Technique</strong> &nbsp; [Attacking Tool; Line]
				    <br/>(Stance/Technique To; Diagram Direction)
			    </th>
			    <th>
				    Arm &nbsp; Section &nbsp; <strong>Arm Technique</strong> &nbsp; [Attacking Tool; Line]
				    <br/>(Technique To; Diagram Direction)
			    </th>
			    <th class="primary">
				    <strong class="face">☺</strong>
				    <br/>ing
			    </th>
	        </tr>
	    </thead>

	    <tbody>
<?
			//# If we were able to SELECT a $oViewPattern
			if (is_resource($oViewPattern) && mysql_num_rows($oViewPattern)) {
				$iRowCount = 0;

				//# Fetch the $oNextRow (which in this case is the first row)
				$oNextRow = mysql_fetch_array($oViewPattern);

				//# Traverse the $oViewPattern, checking each $oNextRow as we go
				while ($oNextRow != null) {
					//# (Re)Init the $a_oRows, push the $oNextRow into the $a_oRows and determine the $iCount
					$a_oRows = array();
					array_push($a_oRows, $oNextRow);
					$iCount = (int)$a_oRows[0]['Count'];

					//# Fetch the $oNextRow (if any)
					$oNextRow = mysql_fetch_array($oViewPattern);
					
					//# If this is a multipart movement
					if (! is_null($a_oRows[0]['CountOrder'])) {
						//# Add the additional $a_oRows while the $iCount's match (and the $oNextRow is valid)
						while ($oNextRow != null && (int)$oNextRow['Count'] == $iCount) {
							array_push($a_oRows, $oNextRow);

							//# Fetch the $oNextRow (if any)
							$oNextRow = mysql_fetch_array($oViewPattern);
						}
					}

					//# Now that we have all of the $a_oRows, build the strings for the current TR
					$sCount = ($iCount <= 0 || $iCount == 999 ? "&bullet;" : $iCount);
					$sCountClass = ((int)$a_oRows[0]['Counted'] == 1 ? "count" : "number");
					$sBody = FormatBodyMovement($a_oRows, 'Motion', 'BodyMovement', 'EyesTo', 'EyesDiagramDirection');
					$sFeetInMotion = FormatLine($a_oRows, 'FeetInMotion', false);
					$sLeg = FormatTechnique($a_oRows, 'LegTechniqueOfficial', 'LegTechniqueType', 'LegTool', 'LegTo', 'LegDiagramDirection', 'LegLR', 'LegSection', 'LegSectionInferred', 'LegLineOfAttack', null);
					$sArm = FormatTechnique($a_oRows, 'ArmTechniqueOfficial', 'ArmTechniqueType', 'ArmTool', 'ArmTo', 'ArmDiagramDirection', 'ArmLR', 'ArmSection', 'ArmSectionInferred', 'ArmLineOfAttack', 'IsArmToolTwin');
					$sFacing = join("<br/>", GetColumnsAsArray($a_oRows, 'Facing', false));
					
					//# Print out the TR with the above formatted strings
					print("		<tr class='" . ($iRowCount++ % 2 ? "odd" : "even") . "'>\n");
					print("			<td class='" . $sCountClass . "'>" . $sCount . "</td>\n");
					print("			<td>" . $sBody . "</td>\n");
					print("			<td>" . $sFeetInMotion . "</td>\n");
					print("			<td>" . $sLeg . "</td>\n");
					print("			<td>" . $sArm . "</td>\n");
					print("			<td class='facing'>" . $sFacing . "</td>\n");
					print("		</tr>\n\n");
				}				
			}
?>
	    </tbody>
	</table>

</body>
</html>