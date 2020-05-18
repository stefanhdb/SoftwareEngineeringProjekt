<html><head>
<script>
	window.onload = function () {

var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2",
	title:{
		text: "Simple Line Chart"
	},
	axisY:{
		includeZero: false
	},
	data: [{        
		type: "line",
      	indexLabelFontSize: 16,
		dataPoints: [
			{ y: 450 },
			{ y: 414},
			{ y: 520, indexLabel: "\u2191 highest",markerColor: "red", markerType: "triangle" },
			{ y: 460 },
			{ y: 450 },
			{ y: 500 },
			{ y: 480 },
			{ y: 480 },
			{ y: 410 , indexLabel: "\u2193 lowest",markerColor: "DarkSlateGrey", markerType: "cross" },
			{ y: 500 },
			{ y: 480 },
			{ y: 510 }
		]
	}]
});
chart.render();

}
	</script>
<meta charset="utf-8">
<title>probe</title>
	<style>
body {
  font-family: Arial, Helvetica, sans-serif;
	
}
	.header{
  padding: 80px; /* some padding */
  text-align: center; /* center the text */
  background: #FFA500; /* green background */
  color: white; /* white text color */
	}
	.Leiste{
  padding: 20px; /* some padding */
  text-align: left; /* center the text */
  background: #DA70D6; /* green background */
  color: white;	
	}
	
		
	
</style>
</head>

<body>

<% out.print(Test.APIConnection.executePost("https://creativecommons.tankerkoenig.de/json/list.php?lat=52.521&lng=13.438&rad=1.5&sort=dist&type=all&apikey=2841944f-2cbb-1b7e-ae94-d7f4d7c5599d")); %>

<img width="250" height="151" alt="" src="../Desktop/projekt.png">

	<div class="Leiste">
	<h2>Erleben Sie die neue Vielfalt neuer Preisgestaltansichten(gestaltgesetzte)</h2>
    </div>
<div id="chartContainer" style="height: 300px; width: 100%;"><div class="canvasjs-chart-container" style="text-align: left; position: relative; cursor: auto;"><canvas width="1887" height="450" class="canvasjs-chart-canvas" style="width: 1258px; height: 300px; position: absolute; -ms-user-select: none;"></canvas><canvas width="1887" height="450" class="canvasjs-chart-canvas" style="width: 1258px; height: 300px; position: absolute; cursor: default; -ms-user-select: none; -webkit-tap-highlight-color: transparent;"></canvas><div class="canvasjs-chart-toolbar" style="border: 1px solid transparent; border-image: none; top: 1px; right: 1px; position: absolute;"></div><div class="canvasjs-chart-tooltip" style="border-radius: 0px; transition:left 0.1s ease-out, bottom 0.1s ease-out; left: 113px; height: auto; bottom: -240.66px; display: none; position: absolute; z-index: 1000; pointer-events: none; box-shadow: 1px 1px 2px 2px rgba(0,0,0,0.1);"><div style="background: rgba(255, 255, 255, 0.9); margin: 0px; padding: 5px; border-radius: 0px; border: 1px solid rgb(109, 120, 173); border-image: none; width: auto; height: auto; text-align: left; color: black; text-indent: 0px; font-family: Trebuchet MS,Helvetica,sans-serif; font-size: 14px; font-style: normal; font-weight: normal; white-space: nowrap; min-width: 50px; text-shadow: 1px 1px 1px rgba(0,0,0,0.1); -ms-user-select: none;"><span style="color:#6D78AD;">1:</span>&nbsp;&nbsp;414</div></div><a tabindex="-1" title="JavaScript Charts" class="canvasjs-chart-credit" style="margin: 0px; outline: invert; top: 286px; right: 2px; color: dimgrey; font-family: Calibri,Lucida Grande,Lucida Sans Unicode,Arial,sans-serif; font-size: 11px; text-decoration: none; position: absolute;" href="https://canvasjs.com/" target="_blank">CanvasJS.com</a></div></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	
<div class="header">
  
<h1>Tank-App</h1>
<p>Statistik und Preisdaten pro Tankstelle anzeigen lassen!.</p>
	
</div>
	
<input onclick="history.back()" type="button" value="Zurück">
	


<span style="margin: 0px; padding: 0px; border: medium; border-image: none; left: 0px; top: -20000px; line-height: normal; font-family: Trebuchet MS,Helvetica,sans-serif; font-size: 16px; font-weight: normal; display: none; white-space: pre; position: absolute;">Mpgyi</span>
</body>
</html>