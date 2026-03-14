<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.billing.model.Bill" %>

<!DOCTYPE html>
<html>
<head>
<title>Reports - Billing System</title>

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
<a href="<%=request.getContextPath()%>/CustomerServlet">👥 Customers</a>
<a href="<%=request.getContextPath()%>/ProductServlet">📦 Products</a>
<a href="<%=request.getContextPath()%>/billing.jsp">🧾 Bills</a>
<a href="<%=request.getContextPath()%>/ReportServlet" class="active">📄 Reports</a>
<a href="<%=request.getContextPath()%>/LogoutServlet" class="logout">→ Logout</a>

</div>


<!-- MAIN -->

<div class="main">

<h1>📄 Billing Reports</h1>
<p class="subtitle">View all billing transactions.</p>

<div class="card">

<h2>All Bills</h2>

<table>

<thead>
<tr>
<th>Bill ID</th>
<th>Customer ID</th>
<th>Total Amount</th>
</tr>
</thead>

<tbody>

<%

List<Bill> bills=(List<Bill>)request.getAttribute("bills");

if(bills==null || bills.isEmpty()){
%>

<tr>
<td colspan="3" class="empty-row">No billing records found.</td>
</tr>

<%

}else{

for(Bill b:bills){
%>

<tr>

<td><b>#<%=b.getBillId()%></b></td>
<td><%=b.getCustomerId()%></td>
<td>₹ <%=b.getTotal()%></td>

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