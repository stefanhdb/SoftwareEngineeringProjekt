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

<table data-role="table" id="leaderboard" class="ui-responsive" border="1">
		<thead>
			<tr>
				<th>Benutzer</th>
				<th>Preis</th>
				
			</tr>
		</thead>
		<tbody>
			<%
			String id = request.getParameter("id");
			//DbConnection.getData(id);
			//DbConnection.createTable(DbConnection.getData(id));
			out.print(DbConnection.createTable(DbConnection.getData(id)));
			
			%>
		</tbody>
	</table>

</body>
</html>