
<%
	//@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"
%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<div class="Überschrift">
	<h2>Tank - App</h2>
</div>

<Style>
.header {
	padding: 80px; /* some padding */
	text-align: center; /* center the text */
	background: #FFA500; /* green background */
	color: white; /* white text color */
}

.Leiste {
	padding: 20px; /* some padding */
	text-align: center; /* center the text */
	background: #DA70D6; /* green background */
	color: white;
}

.Überschrift {
	mpadding: 20px; /* some padding */
	text-align: center; /* center the text */
	background: #C0C0C0; /* green background */
	color: white;
}
</Style>

</head>


<body>

	<%
		String url;

		String latPar = "0";
		String lngPar = "0";

		latPar = request.getParameter("latField");
		lngPar = request.getParameter("lngField");

		if (latPar == null && lngPar == null) {
			double lat = 48.8851;
			double lng = 8.7307;
			url = "https://creativecommons.tankerkoenig.de/json/list.php?lat=" + lat + "&lng=" + lng
					+ "&rad=1.5&sort=dist&type=all&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d";
		} else {
			url = "https://creativecommons.tankerkoenig.de/json/list.php?lat=" + latPar + "&lng=" + lngPar
					+ "&rad=1.5&sort=dist&type=all&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d";
		}
		Test.APIConnection.executePost(url);
		//Test.APIConnection.executePost("https://creativecommons.tankerkoenig.de/json/list.php?street=bahnhofstraße&place=pforzheim&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d");
		//out.print(Test.APIConnection.TankstellenListe.get(1).getName());
	%>

	<div class="Leiste">
		<h2>Preisveränderung von e10</h2>
	</div>

	<div id="chart" style="width: auto; height: 300px;"></div>

	<div class="header">

		<p>Statistik und Preisdaten pro Tankstelle anzeigen lassen!!.</p>

	</div>


	<form>
		<label for="groesse">Größe: <input id="groesse" type="number"
			min="100" max="220" step="1" value="175"> cm
		</label> <label for="masse">Masse: <input id="masse" type="number"
			min="30" max="225" step="0.1" value="75"> kg
		</label>
		<button type="button" id="berechnen">BMI berechnen</button>
	</form>



	<form action="index.jsp" method="GET">
		<fieldset>
			<label type="text" name="lat">Lat: <output></output>
			</label> <label type="text" name="lng">Lng: <output1></output1>
			</label>

			<button type="button" id="out" onclick="geoFindMe()">Zeige
				meine Position an</button>

			<button type="submit">Submit</button>
			<input id="latField" type="hidden" name="latField" /></input> <input
				id="lngField" type="hidden" name="lngField" /></input>
		</fieldset>
	</form>




</body>

<table data-role="table" id="tsTabelle" data-mode="columntoggle"
	class="ui-responsive" border="1">
	<thead>
		<tr>
			<th>Tankstelle</th>
			<th>Ort</th>
			<th>Distanz</th>
			<th>Favoriten</th>
		</tr>
	</thead>
	<tbody>
		<%
			out.print(Test.APIConnection.createTable());
		%>
	</tbody>
</table>

<script>

document.querySelector('#berechnen').addEventListener('click', berechne_BMI);

function berechne_BMI () {
	var groesse = parseInt(document.getElementById("groesse").value),
	    masse = parseInt(document.getElementById("masse").value),
	    bmi = Math.round(100000 * masse / (groesse * groesse)) / 10;
				
	document.querySelector("output").textContent = bmi;
}

	// Visualization API with the 'corechart' package.

	//google.charts.load('visualization', { packages: ['corechart'] });
	google.charts.setOnLoadCallback(drawLineChart);

	function drawLineChart() {
		$
				.ajax({
					url : "https://www.volzinnovation.com/fuel_price_variations_germany/data/474e5046/deaf/4f9b/9a32/9797b778f047/e10.json",
					dataType : "json",
					type : "GET",
					contentType : "application/json; charset=utf-8",
					success : function(data) {
						var arrSales = [ [ 'hour', 'price' ] ]; // Define an array and assign columns for the chart.

						// Loop through each data and populate the array.
						$.each(data, function(index, value) {
							arrSales.push([ value.hour, value.price ]);
						});

						// Set chart Options.
						var options = {
							title : 'Tank Price',
							curveType : 'function',
							legend : {
								position : 'bottom',
								textStyle : {
									color : '#555',
									fontSize : 14
								}
							}
						// You can position the legend on 'top' or at the 'bottom'.
						};

						// Create DataTable and add the array to it.
						var figures = google.visualization
								.arrayToDataTable(arrSales)

						// Define the chart type (LineChart) and the container (a DIV in our case).
						var chart = new google.visualization.LineChart(document
								.getElementById('chart'));
						chart.draw(figures, options); // Draw the chart with Options.
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert('Got an Error');
					}
				});
	}

	function geoFindMe() {
		  var output = document.getElementById("out");
		  var output1 = document.getElementById("out");

		  if (!navigator.geolocation){
		    output.innerHTML = "<p>Geolokation wird von ihrem Browser nicht unterstützt</p>";
		    return;
		  }

		  function success(position) {
		    var latitude  = position.coords.latitude;
		    var longitude = position.coords.longitude;

		    //output.innerHTML = '<p>Die Latitude ist ' + latitude + '° <br>Die Longitude ist ' + longitude + '°</p>';
		    document.getElementById("latField").value =  latitude;
		    document.getElementById("lngField").value =  longitude;

		    document.querySelector("output").textContent =  latitude;
		    document.querySelector("output1").textContent =  longitude;
		  };

		  function error() {
		    output.innerHTML = "Es war nicht möglich Sie zu lokalisieren";
		  };

		  //output.innerHTML = "<p>Lokalisieren</p>";

		  navigator.geolocation.getCurrentPosition(success, error);
		}

 
</script>


</html>