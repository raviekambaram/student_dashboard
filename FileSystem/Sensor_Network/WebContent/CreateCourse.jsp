<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="com.sn.pkg.daoService"%>
<%@ page import="java.sql.*" %>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Course Creation</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
    
    <style type="text/css">
    .btn{
        padding: 12px 250px;
    }
    
h1 { 
	color : #7c795d; 
	font-family : 'Trocchi', serif; 
	font-size : 45px; 
	font-weight : normal;
	line-height : 48px;
    margin : 0; 
    }
   
.loginuser{

padding-left: 650px;
}


    </style>
</head>
<body>

<div class="header">
            <!-- Brand and toggle get grouped for better mobile display -->
            
            <!-- Collect the nav links, forms, and other content for toggling -->
            <% 
            String uname = (String) session.getAttribute("username");
            String valid = (String)session.getAttribute("activesession");

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
            		session.setAttribute("prevurl", currurl);
            		//end back button
            		String usertype = (String)session.getAttribute("usertype");
            		
            		System.out.println(valid);
            		if(valid!=null && valid!="null")
            		{
            			
            		
            %>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <%if(usertype.equalsIgnoreCase("Faculty"))
                    	{%><li>
                        <a href="FacultyHome.jsp">Home</a>
                    </li><%}
                    else
                    {
                    %><li>
                        <a href="StudentHome.jsp">Home</a>
                    </li><%} %>
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
                   <%if(usertype.equalsIgnoreCase("Faculty"))
                    	{%><li>
                        <a href="FacultyHome.jsp">Home</a>
                    </li><%}
                    else
                    {
                    %><li>
                        <a href="StudentHome.jsp">Home</a>
                    </li><%} %>
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
    	 //HttpSession Sess = request.getSession();
		
		
		String userID=(String)session.getAttribute("loggedinUser");
    	String courseID = request.getParameter("courseID");
    	daoService db=new daoService();
    	int count = db.checkCourseCount(userID);

            if (count<3)
            {
            

%>

<div class="container">

<div class="page-header">
    <h1>Course Creation <small>Just upload the required documents</small></h1>
</div>

<!-- Registration form - START -->
<div class="container">
    <div class="row">
        <form action="CreateCourseServlet" method="post" role="form" enctype="multipart/form-data">
            <div class="col-lg-6">
                <div class="well well-sm"><strong><span class="glyphicon glyphicon-asterisk"></span>Required Field</strong></div>
                <div class="form-group">
                    <label for="InputName">Course Name</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="course_name" id="course_name" placeholder="Course Name" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="InputEmail">Course Content Video(*.mp4<15MB)</label>
                    <div class="input-group">
                        <input type="file" class="form-control" id="course_content" name="course_content" placeholder="Course Content" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="InputName">Assignment Question 1</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="as_ques1" id="as_ques1" placeholder="Question 1" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
				<div class="form-group">
                    <label for="InputName">Answer option 1</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="1ansopt1" id="1ansopt1" placeholder="Answer Option 1" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
				<div class="form-group">
                    <label for="InputName">Answer option 2</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="1ansopt2" id="1ansopt2" placeholder="Answer Option 1" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
				<div class="form-group">
                    <label for="InputName">Answer option 3</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="1ansopt3" id="1ansopt3" placeholder="Answer Option 1" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
				<div class="form-group">
                    <label for="InputName">Answer option 4</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="1ansopt4" id="1ansopt4" placeholder="Answer Option 1" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                	<div class="form-group">
                    <label for="InputName">Correct Answer For Question 1</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="as_cans1" id="as_cans1" placeholder="Enter Name" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                <input type="submit" name="submit" id="submit" value="Submit" class="btn btn-info pull-right">
            </div>
        
        <div class="col-lg-5 col-md-push-1">
                <div class="well well-sm"><strong><span class="glyphicon glyphicon-asterisk"></span>Required Field</strong></div>
            <div class="form-group">
                    <label for="InputName">Semester Offered</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="semester_offered" id="semester_offered" placeholder="Semester Offered" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="InputEmail">Course Explaination PDF</label>
                    <div class="input-group">
                        <input type="file" class="form-control" id="course_explaination" name="course_explaination" placeholder="Course Explaination" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
            <div class="form-group">
            
                    <label for="InputName">Assignment Question 2</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="as_ques2" id="as_ques2" placeholder="Question 1" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
				<div class="form-group">
                    <label for="InputName">Answer option 1</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="2ansopt1" id="2ansopt1" placeholder="Answer Option 1" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
				<div class="form-group">
                    <label for="InputName">Answer option 2</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="2ansopt2" id="2ansopt2" placeholder="Answer Option 1" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
				<div class="form-group">
                    <label for="InputName">Answer option 3</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="2ansopt3" id="2ansopt3" placeholder="Answer Option 1" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
				<div class="form-group">
                    <label for="InputName">Answer option 4</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="2ansopt4" id="2ansopt4" placeholder="Answer Option 1" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
			
				<div class="form-group">
                    <label for="InputName">Correct Answer For Question 2</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="as_cans2" id="as_cans2" placeholder="Enter Name" required>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
				
        </div>
		</form>
    </div>
</div>
<%
}
            
else
{
%>

 <h1>Sorry you are not allowed to create more than 3 courses.</h1>

<%
}
            
%>
</div>
</body>
</html>