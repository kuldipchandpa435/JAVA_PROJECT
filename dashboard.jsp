<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.billing.model.User" %>

<%
HttpSession sessionObj = request.getSession(false);
User user = (sessionObj != null) ? (User) sessionObj.getAttribute("loggedUser") : null;

if (user == null) {
response.sendRedirect(request.getContextPath() + "/login");
return;
}
%>

<!DOCTYPE html>

<html>
<head>
<title>Dashboard - Billing System</title>

<style>

*{
box-sizing:border-box;
margin:0;
padding:0;
font-family:'Segoe UI',sans-serif;
}

body{
background:#f0f2f5;
display:flex;
}

/* SIDEBAR */

.sidebar{
width:210px;
min-height:100vh;
background:#1a237e;
padding-top:28px;
position:fixed;
top:0;
left:0;
}

.sidebar h2{
color:#fff;
text-align:center;
font-size:16px;
padding-bottom:18px;
border-bottom:1px solid #3949ab;
}

.sidebar a{
display:block;
color:#c5cae9;
text-decoration:none;
padding:12px 20px;
font-size:14px;
}

.sidebar a:hover,
.sidebar a.active{
background:#3949ab;
color:#fff;
}

.sidebar .logout{
color:#ef9a9a;
margin-top:20px;
}

/* MAIN */

.main{
margin-left:210px;
padding:30px;
width:100%;
}

h1{
font-size:24px;
color:#1a237e;
}

.subtitle{
color:#777;
font-size:13px;
margin-bottom:25px;
}

/* WELCOME */

.welcome{
margin-bottom:25px;
}

/* DATE */

.datetime{
background:white;
padding:15px;
border-radius:8px;
margin-bottom:25px;
box-shadow:0 2px 6px rgba(0,0,0,0.1);
font-size:14px;
color:#444;
}

/* CARDS */

.cards{
display:grid;
grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
gap:20px;
}

.card{
background:white;
padding:20px;
border-radius:10px;
box-shadow:0 2px 8px rgba(0,0,0,.08);
transition:0.2s;
}

.card:hover{
transform:translateY(-4px);
}

.card h3{
margin-bottom:8px;
color:#1a237e;
}

.card p{
font-size:14px;
color:#666;
}

.card a{
display:inline-block;
margin-top:10px;
background:#1a237e;
color:white;
padding:8px 14px;
border-radius:6px;
text-decoration:none;
font-size:13px;
}

.card a:hover{
background:#3949ab;
}

/* SYSTEM INFO */

.system{
margin-top:30px;
background:white;
padding:20px;
border-radius:10px;
box-shadow:0 2px 8px rgba(0,0,0,.08);
}

.system h3{
margin-bottom:10px;
color:#1a237e;
}

.system p{
font-size:14px;
color:#555;
margin:4px 0;
}

</style>

<script>

function updateClock(){
const now=new Date();
document.getElementById("clock").innerHTML=now.toLocaleString();
}

setInterval(updateClock,1000);

</script>

</head>

<body onload="updateClock()">

<!-- SIDEBAR -->

<div class="sidebar">

<h2>🏢 Billing System</h2>

<a href="<%=request.getContextPath()%>/dashboard.jsp" class="active">💻 Dashboard</a> <a href="<%=request.getContextPath()%>/CustomerServlet">👥 Customers</a> <a href="<%=request.getContextPath()%>/ProductServlet">📦 Products</a> <a href="<%=request.getContextPath()%>/billing.jsp">🧾 New Bill</a> <a href="<%=request.getContextPath()%>/ReportServlet">📄 Reports</a> <a href="<%=request.getContextPath()%>/LogoutServlet" class="logout">→ Logout</a>

</div>

<!-- MAIN -->

<div class="main">

<h1>💻 Dashboard</h1>
<p class="subtitle">Welcome to the Billing Management System</p>

<div class="welcome">
<h2>Hello, <%= user.getUsername() %> 👋</h2>
<p>Role : <%= user.getRole() %></p>
</div>

<div class="datetime">
📅 Current Date & Time: <span id="clock"></span>
</div>

<!-- QUICK ACTIONS -->

<div class="cards">

<div class="card">
<h3>Create Bill</h3>
<p>Create a new bill for customer purchase.</p>
<a href="<%=request.getContextPath()%>/billing.jsp">Create</a>
</div>

<div class="card">
<h3>Customers</h3>
<p>Manage all customers.</p>
<a href="<%=request.getContextPath()%>/CustomerServlet">Open</a>
</div>

<div class="card">
<h3>Products</h3>
<p>Add and manage products.</p>
<a href="<%=request.getContextPath()%>/ProductServlet">Open</a>
</div>

<div class="card">
<h3>Reports</h3>
<p>View billing reports.</p>
<a href="<%=request.getContextPath()%>/ReportServlet">Open</a>
</div>

</div>

<!-- SYSTEM INFO -->

<div class="system">

<h3>System Information</h3>

<p>Application : Online Billing System</p>
<p>Technology : JSP, Servlet, JDBC</p>
<p>Server : Apache Tomcat</p>
<p>Database : MySQL</p>

</div>

</div>

</body>
</html>
