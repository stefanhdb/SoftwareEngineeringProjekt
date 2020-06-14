
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tankstelle suchen</title>

<%
	//jQuery
%>
<!-- CSS only -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/ca2e4c3b4a.js"
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

}
</Style>
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

   
	
 	

		<div class="containers">
		<div class="dircetion">
		<div class="p-3 mb-2 bg-dark text-white">
			<form action="searchTankstelle.jsp" method="GET">
				<table>
					<tr>
						<td>Straße :</td>
						<td><input type="text" name="street" id="streetInput"
							placeholder="Straße eingeben..." required></td>
					</tr>
					<tr>
						<td>Stadt :</td>
						<td><input type="text" name="place" id="placeInput" required></td>
					</tr>
					<tr>
						<td>Land :</td>
						<td><input type="text" name="country" id="countryInput"
							required></td>
					</tr>
					<tr>
						<td>Umkreis :</td>
						<td><select id="rad" name="rad">
								<option value="5">5 km</option>
								<option value="10">10 km</option>
								<option value="15">15 km</option>
								<option value="25">25 km</option>
						</select></td>
					</tr>
					<tr>
						<td><input type="text" name="lat" id="latInput" required
							readonly></td>
						<td><input type="text" name="lng" id="lngInput" required
							readonly></td>
					</tr>
					<tr>
						<td><button type="button" onclick="getAdress()">Bestätigen</button></td>
						<td><button type="submit">Submit</button></td>
					</tr>
				</table>
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
							<th>Leaderboard</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (request.getParameter("lat") != null) {
								String latPar = request.getParameter("lat");
								String lngPar = request.getParameter("lng");
								String radPar = request.getParameter("rad");

								String url = Test.APIConnection.createUrl(latPar, lngPar, radPar);
								Test.APIConnection.executePost(url);
								//Tabelle schreiben lassen		
								out.print(Test.APIConnection.createTable());
							}
						%>
					</tbody>
				</table>

			</form>
		</div>
		</div>
  </div>

</body>


<script>
	function getAdress() {

		var apikey = '9fb145e6d9e24f8c8cf03aa55a8ef139';
		var str = document.getElementById("streetInput").value;
		var pla = document.getElementById("placeInput").value;
		var cou = document.getElementById("countryInput").value;

		var api_url = 'https://api.opencagedata.com/geocode/v1/json'

		var request_url = api_url + '?' + 'key=' + apikey + '&q='
				+ encodeURIComponent(str + ',' + pla + ',' + cou) + '&pretty=1';

		// see full list of required and optional parameters:
		// https://opencagedata.com/api#forward

		var request = new XMLHttpRequest();
		request.open('GET', request_url, true);

		request.onload = function() {
			// see full list of possible response codes:
			// https://opencagedata.com/api#codes

			if (request.status == 200) {
				// Success!
				var data = JSON.parse(request.responseText);
				//alert(data.results[0].formatted);
				//var data = JSON.stringify(request.responseText);

				document.getElementById("latInput").value = JSON
						.stringify(data.results[0].geometry.lat);
				document.getElementById("lngInput").value = JSON
						.stringify(data.results[0].geometry.lng);

			} else if (request.status <= 500) {
				// We reached our target server, but it returned an error

				console.log("unable to geocode! Response code: "
						+ request.status);
				var data = JSON.parse(request.responseText);
				console.log(data.status.message);
			} else {
				console.log("server error");
			}
		};

		request.onerror = function() {
			// There was a connection error of some sort
			console.log("unable to connect to server");
		};

		request.send(); // make the request
	}

	function lbVerw(t) {

		var url = "http://localhost:8080/tankApp/leaderboard.jsp?id=" + t;
		window.location.href = url;
	}

	function favVerw(t) {
		var cookie = Cookies.get("FavoritenID");

		//
		if (cookie == null) {
			Cookies.set("FavoritenID", t + "&");
		}

		//Hinzufügen der Tankstelle	
		else if (!cookie.includes(t)) {
			cookie += t
			cookie += "&"
			Cookies.set("FavoritenID", cookie);
		}

		//Löschen einer Vorhandenen Tankstelle
		else {
			var newCookie = cookie.replace(t + "&", "");
			Cookies.set("FavoritenID", newCookie);
		}

		location.reload();
	}
</script>



</html>