<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>
<link href="css/jobReg.css" rel="stylesheet">
    <!-- Bootstrap Core CSS -->
    <link href="css/jobbootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/joblanding-page.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="css/jobfont-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

</head>
<body>
<%
String user_status = request.getParameter("userstatus");
if(user_status!=null && user_status!="null")
{
	if(user_status.equalsIgnoreCase("already_registered"))

{
%>
<div class="alert alert-danger">
  <strong>UserID already Exists! Try different UserID or try <a href="FacultyLogin.jsp">Logging In</a></strong>
</div>
<%
}
else
{
%>
<div></div>
<%
}
}
%>
<div class="container">
    <h1 class="well">Registration Form</h1>
	<div class="col-lg-12 well">
	<div class="row">
				<form action="RegistrationServlet" method="post">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>First Name</label>
								<input name="fname" type="text" placeholder="Enter First Name Here.." required class="form-control">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Last Name</label>
								<input name="lname" type="text" placeholder="Enter Last Name Here.." required class="form-control">
							</div>
						</div>					
						<div class="form-group">
							<label>UserID</label>
							<input name="userID" type="text" placeholder="Enter UserID Here.." required class="form-control">
						</div>	
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Password</label>
								<input name="pwd" type="password" placeholder="Enter password Here.." required class="form-control">
							</div>		
							<div class="col-sm-6 form-group">
								<label>Re-enter Password</label>
								<input type="password" placeholder="Re-Enter password Here.." required class="form-control">
							</div>	
						</div>						
					<div class="form-group">
						<label>Select User:</label>
						<select name="user">
    					<option value="Faculty">Faculty</option>
    					<option value="Student">Student</option>
 						 </select>
					</div>		
					<button type="submit" class="btn btn-lg btn-info">Submit</button>					
					</div>
				</form> 
				</div>
	</div>
	</div>
</body>
</html>