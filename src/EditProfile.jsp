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
			<input type="text" name="accountnumber" id="accountnumber" class="input-field" placeholder="Account Number"
				disabled required
				value='<%=session.getAttribute("sess_AccountNum") != null ? session.getAttribute("sess_AccountNum") : ""%>' />
		</div>
		<div class="input">
			<input type="text" id="username" name="username" class="input-field" placeholder="Username" required
				value='<%=session.getAttribute("sess_Username") != null ? session.getAttribute("sess_Username") : ""%>' />
		</div>
		<div class="input">
			<input type="text" class="input-field" name="phone" id="phone" placeholder="Phone"
				value='<%=session.getAttribute("sess_Phone") != null ? session.getAttribute("sess_Phone") : ""%>'
				maxlength="10" required />
		</div>
		<div class="input">
			<input type="date" class="input-field" name="DOB" id="DOB" placeholder="DOB"
				value='<%=session.getAttribute("sess_DOB") != null ? session.getAttribute("sess_DOB") : ""%>'
				required />
		</div>
		<div class="input">
			<input type="text" class="input-field" placeholder="Area" name="area" id="area"
				value='<%=session.getAttribute("sess_Area") != null ? session.getAttribute("sess_Area") : ""%>' />
		</div>
		<div class="input">
			<input type="text" class="input-field" placeholder="City" name="city" id="city"
				value='<%=session.getAttribute("sess_City") != null ? session.getAttribute("sess_City") : ""%>' />
		</div>
		<div class="input">
			<input type="text" class="input-field" placeholder="State" name="state" id="state"
				value='<%=session.getAttribute("sess_State") != null ? session.getAttribute("sess_State") : ""%>' />
		</div>
		<div class="input">
			<input type="text" class="input-field" placeholder="ZIP" name="zip" id="zip"
				value='<%=session.getAttribute("sess_ZIP") != null ? session.getAttribute("sess_ZIP") : ""%>'
				maxlength="6" />
		</div>
		<div class="action">
			<button type="button" class="action-button" onClick="fnEditProfile()">Update Profile</button>
		</div>
	</form>
</body>

</html>