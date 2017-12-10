<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="com.sn.pkg.daoService"%>
<%@ page import="java.sql.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Grading</title>
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
.loginuser{

padding-left: 400px;
}
</style>

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



    <% 	
    	 	HttpSession Sess = request.getSession();
    		String flag ="false";
    		System.out.println(flag);
    		if(request.getParameter("updated")!=null && request.getParameter("updated")!="null")
    		flag = request.getParameter("updated");
    		System.out.println(flag);
    		if(flag.equalsIgnoreCase(null) && flag.equalsIgnoreCase("null"))
    		{
    			flag = "false";
    		}
    		int fsort,lsort,gsort;
    		fsort = (Integer) session.getAttribute("fsort");
    		lsort = (Integer) session.getAttribute("lsort");
    		gsort = (Integer) session.getAttribute("gsort");
    		String courseID = request.getParameter("courseID");
            //String sql = "select course_name,first_name,last_name,scores,gradeprim,userID from sensor_network.grading where courseID =?";
            daoService db=new daoService();
            ResultSet resultset = db.getGradeInfo(courseID);           
            //System.out.println(sql);
            

if(resultset.next())
{
	if( flag.equalsIgnoreCase("true"))
	{
		%> <div class="alert alert-success">
  <strong>Grade Updated successfully!!</strong>
</div>
	<%}
%>
<h3>COURSE NAME:  <%= resultset.getString(1) %></h3> 
<table id="mytable" class="table table-bordred table-striped" BORDER="1">
     
     <thead>
    
     <%-- <th><a href="Grading.jsp?courseID=<%= courseID %>">Course name</a></th> --%>
      <th><a href="Grading1.jsp?courseID=<%= courseID %>&colname=first_name">First Name</a></th>
       <th><a href="Grading1.jsp?courseID=<%= courseID %>&colname=last_name">Last Name</a></th>
       <th><a href="Grading1.jsp?courseID=<%= courseID %>&colname=scores">Scores</a></th>
       <th>Update</th>
     </thead>
<tbody>
<% do
{
%>
<tr>
<form action="Grading?gradeprim=<%= resultset.getString(5) %>&courseID=<%= courseID %>" method=post>
	<%-- 		<td> <%= resultset.getString(1) %> </td> --%>
			   <td> <%= resultset.getString(2) %> </td>
               <td> <%= resultset.getString(3) %> </td>
               <td> <input name="grade" type="text" placeholder="Enter password Here.." value="<%= resultset.getString(4) %>" class="form-control"> </td>
               <td> <p data-placement="top" data-toggle="tooltip" title="Edit"><input type="submit" value="EDIT" class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal"  ><span class="glyphicon glyphicon-ok"></span></p> </td>
           </tr>
   </form>        
<%
}while(resultset.next());
}
else
{
	%> <h1>Sorry there are no Students available to display grades</h1>
<%}
%>
</tbody>
        
</table>

<!-- <script src="js/sortable.js"></script> -->
</body>
</html>