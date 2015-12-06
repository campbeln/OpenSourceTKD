<?php

//# 
$mysql = mysql_connect("localhost", "root", "");
if (!$mysql) { die('Could not connect: ' . mysql_error()); }

mysql_select_db("fusionmartialart", $mysql);
$oPatternCount = mysql_query("SELECT `PatternID`, `Count`, `CountOrder`, `Counted`, `Motion`, `BodyMovement`, `EyesTo`, `EyesDiagramDirection`, `FeetInMotion`, `LegLR`, `LegSection`, `LegTechniqueOfficial` AS `LegTechnique`, `LegTo`, `LegDiagramDirection`, `LegTool`, `LegLineOfAttack`, `ArmLR`, `ArmSection`, `ArmTechniqueOfficial` AS `ArmTechnique`, `ArmTo`, `ArmDiagramDirection`, `ArmTool`, `ArmLineOfAttack`, `IsArmToolTwin`, `Facing` FROM `viewpattern`");
$oPattern = mysql_query("SELECT * FROM `patterns` ORDER BY `SortOrder`");


function SQLToJSON($oData) {
	$aColumns = array();

	$sReturn = "[\n";

	if (is_resource($oData) && mysql_num_rows($oData)) {
		//# Traverse the passed $oData as a recordset
		while ($row = mysql_fetch_assoc($oData)) {
			if (empty($aColumns)) {
				$aColumns = array_keys($row);
			}

			$sReturn .= "	{";

			for ($i = 0; $i < count($aColumns); $i++) {
				$sReturn .= "'" . $aColumns[$i] . "': '" . str_replace("'", "\'", $row[$aColumns[$i]]) . "', ";
			}

			$sReturn .= "},\n";
		}
		mysql_data_seek($oData, 0);
	}

	$sReturn .= "]\n";
	return $sReturn;
}


function SQL2JSON($oData) {
	$sReturn = "[\n";

	if (is_resource($oData) && mysql_num_rows($oData)) {
		//# Traverse the passed $oData as a recordset
		while ($row = mysql_fetch_assoc($oData)) {
			$sReturn .= "	" + json_encode($row) + ",\n";
		}
		mysql_data_seek($oData, 0);
	}

	return $sReturn . "]\n";
}


function SQLToFn($oData) {
	$aColumns = array();
	$sReturn = "{names:[],length:0}";
	$i = 0;
	
	if (is_resource($oData) && mysql_num_rows($oData)) {
		$sReturn = "{";

		//# Traverse the passed $oData as a recordset
		while ($row = mysql_fetch_assoc($oData)) {
			if (empty($aColumns)) {
				$aColumns = array_keys($row);
				$sReturn = "names:" + json_encode($aColumns) + ",";
			}
			
			for ($i = 0; $i < count($aColumns); $i++) {
//				$sReturn .= $i . ":'" . str_replace("'", "\'", $row[$aColumns[$i]]) . "',";
				$sReturn .= $i . ":" . json_encode($row[$aColumns[$i]]) . ",";
			}
		}
		mysql_data_seek($oData, 0);

		$sReturn .= "length:" . $i . "}";
	}
	
	//# 
	return "function(R,C){" .
			"var r=parseInt(R,10)||-1," .
				"c=parseInt(C,10)||-1," .
				"n=(C+'').toLowerCase()," .
				"v=undefined," .
				"d=" . $sReturn .
			";" .
			"if(r>-1){" .
				"if(c>-1){" .
					"v=d[r][c];" .
				"}" .
				"else if(n){" .
					"c=d['names'].indexOf(n);" .
					"v=d[r][c];" .
				"}" .
			"}" .
			"if(R=='all'){" .
				"v=d;" .
			"}" .
			"return v;" .
		"}"
	;
}


function ArrayToJSON($aData) {
	$sReturn = "[";

	for ($i = 0; $i < count($aData); $i++) {
		$sReturn .= "'" . str_replace("'", "\'", $aData[$i]) . "',\n";
	}

	$sReturn .= "]";
	return $sReturn;
}


//header('Content-Type: application/json');
//echo json_encode($oPatternCount);
//echo json_encode($oPatternCount);

header("Content-Type: application/javascript");
echo $_GET["varjs"] . " = {\n"
echo "$version: '" . $_GET["version"] . "',\n";
echo "patterns: " . SQLToFn($oPattern) . ",\n";
echo "patterncounts: " . SQLToFn($oPatternCount) . "\n";
echo "};\n"



