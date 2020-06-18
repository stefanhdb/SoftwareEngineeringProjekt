<!DOCTYPE HTML>
<html>
<head>
	<%//jQuery %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <title>Fahrtenbuch</title>
  
  <!-- CSS only -->
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


<Style>
.containers {
	background-image: url("gas_groﬂe.jpg");
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
</Style>
  
  
</head>

<body>



<div class="containers">

     <div class="dircetion">
     
     <div class="p-3 mb-2 bg-dark text-white">
     
 <form action="fahrtenbuchSupport.jsp" method="GET">
  <table>
   <tr>
    <td>Straﬂe :</td>
    <td><input type="text" name="street" id="streetInput" required></td>
   </tr>
   <tr>
    <td>Stadt :</td>
    <td><input type="text" name="place" id="placeInput" required></td>
   </tr>
   <tr>
    <td>Land :</td>
    <td><input type="text" name="country" id="countryInput" required></td>
   </tr>
   <tr>
    <td>Preis :</td>
    <td><input type="number" step="0.01" min="0" name="price" id="priceInput" required></td>
   </tr>
   <tr>
    <td>Liter :</td>
    <td><input type="number" step="0.01" min="0" name="liter" id="literInput" required></td>
   </tr>
   <tr>
    <td>Datum :</td>
    <td><input type="date" name="date" id="dateInput" required></td>
   </tr>
   <tr>
    <td><input type="text" name="id" id="idInput" required readonly></td>
    <td><input type="text" name="name" id="nameInput" required readonly></td>
   </tr>  
   <tr>
   <td><button type="button" onclick="getAdress()">Best‰tigen</button></td>   
    <td><button type="submit" >Submit</button></td>   
   </tr>
  </table>
  
 </form>
 </div>
		</div>
	</div>
 
 <script> 
 		function getAdress(){ 
		 
		  var apikey = '9fb145e6d9e24f8c8cf03aa55a8ef139';
		  var str = document.getElementById("streetInput").value;
		  var pla = document.getElementById("placeInput").value;
		  var cou = document.getElementById("countryInput").value;
		  var api_url = 'https://api.opencagedata.com/geocode/v1/json'
		  var request_url = api_url
		    + '?'
		    + 'key=' + apikey
		    + '&q=' + encodeURIComponent(str + ',' + pla + ',' + cou)
		    + '&pretty=1';
		  // see full list of required and optional parameters:
		  // https://opencagedata.com/api#forward
		  var request = new XMLHttpRequest();
		  request.open('GET', request_url, true);
		  request.onload = function() {
		    // see full list of possible response codes:
		    // https://opencagedata.com/api#codes
		    if (request.status == 200){ 
		      // Success!
		      var data = JSON.parse(request.responseText);
		      //alert(data.results[0].formatted);
		      //var data = JSON.stringify(request.responseText);
		      
		      var coordinates=[data.results[0].geometry.lat, data.results[0].geometry.lng];
		      
				//coordinates.push({"lat": data.results[0].geometry.lat, "lng":  data.results[0].geometry.lng}); 
		    	
				//alert(JSON.stringify(coordinates));
			      searchTsId(coordinates);
		    } else if (request.status <= 500){ 
		      // We reached our target server, but it returned an error
		                           
		      console.log("unable to geocode! Response code: " + request.status);
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
		  request.send();  // make the request
		} 
 		function searchTsId(coordinates){
 			
 			//Anfrage an volzinnovation schicken
 			jQuery.getJSON('https://www.volzinnovation.com/fuel_price_variations_germany/data/stations.json', function(data){
 				//JSON Datei abspeichern	
 			var jsonStr = '{"gasStation":' + JSON.stringify(data) + "}";
 			var jsonDat = JSON.parse(jsonStr);

 			// Arrays f¸r die passenden Tankstellenattribute deklarieren
 			var tsId=[];
 			var tsName=[];
 			var counter=0;
 			
 			//ID der passenden Tankstellen abspeichern
 			for(var x=0; x < jsonDat.gasStation.length; x++){
 			var ts =jsonDat.gasStation[x];
 			//Nach einer Tankstelle an den Koordinaten in einem kleinen Umkreis suchen
 			if((coordinates[0] > ts.latitude-0.01 && coordinates[0] < ts.latitude+0.01)  && (coordinates[1] > ts.longitude -0.01 && coordinates[1] < ts.longitude + 0.01)){
 				tsId[counter] = ts.uuid;
 				tsName[counter] = ts.name;
 				counter++;
 				}
 				}
 			if(tsId.length == 0){
 				alert("Keine Tankstelle wurde unter dieser Adresse gefunden!");
 			}
 			else if(tsId.length == 1){
 	 			//Wenn nur eine Tankstelle mit den passenden Koordinaten gefunden wurde, werden diese Werte abgespeichert
 				var id = JSON.stringify(tsId[0]).slice(1, -1);
 				var name = JSON.stringify(tsName[0]).slice(1, -1);
				
 				document.getElementById("idInput").value = id;
 				document.getElementById("nameInput").value = name;
 				}
 			else{
 				alert("Mehrere Tankstellen gefunden!");
 			}
 			});
 			
 		}
		
		</script>
 
 
</body>
</html>