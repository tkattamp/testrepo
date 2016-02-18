<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.Statement" %>
<body>


<form method = "post">
<table border = "2">
<tr>
<td>students name</td>
<td>student ID</td>
</tr>
<%
//Connection cn=null;

try{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/thomas";
String username="root";
String password="root";
String query="select * from student";
 java.sql.Connection cn= DriverManager.getConnection(url,username,password);
Statement stmnt=cn.createStatement();
ResultSet rs=stmnt.executeQuery(query);
while(rs.next())
{   

    System.out.println(rs.getString("student_name"));
%>
<tr><td><%=rs.getString("student_name") %></td>
<td><%=rs.getInt("student_id") %></td></tr>
<%
}
%>



</table>
<%
rs.close();
stmnt.close();
cn.close();

}
catch (Exception e)
{
    e.printStackTrace();   
}





%>
</form>
</body>
</html>