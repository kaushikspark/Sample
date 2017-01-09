<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h4>Select your Favourite Fruits</h4>
<form action="FruitsServlet" method="post">
<input type="checkbox" name="fruit" value="Apple">Apple<br>
<input type="checkbox" name="fruit" value="Mango">Mango <br>
<input type="checkbox" name="fruit" value="Orange">Orange<br>
<input type="checkbox" name="fruit" value="Strawberry">Strawberry<br>
<input type="checkbox" name="fruit" value="Pineapple">Pineapple<br>
<input type="checkbox" name="fruit" value="WaterMelon">WaterMelon<br>
<input type="submit" name="submit" value="Select fruits"> 
</form>

</body>
</html>