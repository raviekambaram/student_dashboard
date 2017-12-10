<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Faculty Login Page</title>
<!-- Custom Fonts -->
    <link href="css/jobfont-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<!-- Bootstrap Core CSS -->
    <link href="css/jobbootstrap.min.css" rel="stylesheet">

<link href="css/facultylogin.css" rel="stylesheet">
<style type="text/css">
.register{
padding-left:200px;
font-size: 16px;
}
h4{
color: black;
margin-left: 0px;
}
</style>
</head>
<body>
<%

String activesession = (String)session.getAttribute("activesession");
String loggedinUser = (String)session.getAttribute("loggedinUser");
if(activesession!=null)
{
if(activesession.equalsIgnoreCase("SET"))
{
	%>
	<div class="header">
	<h4> HELLO <%=loggedinUser %> YOU HAVE ALREADY LOGGED IN, KINDLY <a href="FacultyHome.jsp">CLICK HERE</a> TO GO TO THE HOME PAGE</h4>
	<h4>IF YOU ARE NOT <%=loggedinUser %> PLEASE <a href="logout">CLICK HERE</a></h4>
	</div>
	<% 
}
}
else
{
String user_status = request.getParameter("userstatus");
if(user_status!=null && user_status!="null")
{
if(user_status.equalsIgnoreCase("registered_successfully"))
{
%>
<div class="alert alert-success">
  <strong>You are successfully registered. Please Login to continue</strong>
</div>

<%	
}
else if(user_status.equalsIgnoreCase("not_found"))
{
%>
<div class="alert alert-danger">
  <strong>Your Credentials did not match. Please try logging in again or <a href="Registration.jsp">Register</a></strong>
</div>

<%	
}

else 
{
	%>
	<div><img alt="" src="img/bg.jpg"> </div>

	<%
}
}
%>
  <div class="body"></div>
		<div class="grad"></div>
		<div class="header">
			<div>Sensor<span>Networks</span></div>
		</div>
		<br>
		<div class="login">
				<h1><div><span>LOGIN</span><div></h1>
				<form action="loginServlet" method="post">
				<input type="text" placeholder="userID" name="user"><br>
				<input type="password" placeholder="password" name="password"><br>
				<input type="submit" value="Login">
				</form>
				<span class="register"><a href="Registration.jsp">Register</a></span>
		</div>
 
 <%} %> 
</body>

</html>