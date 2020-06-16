<!DOCTYPE html>
<%@page import="Test.DbConnection"%>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
	
<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script>

<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>


<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
	
	
	<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
	
	<title>Hauptseite</title>
	
<Style>
	
	.Beschreibung
	{
	mpadding: 20px; /* some padding */
	text-align:center; /* center the text */
	background: beige; /* green background */
	color: black;
	font-size: 16pt;  /*Schrift-Größe*/
	}
	
	.MeinButton
	{
		float: right;
		border: 2px solid black;
		width: 5%;
		text-align: center;
		padding: 8px;
		background-color: chocolate;
		color: white;
		border-radius: 6px;
	}
	.MeinButton:hover
	{
		background-color: orangered;
	}
	
	
.header {
	padding: 80px; /* some padding */
	text-align: center; /* center the text */
	background: beige; /* green background */
	color: black; /* white text color */
}

	.picture0 {
	padding: 50px; /* some padding */
	text-align:center; /* center the text */
	background: beige; /* green background */
	color: black;
	}
	.picture {
	
	padding: 50px; /* some padding */
	text-align:center; /* center the text */
	background: beige; /* green background */
	color: black;
	}
	

	
.Leiste {
	padding: 20px; /* some padding */
	text-align: center; /* center the text */
	background: beige; /* green background */
	color: black;
	<div
}

.Überschrift {
	mpadding: 20px; /* some padding */
	text-align: left; /* center the text */
	background: beige; /* green background */
	color: black;
	font-size: 16pt;  /*Schrift-Größe*/
}
		
</Style>

</head>


<body>

<a target= "_blank" style="text-decoration: none;" href="http://www.hs-pforzheim.de">
		<div class="MeinButton">Kontakt</div> </a>


<div class="Überschrift"> 
		<h2> <img src="Fuel_Symbol.jpg" width="100" height="100" alt""/> 
			 Deine Tank-App </h2>
	</div>

<div class="Beschreibung">  Schön, dass Sie da sind. Erleben Sie die Vielfalt aktueller Preise und finden Sie Ihre Tankstelle, jetzt. </div>
	
	<div class="picture0">
		<img src="Zapfhahn_Sunset_Klein.jpg" width="1000" height="620" alt=""/>	</div>
	
	<div class="Beschreibung">  Jetzt bequem Ihren Standort ermitteln lassen und den Überblick behalten </div>
	
	<div class="picture">		
		<img src="Tankstellenpreise.jpg" width="980" height="550" alt=""/> </div>
	
	

	<%//Position bestimmen %>
	<form action="index.jsp" method="GET">
		<fieldset>
			<input id="latLabel" type="text" name="lat" readonly="readonly" required> 
			<input id="lngLabel" type="text" name="lng" readonly="readonly" required>
			<button type="button" id="out" onclick="showPosition()"> Zeige meine Position an</button>
			<button type="submit">Bestätigen</button>
		</fieldset>
	</form>
	
	
	
	<form action="Login.jsp" method="POST">	
	  <div class="container">	
	    <button type="submit">Login</button>	    
	</form>
	
	<form action="searchTankstelle.jsp" method="POST">	
	  <div class="container">	
	    <button type="submit">Nach Tankstelle suchen</button>	    
	</form>

	<form action="fahrtenbuch.jsp" method="POST">	
	  <div class="container">	
	    <button type="submit">Fahrtenbuch eintragen</button>	    
	</form>

	<form  method="POST">
	<label>Umkreis:</label>
	<select id="rad" name="rad">
			<option value="5" >5 km</option>
			<option value="10">10 km</option>
			<option value="15">15 km</option>
			<option value="25">25 km</option>
		</select>
	<button type="submit" onclick="getRad()">Umkreis festlegen</button>
	<table data-role="table" id="tsTabelle" class="ui-responsive" border="1">
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
				<th>Leaderboard</th>
			</tr>
		</thead>
		<tbody>
			<%
			String latPar = request.getParameter("lat");
			String lngPar = request.getParameter("lng");
			String radPar = request.getParameter("rad");
			
			
			
			String coord = "";
			
			Cookie[] cookies = request.getCookies();
			if(cookies != null){
			for(Cookie c : cookies){
				if(c.getName().equals("Koordinaten")){
					coord = c.getValue();
					break;
					}
				}
			}

			String url = Test.APIConnection.createUrl(latPar, lngPar, coord, radPar);	
			
			Test.APIConnection.executePost(url);
			
			//Tabelle schreiben lassen
			
				out.print(Test.APIConnection.createTable());
			%>
		</tbody>
	</table>
	</form>
	
	<table data-role="table" id="tsFavTabelle" class="ui-responsive" border="1">
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
				<th>Leaderboard</th>
			</tr>
		</thead>
		<tbody>
			
			<%			
			//Favoriten ArrayList erschaffen
			Cookie[] favCook = request.getCookies();
			if(cookies != null){
			for(Cookie c : favCook){
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

		    var cookie = Cookies.get("Koordinaten");

		    var r = confirm("Möchsten sie diese Koordinaten als ihre Standart-Adresse speichern?");
		    if (r == true) {
		    	Cookies.set("Koordinaten", lat + "&" + lon + "&");
		    } 

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

		 if(cookie == null){ 
	        Cookies.set("FavoritenID", t + "&");   
	            	
			}

			//Hinzufügen der Tankstelle	
		 else if(!cookie.includes(t) ){	
			cookie += t
			cookie += "&"
		 	Cookies.set("FavoritenID", cookie);
			
		 	}			 							

		 //Löschen einer Vorhandenen Tankstelle
	 	else{
			var newCookie = cookie.replace(t+"&","");
			Cookies.set("FavoritenID", newCookie);
			}
			
		}

	function lbVerw(t){

		var url = "http://localhost:8080/tankApp/leaderboard.jsp?id=" + t;
		 window.location.href = url;
	}

	function getRad(){
		
		var rad = document.getElementById("rad").value;
		location.reload();	
		}
	
			 
</script>


</html>