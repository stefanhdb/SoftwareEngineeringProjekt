<%@page import="Test.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leaderboard</title>
</head>

<body>



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
		<td><button type="submit"> Filter anwenden!</button></td>
	</tr>
	<tr>
    <td>Datum :</td>
    <td>Ab: <input type="date" name="dateAb" id="dateAbInput" ></td>
    <td>Bis: <input type="date" name="dateBis" id="dateBisInput" ></td>
   </tr>
	</table>
</form>
			
<table data-role="table" id="leaderboard" class="ui-responsive" border="1">
		<thead>
			<tr>
				<th>Benutzer</th>
				<th>Preis pro Liter</th>
				<th>Im Durchschnitt gespart</th>
				
			</tr>
		</thead>
		<tbody>
			<%
			String id = request.getParameter("id");
			String fuel = request.getParameter("fuel");
			String dateAb = request.getParameter("dateAb");
			String dateBis = request.getParameter("dateBis");
			
			out.print(DbConnection.createTable(DbConnection.getData(id) ,fuel , dateAb ,dateBis));			
			
			%>
		</tbody>
	</table>
	

</body>

<script> 
//Um die ID bei Submitt zu behalten, muss diese in einem Input gespeichert werden, damit sie erneut mitgegeben wird
var url_string = window.location.href ; 
var url = new URL(url_string);
var id = url.searchParams.get("id");
document.getElementById('idInput').value = id ;



const table = document.querySelector('leaderboard'); //get the table to be sorted

table.querySelectorAll('th').forEach((element, columnNo)=>{ element.addEventListener('click', event =>{sortTable(table, columnNo); //call a function which sorts the table by a given column number
    })
  });
  
  
  function sortTable(table, sortColumn){
  // get the data from the table cells
  const tableBody = table.querySelector('tbody')
  const tableData = table2data(tableBody);
  // sort the extracted data
  tableData.sort((a, b)=>{
    if(a[sortColumn] > b[sortColumn]){
      return 1;
    }
    return -1;
  })
  // put the sorted data back into the table
  data2table(tableBody, tableData);
}
  

//this function gets data from the rows and cells 
//within an html tbody element
function table2data(tableBody){
const tableData = []; // create the array that'll hold the data rows
tableBody.querySelectorAll('tr')
 .forEach(row=>{  // for each table row...
   const rowData = [];  // make an array for that row
   row.querySelectorAll('td')  // for each cell in that row
     .forEach(cell=>{
       rowData.push(cell.innerText);  // add it to the row data
     })
   tableData.push(rowData);  // add the full row to the table data 
 });
return tableData;
}

//this function puts data into an html tbody element
function data2table(tableBody, tableData){
tableBody.querySelectorAll('tr') // for each table row...
 .forEach((row, i)=>{  
   const rowData = tableData[i]; // get the array for the row data
   row.querySelectorAll('td')  // for each table cell ...
     .forEach((cell, j)=>{
       cell.innerText = rowData[j]; // put the appropriate array element into the cell
     })
   tableData.push(rowData);
 });
}


</script>

</html>