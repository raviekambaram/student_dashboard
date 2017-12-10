<%@page import="com.sn.pkg.discussionQAModal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="com.sn.pkg.daoService"%>
<%@ page import="java.sql.*" %>

        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="form-1/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="form-1/assets/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="choose-layout-assets/style.css">

<link rel="stylesheet" type="text/css" href="css/discussion.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Discussion Forum</title>
<style>
body{
font-size: 150%;
}
h1 { 
	color : #7c795d; 
	font-family : 'Trocchi', serif; 
	font-size : 45px; 
	font-weight : normal;
	line-height : 48px;
    margin : 0; 
    }
.div1 {
    width: 800px;
    height: 100px;
    border: 1px solid black;
    padding: 50px;
    margin-left: 320px;
}
.loginuser{

padding-left: 650px;
}
</style>
</head>
<body>
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
            		//System.out.println(valid);
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
            		String quesNO = request.getParameter("quesNO");
                     daoService db1=new daoService();
                     String question = db1.getQuestion(quesNO);
        				System.out.println("question"+question);
            int i =0;
            
%><div class="div1"><h3>QUESTION: <%=question %></h3></div><%           
            daoService db=new daoService();
            ResultSet resultset = db.getAnswers(quesNO);
            if(resultset.next())
            {
            %>


<table>
  <thead>
    <tr>
      <th>#</th>
      <th>Posted By</th>
      <th>Answers</th>
      <th>Time Posted</th>
    </tr>
  </thead>
  <% do{%>
  
  <tbody>
  	<tr>
      <td><%=++i %></td>
      <td><strong><%=resultset.getString(3) %></strong></td>
      <td><%=resultset.getString(2) %></td>
      <td><%=resultset.getString(4) %></td>
   </tr>
      </tbody>
      <%
      }while(resultset.next());
  }
            else
            {
            	%> <h1>Sorry there are no answers for the above question.</h1>
            <hr><br><%}
                    %>   		

</table>
<form action="AddAnswer?quesNO=<%=quesNO %>" method="post">
<textarea class="textarea" type="textarea" name="answer" placeholder="Enter your answer here" rows="4" cols="50"></textarea>
<input type="submit" value="Post Answer"></input>
</form>
</body>
</html>