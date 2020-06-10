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


<script
	src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>

<!-- CSS only -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/ca2e4c3b4a.js"
	crossorigin="anonymous"></script>












</head>
<Style>
@import
	url('https://fonts.googleapis.com/css2?family=Lato&display=swap');

.header {
	/* 	background-image: url(""); */
	/* 	height: 20vh; */
	background-size: cober;
	background-position: center;
}

ul {
	float: right;
	list-style-type: none;
	margin-top: 25 px;
}

ul li {
	display: inline-block;
}

ul li a {
	text-decoration: none;
	color: white;
	padding: 5px 20px;
	border: 1px solid white;
	transition: 0.6s ease;
}

ul li a:hover {
	background-color: white;
	color: black;
}

.logo img {
	float: left;
	width: 150px;
	height: auto;
}

.main {
	max-width: 1200px;
	margin: auto;
}

.Navigationsleiste {
	background-color: #310c0c;
	padding: 20px;
	text-align: center;
}

.unsermodal {
	z-index: 3;
	display: none;
	padding-top: 100px;
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4)
}

.modal-content {
	margin: auto;
	background-color: #fff;
	position: relative;
	padding: 0;
	outline: 0;
	width: 600px
}

.container, .panel {
	padding: 0.01em 16px
}

.panel {
	margin-top: 16px;
	margin-bottom: 16px
}

.button {
	white-space: normal
}

.display-topright {
	position: absolute;
	right: 0;
	top: 0
}

.display-hover {
	display: block
}

.platzfürüberschrift {
	background-color: grey;
	height: 150px;
	opacity: 0.5;
}

.Überschrift {
	background: url(../Tankstellenpreise.jpg);
	text-align: center;
	width: 100%;
	height: auto;
	background-size: cover;
	background-attachment: fixed;
	position: relative;
	overflow: hidden;
	border-radius: 0 0 85% 85%/30%;
}

.Überschrift .overlay {
	width: 100%;
	height: 100%;
	padding: 50px;
	color: #FFF;
	text-shadow: 1px 1px 1px #333;
	background-image: linear-gradient(135deg, red, grey);
	opacity: 0.5;
}

* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	height: 900px;
	font-family: 'Lato', sans-serif;
	background-color: #F0FFFF;
	color: #fff;
}

header {
	background: url(Tankstellenpreise.jpg);
	text-align: center;
	width: 100%;
	height: auto;
	background-size: cover;
	background-attachment: fixed;
	position: relative;
	overflow: hidden;
	border-radius: 100 100 150% 100%/3000%;
}

