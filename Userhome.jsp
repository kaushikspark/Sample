<!DOCTYPE html>
<%@page import="com.bank.Bean.Bean"%>
<html>
<style>
textbox {
	background-color: #0099CC;
	border: 1px solid #008000;
}

.textbox {
	border: 2px solid #456879;
	border-radius: 10px;
	height: 10px;
	width: 300px;
}

b {
	padding: 5px 15px;
	text-align: left;
	font-family: "Comic Sans MS", Times, serif;
	font-size: 25px;
	color: white;
	display: inline-block;
	width: 500px;
}

input {
	text-align: center;
	font-family: "Comic Sans MS", Times, serif;
	font-size: 15px; -
	padding-right: 20px;
	display: inline-block;
	min-width: 150px;
}
/* input[type=button] {
                padding: 5px 15px;
                color: white;
                cursor: pointer;
                -webkit-border-radius: 5px; 
                border-radius: 5px; 
} */
th {
	padding: 15px;
	text-align: left;
	font-family: "Comic Sans MS", Times, serif;
	font-size: 25px;
	color: white;
	display: inline-block;
	width: 200%;
}

h4 {
	padding: 15px;
	text-align: left;
	width: 200%;
	font-family: "Comic Sans MS", Times, serif;
	font-size: 25px;
	display: inline-block;
	color: white;
}

body {
	background-image: url("mainbg.jpg");
	background-size: cover;
}

h6 {
	text-align: center;
	font-family: "Comic Sans MS", Times, serif;
	font-size: 25px;
	color: white;
}

#Profile {
	line-height: 0em;
}

