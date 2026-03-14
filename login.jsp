<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html lang="en">
<head>
<title>Online Billing - Login</title>
<meta charset="UTF-8">

<style>

*{
box-sizing:border-box;
margin:0;
padding:0;
font-family:'Segoe UI',sans-serif;
}

body{
height:100vh;
display:flex;
align-items:center;
justify-content:center;
background:linear-gradient(135deg,#1a237e,#3949ab);
}

/* LOGIN CARD */

.card{
background:#ffffff;
padding:35px 30px;
border-radius:12px;
box-shadow:0 10px 25px rgba(0,0,0,0.2);
max-width:360px;
width:100%;
}

/* TITLE */

h1{
text-align:center;
margin-bottom:25px;
color:#1a237e;
font-size:22px;
}

/* LABEL */

label{
display:block;
margin-bottom:5px;
font-size:13px;
color:#444;
}

/* INPUT */

input{
width:100%;
padding:10px;
border-radius:8px;
border:1px solid #ddd;
margin-bottom:15px;
font-size:14px;
}

input:focus{
outline:none;
border-color:#3949ab;
box-shadow:0 0 0 2px rgba(57,73,171,0.15);
}

/* BUTTON */

button{
width:100%;
padding:10px;
border:none;
border-radius:8px;
background:#1a237e;
color:#fff;
font-size:14px;
cursor:pointer;
transition:0.3s;
}

button:hover{
background:#3949ab;
}

/* ERROR */

.error{
color:#b91c1c;
background:#fee2e2;
padding:8px 10px;
border-radius:8px;
margin-bottom:15px;
font-size:13px;
}

/* FOOTER */

.footer{
text-align:center;
margin-top:15px;
font-size:12px;
color:#777;
}

</style>

</head>

<body>

<div class="card">

<h1>Online Billing System</h1>

<%
String error=(String)request.getAttribute("error");
if(error!=null){
%>

<div class="error"><%=error%></div>

<%
}
%>

<form action="login" method="post">

<label>Username</label> <input name="username" type="text" required>

<label>Password</label> <input name="password" type="password" required>

<button type="submit">Login</button>

</form>

<div class="footer">
Billing Management System
</div>

</div>

</body>
</html>
