<%@page import="com.sn.pkg.daoCourse"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@page import="com.sn.pkg.daoService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
.center {
    margin: auto;
    width: 60%;
    padding: 14px;
    text-align: -webkit-center;
    font-size: xx-large;
}
p {
    font-weight: 900;
    font-size: 50%
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
<%
String uname = (String) session.getAttribute("username");
String courseID = request.getParameter("courseID");
System.out.println("CourseID "+courseID);
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
         daoService db=new daoService();
         daoCourse cs = db.getCourseInfoDisplay(courseID);
	String cname = cs.getcourse_name();
	String semoffer = cs.getsemester_offered();
String valid = (String)session.getAttribute("activesession");
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
            <%} 
            	if(cs!=null)
		{
			
		%>

<div class="center">COURSE EXPLAINATION:
<br>
<br>
<p>Course Name		 	: <%=cname %></p>
<br>
<p>Semester offered     : <%=semoffer %></p>
<br>
<p>Course Explanation PDF :</p>

</div>
<iframe src="ContentDispServlet?courseID=<%=courseID %>&content=pdf" width="1500" height="500" frameborder="1" name="Course Description" scrolling="auto">
</iframe>
<hr>

<div class="center">COURSE CONTENT:</div>
<iframe src="ContentDispServlet?courseID=<%=courseID %>&content=video
" width="1500"  height="500" frameborder="1" name="Course Description" scrolling="auto">
</iframe>
<hr>
<div class="center"> ASSIGNMENT:</div>
<div class="center"> <a type="button" href="Assignment.jsp?courseID=<%=courseID %>" class="btn btn-info btn-block">View Assignment</a>  
 </div>
<hr>
<div class="center"> DISCUSSION FORUM:</div>
<div class="center"> <a type="button" href="DiscQues.jsp?courseID=<%=courseID %>" class="btn btn-info btn-block">Discussion Forum</a>  
 </div>
<%}
            	else
            	{
            	
            	%>
            	<h1>Course Not Selected properly. Make proper selection.</h1>
            	<%
            	}%>
</body>
</html>