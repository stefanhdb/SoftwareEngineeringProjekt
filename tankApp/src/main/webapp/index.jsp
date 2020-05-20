<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
	<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
	<div class = "Überschrift">
	<h2>Tank - App</h2>
	</div>
	
	<Style>
	.header{
  padding: 80px; /* some padding */
  text-align: center; /* center the text */
  background: #FFA500; /* green background */
  color: white; /* white text color */
	}
	.Leiste{
  padding: 20px; /* some padding */
  text-align: center; /* center the text */
  background: #DA70D6; /* green background */
  color: white;	
	}
	.Überschrift{
  mpadding: 20px; /* some padding */
  text-align: center; /* center the text */
  background: #C0C0C0; /* green background */
  color: white;			
		}

	
	</Style>
	
</head>
	
	
<body>
    
    <% Test.APIConnection.executePost("https://creativecommons.tankerkoenig.de/json/list.php?lat=52.521&lng=13.438&rad=1.5&sort=dist&type=all&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d"); %>
	    <% //Test.APIConnection.executePost("https://creativecommons.tankerkoenig.de/json/list.php?street=bahnhofstraße&place=pforzheim&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d"); %>
	
	 <% //out.print(Test.APIConnection.TankstellenListe.get(1).getName()); <%out.print(Test.APIConnection.TankstellenListe.get(0).getName()); %> %>
	 
	<div class = "Leiste">
	<h2>Preisveränderung von e10</h2>
	</div>
	
	<div id="chart" style="width:auto; height:300px;"></div>
	
	<div class="header">
    
    <p>Statistik und Preisdaten pro Tankstelle anzeigen lassen!.</p>
	
	</div>
</body>


<table data-role="table" id="tsTabelle" data-mode="columntoggle" class="ui-responsive" border="1">
	<thead>
		<tr>
			<th>Tankstelle</th>
			<th>Ort</th>
			<th>Distanz</th>
		</tr>
	</thead>
	<tbody>
		
			<% out.print(Test.APIConnection.createTable());
			%>
			
	</tbody>
</table>



	
<script>
    // Visualization API with the 'corechart' package.
    google.charts.load('visualization', { packages: ['corechart'] });
    google.charts.setOnLoadCallback(drawLineChart);

	
    function drawLineChart() {
        $.ajax({
            url: "https://www.volzinnovation.com/fuel_price_variations_germany/data/474e5046/deaf/4f9b/9a32/9797b778f047/e10.json",
            dataType: "json",
            type: "GET",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                var arrSales = [['hour', 'price']];    // Define an array and assign columns for the chart.

                // Loop through each data and populate the array.
                $.each(data, function (index, value) {
                    arrSales.push([value.hour, value.price]);
                });

                // Set chart Options.
                var options = {
                    title: 'Tank Price',
                    curveType: 'function',
                    legend: { position: 'bottom', textStyle: { color: '#555', fontSize: 14} }  // You can position the legend on 'top' or at the 'bottom'.
                };

                // Create DataTable and add the array to it.
                var figures = google.visualization.arrayToDataTable(arrSales)

                // Define the chart type (LineChart) and the container (a DIV in our case).
                var chart = new google.visualization.LineChart(document.getElementById('chart'));
                chart.draw(figures, options);      // Draw the chart with Options.
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert('Got an Error');
            }
        });
    }

	
    	
</script>


</html>