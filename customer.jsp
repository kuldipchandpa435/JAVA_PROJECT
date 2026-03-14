<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.billing.model.Customer" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Customers - Billing System</title>

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
font-size:15px;
padding:0 14px 18px;
border-bottom:1px solid #3949ab;
margin-bottom:8px;
}

.sidebar a{
display:block;
color:#c5cae9;
text-decoration:none;
padding:11px 20px;
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
padding:28px;
width:100%;
}

h1{
font-size:22px;
color:#1a237e;
margin-bottom:5px;
}

.subtitle{
color:#777;
font-size:13px;
margin-bottom:22px;
}

/* CARD */

.card{
background:#fff;
border-radius:10px;
padding:22px;
box-shadow:0 2px 8px rgba(0,0,0,.08);
margin-bottom:26px;
}

.card h2{
font-size:15px;
color:#1a237e;
margin-bottom:16px;
}

/* FORM */

.form-row{
display:flex;
gap:12px;
flex-wrap:wrap;
align-items:flex-end;
}

.fg{
display:flex;
flex-direction:column;
flex:1;
min-width:150px;
}

.fg label{
font-size:12px;
font-weight:700;
color:#555;
margin-bottom:5px;
text-transform:uppercase;
}

.fg input{
padding:9px 12px;
border:1px solid #ddd;
border-radius:6px;
font-size:14px;
outline:none;
}

.fg input:focus{
border-color:#3949ab;
}

/* BUTTON */

.btn{
padding:9px 18px;
border:none;
border-radius:6px;
font-size:13px;
font-weight:600;
cursor:pointer;
text-decoration:none;
display:inline-block;
}

.btn-primary{
background:#1a237e;
color:#fff;
}

.btn:hover{
opacity:.85;
}

/* TABLE */

table{
width:100%;
border-collapse:collapse;
font-size:14px;
}

thead{
background:#1a237e;
color:#fff;
}

th{
padding:11px 13px;
text-align:left;
}

tbody tr{
border-bottom:1px solid #f0f0f0;
}

tbody tr:hover{
background:#f5f7ff;
}

td{
padding:10px 13px;
}

.empty-row{
text-align:center;
color:#999;
padding:30px !important;
}

</style>
</head>

<body>

<!-- SIDEBAR -->

<div class="sidebar">

<h2>🏢 Billing System</h2>

<a href="<%=request.getContextPath()%>/dashboard.jsp">💻 Dashboard</a>
<a href="<%=request.getContextPath()%>/CustomerServlet" class="active">👥 Customers</a>
<a href="<%=request.getContextPath()%>/ProductServlet">📦 Products</a>
<a href="<%=request.getContextPath()%>/billing.jsp">🧾 Bills</a>
<a href="<%=request.getContextPath()%>/ReportServlet">📄 Reports</a>
<a href="<%=request.getContextPath()%>/LogoutServlet" class="logout">→ Logout</a>

</div>


<!-- MAIN -->

<div class="main">

<h1>👥 Customer Management</h1>
<p class="subtitle">Add and manage customers.</p>

<!-- ADD CUSTOMER -->

<div class="card">

<h2>+ Add Customer</h2>

<form action="CustomerServlet" method="post">

<div class="form-row">

<div class="fg">
<label>Name</label>
<input type="text" name="name" required>
</div>

<div class="fg">
<label>Email</label>
<input type="text" name="email">
</div>

<div class="fg">
<label>Phone</label>
<input type="text" name="phone">
</div>

<div class="fg">
<label>Address</label>
<input type="text" name="address">
</div>

<div class="fg" style="max-width:140px;">
<label>&nbsp;</label>
<button type="submit" class="btn btn-primary">Add</button>
</div>

</div>

</form>

</div>


<!-- CUSTOMER TABLE -->

<div class="card">

<h2>All Customers</h2>

<table>

<thead>
<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Phone</th>
<th>Address</th>
</tr>
</thead>

<tbody>

<%
List<Customer> list=(List<Customer>)request.getAttribute("customers");

if(list==null || list.isEmpty()){
%>

<tr>
<td colspan="5" class="empty-row">No customers added yet.</td>
</tr>

<%
}else{

for(Customer c:list){
%>

<tr>

<td><b>#<%=c.getCustomerId()%></b></td>
<td><%=c.getName()%></td>
<td><%=c.getEmail()%></td>
<td><%=c.getPhone()%></td>
<td><%=c.getAddress()%></td>

</tr>

<%
}
}
%>

</tbody>
</table>

</div>

</div>

</body>
</html>