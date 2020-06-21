<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Favoriten</title>

<script
	src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>



<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/ca2e4c3b4a.js"
	crossorigin="anonymous"></script>


	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>





</head>

<Style>

.containers {
	background-image: url("gas_große.jpg");
	position: fixed;
	top: 0;
	left: 0;
	/* Preserve aspet ratio */
	min-width: 100%;
	min-height: 100%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
.dircetion{
  margin-top: 50px;
	margin-left: 50px;
	margin-right: 50px;
}
.logo{


float: left;


}
</Style>
<body>



				<div class="containers">
				 <div class="p-3 mb-2 bg-dark text-white">
				<div class="logo">
					<nav>
						<a href="http://localhost:8080/tankApp/"><img src="logo.png" height="115" 
							width="115" /></a>
					</nav>
				</div>
					
					
			

                 <div class="boxfav">

					<table class="table table-striped table-dark">
						<thead>
							<tr>
								<th>Tankstelle</th>
								<th>Straße</th>
								<th>Ort</th>
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
								if (favCook != null) {
									for (Cookie c : favCook) {
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
					</div>
				</div>

</body>
<script >

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
	
	location.reload();

}


function lbVerw(t) {

	var url = "http://localhost:8080/tankApp/leaderboard.jsp?id=" + t + "&fuel=&dateAb=&dateBis=";
	window.location.href = url;
}


function goHome(){window.location.href = "http://localhost:8080/tankApp/index.jsp";}

</script>
</html>