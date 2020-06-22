<!DOCTYPE html>
<%@page import="Test.APIConnection"%>
<%@page import="Test.DbConnection"%>
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

<title>Hauptseite</title>

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

body {
	height: 900px;
	font-family: 'Lato', sans-serif;
	background-color: #F0FFFF;
	color: #fff;
}

.table {
	
}

.header {
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

.header .overlay {
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
	margin-top: 20px;
	margin-left: 20px;
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

.box {
	margin-top: 45px;
	margin-left: 20px;
}

.boxfav {
	margin-top: 45px;
	margin-left: 20px;
	margin-bottom: 20px;
}

.container {
	
}

.buttonsheader {
	
}

.logo {
	float: left;
}
#myBtn{

background:#e7e7e7;
      border-radius: 30px;
      width: 15em;
      height: 3em;
      position:left;
display: table-cell; vertical-align: left;
display: inline-block;
 

}
.mytext{
height:45px; 
width:250px;



 }
 .sdd{
 
 margin-left: 35%;
 
 
 
 }
.fetsleg{

 margin-left: 42%;



}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #DCDCDC;
}

li {
  float: left;
}

li a {
  display: block;
  color: #FFFFFF;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #A9A9A9;
}

.active {
  background-color: #A9A9A9;
}
.navbaar{ 



margin-left: 0px;
margin-bottom: 0px;



}
</Style>





<body>

	<%//Wenn noch kein Benutzer angelegt ist, wird der User zum Login geschickt
	boolean boo = false;
	Cookie[] cook = request.getCookies();
	if(cook != null){
		for(Cookie c : cook){
			if(c.getName().equals("Benutzer")){
				boo= true;
				break;
				}
				}
			}
	if(boo==false){
		out.print("<script>var url = \"http://localhost:8080/tankApp/Login.jsp\";alert(\"Sie müssen zuerst ein Benutzkonto anlegen! Sie werden automatisch zum Login umgeleitet.\"); window.location.href = url;</script>");
	}
	
	%>
    <div class="navbaar">
  <ul>
  <li><a class="active" onclick="goLog()">Login</a></li>
  <li><a onclick="goST()">Suchen</a></li>
  <li><a onclick="goFav()">Favoriten</a></li>
  <li><a onclick="goFahrt()">Fahrtenbuch</a></li>
  
</ul>
</div>	
	
	 <div class="header">
	

<!-- 		<ul class="nav nav-tabs"> -->
<!-- 			<li class="nav-item"><a class="nav-link active" onclick="goLog()">Login</a> -->
<!-- 			</li> -->
<!-- 			<li class="nav-item dropdown"><a -->
<!-- 				class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" -->
<!-- 				role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a> -->
<!-- 				<div class="dropdown-menu"> -->
<!-- 					<a class="dropdown-item"  onclick="goST()">Suchen</a> <a -->
<!-- 						class="dropdown-item" onclick="goFahrt()">Fahrtenbuch</a> <a -->
<!-- 						class="dropdown-item" href="#">Something else here</a> -->
<!-- 					<div class="dropdown-divider"></div> -->
<!-- 					<a class="dropdown-item" href="#">Separated link</a> -->
<!-- 				</div></li> -->
<!-- 			<li class="nav-item"><a class="nav-link" href="#">Link</a></li> -->
<!-- 			<li class="nav-item"><a class="nav-link disabled" href="#" -->
<!-- 				tabindex="-1" aria-disabled="true">Disabled</a></li> -->
<!-- 		</ul> -->






		<div class="overlay">
		<div class="logo">
				<nav>
					<a href="http://localhost:8080/tankApp/"><img src="logo.png"
						height="130" width="156" /></a>
				</nav>
			</div>
			<div class="buttonsheader"></div>
			<h1>Tank-App</h1>
			<h3>Das beste Vergleichportal für's Tanken</h3>
			<p>Passen sie den besten Moment fürs Tanken ab..</p>
			<br>
			<form >
			</div>	
	</div>	



	<!-- Contents -->
	<div class="containers">
		<div class="pos-f-t">
			<div class="collapse" id="navbarToggleExternalContent">
				<div class="bg-dark p-4">
					<h5 class="text-white h4">Position/Umkreis</h5>
			
						<span class="text-muted">

