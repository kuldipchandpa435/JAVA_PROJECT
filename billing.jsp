<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.billing.model.Bill, java.util.List" %>

<%
List<Bill> bills = (List<Bill>) request.getAttribute("bills");
%>

<!DOCTYPE html>

<html>
<head>
<title>Billing - Billing System</title>

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
padding:30px;
width:100%;
}

h1{
font-size:24px;
color:#1a237e;
margin-bottom:6px;
}

.subtitle{
color:#777;
font-size:13px;
margin-bottom:25px;
}

/* CARD */

.card{
background:white;
padding:20px;
border-radius:10px;
box-shadow:0 2px 8px rgba(0,0,0,.08);
margin-bottom:25px;
}

/* FORM */

.form-row{
display:flex;
gap:15px;
flex-wrap:wrap;
}

.fg{
display:flex;
flex-direction:column;
flex:1;
}

.fg label{
font-size:12px;
font-weight:700;
margin-bottom:5px;
text-transform:uppercase;
}

.fg input,
.fg select{
padding:9px;
border:1px solid #ddd;
border-radius:6px;
}

/* BUTTON */

.btn{
padding:9px 18px;
border:none;
border-radius:6px;
font-size:13px;
cursor:pointer;
}

.btn-primary{
background:#1a237e;
color:#fff;
}

.btn-warning{
background:#e65100;
color:#fff;
}

.btn-danger{
background:#b71c1c;
color:#fff;
}

/* TABLE */

table{
width:100%;
border-collapse:collapse;
}

thead{
background:#1a237e;
color:white;
}

th,td{
padding:11px;
text-align:center;
}

tbody tr{
border-bottom:1px solid #eee;
}

/* STATUS */

.badge{
padding:4px 10px;
border-radius:20px;
font-size:12px;
font-weight:bold;
}

.paid{
background:#e8f5e9;
color:#2e7d32;
}

.unpaid{
background:#fff3e0;
color:#e65100;
}

</style>

</head>

<body>

<!-- SIDEBAR -->

<div class="sidebar">

<h2>🏢 Billing System</h2>

<a href="<%=request.getContextPath()%>/dashboard.jsp">💻 Dashboard</a> <a href="<%=request.getContextPath()%>/CustomerServlet">👥 Customers</a> <a href="<%=request.getContextPath()%>/ProductServlet">📦 Products</a> <a href="<%=request.getContextPath()%>/BillServlet" class="active">🧾 Bills</a> <a href="<%=request.getContextPath()%>/ReportServlet">📄 Reports</a> <a href="<%=request.getContextPath()%>/LogoutServlet" class="logout">→ Logout</a>

</div>

<!-- MAIN -->

<div class="main">

<h1>Bill Management</h1>
<p class="subtitle">Create and manage customer bills.</p>

<!-- ADD BILL -->

<div class="card">

<h3>Add New Bill</h3>

<form action="BillServlet" method="post">

<input type="hidden" name="action" value="create">

<div class="form-row">

<div class="fg">
<label>Customer ID</label>
<input type="number" name="customerId" required>
</div>

<div class="fg">
<label>Total Amount</label>
<input type="number" name="total" required>
</div>

<div class="fg">
<label>Status</label>
<select name="status">
<option value="UNPAID">UNPAID</option>
<option value="PAID">PAID</option>
</select>
</div>

<div class="fg">
<label>&nbsp;</label>
<button class="btn btn-primary">Create Bill</button>
</div>

</div>

</form>

</div>

<!-- BILL TABLE -->

<div class="card">

<h3>All Bills</h3>

<table>

<thead>
<tr>
<th>ID</th>
<th>Customer ID</th>
<th>Total</th>
<th>Status</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<%
if(bills!=null){
for(Bill b:bills){
boolean paid="PAID".equals(b.getStatus());
%>

<tr>

<td>#<%=b.getBillId()%></td>

<td><%=b.getCustomerId()%></td>

<td>₹ <%=b.getTotal()%></td>

<td>
<span class="badge <%=paid?"paid":"unpaid"%>">
<%=paid?"PAID":"UNPAID"%>
</span>
</td>

<td>

<a href="BillServlet?action=edit&billId=<%=b.getBillId()%>">
<button class="btn btn-warning">Edit</button>
</a>

<a href="BillServlet?action=delete&billId=<%=b.getBillId()%>">
<button class="btn btn-danger">Delete</button>
</a>

</td>

</tr>

<%
}}
%>

</tbody>

</table>

</div>

</div>

</body>
</html>
