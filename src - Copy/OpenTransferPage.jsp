<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Plutus</title>
	<link rel="icon" type="image/x-icon" href="./images/logo.png">
	<link rel="stylesheet" href="Plutus.css" type="text/css">
</head>

<body>
	<!-- Transfer -->
	<div class="card-image">
		<img src="./images/logo.png" />
		<h2 class="card-heading">
			Transfer
		</h2>
	</div>
	<form class="card-form">
		<div class="input">
			<label class="input-label">Username</label>
			<input type="text" id="username" name="username" class="input-field" required disabled
				value='<%=session.getAttribute("sess_Username") != null ? session.getAttribute("sess_Username") : ""%>' />
		</div>
		<div class="input">
			<label class="input-label">Account Number</label>
			<input type="text" name="accountnumber" id="accountnumber" class="input-field" required disabled
				value='<%=session.getAttribute("sess_AccountNum") != null ? session.getAttribute("sess_AccountNum") : ""%>' />
		</div>
		<div class="input">
			<label class="input-label">Receiver Account Number</label>
			<input type="text" name="receiver-accountnumber" id="ReceiverAccountNum" class="input-field" required />
		</div>
		<div class="input">
			<label class="input-label">Amount</label>
			<input type="text" name="amount" id="amount" class="input-field" required />
		</div>
		<div class="input">
			<label class="input-label">Please enter captcha</label>
			<input type="text" name="captcha" id="captcha" class="input-field" required />
		</div>
		<i onClick="fnGenerateCaptcha()">Please click here to get new captcha</i>
		<p id="DisplayCaptacha"></p>
		<br />
		<div class="action">
			<button type="button" class="action-button" onClick="fnTransferAmount()">Transfer</button>
		</div>
	</form>
</body>

</html>