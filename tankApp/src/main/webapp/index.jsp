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
	
	
	<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>

<div class="‹berschrift">
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

.‹berschrift {
	mpadding: 20px; /* some padding */
	text-align: center; /* center the text */
	background: #C0C0C0; /* green background */
	color: white;
}
</Style>



</head>


<body>

	<%		
		//https://creativecommons.tankerkoenig.de/json/list.php?street=bahnhofstraﬂe&place=pforzheim&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d");
		//https://creativecommons.tankerkoenig.de/json/list.php?lat=48.916901499999994&lng=8.7445567&rad=1.5&sort=dist&type=all&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d
		//https://creativecommons.tankerkoenig.de/json/list.php?lat=48.916901499999994&lng=8.7445567&rad=1.5&sort=dist&type=all&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d
		//https://creativecommons.tankerkoenig.de/json/list.php?lat=48.8851&lng=8.7307&rad=1.5&sort=dist&type=all&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d
		//https://creativecommons.tankerkoenig.de/json/list.php?lat=48.916902799999995&lng=8.744553800000002&rad=1.5&sort=dist&type=all&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d
		//out.print(Test.APIConnection.TankstellenListe.get(1).getName());
		
		
		
		
	%>

	<div class="Leiste">
		<h2>Preisver‰nderung von e10</h2>
	</div>

	<div id="chart" style="width: auto; height: 300px;"></div>

	<div class="header">

		<p>Statistik und Preisdaten pro Tankstelle anzeigen lassen!.</p>

	</div>



	<form action="index.jsp" method="GET">
		<fieldset>
			<input id="latLabel" type="text" name="lat"> 
			<input id="lngLabel" type="text" name="lng">
			<button type="button" id="out" onclick="showPosition()"> Zeige meine Position an</button>
			<button type="submit">Submit</button>
		</fieldset>
	</form>


	<table data-role="table" id="tsTabelle" class="ui-responsive" border="1">
		<thead>
			<tr>
				<th>Tankstelle</th>
				<th>Straﬂe</th>
				<th>Ort</th>
				<th>Distanz</th>
				<th>Diesel</th>
				<th>E10</th>
				<th>E5</th>
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
	
	<table data-role="table" id="tsFavTabelle" class="ui-responsive" border="1">
		<thead>
			<tr>
				<th>Tankstelle</th>
				<th>Straﬂe</th>
				<th>Ort</th>
				<th>Distanz</th>
				<th>Diesel</th>
				<th>E10</th>
				<th>E5</th>
				<th>Favoriten</th>
			</tr>
		</thead>
		<tbody>
			<%
			//Favoriten ArrayList erschaffen
			Cookie[] cookies = request.getCookies();
			if(cookies != null){
				out.print("");
			for(Cookie c : cookies){
				if(c.getName().equals("FavoritenID")){
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

</body>





<script>
	// Visualization API with the 'corechart' package.

	//google.charts.load('visualization', { packages: ['corechart'] });
	//google.charts.setOnLoadCallback(drawLineChart);

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

		 if(navigator.geolocation)
		    {
		        navigator.geolocation.getCurrentPosition(showMap, showError);
		    } 
		    else
		    {
		        alert("Sorry, your browser does not support HTML5 geolocation.");
		    }
		 
		}

		function showMap(position)
		{
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

	function favVerw(t){
		 var cookie = Cookies.get("FavoritenID");
		 
		 if(!cookie.includes(t)){
			 if(cookie == null){
		         Cookies.set("FavoritenID", t + "&");         	
					}			
				 else{			 
					 cookie += t
					 cookie += "&"
				 	Cookies.set("FavoritenID", cookie);
				 	}			 							
			 }
		 else{
					var newCookie = cookie.replace(t+"&","");
					Cookies.set("FavoritenID", newCookie);
					}
			
		 location.reload();	
		}
		 
</script>


</html>