<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Preisveränderung</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>
<body>

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

<script>


	document.getElementById("idInput").value = "<% String idI = request.getParameter("id");out.print(idI);%>";
	


window.onload = function hello (t) {
	

	
    var dataPoints = [];
    var chart = new CanvasJS.Chart("chartContainer", {
        animationEnabled: true,
        theme: "light2",
        zoomEnabled: true,
        title: {
            text: "Preisveränderung"
        },
        axisY: {
            title: "Preise pro Stunde",
            titleFontSize: 24,
            includeZero: false
        },
        axisX: {
            title: "Hours",
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
                y: data[i].price + <%String idB = request.getParameter("id"); String fuelU = request.getParameter("fuel"); out.print(Test.APIConnection.getPrice(idB,fuelU));%>
            });
        }
        chart.render();
    }
    $.getJSON("https://www.volzinnovation.com/fuel_price_variations_germany/data/<% String id = request.getParameter("id"); String newId = id.replace("-", "/"); out.print(newId);%>/<% String fuel = request.getParameter("fuel"); out.print(fuel);%>.json",addData);

    
}
</script>
	

</html>