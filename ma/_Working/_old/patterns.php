<?php

?>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script type="text/javascript" src="/js/jquery-2.0.3.min.js"></script>

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
			for (i = 1000; i < 1025; i++) {
				$("#Patterns").append('<div id="Pattern' + i + '">');
				$("#Pattern" + i).load("http://localhost/pattern.php?pattern=" + i + " #Pattern");
				//$.get("http://localhost/pattern.php?pattern=" + i, function(data) {
				//	$(data, "#Pattern").appendTo("#Patterns");
				//});
			}
		});
	</script>
</head>
<body>

	<div id='Patterns' />

</body>
</html>