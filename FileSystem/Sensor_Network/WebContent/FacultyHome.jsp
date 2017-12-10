<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.sn.pkg.DBCon"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <!--  <title>Bootstrap Login &amp; Register Templates</title>  -->
  		<title>Faculty Home</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="form-1/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="form-1/assets/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="choose-layout-assets/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
       <!--  <link rel="shortcut icon" href="form-1/assets/ico/favicon.png"> -->

<style type="text/css">
.loginuser{

padding-left: 650px;
}
</style>

</head>
<body>
<%


%>
<div class="header">
            <!-- Brand and toggle get grouped for better mobile display -->
            
            <!-- Collect the nav links, forms, and other content for toggling -->
            <% 
            
            
            
            
            String uname = (String) session.getAttribute("username");
          //back button
    		String currurl="";
    		String prevurl="";
    		if (request instanceof HttpServletRequest) 
    		{
    		String url = ((HttpServletRequest)request).getRequestURL().toString();
    		String queryString = ((HttpServletRequest)request).getQueryString();
    		currurl =url + "?" + queryString;
    		}
    		prevurl=(String)session.getAttribute("prevurl");
    		if(prevurl==null)
    		{
    			prevurl=currurl;
    		}
    		session.setAttribute("prevurl", currurl);
    		//end back button
            
            
            
            
            
            
            String valid = (String)session.getAttribute("activesession");
            		System.out.println(valid);
                     	if(valid!=null && valid!="null")
            		{
            
            		
            %>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="FacultyHome.jsp">Home</a>
                    </li>
                    <li>
                        <a href="<%=prevurl%>">Back</a>
                    </li>
                    <li>
                        <a href="logout">Logout</a>
                    </li>
                </ul>
            <span class="loginuser">Logged in as : <%= uname %></span>
            </div>
            <%}
            		
            		else
            		{
            		%>
            		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="FacultyHome.jsp">Home</a>
                    </li>
                    <li>
                        <a href="<%=prevurl%>">Back</a>
                    </li>
                    <li>
                        <a href="FacultyLogin.jsp">Login</a>
                    </li>
                </ul>
            
            </div>
            
            <%} %>


<%
String flag ="false";
if(request.getParameter("coursecreation")!=null && request.getParameter("coursecreation")!="null")
    		flag = request.getParameter("coursecreation");
    		
    		if( flag.equalsIgnoreCase("success"))
	{
		%> <div class="alert alert-success">
  <strong>Course Created successfully!!</strong>
</div>
	<%}
%>
    		

    	<div class="section-container">
	        <div class="container layouts">
	            <div class="row">
	                <div class="col-sm-12 section-description">
	                <h3>Hello <%=uname %>, You have logged in as a <strong>FACULTY</strong></h3> <br>
	                    <h3>What Do you want to do today ?</h3> <br>
	                </div>
	            </div>
	            <div class="row">
	            	<div class="col-sm-10 col-sm-offset-1">
	            		<div class="row">
		                	<div class="col-sm-4 layout-box">
		                	
			                	
			              	<span class = "relative">
			                	<a href="CoursePage.jsp">
			        <ul class="caption-style-1">
			         	<li>		<img src="form-1/assets/img/backgrounds/1.jpg" alt="" style="opacity: 0.7;"/>
			        				<p class="absolute-text"><font color=#000000>COURSE CENTER<br><br>Lets you create and view courses and assignments</font></p>
			            <div class="caption">
						<div class="blur"></div>
						<div class="caption-text">
						<h1><strong>COURSE CENTER</strong></h1>
						</div>
						</div>
						</li>
					</ul>
						
			            
			                	</a>
			                </span>  
		                    </div>
		                    
		                    
		                    
		                    
		                    
		                    
		                    <div class="col-sm-4 layout-box" style="float: right;">
			                    
			                     	<span class = "relative">
			                	<a href="GradeViewCourse.jsp">
			        <ul class="caption-style-1">
			         	<li>		<img src="form-1/assets/img/backgrounds/1.jpg" alt="" style="opacity: 0.7;"/>
			        				<p class="absolute-text"><font color=#000000>GRADE CENTER<br><br>Lets you view and Edit Grades</font></p>
			            <div class="caption">
						<div class="blur"></div>
						<div class="caption-text">
						<h1><strong>GRADE CENTER</strong></h1>
						</div>
						</div>
						</li>
					</ul>
						
			            
			                	</a>
			                </span> 
		                    </div>
		                    
		                    
		                    
		                    
		                    
		                    
		                    
		                    
		                    
		                    
		                    
		                    
		                    
	                    </div>
                    </div>
	            </div>
	        </div>
        </div>
        
        <div class="container footer">
            <div class="row">
                <div class="col-sm-12">
        			<p>Copyright © sensornetworks.edu 2016</p>
                </div>
            </div>
        </div>
        
</body>
</html>