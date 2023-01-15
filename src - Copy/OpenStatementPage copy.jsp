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
			<label class="input-label">Monthly/Annual</label>
			<select class="input-field" id="MonthAnnual" onchange="fnChangeMonthAnnual()">
				<option value=""></option>
				<option value="month">Month</option>
				<option value="annual">Annual</option>
			</select>
		</div>
		<div id="monthSection" style="display: none;">
			<div class="input">
				<label class="input-label">From</label>
				<input type="date" id="fromDate" name="fromDate" class="input-field" required value='' />
			</div>
			<div class="input">
				<label class="input-label">To</label>
				<input type="date" id="toDate" name="toDate" class="input-field" required value='' />
			</div>
		</div>

		<br />
		<div class="action">
			<button type="button" class="action-button" onClick="fnGenerateStatement()">Generate Statement</button>
		</div>
	</form>
</body>

</html>