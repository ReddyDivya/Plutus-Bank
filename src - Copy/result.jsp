<html>
<body>
<table align=center>
<tr><td><h1><center>Ur Details</center></h1></td></tr>
<tr><td><h1>--------------------------</h1></td></tr>
<tr>
<td><b>Name:</b></td><td><%=request.getAttribute("Name")%></td>
</tr>
<tr>
<td><b>Password:</b></td><td><%=request.getAttribute("pwd")%></td>
</tr>
<tr>
<td><b>Re-Password:</b></td><td><%=request.getAttribute("pwd1")%></td>
</tr>
<tr>
<td><b>Amount:</b></td><td><%=request.getAttribute("amount")%></td>
</tr>
<tr>
<td><b>Phone:</b></td><td><%=request.getAttribute("phn")%></td>
</tr>
</body>
</html>