<%@page import="Test.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leaderboard</title>


<!-- CSS only -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
	
<script src="https://kit.fontawesome.com/ca2e4c3b4a.js"
	crossorigin="anonymous"></script>
	
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
.hintergrund{
    -webkit-box-shadow: 0 0 10px 0 #000000;
	box-shadow: 0 0 10px 0 #000000;
	background-color: #0f161a;
	border-left: 5px solid #f42339;
	float: left;
	width: 100%;
	margin-top: 20px;
	margin-left: 20px;
}
.dircetion{
  margin-top: 50px;
	margin-left: 50px;
	margin-right: 50px;

}
.logo{


float: left;


}
}
</Style>
<body>


    <div class="containers">
		<div class="dircetion">
		<div class="p-3 mb-2 bg-dark text-white">
		<div class="logo">
					<nav>
						<a href="http://localhost:8080/tankApp/"><img src="logo.png" height="105" 
							width="105" /></a>
					</nav>
				</div>
	<form action="leaderboard.jsp">
		<table>
			<tr>
				<td>Tankstelle: :</td>
				<td><input type="text" id="idInput" name="id" readonly></input></td>
			</tr>
			<tr>
				<td>Treibstoff: :</td>
				<td><select id="fuelInput" name="fuel">
						<option value="">Alle</option>
						<option value="diesel">Diesel</option>
						<option value="e5">E5</option>
						<option value="e10">E10</option>
				</select></td>
				<td><button type="submit">Filter anwenden!</button></td>
			</tr>
			<tr>
				<td>Datum :</td>
				<td>Ab: <input type="date" name="dateAb" id="dateAbInput"></td>
				<td>Bis: <input type="date" name="dateBis" id="dateBisInput"></td>
			</tr>
		</table>
	</form>

	
		<table class="table table-striped table-dark">
		<thead>
			<tr>
				<th>Benutzer</th>
				<th>Treibstoff</th>
				<th>Datum der Transaktion</th>
				<th>Preis pro Liter</th>
				<th>Unterschied zum Durchschnittspreis</th>

			</tr>
		</thead>
		<tbody>
			<%
				String id = request.getParameter("id");
				String fuel = request.getParameter("fuel");
				String dateAb = request.getParameter("dateAb");
				String dateBis = request.getParameter("dateBis");

				out.print(DbConnection.createTable(DbConnection.getData(id), fuel, dateAb, dateBis));
			%>
		</tbody>
	</table>
  </div>
		</div>
  </div>

</body>

<script> 
//Um die ID bei Submitt zu behalten, muss diese in einem Input gespeichert werden, damit sie erneut mitgegeben wird
var url_string = window.location.href ; 
var url = new URL(url_string);
var id = url.searchParams.get("id");
document.getElementById('idInput').value = id ;


</script>

</html>