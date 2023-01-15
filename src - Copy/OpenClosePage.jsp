<html>

<head>
	<link rel="stylesheet" href="ApanaBnk.css" type="text/css">
</head>

<body>
	<form name="form1">
		<h1>CLOSING ACCOUNT</h1>
		<table border="0">
			<tr>
				<td><b>USER NAME:</b></td>
				<td><input type="text" name="tname"></td>
			</tr>
			<tr>
				<td><b>PASSWORD</b>:</td>
				<td>
					<right><input type="password" name="tpwd1">
				</td>
			</tr>
			<td><input type="button" value="SUBMIT" onclick="fnSendBECall()" /></td>
			<td><input type="RESET" value="RESET" /></td>
			</tr>
		</table>
	</form>
	<p id="mylocation"></p>
</body>

</html>