header .overlay {
	width: 100%;
	height: 100%;
	padding: 50px;
	color: #FFF;
	text-shadow: 1px 1px 1px #333;
	background-image: linear-gradient(135deg, rgb(124, 108, 108) 10%,
		#e98b596b 100%);
}

h1 {
	font-family: 'Dancing Script', cursive;
	font-size: 80px;
	margin-bottom: 30px;
}

h3, p {
	font-family: 'Open Sans', sans-serif;
	margin-bottom: 30px;
}

button {
	border: none;
	outline: none;
	padding: 10px 20px;
	border-radius: 50px;
	color: #333;
	background: #fff;
	margin-bottom: 50px;
	box-shadow: 0 3px 20px 0 #0000003b;
}

button:hover {
	cursor: pointer;
}

tr {
	background-color: grey;
	color: white;
}

.headcontent {
	-webkit-box-shadow: 0 0 10px 0 #000000;
	box-shadow: 0 0 10px 0 #000000;
	background-color: #0f161a;
	border-left: 5px solid #f42339;
	float: left;
	width: 100%;
	magine-top: 20px;
}

.contentname {
	text-transform: uppercase;
	font-weight: 700;
	color: grey;
	padding: 18px;
}

.contenticon {
	background-color: #fff;
	width: 20px;
	height: 25px;
	float: left;
	margin-top: 15px;
	margin-left: 10px;
}

.containers {
	background-image: url("gas_große.jpg");
	width: 100%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
}
</Style>

<header>
	<div class="overlay">
		<h1>Tank-App</h1>
		<h3>Das beste Vergleichportal für's Tanken</h3>
		<p>Passen sie den besten Moment fürs Tanken ab..</p>
		<br>
		<!-- Image Buttonfürmodal -->
		<div class="button">

			<button
				onclick="document.getElementById('id01').style.display='block'"
				title="hey">Diagramm</button>
		</div>
		<form action="index.jsp" method="GET">
			<fieldset>
				<button type="button" id="out" onclick="showPosition()">
					Zeige meine Position an</button>
				<button type="submit">Bestätigen</button>


				<input id="latLabel" type="text" name="lat" readonly="readonly">
				<input id="lngLabel" type="text" name="lng" readonly="readonly">

			</fieldset>
		</form>
	</div>
</header>


<body>





	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
	<%
		//https://creativecommons.tankerkoenig.de/json/list.php?street=bahnhofstraße&place=pforzheim&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d");
		//https://creativecommons.tankerkoenig.de/json/list.php?lat=48.916901499999994&lng=8.7445567&rad=1.5&sort=dist&type=all&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d
		//https://creativecommons.tankerkoenig.de/json/list.php?lat=48.916901499999994&lng=8.7445567&rad=1.5&sort=dist&type=all&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d
		//https://creativecommons.tankerkoenig.de/json/list.php?lat=48.8851&lng=8.7307&rad=1.5&sort=dist&type=all&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d
		//https://creativecommons.tankerkoenig.de/json/list.php?lat=48.916902799999995&lng=8.744553800000002&rad=1.5&sort=dist&type=all&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d
		//out.print(Test.APIConnection.TankstellenListe.get(1).getName());
	%>

<body>

	<!-- Contents -->
	<div class="containers">
		<div class="row">



			<div class="col-lg-9">

				<div class="headcontent">
					<div class="contenticon"></div>

					<div class="contentname">Tabelle für Tankstelleninfos.</div>

				</div>
				<table data-role="table" id="tsTabelle" class="ui-responsive"
					border="1">
					<thead>
						<tr>
							<th>Tankstelle</th>
							<th>Straße</th>
							<th>Ort</th>
							<th>Distanz</th>
							<th>Diesel</th>
							<th>E10</th>
							<th>E5</th>
							<th>Geöffnet</th>
							<th>Favoriten</th>

						</tr>
					</thead>
					<tbody>
						<%
							String latPar = request.getParameter("lat");
							String lngPar = request.getParameter("lng");

							String url = Test.APIConnection.createUrl(latPar, lngPar);

							Test.APIConnection.executePost(url);

							//Tabelle schreiben lassen

							out.print(Test.APIConnection.createTable());
						%>
					</tbody>
				</table>


				<table data-role="table" id="tsFavTabelle" class="ui-responsive"
					border="1">
					<thead>
						<tr>
							<th>Tankstelle</th>
							<th>Straße</th>
							<th>Ort</th>
							<th>Distanz</th>
							<th>Diesel</th>
							<th>E10</th>
							<th>E5</th>
							<th>Geöffnet</th>
							<th>Favoriten</th>
						</tr>
					</thead>
					<tbody>
						<%
							//Favoriten ArrayList erschaffen
							Cookie[] cookies = request.getCookies();
							if (cookies != null) {
								out.print("");
								for (Cookie c : cookies) {
									if (c.getName().equals("FavoritenID")) {
										Test.APIConnection.getFav(c.getValue());
										break;
									}
								}
								//Favoriten Tabelle schreiben lassen
								out.print(Test.APIConnection.createTableFav());
							}
						%>
					</tbody>
				</table>

			</div>






			<div class="col-lg-3">
				>
				<!-- Hintergrund und Leiste -->
				<div class="header">
					<div class="logo">
						<image src="">
					</div>

					<ul>
						<li><a target="_blank" style="text-decoration: none;"
							href="http://www.hs-pforzheim.de">Home</a></li>
						<li><a href="www.hs-pforzheim.de">Service</a></li>
						<li><a href="#">Gallerie</a></li>
						<li><a href="#">Kontakt</a></li>
					</ul>


				</div>








			</div>
		</div>


	</div>
	<!-- unsermodal -->
	<div id="id01" class="unsermodal">
		<div class="modal-content">
			<header class="container">
				<span onclick="document.getElementById('id01').style.display='none'"
					style="font-size: 20px; color: grey"> <i
					class="fa fa-remove"></i></span>

				<h5>
					<i class="fa fa-smile-o"></i>
				</h5>
			</header>
			<div class="container">
				<div id="chartContainer" style="height: 370px; width: 100%;"></div>
				<script
					src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
				<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
			</div>
			<footer class="container ">



				<p>Modal footer</p>
			</footer>
		</div>
	</div>








</body>





<script>
	// Visualization API with the 'corechart' package.

	//google.charts.load('visualization', { packages: ['corechart'] });
	//google.charts.setOnLoadCallback(drawLineChart);
	window.onload = function() {

		var dataPoints = [];

		var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled : true,
			theme : "light2",
			zoomEnabled : true,
			title : {
				text : "Stunde und Preis"
			},
			axisY : {
				title : "Preise pro Stunde",
				titleFontSize : 24,
				includeZero : false
			},
			axisX : {
				title : "Hours",
				maximum : 25,

			},
			data : [ {
				type : "line",
				yValueFormatString : "number",

				xValueType : "number",
				dataPoints : dataPoints
			} ]
		});

		function addData(data) {
			for (var i = 0; i < data.length; i++) {
				dataPoints.push({
					x : data[i].hour,
					y : data[i].price
				});
			}
			chart.render();
		}

		$
				.getJSON(
						"https://www.volzinnovation.com/fuel_price_variations_germany/data/474e5046/deaf/4f9b/9a32/9797b778f047/e10.json",
						addData);

	}

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

	function showPosition() {

		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showMap, showError);
		} else {
			alert("Sorry, your browser does not support HTML5 geolocation.");
		}

	}

	function showMap(position) {
		lat = position.coords.latitude;
		lon = position.coords.longitude;
		document.getElementById("latLabel").value = lat;
		document.getElementById("lngLabel").value = lon;
	}

	function showError(error) {
		switch (error.code) {
		case error.PERMISSION_DENIED:
			alert("User denied request for geolocation.");
			break;
		case error.POSITION_UNAVAILABLE:
			alert("Location data not available.");
			break;
		case error.TIMEOUT:
			alert("Request for location timed out.");
			break;
		case error.UNKNOWN_ERROR:
			alert("An error occured.");
			break;
		}
	}

	function favVerw(t) {
		var cookie = Cookies.get("FavoritenID");

		if (cookie == null) {
			Cookies.set("FavoritenID", t + "&");
		}

		else if (!cookie.includes(t)) {
			cookie += t
			cookie += "&"
			Cookies.set("FavoritenID", cookie);
		}

		else {
			var newCookie = cookie.replace(t + "&", "");
			Cookies.set("FavoritenID", newCookie);
		}

		location.reload();
	}
</script>


</html>