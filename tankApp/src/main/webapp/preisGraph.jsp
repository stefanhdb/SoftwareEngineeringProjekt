<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Preisveränderung</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
<form action="preisGraph.jsp" method="GET">	
	<table>  
   <tr>
	<td>Treibstoff: :</td>
	<td><select id="fuelInput" name="fuel">
		<option value="diesel">diesel</option>
		<option value="e5">e5</option>
		<option value="e10">e10</option>
	</select>
	</tr>
   <tr>
   <td>Tankstellen-ID: </td> 
    <td><input type="text" name="id" id="idInput" required readonly></input></td>
   </tr>  
   <tr>   
    <td><button type="submit" >Submit</button></td>   
   </tr>
  </table>
 </form>	 

<div class="container">
				<div id="chartContainer" style="height: 370px; width: 100%;"></div>
				<script
					src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
				<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
			</div>

</body>
</div>
					</div>
				</div>
<script>


	document.getElementById("idInput").value = "<% String idI = request.getParameter("id");out.print(idI);%>";
	


window.onload = function hello (t) {
	

	
    var dataPoints = [];
    var chart = new CanvasJS.Chart("chartContainer", {
        animationEnabled: true,
        theme: "light2",
        zoomEnabled: true,
        title: {
            text: "Preisveränderung <%out.print(request.getParameter("fuel")); %> des letzten Tages"
        },
        axisY: {
            title: "Preise pro Stunde",
            titleFontSize: 24,
            includeZero: false
        },
        axisX: {
            title: "Uhr",
            maximum: 25,
        },
        data: [{
            type: "line",
            yValueFormatString: "number",
            xValueType: "number",
            dataPoints: dataPoints
        }]
    });

    function addData(data) {
    	
	
        for (var i = 0; i < data.length; i++) {
            dataPoints.push({
                x: data[i].hour,                
                y: data[i].price
            });
        }
        chart.render();
    }
    <%//Link für die Preisabfrage mithilfe der Parameter erstellen %>
    $.getJSON("https://www.volzinnovation.com/fuel_price_variations_germany/data/<% String id = request.getParameter("id"); String newId = id.replace("-", "/"); out.print(newId);%>/<% String fuel = request.getParameter("fuel"); out.print(fuel);%>.json",addData);

    
}
</script>
	

</html>