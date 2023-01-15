<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="ApanaBnk.css" type="text/css">
</head>

<body>
	<div id="TransferUpdate">
		<h1>TRANSFER FORM</h1>
		<table>
			<form id="TransferData">
				<tr>
					<td><span id="Manditory_Fields">*</span><b>Receiver ID</b></td>
					<td><input type="text" id="ReceiverAccountid" placeholder="Account Number"
							name="ReceiverAccountid" /></td>
				</tr>
				<tr>
					<td><span id="Manditory_Fields">*</span><b>Transfer Amount</b></td>
					<td><input type="text" id="TranferAmount" placeholder="Amount" name="Amount" /></td>
				</tr>
			</form>
		</table>
		<input type="button" value="Transfer" onClick="fnTransferAmount()" />

	</div>
</body>

</html>