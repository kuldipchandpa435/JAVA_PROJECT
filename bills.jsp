<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.billing.model.Bill, java.util.List" %>

<%
List<Bill> bills = (List<Bill>) request.getAttribute("bills");
%>

<!DOCTYPE html>

<html>
<head>
<title>Bills - Billing System</title>

<style>

*{
box-sizing:border-box;
margin:0;
padding:0;
font-family:'Segoe UI',sans-serif;
}

body{
background:#f0f2f5;
padding:40px;
}

/* CONTAINER */

.container{
width:900px;
margin:auto;
}

/* CARD */

.card{
background:#fff;
padding:25px;
border-radius:10px;
box-shadow:0 2px 8px rgba(0,0,0,0.1);
margin-bottom:30px;
}

/* TITLES */

h2{
color:#1a237e;
margin-bottom:15px;
}

/* FORM */

.form-row{
display:flex;
gap:15px;
flex-wrap:wrap;
}

.form-group{
display:flex;
flex-direction:column;
flex:1;
}

label{
font-size:13px;
font-weight:bold;
margin-bottom:5px;
}

input,select{
padding:9px;
border:1px solid #ddd;
border-radius:6px;
}

/* BUTTON */

.btn{
padding:9px 18px;
border:none;
border-radius:6px;
cursor:pointer;
font-size:13px;
}

.btn-primary{
background:#1a237e;
color:white;
}

.btn-primary:hover{
background:#3949ab;
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

tbody tr:hover{
background:#f5f5f5;
}

/* STATUS */

.paid{
color:#2e7d32;
font-weight:bold;
}

.unpaid{
color:#e65100;
font-weight:bold;
}

/* ACTION BUTTON */

.edit-btn{
background:#ff9800;
color:white;
padding:6px 10px;
border-radius:4px;
text-decoration:none;
font-size:12px;
}

.edit-btn:hover{
background:#fb8c00;
}

</style>

</head>

<body>

<div class="container">

<div class="card">

<h2>Add Bill</h2>

<form action="BillServlet" method="post">

<input type="hidden" name="action" value="create">

<div class="form-row">

<div class="form-group">
<label>Customer ID</label>
<input type="number" name="customerId" required>
</div>

<div class="form-group">
<label>Total</label>
<input type="number" name="total" required>
</div>

<div class="form-group">
<label>Status</label>
<select name="status">
<option value="UNPAID">UNPAID</option>
<option value="PAID">PAID</option>
</select>
</div>

<div class="form-group">
<label>&nbsp;</label>
<button class="btn btn-primary">Create Bill</button>
</div>

</div>

</form>

</div>

<div class="card">

<h2>All Bills</h2>

<table>

<thead>
<tr>
<th>ID</th>
<th>Customer</th>
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

<td class="<%=paid?"paid":"unpaid"%>">
<%=b.getStatus()%>
</td>

<td>
<a class="edit-btn" href="editBill.jsp?id=<%=b.getBillId()%>">
Edit
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