<!-- 					<button id="myBtn" style="height:45px; width:120px">hassf</button> -->

			<form action="index.jsp" method="GET" >
					 
					<input id="latLabel" type="text" name="lat" class="mytext" readonly="readonly" 
						required > 
					<input id="lngLabel"  type="text" name="lng"
						readonly="readonly" required>
						<div class="sdd">
					<button  type="button"  id="myBtn" onclick="showPosition()" style="height:45px; width:250px;">Zeige meine Position an</button>	
					<button type="button"  id="myBtn" onclick="subCoord()">Bestätigen</button>
					</div>			
			</form>
		
			<form action="index.jsp" method="GET" >
				<label>Umkreis:</label> 
				<select id="rad" name="rad">
					<option value="5">5 km</option>
					<option value="10">10 km</option>
					<option value="15">15 km</option>
					<option value="25">25 km</option>
				</select>
				<button id="myBtn" class ="fetsleg" type="submit" onclick="getRad()" >Umkreis festlegen</button>
			</form>

					</span>
				</div>
			</div>
			<nav class="navbar navbar-dark bg-dark">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarToggleExternalContent"
					aria-controls="navbarToggleExternalContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			</nav>
		</div>
	




		<div class="row">
			<div class="col-lg-9">
				<div class="headcontent">
					<div class="contenticon"></div>
					<div class="contentname">Tabelle für Tankstelleninfos.</div>
				</div>
				<div class="box">
					<table class="table table-striped table-dark">
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
								<th>Preisveränderung anzeigen</th>
							</tr>
						</thead>
						<tbody>
							<%
								String latPar = request.getParameter("lat");
								String lngPar = request.getParameter("lng");
								String radPar = request.getParameter("rad");

								String coord = "";

								Cookie[] cookies = request.getCookies();
								if (cookies != null) {
									for (Cookie c : cookies) {
										if (c.getName().equals("Koordinaten")) {
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

		var cookie = Cookies.get("Koordinaten");

		var r = confirm("Möchsten sie diese Koordinaten als ihre Standard-Adresse speichern?");
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

	function favVerw(t) {
		var cookie = Cookies.get("FavoritenID");

		//Wenn keine Cookies vorhanden sind, wird ein neuer erstellt
		if (cookie == null) {
			Cookies.set("FavoritenID", t + "&");
			alert("Favoritenliste wurde mit der Tankstelle erstellt!");
		}

		//Hinzufügen der Tankstelle	
		else if (!cookie.includes(t)) {
			cookie += t
			cookie += "&"
			Cookies.set("FavoritenID", cookie);
			alert("Tankstelle wurde zur Favoritenliste hinzugefügt!");
		}

		//Löschen einer Vorhandenen Tankstelle
		else {
			var newCookie = cookie.replace(t + "&", "");
			Cookies.set("FavoritenID", newCookie);
			alert("Tankstelle wurde von der Favoritenliste gelöscht!");
		}

	}

	function lbVerw(t) {

		var url = "http://localhost:8080/tankApp/leaderboard.jsp?id=" + t + "&fuel=&dateAb=&dateBis=";
		window.location.href = url;
	}

	function goFahrt(){window.location.href = "http://localhost:8080/tankApp/fahrtenbuch.jsp";}

	function goST(){window.location.href = "http://localhost:8080/tankApp/searchTankstelle.jsp";}

	function goLog(){window.location.href = "http://localhost:8080/tankApp/Login.jsp";}

	function goFav(){window.location.href = "http://localhost:8080/tankApp/favoritenListe.jsp";}

	function goGraph(t){window.location.href = "http://localhost:8080/tankApp/preisGraph.jsp?id="+t+"&fuel=diesel";}

	function getRad() {
		// Ausgewählten Radius abspeichern
		var rad = document.getElementById("rad").value;
	}

	function subCoord(){
		var url = "http://localhost:8080/tankApp/index.jsp"+ "?lat="+document.getElementById("latLabel").value+"&lng="+document.getElementById("lngLabel").value;
		window.location.href = url;
		}
</script>


</html>