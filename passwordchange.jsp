<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
String oldpass=request.getParameter("p1");
String newpass=request.getParameter("p2");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection connection=DriverManager.getConnection("jdbc:oracle:thin:@10.232.71.29:1521:inatp02","shobana","shobana");
Statement statement=connection.createStatement();
String seql="select * from banks where password='"+oldpass+"'";
ResultSet res=statement.executeQuery(seql);
if(res.next())
{
String sql="update banks set password='"+newpass+"' where password='"+oldpass+"'";
 res=statement.executeQuery(sql);
 response.sendRedirect("Userhome.jsp?pwd=success");%>
<!--  RequestDispatcher rd=request.getRequestDispatcher("Userhome.jsp");  
    rd.forward(request, response);  -->
	<%-- <jsp:forward page="Userhome.jsp" /> --%>
	 <%}
else{
	/* RequestDispatcher rd=request.getRequestDispatcher("dummy1.html");  
    rd.forward(request, response);  */
	response.sendRedirect("Userhome.jsp?pwd=failure");
}
	
%>



</body>
</html>