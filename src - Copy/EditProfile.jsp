<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Plutus</title>
	<link rel="icon" type="image/x-icon" href="./images/logo.png">
	<link rel="stylesheet" href="Plutus.css" type="text/css">
</head>

<body>
	<!-- Edit Profile -->
	<div class="card-image">
		<img src="./images/logo.png" />
		<h2 class="card-heading">
			Edit Profile
		</h2>
	</div>
	<form class="card-form">
		<div class="input">
			<label class="input-label">Account Number</label>
			<input type="text" name="accountnumber" id="accountnumber" class="input-field" disabled required
				value='<%=session.getAttribute("sess_AccountNum") != null ? session.getAttribute("sess_AccountNum") : ""%>' />
		</div>
		<div class="input">
			<label class="input-label">Username</label>
			<input type="text" id="username" name="username" class="input-field" required
				value='<%=session.getAttribute("sess_Username") != null ? session.getAttribute("sess_Username") : ""%>' />
		</div>
		<div class="input">
			<label class="input-label">Phone</label>
			<input type="text" class="input-field" name="phone" id="phone"
				value='<%=session.getAttribute("sess_Phone") != null ? session.getAttribute("sess_Phone") : ""%>'
				maxlength="10" required />
		</div>
		<div class="input">
			<label class="input-label">DOB</label>
			<input type="date" class="input-field" name="DOB" id="DOB"
				value='<%=session.getAttribute("sess_DOB") != null ? session.getAttribute("sess_DOB") : ""%>'
				required />
		</div>
		<div class="input">
			<label class="input-label">Area</label>
			<input type="text" class="input-field" name="area" id="area"
				value='<%=session.getAttribute("sess_Area") != null ? session.getAttribute("sess_Area") : ""%>' />
		</div>
		<div class="input">
			<label class="input-label">City</label>
			<input type="text" class="input-field" name="city" id="city"
				value='<%=session.getAttribute("sess_City") != null ? session.getAttribute("sess_City") : ""%>' />
		</div>
		<div class="input">
			<label class="input-label">State</label>
			<input type="text" class="input-field" name="state" id="state"
				value='<%=session.getAttribute("sess_State") != null ? session.getAttribute("sess_State") : ""%>' />
		</div>
		<div class="input">
			<label class="input-label">ZIP</label>
			<input type="text" class="input-field" name="zip" id="zip"
				value='<%=session.getAttribute("sess_ZIP") != null ? session.getAttribute("sess_ZIP") : ""%>'
				maxlength="6" />
		</div>
		<br />
		<div class="action">
			<button type="button" class="action-button" onClick="fnEditProfile()">Update Profile</button>
		</div>
	</form>
</body>

</html>