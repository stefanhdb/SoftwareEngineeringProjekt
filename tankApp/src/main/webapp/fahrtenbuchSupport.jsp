<%@page import="Test.DbData"%>
<%@page import="Test.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>


</head>
<body>

<%
String user = ""; 
Cookie[] cookies = request.getCookies();
if(cookies != null){
	for(Cookie c : cookies){
		if(c.getName().equals("Benutzer")){
			user = c.getValue();
			break;
			}
		}
}

int id = 1;
String tsId = request.getParameter("id");
String tsName = request.getParameter("name");
String fuel = request.getParameter("fuel");

String price = request.getParameter("price");
String liter = request.getParameter("liter");
String date = request.getParameter("date");

DbConnection.insertData(DbConnection.getArray(id, tsId, tsName, user, fuel, price, liter, date));

%>

<script>

var url = "http://localhost:8080/tankApp/index.jsp";
window.location.href = url;

</script>


	</body>
</html>