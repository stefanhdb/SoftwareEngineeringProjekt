<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form >
				<div class="container">
					<button type="button" onclick="goHome()">Zum Hauptmenü zurüch gehen</button>
					</div>
			</form>

<div class="boxfav">

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
				
				

</body>
<script >function goHome(){window.location.href = "http://localhost:8080/tankApp/index.jsp";}</script>
</html>