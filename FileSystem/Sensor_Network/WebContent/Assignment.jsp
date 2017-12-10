<%@page import="com.sn.pkg.daoService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="com.sn.pkg.DBCon"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.Random"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<style>

.btn {
    display: block;
    padding: 6px 41px;
    margin-bottom: 4px;
    }
    .center {
    margin: auto;
    width: 60%;
    padding: 14px;
    text-align: -webkit-center;
    font-size: xx-large;
    margin-left: 100px
}
.question{
margin-left: 150px


}
body{
padding-left:350px
}
.sub{
padding-left:230px
}
.header1{
padding-right:100px
}
.form1{
padding-left:50px
}
.loginuser{

padding-left: 500px;
}
h1 { 
	color : #7c795d; 
	font-family : 'Trocchi', serif; 
	font-size : 45px; 
	font-weight : normal;
	line-height : 48px;
    margin : 0; 
    }
    input[type="submit"]
    {
    margin-top:10px;
    padding:(10px 20px);
    
    }
</style>
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
  
	
String courseID = request.getParameter("courseID");

daoService db=new daoService();
ResultSet resultset = db.getAssignment(courseID);
Random rand = new Random();
int i,j,k,l,a,b,c;


Random r = new Random();
int Low = 0;
int High =3;

//System.out.println(sql);
if(resultset.next())
{
	
String [] q1ans = {resultset.getString(3),resultset.getString(4),resultset.getString(5),resultset.getString(6)};
String [] q2ans = {resultset.getString(7),resultset.getString(8),resultset.getString(9),resultset.getString(10)};
	
%>
<%
String flag ="false";
if(request.getParameter("AssState")!=null && request.getParameter("AssState")!="null")
    		flag = request.getParameter("AssState");
    		
    		if( flag.equalsIgnoreCase("failure"))
	{
		%> <div class="alert alert-danger">
  <strong>This assignment is already submitted and graded.</strong>
</div>
	<%}
%>
<div class="container">
  <!--
  -->
  <div class="header center">
  <h2 class="header1"><%=resultset.getString(11)%> Assignment.</h2>
  </div>
  <div class="form1">
  <form action="AssignmentServlet?courseID=<%=courseID %>" method="post">
  <h3 class="question">1)<%=resultset.getString(1) %></h3>
    <div class="btn-group-lg btn-group" data-toggle="buttons">
      <row>
        <div class="col-lg-6">
          <label class="btn btn-primary">
            <input type="radio" name="options1" id="option1" value="<%=q1ans[i = r.nextInt(High-Low) + Low] %>"> <%=q1ans[i] %>
          </label>
        </div>
        </row>
      <%
      a=i;
      i++;
      if(i>3)
      {
    	  j=0;
      }
      else
      {
    	  j=i;
      }%>  <!--<span>or</span>-->
        <row>
        <div class="col-lg-6">
          <label class="btn btn-primary">
            <input type="radio" name="options1" id="option2" value="<%=q1ans[j] %>"> <%=q1ans[j] %>
          </label>
        </div>
      </row>
      <%b=j;
      j++;
      if(j>3)
      {
    	  k=0;
      }
      else
      {
    	  k=j;
      }%>
      <row>
        <div class="col-lg-6">
          <label class="btn btn-primary">
            <input type="radio" name="options1" id="option2" value="<%=q1ans[k] %>"> <%=q1ans[k] %>
          </label>
        </div>
      </row>
      <%c=k;
      k++;
      if(k>3)
      {
    	  l=0;
      }
      else
      {
    	  l=k;
      }%>
      <row>
        <div class="col-lg-6">
          <label class="btn btn-primary">
            <input type="radio" name="options1" id="option2" value="<%=q1ans[l] %>"> <%=q1ans[l] %>
          </label>
        </div>
      </row>
  </div>
<h3 class="question">2)<%= resultset.getString(2) %></h3>
    <div class="btn-group-lg btn-group" data-toggle="buttons">
      <row>
        <div class="col-lg-6">
          <label class="btn btn-primary">
            <input type="radio" name="options2" id="option1" value="<%=q2ans[c]%>"> <%=q2ans[c] %>
          </label>
        </div>
        </row>
        <!--<span>or</span>-->
        <row>
        <div class="col-lg-6">
          <label class="btn btn-primary">
            <input type="radio" name="options2" id="option2" value="<%=q2ans[b]%>"> <%=q2ans[b] %>
          </label>
        </div>
      </row>
      <row>
        <div class="col-lg-6">
          <label class="btn btn-primary">
            <input type="radio" name="options2" id="option2" value="<%=q2ans[l]%>"> <%=q2ans[l] %>
          </label>
        </div>
      </row>
      <row>
        <div class="col-lg-6">
          <label class="btn btn-primary">
            <input type="radio" name="options2" id="option2" value="<%=q2ans[a] %>"> <%=q2ans[a] %>
          </label>
        </div>
      </row>
  </div>
 <div class=sub> 
<%if(usertype.equalsIgnoreCase("Faculty"))
                    	{%><%}else{ %><input type="submit"  class="btn btn-success" value="Submit" ><% }%>
</div>
</form>
</div>
</div>

<%
}
else
{
%>
<h1>Sorry the assignment is locked at this time. Contact instructor for further information.</h1>
<%
} 
%>
<!-- Latest compiled and minified JavaScript -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</body>
</html>