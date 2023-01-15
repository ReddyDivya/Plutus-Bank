<html>

<head>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<title>Plutus</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<link rel="icon" type="image/x-icon" href="./images/logo.png">
	<link rel="stylesheet" href="Plutus.css" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
	<div class="db-container">
		<!--1.Navbar-->
		<header class="db-header">
			<!--1. Admin login Logo-->
			<div class="db-header-logo">
				<a href="Home.jsp" class="active" style="text-decoration: none;">
					<span class="db-header-logo-icon">
						<img src="./images/logo.png" />
					</span>
				</a>
				<a href="Home.jsp" class="active" style="text-decoration: none;">
					<h1 class="logo-title">
						<span>Plutus</span>
						<span>It's your money</span>
					</h1>
				</a>
			</div>

			<!--1. Admin login navbar -->
			<div class="db-header-navbar" id="admin-db-header-navbar">
				<div class="db-header-navbar-tabs">
					<a href="Admin.jsp" class="active">Customers Info</a>
					<a href="NewAccount.jsp" class="active">Add Account</a>
					<a href="Home.jsp" class="active">Logout</a>
				</div>
			</div>
		</header>

		<div class="db-body-main-content">
			<!--2. New Account -->
			<div class="card" id="user-signup">
				<div class="card-image">
					<img src="./images/logo.png" />
					<h2 class="card-heading">
						Register
					</h2>
				</div>
				<form class="card-form">
					<table>
						<tbody>
							<tr>
								<td colspan="2">
									<div class="input">
										<input type="text" class="input-field" placeholder="Username" name="username"
											id="username" value="Divya" required />
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input">
										<input type="text" class="input-field" placeholder="Amount" name="amount"
											id="amount" value="12000" required />
									</div>
								</td>
								<td>
									<div class="input">
										<input type="text" class="input-field" placeholder="Phone" name="phone"
											id="phone" value="9087890876" maxlength="10" required />
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="input">
										<input type="date" class="input-field" placeholder="DOB" name="DOB" id="DOB"
											value="02-05-1998" required />
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input">
										<input type="text" class="input-field" placeholder="Area" name="area" id="area"
											value="Begumpet" />
									</div>
								</td>
								<td>
									<div class="input">
										<input type="text" class="input-field" placeholder="City" name="city" id="city"
											value="Hyd" />
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input">
										<input type="text" class="input-field" placeholder="State" name="state"
											id="state" value="TS" />
									</div>
								</td>
								<td>
									<div class="input">
										<input type="text" class="input-field" placeholder="ZIP" name="zip" id="zip"
											value="500013" maxlength="6" />
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input">
										<input type="password" class="input-field" placeholder="Password"
											name="password" id="password" maxlength="10" value="Divya123" required />
									</div>
								</td>
								<td>
									<div class="input">
										<input type="password" class="input-field" placeholder="Confirm Password"
											name="repassword" id="repassword" maxlength="10" value="Divya123"
											required />
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input">
										<label class="input-label">Male</label>
										<input type="radio" name="gender" id="male" class="input-field" value="male"
											checked />
									</div>
								</td>
								<td>
									<div class="input">
										<label class="input-label">Female</label>
										<input type="radio" name="gender" id="female" class="input-field"
											value="female" />
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="card-info">
						<p>
							<input type="checkbox" class="input-field" id="agreeTerms" value="" />
							By signing up you are agreeing to our <a href="#">Terms and Conditions</a>
						</p>
					</div>
					<div class="action">
						<button type="button" class="action-button" onClick="fnAddAccount()">Add
							Account</button>
					</div>
				</form>
			</div>
			<!-- Displaying New account-->
			<div style="display:flex; width:90%; ">

				<!-- Displaying New account form -->
				<div class="card" id="action-form" style="display:none; margin:1rem auto;"></div>

				<!-- Displaying New account, Close account details -->
				<section class="service-section" id="newaccount-service-section" style="display:none;">
					<div class="tiles">
						<article class="tile" id="tile" style="display:none;">
							<div class="user-tile-body">
								<div class="tile-body-action" id="tile-body-action-info">

								</div>
							</div>
						</article>
					</div>
				</section>
			</div>
		</div>

		<!--3. Footer-->
		<%@ include file="Footer.jsp" %>
	</div>
