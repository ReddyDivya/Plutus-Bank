<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Plutus</title>
	<link rel="icon" type="image/x-icon" href="./images/logo.png">
	<link rel="stylesheet" href="Plutus.css" type="text/css">
</head>

<body>
	<!-- Statement -->
	<div class="card-image">
		<img src="./images/logo.png" />
		<h2 class="card-heading">
			Statement
		</h2>
	</div>
	<form class="card-form">
		<div class="input">
			<input type="text" id="username" name="username" class="input-field" placeholder="Username" required
				disabled
				value='<%=session.getAttribute("sess_Username") != null ? session.getAttribute("sess_Username") : ""%>' />
		</div>
		<div class="input">
			<input type="text" name="accountnumber" id="accountnumber" class="input-field" placeholder="Account Number"
				required disabled
				value='<%=session.getAttribute("sess_AccountNum") != null ? session.getAttribute("sess_AccountNum") : ""%>' />
		</div>
		<div>
			<div class="input">
				<input type="date" id="fromDate" name="fromDate" class="input-field" placeholder="From Date" required
					value='' />
			</div>
			<div class="input">
				<input type="date" id="toDate" name="toDate" class="input-field" placeholder="To Date" required
					value='' />
			</div>
		</div>

		<br />
		<div class="action">
			<button type="button" class="action-button" onClick="fnGenerateStatement()">Generate Statement</button>
		</div>
	</form>
</body>

</html>