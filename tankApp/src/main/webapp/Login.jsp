<%@page import="Test.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script
	src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
	

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
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



	<!-- Contents -->

		<div class="containers">
         <div class="dircetion">
        
        <div class="p-3 mb-2 bg-dark text-white">
         <form action="Login.jsp" method="GET">
         
			<label for="uname"><b>Username</b></label> <input id="nameLabel"
				type="text" placeholder="Enter Username" name="uname" required>
				
				 <div class="logo">
					<nav>
						<a href="http://localhost:8080/tankApp/"><img src="logo.png" height="55" 
							width="55" /></a>
					</nav>
				</div>
			<button type="submit" >Bestätigen</button>
			<button type="button" onclick="goMain()">Zurück zum Hauptmenu</button>				
		</form>
		</div>
		
		</div>
		</div>
		
		<% try{
			String uname = request.getParameter("uname");
			
			//Überprüfen, ob der User etwas eingegeben hat
			if(!uname.equals(null) && !uname.equals("")){
			
			//Überprüfen, ob der eingegebene Name schon vorhanden ist!
			boolean boo = DbConnection.searchUName(uname);
					
			int counter = 0;
					
			Cookie[] cookies = request.getCookies();
			if(boo==true){
			//Wenn der Benutzername noch nicht vorhanden ist:
			
				for(Cookie c : cookies){
					if(c.getName().equals("Benutzer")){
						//Wenn es bereits einen Benutzcookie gibt, wird dieser aktualisiert
						counter=2;						
						c.setValue(uname);
						response.addCookie(c);	
						out.print("<script>alert(\"Benutzername wurde aktualisiert!\")</script>");
						break;
						}
						}
					}
			else{
				//Wenn der Benutzname vergeben ist, wird eine Fehlermeldung ausgelöst
				counter=1;
				out.print("<script>alert(\"Benutzername ist bereits vorhanden! Wählen sie einen anderen.\")</script>");
			}
			
			if(counter==0){
				//Wenn es noch keinen Benutzercookie gibt, wird ein neuer erstellt
				Cookie cookie = new Cookie("Benutzer", uname);	
				response.addCookie(cookie);		
				out.print("<script>alert(\"Benutzerprofil wurde erstellt!\")</script>");
			}
			}
			}
		catch(Exception e){}
					%>
	

	<script>

		function goMain(){
			var url = "http://localhost:8080/tankApp/index.jsp";
			window.location.href = url;
			}
	</script>

</body>



</html>