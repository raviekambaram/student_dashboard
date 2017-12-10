<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="com.sn.pkg.daoService"%>
<%@ page import="java.sql.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Course</title>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="form-1/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="form-1/assets/font-awesome/css/font-awesome.min.css"> 
<link href="css/joblisting.css" rel="stylesheet">
<style>
h1 { 
	color : #7c795d; 
	font-family : 'Trocchi', serif; 
	font-size : 45px; 
	font-weight : normal;
	line-height : 48px;
    margin : 0; 
    }
   
div {
    margin-top: 10px;
    margin-bottom: 100px;
    margin-right: 150px;
    margin-left: 80px;
}
table,td, th{
 border: 1px solid #dddddd;
 }
.loginuser{

padding-left: 500px;
}

</style>

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



</head>
<body>

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
			session.setAttribute("prevurl", currurl);
			//end back button
String usertype = (String)session.getAttribute("usertype");
            
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
            <%} %>




 <div class="table-responsive">

              
             
    <% 	
    	 HttpSession Sess = request.getSession();
    	String userID =(String) Sess.getAttribute("loggedinUser");
            daoService db=new daoService();
            ResultSet resultset = db.getCourseInfoGrade(userID);


if(resultset.next())
{
	%><table id="mytable" class="table table-bordred table-striped">
     
     <thead>
     <th>Course name</th>
      <th>Semester Offered</th>
       <th>Detailed Description</th>
     </thead>
<tbody>
		<%	do
			{ 
				%>
					
					
			
            <tr>
               <td> <%= resultset.getString(2) %> </td>
               <td> <%= resultset.getString(3) %> </td>
               <td> <p data-placement="top" data-toggle="tooltip" title="Edit"><a href="CourseDisplay.jsp?courseID=<%= resultset.getString(1)%>" class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal"  ><span class="glyphicon glyphicon-ok"></span></a></p> </td>
           </tr> 
					<%}while(resultset.next());
}
else
{
	%> <h1>You have not created any courses till now!!!</h1>
<%}
        %>   		
    		
        
    
   
    
    </tbody>
        
</table>

</body>
</html>