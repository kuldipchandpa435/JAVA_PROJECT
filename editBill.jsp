<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.billing.model.Bill" %>

<%
Bill bill=(Bill)request.getAttribute("bill");
%>

<!DOCTYPE html>

<html>
<head>
<title>Edit Bill</title>

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
justify-content:center;
align-items:center;
height:100vh;
}

/* CARD */

.card{
background:#fff;
padding:30px;
border-radius:10px;
box-shadow:0 2px 10px rgba(0,0,0,0.1);
width:400px;
}

/* TITLE */

h2{
color:#1a237e;
margin-bottom:20px;
text-align:center;
}

/* FORM */

.form-group{
display:flex;
flex-direction:column;
margin-bottom:15px;
}

label{
font-size:13px;
font-weight:bold;
margin-bottom:5px;
}

input,select{
padding:10px;
border:1px solid #ddd;
border-radius:6px;
}

/* BUTTON */

button{
background:#1a237e;
color:white;
border:none;
padding:10px;
border-radius:6px;
cursor:pointer;
font-size:14px;
width:100%;
}

button:hover{
background:#3949ab;
}

</style>

</head>

<body>

<div class="card">

<h2>Edit Bill</h2>

<form action="BillServlet" method="post">

<input type="hidden" name="action" value="update">

<input type="hidden" name="billId" value="<%=bill.getBillId()%>">

<div class="form-group">
<label>Customer ID</label>
<input type="number" name="customerId" value="<%=bill.getCustomerId()%>" required>
</div>

<div class="form-group">
<label>Total</label>
<input type="number" name="total" value="<%=bill.getTotal()%>" required>
</div>

<div class="form-group">
<label>Status</label>
<select name="status">
<option value="UNPAID">UNPAID</option>
<option value="PAID">PAID</option>
</select>
</div>

<button>Update Bill</button>

</form>

</div>

</body>
</html>