ul.tab {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

/* Float the list items side by side */
ul.tab li {
	float: left;
}

/* Style the links inside the list items */
ul.tab li a {
	display: inline-block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of links on hover */
ul.tab li a:hover {
	background-color: #ddd;
}

/* Create an active/current tablink class */
ul.tab li a:focus,.active {
	background-color: #ccc;
}

/* Style the tab content */
/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	/*  -webkit-animation: fadeEffect 1s; */
	animation: fadeEffect 1s;
}

@
-webkit-keyframes fadeEffect {
	from {opacity: 0;
}

to {
	opacity: 1;
}

}
@
keyframes fadeEffect {
	from {opacity: 0;
}

to {
	opacity: 1;
}
}
</style>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.js"></script>
<body>
<script src="angular.1.2.1.js"></script>

	

	<%


Bean bean=new Bean();

String account=bean.getAccount_number();

String name=bean.getUname();
String email=bean.getMail();
String password=bean.getPassword();
long mobile=bean.getMobile();
String address=bean.getAddress();
String city=bean.getCity();
String state=bean.getState();
String country=bean.getCountry();
int balance=bean.getBalance();

%>



	<ul class="tab">
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openCity(event, 'Home')" id="defaultOpen">Home</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openCity(event, 'Profile')">Profile</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openCity(event, 'Online funds')">Online Funds</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openCity(event, 'Withdrawl')">Withdrawl</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openCity(event, 'Deposit')">Deposit</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openCity(event, 'Password Change')">Password Change</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="location.href='logoutservlet'">Logout</a></li>
	</ul>
	

	<% if(request.getParameter("pwd") != null) {
		if(request.getParameter("pwd").equals( "success"))
       out.println("<script>alert('Password Changed Successfully!');</script>");
	}
		if(request.getParameter("pwd") != null) {
			if(request.getParameter("pwd").equals( "failure"))
	       out.println("<script>alert('Invalid Password!');</script>");	
		}
		
		%>
<%-- 
	<% System.out.println(request.getParameter("trans")); %>

 --%>

<%-- <% System.out.println(request.getParameter("trans")); %> --%>

<% if(request.getParameter("trans") !=null) {
if(request.getParameter("trans").equals( "success")) 
   out.println("<script>alert('Transfer done Successfully!');</script>");
   }
if(request.getParameter("trans") !=null) {
if(request.getParameter("trans").equals("incorrect"))
 out.println("<script>alert('Destination number is incorrect!');</script>");
}
if(request.getParameter("trans") !=null) {
if(request.getParameter("trans").equals("insufbal"))
 out.println("<script>alert('Insufficient Balance!');</script>");
}
if(request.getParameter("trans") !=null) {	 
if(request.getParameter("trans").equals("accwrong"))
 out.println("<script>alert('Account number is incorrect!');</script>");
}    
%> 
<% if(request.getParameter("dep") !=null) {
if(request.getParameter("dep").equals( "success")) 
   out.println("<script>alert('Deposit done Successfully!');</script>");
   }
if(request.getParameter("dep") !=null) {
if(request.getParameter("dep").equals( "failure")) 
   out.println("<script>alert('Account number is incorrect!');</script>");
   }
%>

<% if(request.getParameter("with") !=null) {
if(request.getParameter("with").equals( "success")) 
   out.println("<script>alert('Withdraw done Successfully!');</script>");
   }
if(request.getParameter("with") !=null) {
if(request.getParameter("with").equals( "failure")) 
   out.println("<script>alert('Account number is incorrect!');</script>");
   }
if(request.getParameter("with") !=null) {
if(request.getParameter("with").equals( "minbal")) 
   out.println("<script>alert('Minimum Balance should be 1000!');</script>");
   }
%>

<div id="Home" class="tabcontent">
		<h3>
			<div id="mydiv">Bank</div>
		</h3>
	</div>
<%
String obj=session.getAttribute("name").toString();%>
	<b> Welcome <%= obj %> !!!
	</b>


	<script>
 $(document).ready(function() {
	 $("#mydiv").css({"text-align":"center","font-family":"Comic Sans MS","font-size":"25px","color":"white"});
	 alert($("#mydiv").text()); 
}); 
</script>
	<div id="Profile" class="tabcontent" align="center">
		<center>
			<h3>
				<h6>Profile</h6>
			</h3>
		</center>

		<b>
			<center>
				<div align="justify">
					<table style="width: 25em;">
						<tr>
							<td>Account No:</td>
							<td>
								<h4><%=account %></h4>
							</td>
						</tr>
						<tr>
							<td>Name :</td>
							<td>
								<h4><%=name %></h4>
							</td>
						</tr>
						<tr>
							<td>Email :</td>
							<td>
								<h4><%=email %></h4>
							</td>
						</tr>
						<tr>
							<td>Mobile :</td>
							<td>
								<h4><%=mobile %></h4>
							</td>
						</tr>


						<tr>
							<td>Balance :</td>
							<td>
								<h4><%=balance %></h4>
							</td>
						</tr>
					</table>
				</div>
			</center>
		</b>


	</div>
	<div id="Online funds" class="tabcontent">
		<center>
			<h3>
				<h6>Online Funds</h6>
			</h3>
		</center>
		<form name="f1" action="Transfer.jsp" method="post"
			onsubmit="return check1()">

			<center>
				<b> Enter Source Account Number:</b> <input class="textbox"
					type="text" name="o1" value="ABCD201600000002"size="40" style="height: 40px;" /> <br>
				<b> Enter Destination Account Number:</b> <input class="textbox"
					type="text" name="o2" value="ABCD201600000003" size="40"  style="height: 40px;" /> <br>
				<b> Enter Transfer Amount:</b> <input class="textbox" type="text"
					name="o3" value="10000" size="40" style="height: 40px;" /> <br>
				<br> <input class="button" type="submit" id="11"
					value="Transfer">
			</center>
		</form>
	</div>


	<div id="Withdrawl" class="tabcontent">
		<center>
			<h3>
				<h6>Withdrawl</h6>
			</h3>
		</center>
		<form name="f2" action="Withdrawl.jsp" method="post"
			onsubmit="return check2()">

			<center>
				<b> Enter Account Number:</b> <input class="textbox" type="text"
					name="w1" size="40" value="ABCD201600000002" style="height: 40px;" /> <br> <b>
					Enter the amount to withdraw:</b> <input class="textbox" type="text"
					name="w2" size="40" value="10000" style="height: 40px;" /> <br>
				<br> <input class="button" type="submit" id="22"
					value="Withdraw">
		</form>
		</center>

	</div>

	<div id="Deposit" class="tabcontent">
		<center>
			<h3>
				<h6>Deposit</h6>
			</h3>
		</center>
		<form name="f3" action="Deposit.jsp" method="post" onsubmit="return check3()" >

			<center>
				<b> Enter Account Number:</b> <input class="textbox" type="text"
					name="d1" id="account" size="40" onkeyup="ajaxdisplay()" value="ABCD201600000002" style="height: 40px;" /> <br> <b>
					Enter the amount to deposit:</b> <input class="textbox" type="text"
					name="d2" size="40" value="100" style="height: 40px;" /> <br>
					<div id="show_details">
					
					</div>
					<br><br>
				<br> <input  class="button" type="submit" id="33"
					value="Deposit">
		</form>
		</center>
	</div>
	<div id="Password Change" class="tabcontent">
		<center>
			<h3>
				<h6>Password change</h6>
			</h3>
		</center>
		<form name="f4" method="post" onsubmit="return check4()"
			action="passwordchange.jsp">

			<center>
				<b> Enter current password:</b> <input class="textbox"
					type="password" name="p1" id="2" size="40" value=""
					style="height: 40px;" /> <br> 
					<div ng-app>
					<b> New password:</b> <input
					class="textbox" type="password" name="p2" id="3" size="40" value="" ng-model="newp"
					style="height: 40px;" /> <br> 
					<b> confirm password:</b> <input
					class="textbox" type="password" name="p3" id="4" size="40" value="{{newp}}"
					style="height: 40px;" /> <br>
					</div>
				<br> <input class="button" type="submit" id="44" value="Change">
		</form>
		</center>
	</div>
	<div id="Logout" class="tabcontent">
		<h3>
			<b>Logout
		</h3>
		<p>
			Successfully logged out</b>
		</p>
		<!--  <a href="Home.html" /> -->
	</div>

	<script type="text/javascript">
function check1()
{
	
	
	
	/* if(isNaN(document.f1.o1.value))
	{
	alert("please enter a valid source account number");
	return false;
	} */
	if(document.f1.o1.value=="")
	{
		alert("please enter source account number");
		return false;
		}
	var a1=document.f1.o1.value;
	
	
	var x1=a1.length;
	
	
	if(x1!=16)
	{
	alert("Enter a 16 digit account number");
	return false;
	}
	
	
	/* if(isNaN(document.f1.o2.value))
	{
	alert("please enter a valid destination account number");
	return false;
	} */
	if(document.f1.o2.value=="")
	{
		alert("please enter destination account number");
		return false;
		}
	
	var a2=document.f1.o2.value;
	var x2=a2.length;
	if(x2!=16)
	{
	alert("Enter a 16 digit account number");
	return false;
	}
	
	if(document.f1.o3.value=="")
	{
		alert("please enter transfer amount");
		return false;
		}
	 if(isNaN(document.f1.o3.value))
		{
		alert("please enter a valid tranfer amount");
		return false;
		} 
	if(document.f1.o1.value==document.f1.o2.value)
		{
		alert("Source and Destination account acount number cannot be same");
		return false;
		}
	

	}
function check2()
{
	/* if(isNaN(document.f2.w1.value))
		{
		alert("please enter a valid account number");
		return false;
		} */
		
		
	if(document.f2.w1.value=="")
	{
	alert("please enter an account number");
	return false;
	}
		var a1=document.f2.w1.value;
		
		var x1=a1.length;
		
		
		if(x1!=16)
		{
		alert("Enter a 16 digit account number");
		return false;
		}
		if(document.f2.w2.value=="")
		{
		alert("please enter an amount");
		return false;
		}
	 if(isNaN(document.f2.w2.value))
	{
	alert("please enter a valid amount");
	return false;
	} 

	
}
	function check3()
	{

		
		 if(document.f3.d1.value=="")
		{
		alert("please enter an account number");
		return false;
		}
		var a1=document.f3.d1.value;
		
		var x1=a1.length;
		
		
		if(x1!=16)
		{
		alert("Enter a 16 digit account number");
		return false;
		}
		if(document.f3.d2.value=="")
		{
		alert("please enter an amount");
		return false;
		}
		if(isNaN(document.f3.d2.value))
		{
		alert("please enter a valid amount");
		return false;
		} 
	}
	function ajaxdisplay()
	{
		var request=new XMLHttpRequest();  
		var name=document.getElementById("account").value;  

		var url="ajax.jsp?val="+name;  
		  
		try{  
		request.onreadystatechange=function(){  
		if(request.readyState==4){ 
		       console.log("asdfaf");
		var val=request.responseText;  
		document.getElementById('show_details').innerHTML=val;  
		}  
		}//end of function  
		request.open("GET",url,true);  
		request.send();  
		}catch(e){alert("Unable to connect to server");}  
		}
	
	
	
	function check4()
	{
		
		if(document.f4.p1.value=="")
		{
		alert("please enter your current password");
		return false;
		}
		
		if(document.f4.p2.value=="")
		{
		alert("please enter your new password");
		return false;
		}
		
		if(document.f4.p3.value=="")
		{
		alert("please enter your confirm new password");
		return false;
		}
		var current=document.getElementById("2");
		var password = document.getElementById("3");
		confirm_password = document.getElementById("4");
		var str1=document.f4.p2.value;
		var q=str1.length;
		if(q<=7)
		{
		alert("Password should be 8 or more characters");
		return false;
		}
		if(password.value == current.value) 
		{
		    alert("Old and New password cannot be same!");
		    return false;
		}
		 if(password.value != confirm_password.value) 
		{
		    alert("Passwords Don't Match");
		    return false;
		}
		 /*
		if(password.value == confirm_password.value) 
		{
		    alert("Password successfully changed");
		    return true;
		} */
		
	
	}

function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
    
}
document.getElementById("defaultOpen").click();
</script>
<!-- <script>
var request=new XMLHttpRequest();  
function accountFind(){  
var name=document.getElementById("uaccount").value;  

var url="agetSummary.jsp?val="+name;  
  
try{  
request.onreadystatechange=function(){  
if(request.readyState==4){ 
       console.log("asdfaf");
var val=request.responseText;  
document.getElementById('account').innerHTML=val;  
}  
}//end of function  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}
</script> -->
</body>
</html>









