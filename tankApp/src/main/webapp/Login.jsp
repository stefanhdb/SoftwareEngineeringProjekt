<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>


<form action="index.jsp" method="post">
	

	    <label for="uname"><b>Username</b></label>
	    <input id="nameLabel" type="text" placeholder="Enter Username" name="uname" required>
	
	    <button type="submit" onclick="logIn()">Login</button>

	</form>
	
	<script>

	function logIn(){
	
	var cookie = Cookies.get("Benutzer");
	var uname = document.getElementById("nameLabel").value;

	if(uname != null && uname != ""){
    Cookies.set("Benutzer", uname);
	}         	
	}

</script>

</body>



</html>