</body>
<script>

	//add new account
	function fnAddAccount() {

		//username
		if (document.getElementById("username").value == "") {
			document.getElementById("username").style.background == "#FF9999";
			alert("Please enter username.");
			document.getElementById("username").focus();
			return false;
		}
		else if (!isNaN(document.getElementById("username").value)) {
			document.getElementById("username").style.background = "#FF9999";
			alert("Please enter proper username.");
			document.getElementById("username").value = "";
			document.getElementById("username").focus();
			return false;
		}

		//amount
		if (document.getElementById("amount").value == "") {
			document.getElementById("amount").style.background == "#FF9999";
			alert("Please enter amount.");
			document.getElementById("amount").focus();
			return false;
		}
		else if (document.getElementById("amount").value < 500) {
			document.getElementById("amount").style.background = "#FF9999";
			alert("Please keep minimum balance of 500 /-");
			document.getElementById("amount").focus();
			return false;
		}

		//phone
		if (document.getElementById("phone").value == "") {
			document.getElementById("phone").style.background == "#FF9999";
			alert("Please enter phone number.");
			document.getElementById("phone").focus();
			return false;
		}
		else if (document.getElementById("phone").value.length < 10) {
			document.getElementById("phone").style.background = "#FF9999";
			alert("Plese enter phone number with 10 digits.");
			document.getElementById("phone").focus();
			return false
		}

		//area
		if (document.getElementById("area").value == "") {
			document.getElementById("area").style.background == "#FF9999";
			alert("Please enter area.");
			document.getElementById("area").focus();
			return false;
		}
		else if (!isNaN(document.getElementById("area").value)) {
			document.getElementById("area").style.background = "#FF9999";
			alert("Please enter proper area.");
			document.getElementById("area").value = "";
			document.getElementById("area").focus();
			return false;
		}

		//city
		if (document.getElementById("city").value == "") {
			document.getElementById("city").style.background == "#FF9999";
			alert("Please enter city.");
			document.getElementById("city").focus();
			return false;
		}
		else if (!isNaN(document.getElementById("city").value)) {
			document.getElementById("city").style.background = "#FF9999";
			alert("Please enter proper city.");
			document.getElementById("city").value = "";
			document.getElementById("city").focus();
			return false;
		}

		//state
		if (document.getElementById("state").value == "") {
			document.getElementById("state").style.background == "#FF9999";
			alert("Please enter state.");
			document.getElementById("state").focus();
			return false;
		}
		else if (!isNaN(document.getElementById("state").value)) {
			document.getElementById("state").style.background = "#FF9999";
			alert("Please enter proper state.");
			document.getElementById("state").value = "";
			document.getElementById("state").focus();
			return false;
		}

		//zip
		if (document.getElementById("zip").value == "") {
			document.getElementById("zip").style.background == "#FF9999";
			alert("Please enter zip.");
			document.getElementById("zip").focus();
			return false;
		}
		else if (document.getElementById("zip").value.length < 6) {
			document.getElementById("zip").style.background = "#FF9999";
			alert("Please enter proper zip.");
			document.getElementById("zip").focus();
			return false
		}

		//password
		if (document.getElementById("password").value == "") {
			document.getElementById("password").style.background == "#FF9999";
			alert("Please enter password.");
			document.getElementById("password").focus();
			return false;
		}
		else if (document.getElementById("password").value.length < 6) {
			document.getElementById("password").style.background = "#FF9999";
			alert("Password must have 6 characters.");
			document.getElementById("password").focus();
			return false;
		}
		else if (document.getElementById("password").value != document.getElementById("repassword").value) {
			document.getElementById("password").style.background = "#FF9999";
			alert("Please check your password.");
			document.getElementById("repassword").focus();
			return false;
		}

		// //terms and conditions
		if (document.getElementById.checked == false) {
			alert("Please agree to our terms and conditions.");
			return false;
		}
		else {

			var vURL = "newaccount?&username=" + document.getElementById("username").value
				+ "&password=" + document.getElementById("password").value
				+ "&repassword=" + document.getElementById("repassword").value
				+ "&DOB=" + document.getElementById('DOB').value
				+ "&gender= " + (document.getElementById('female').checked ? 'Female' : 'Male')
				+ "&phone=" + document.getElementById("phone").value
				+ "&amount=" + document.getElementById("amount").value
				+ "&area=" + document.getElementById('area').value
				+ "&city=" + document.getElementById('city').value
				+ "&state=" + document.getElementById('state').value
				+ "&zip=" + document.getElementById('zip').value

			fnSendBECall("tile-body-action-info", vURL);//display newly added account details in 'tile-body-action-info'
			document.getElementById("user-signup").style.display = "none";//hiding new account form
			document.getElementById("newaccount-service-section").style.display = "block";//showing newly added account details
		}
	}//fnAddAccount

	//send BE call
	function fnSendBECall(vId, vURL) {
		var vRequest = "";

		if (window.XMLHttpRequest) {
			vRequest = new XMLHttpRequest;
		}
		else if (window.ActiveXObject) {
			vRequest = new ActiveXObject(Microsoft.XMLHTTP);
		}
		vRequest.onreadystatechange = function () {
			if (vRequest.readyState == 4) {
				var vResponse = vRequest.responseText;

				if (vResponse.indexOf("invalid") == -1) //success
				{
					document.getElementById("user-signup").style.display = "none";
				}
				else //fail
				{
					document.getElementById("user-signup").style.display = "block";
				}

				document.getElementById(vId).innerHTML = vResponse;
				document.getElementById("tile").style.display = "block";//showing details block
			}
		};

		vRequest.open("Get", vURL, false);
		vRequest.send();
	}//fnSendBECall
</script>

</html>