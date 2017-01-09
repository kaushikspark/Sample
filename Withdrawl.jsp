<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@page import="com.bank.Bean.Bean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
h1
{
                text-align: center;
                font-family: "Comic Sans MS", Times, serif;
                font-size: 65px;
                 color: white;
                 height:50px;
}
body
{
   background-image: url("mainbg.jpg");
   background-size:cover;
   background-repeat: no-repeat;
}
a
{
                position:absolute;
                top:60%;
                left:45%;
                text-align: center;
                font-family: "Comic Sans MS", Times, serif;
                font-size: 50px;
                 color: white;
                 height:50px;
                 
}
</style>
<body>
<%
Bean bean=new Bean();
String source=request.getParameter("w1");
String amount=request.getParameter("w2");
double amnt= Double.parseDouble(amount);
String username=session.getAttribute("name").toString();
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection connection=DriverManager.getConnection("jdbc:oracle:thin:@10.232.71.29:1521:inatp02","shobana","shobana");
Statement statement=connection.createStatement();
String sql2="select * from banks join  AccountDetails ad on banks.uname=ad.uname where banks.uname='"+username+"' and ad.account_number='"+source+"' ";
ResultSet rs=statement.executeQuery(sql2);
if(rs.next())
{
	  double accbal=rs.getDouble("balance")- amnt;
	  if(accbal > 1000)
      {
		  String sql3="update AccountDetails set balance=balance-"+amnt+" where account_number='"+source+"'";
		  rs=statement.executeQuery(sql3);
		  rs=statement.executeQuery("select * from  AccountDetails where account_number='"+source+"'");
          if(rs.next())
          {
           bean.setBalance(rs.getInt("balance"));
           response.sendRedirect("Userhome.jsp?with=success");%>
           
          <%-- <h1>WITHDRAWL SUCCESSFUL!<br>YOUR AVAILABLE BALANCE IS:<%=rs.getInt("balance") %> </h1><br><br>
<a href="Userhome.jsp">Home</a> --%>
          <%
          }
		  
		  
      }
	  else{
		  response.sendRedirect("Userhome.jsp?with=minbal");
          %>
          
          <!-- <h1>PLEASE CHECK IF YOUR MINIMUM BALANCE IS 1000 RS!</h1>
          <a href="Userhome.jsp">Home</a> -->
          
          <%
   } 
	  
	  
}
else{
	response.sendRedirect("Userhome.jsp?with=failure");
    %>
    
   <!--  <h1>PLEASE ENTER A VALID ACCOUNT NUMBER !</h1>
    <a href="Userhome.jsp">Home</a> -->
    
    <%
} 
%>


</body>
</html>