<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="com.sn.pkg.daoService"%>
<%@ page import="java.sql.*" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>

.question{
-moz-border-radius: 8px;
-webkit-border-radius: 8px;
border-radius: 8px;
/*IE 7 AND 8 DO NOT SUPPORT BORDER RADIUS*/
-moz-box-shadow: 0px 0px 3px #000000;
-webkit-box-shadow: 0px 0px 3px #000000;
box-shadow: 0px 0px 3px #000000;
margin-top : 10px;
margin-left : 100px;
margin-right : 100px;
margin-bottom : 10px;
}
.textarea{
-moz-border-radius: 8px;
-webkit-border-radius: 8px;
border-radius: 8px;
-moz-box-shadow: 0px 0px 3px #000000;
-webkit-box-shadow: 0px 0px 3px #000000;
box-shadow: 0px 0px 3px #000000;
margin-top : 10px;
margin-left : 100px;
margin-right : 0px;

}

.answer
{-moz-border-radius: 8px;
-webkit-border-radius: 8px;
border-radius: 8px;
/*IE 7 AND 8 DO NOT SUPPORT BORDER RADIUS*/
-moz-box-shadow: 0px 0px 3px #000000;
-webkit-box-shadow: 0px 0px 3px #000000;
box-shadow: 0px 0px 3px #000000;
margin-top : 5px;
margin-left : 150px;
margin-right : 150px;}
</style>
</head>
<body>
<%String quesNO = "12";
daoService db1=new daoService(); 
ResultSet resultset1 = db1.getAnswers(quesNO);
            while(resultset1.next())
            {%>
<div class ="answer">

Answer: <%=resultset1.getString(2) %><br>
</div>
<%} %>
<textarea class="textarea" rows="4" cols="50">
Add Answer: 
</textarea>
</div>

</body>
</html>