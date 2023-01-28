<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" %>
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Plutus</title>
		<link rel="icon" type="image/x-icon" href="./images/logo.png">
		<link rel="stylesheet" href="Plutus.css" type="text/css">
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
		<script type="text/javascript" charset="utf8"
			src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>

	</head>

	<body>
		<div class="db-container">
			<!--1.Navbar-->
			<header class="db-header">
				<!--Logo-->
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

				<!-- Home navbar -->
				<div class="db-header-navbar" id="home-db-header-navbar">
					<div class="db-header-navbar-tabs">
						<div class="accounts-dropdown">
							<a href="#" class="active">Accounts</a>
							<div class="accounts-dropdown-content">
								<a href="#">Savings Account</a>
								<a href="#">Deposits</a>
							</div>
						</div>
						<div class="accounts-dropdown">
							<a href="#" class="active">Cards</a>
							<div class="accounts-dropdown-content">
								<a href="#">Credit Cards</a>
								<a href="#">Debit Cards</a>
							</div>
						</div>
						<div class="accounts-dropdown">
							<a href="#" class="active">Loans</a>
							<div class="accounts-dropdown-content">
								<a href="#">Personal Loans</a>
								<a href="#">Home Loans</a>
								<a href="#">Vehicle Loans</a>
								<a href="#">Gold Loans</a>
							</div>
						</div>
						<div class="accounts-dropdown">
							<a href="#" class="active">Invest</a>
							<div class="accounts-dropdown-content">
								<a href="#">Deposits</a>
								<a href="#">Gold Wealth</a>
								<a href="#">Retirement Planning</a>
							</div>
						</div>
						<div class="accounts-dropdown">
							<a href="#" class="active">Insure</a>
							<div class="accounts-dropdown-content">
								<a href="#">Life Insurance</a>
								<a href="#">Health Insurance</a>
								<a href="#">Vehicle Insurance</a>
								<a href="#">Travel Insurance</a>
							</div>
						</div>

						<a href="CustomerCare.jsp" class="active">Customer Care</a>
						<a href="About.jsp" class="active">About</a>
						<a href="UserLogin.jsp" class="active">Login</a>
					</div>
				</div>

				<!-- User login navbar -->
				<div class="db-header-navbar" id="user-db-header-navbar" style="display:none">
					<div class="db-header-navbar-tabs">
						<a href="#" class="active" onClick="fnBalanceAmount()">Overview</a>
						<a href="#" class="active" onClick="fnOpenDepositPage()">Deposit</a>
						<a href=" #" class="active" onClick="fnOpenWithdrawPage()">Withdraw</a>
						<a href="#" class="active" onClick="fnOpenTransferPage()">Transfer</a>
						<a href="#" class="active" onClick="fnOpenStatementPage()">Statement</a>
						<a href="#" class="active" onClick="fnOpenEditProfilePage()">Edit Profile</a>
						<a href="UserLogin.jsp" class="active" id="LoginOrOut">Login</a>
					</div>
				</div>

				<!--User Profile Icon-->
				<div class="db-header-actions">
					<button class="user-profile">
						<span id="user-profile-name"></span>
						<span><img id="user-profile-icon" /></span>
					</button>
				</div>
			</header>

			<!--Login Body-->
			<div class="db-body-main-content">
				<!--2. User Login-->
				<div class="card" id="user-login">
					<div class="card-image">
						<img src="./images/logo.png" />
						<h2 class="card-heading">
							LOGIN
						</h2>
					</div>
					<form class="card-form">
						<div class="input">
							<input type="text" id="Username" name="Username" placeholder="Username" class="input-field"
								value="Divya" required />
						</div>
						<div class="input">
							<input type="text" name="accountnumber" id="accountnumber" placeholder="Account Number"
								class="input-field" value="1" required />
						</div>
						<div class="input">
							<input type="password" name="password" id="password" placeholder="Password"
								class="input-field" value="Divya123" required />
						</div>
						<div id="LoginMsg" style="display:none"></div>
						<div class="card-info">
							<p class="card-line" onclick="fnResetPassword()">Forgot Password?</p>
						</div>
						<div class="action">
							<button type="button" class="action-button" onClick="fnUserLogin()">LOGIN</button>
						</div>
					</form>
					<div class="card-info">
						<hr>
						<a href="AdminLogin.jsp" class="button">ADMIN LOGIN</a>
					</div>
				</div>

				<!-- Displaying Deposit, Withdraw, Transfer -->
				<div style="display:flex; width:90%; ">

					<!-- Displaying Deposit, Withdraw, Transfer forms -->
					<div class="card" id="action-form" style="display:none; margin:1rem auto;"></div>

					<!-- Displaying Deposit, Withdraw, Transfer, Balance Details -->
					<section class="service-section" id="user-service-section" style="display:none;">
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
				<br />
				<!-- Displaying Statement details-->
				<div id="DsplyStmtDetailsTbl" style="display:none;">
					<button type="button" onclick="fnTableToCSV()">Download</button>
					<table id="StmtDetailsTbl" border="1">
						<thead>
							<tr>
								<th>Date</th>
								<!-- <th onclick="fnSortByName()">Username</th> -->
								<th>Username</th>
								<th>Account Number</th>
								<th>Type of Transaction</th>
								<th>Amount</th>
								<th>Balance</th>
								<th>Remark</th>
							</tr>
						</thead>
						<tbody id="StmtDetails"></tbody>
					</table>
				</div>

				<!--2. Footer-->
				<%@ include file="Footer.jsp" %>
			</div>
	</body>
	<script>
		// var vFullname = '<%=session.getAttribute("sess_Username") != null ? session.getAttribute("sess_Username") : ""%>';

		async function fnSendBECall(vId, vURL) {
			var ajaxrequest;

			if (window.XMLHttpRequest) {
				ajaxrequest = new XMLHttpRequest;
			}
			else if (window.ActiveXObject) {
				ajaxrequest = new ActiveXObject(Microsoft.XMLHTTP);
			}

			ajaxrequest.onreadystatechange = function () {
				if (ajaxrequest.readyState == 4) {
					var vResponse = ajaxrequest.responseText;

					if (vResponse.indexOf("Invalid") == -1 && vResponse.indexOf("Unable") == -1) //success
					{
						document.getElementById("user-login").style.display = "none";
					}
					else //fail
					{
						// document.getElementById("user-login").style.display = "block";
					}

					document.getElementById("tile").style.display = "block";//showing details block
					document.getElementById(vId).innerHTML = vResponse;

					return true;
				}
				else
					return false;
			};

			ajaxrequest.open("Get", vURL, false);
			ajaxrequest.send();

		}//fnSendBECall

		let CallBE = (vId, vURL) => {
			return new Promise((resolve, reject) => {
				var ajaxrequest;
				if (window.XMLHttpRequest) {
					ajaxrequest = new XMLHttpRequest;
				}
				else if (window.ActiveXObject) {
					ajaxrequest = new ActiveXObject(Microsoft.XMLHTTP);
				}

				ajaxrequest.open("GET", vURL);

				ajaxrequest.onload = () => {
					if (ajaxrequest.status >= 200 && ajaxrequest.status < 300) {
						resolve(ajaxrequest.response);
					} else {
						reject(ajaxrequest.statusText);
					}
				};
				ajaxrequest.onerror = () => reject(ajaxrequest.statusText);
				ajaxrequest.send();
			});
		};

		//login
		async function fnUserLogin() {

			if (document.getElementById("Username").value == "" || document.getElementById("accountnumber").value == ""
				|| document.getElementById("password").value == "") {

				document.getElementById("Username").style.background = "#FF9999";
				document.getElementById("accountnumber").style.background = "#FF9999";
				document.getElementById("password").style.background = "#FF9999";

				alert("Please fill all mandatory fields.");
				document.getElementById("Username").focus();//focusing first form field(Username)
				return false;
			}

			//fullname
			else if (document.getElementById("Username").value == "") {
				document.getElementById("Username").style.background == "#FF9999";
				alert("Please enter Username.");
				document.getElementById("Username").focus();
			}
			else if (!isNaN(document.getElementById("Username").value)) {
				document.getElementById("Username").style.background = "#FF9999";
				alert("Please enter proper Username.");
				document.getElementById("Username").value = "";
				document.getElementById("Username").focus();
				return false;
			}

			//password
			if (document.getElementById("password").value == "") {
				document.getElementById("password").style.background = "#FF9999";
				alert("Please enter password.");
				document.getElementById("password").value = "";
				document.getElementById("password").focus();
				return false
			}

			//account number
			if (document.getElementById("accountnumber").value == "") {
				document.getElementById("accountnumber").style.background = "#FF9999";
				alert("Please enter account number.");
				document.getElementById("accountnumber").value = "";
				document.getElementById("accountnumber").focus();
				return false;
			}
			else if (isNaN(document.getElementById("accountnumber").value)) {
				document.getElementById("accountnumber").style.background = "#FF9999";
				alert("Please enter proper account number.");
				document.getElementById("accountnumber").value = "";
				document.getElementById("accountnumber").focus();
				return false;
			}
			else {

				var vURL = "loginpage?Username=" + document.getElementById("Username").value
					+ "&Password=" + document.getElementById("password").value
					+ "&AccountNum=" + document.getElementById("accountnumber").value;

				//fnSendBECall("LoginMsg", vURL);
				await CallBE("LoginMsg", vURL)
					.then(vResponse => {

						if (vResponse.indexOf("Invalid") == -1) //success
						{
							document.getElementById("user-profile-name").innerHTML = vResponse.split("<SEP>")[0];
							document.getElementById("user-profile-icon").src = "images/user1.jpeg";
							document.getElementById("user-login").style.display = "none";

							//changing navbar
							document.getElementById("home-db-header-navbar").style.display = "none";
							document.getElementById("user-db-header-navbar").style.display = "block";

							//showing logout info
							document.getElementById("LoginOrOut").innerHTML = "Logout";
							document.getElementById("LoginOrOut").href = "UserLogout.jsp";

							fnBalanceAmount();//display user balance
						}
						else //fail
						{
							// document.getElementById("user-login").style.display = "block";
						}

						document.getElementById("tile").style.display = "block";//showing details block
						document.getElementById("LoginMsg").innerHTML = vResponse;

					}).catch(resp => console.log(resp))

				document.getElementById("LoginMsg").style.display = "block";
			}
		}//fnUserLogin

		//check customer balance amount
		function fnBalanceAmount() {

			var vURL = "balanceamount";

			fnSendBECall("tile-body-action-info", vURL);//display balance details in 'tile-body-action-info'
			document.getElementById("action-form").style.display = "none";
			document.getElementById("user-service-section").style.display = "block";//showing form's block
			document.getElementById("tile").style.display = "block";//showing form's block

		}//fnBalanceAmount

		//opens deposit page
		function fnOpenDepositPage() {
			var vURL = "OpenDepositPage.jsp";

			document.getElementById("tile-body-action-info").innerHTML = "";
			document.getElementById("action-form").style.display = "inline-flex";

			fnSendBECall("action-form", vURL);//Deposit page gets displayed in the 'action-form' div
			document.getElementById("tile").style.display = "none";//hiding details block
			document.getElementById("DsplyStmtDetailsTbl").style.display = 'none';//hiding Statement Table
		}//fnOpenDepositPage

		//deposit amount
		function fnDepositAmount() {
			if (document.getElementById("amount").value == "") {
				document.getElementById("amount").style.background = "#FF9999";
				alert("Please enter amount.");
				document.getElementById("amount").value = "";
				document.getElementById("amount").focus();
				return false;
			}
			if (document.getElementById("amount").value < 100) {
				document.getElementById("amount").style.background = "#FF9999";
				alert('Please enter amount more than 100/-');
				document.getElementById("amount").value = "";
				document.getElementById("amount").focus();
				return false;
			}
			else if (isNaN(document.getElementById("amount").value)) {
				document.getElementById("amount").style.background = "#FF9999";
				alert('Please enter proper amount.');
				document.getElementById("amount").value = "";
				document.getElementById("amount").focus();
				return false;
			}
			else {

				var vURL = "depositpage?Amount=" + document.getElementById("amount").value;

				fnSendBECall("tile-body-action-info", vURL);//display deposit details in 'tile-body-action-info'
				document.getElementById("user-service-section").style.display = "block";//showing form's block
				// document.getElementById("tile").style.display = "none";//hiding details block
			}
		}//fnDepositAmount

		//opens withdraw page
		function fnOpenWithdrawPage() {
			var vURL = "OpenWithdrawPage.jsp";

			document.getElementById("tile-body-action-info").innerHTML = "";
			document.getElementById("action-form").style.display = "inline-flex";

			fnSendBECall("action-form", vURL);//Withdraw page gets displayed in the 'action-form' div
			document.getElementById("tile").style.display = "none";//hiding details block
			document.getElementById("DsplyStmtDetailsTbl").style.display = 'none';//hiding Statement Table
		}//fnOpenWithdrawPage

		//user withdraw amount
		function fnWithdrawAmount() {
			if (document.getElementById("amount").value == "") {
				document.getElementById("amount").style.background = "#FF9999";
				alert("Please enter amount.");
				document.getElementById("amount").value = "";
				document.getElementById("amount").focus();
			}
			else if (document.getElementById("amount").value < 100) {
				document.getElementById("amount").style.background = "#FF9999";
				alert("Please enter amount more than 100/-");
				document.getElementById("amount").value = "";
				document.getElementById("amount").focus();
			}
			else if (isNaN(document.getElementById("amount").value)) {
				document.getElementById("amount").style.background = "#FF9999";
				alert("Please enter proper amount");
				document.getElementById("amount").value = "";
				document.getElementById("amount").focus();
			}
			else if (document.getElementById("amount").value > 25000) {
				document.getElementById("amount").style.background = "#FF9999";
				alert("Please cannot withdraw more than Rs.25,000/-");
				document.getElementById("amount").value = "";
				document.getElementById("amount").focus();
			}
			else {

				var vURL = "withdrawpage?amount=" + document.getElementById("amount").value;

				fnSendBECall("tile-body-action-info", vURL);//display withdraw details in 'tile-body-action-info'
				document.getElementById("user-service-section").style.display = "block";//showing form's block
			}
		}//fnWithdrawAmount

		//opens transfer page
		function fnOpenTransferPage() {
			var vURL = "OpenTransferPage.jsp";

			document.getElementById("tile-body-action-info").innerHTML = "";
			document.getElementById("action-form").style.display = "inline-flex";

			fnSendBECall("action-form", vURL);//Transfer page gets displayed in the 'action-form' div
			document.getElementById("tile").style.display = "none";//hiding details block
			document.getElementById("DsplyStmtDetailsTbl").style.display = 'none';//hiding Statement Table
		}//fnOpenTransferPage


		//transfer amount to others account
		function fnTransferAmount() {

			//receiver account number
			if (document.getElementById("ReceiverAccountNum").value == "") {
				document.getElementById("ReceiverAccountNum").style.background = "#FF9999";
				alert("Please enter account number.");
				document.getElementById("ReceiverAccountNum").value = "";
				document.getElementById("ReceiverAccountNum").focus();
				return false;
			}
			else if (!isNaN(document.getElementById("ReceiverAccountNum").value) == "") {
				document.getElementById("ReceiverAccountNum").style.background = "#FF9999";
				alert("Please enter proper account number.");
				document.getElementById("ReceiverAccountNum").value = "";
				document.getElementById("ReceiverAccountNum").focus();
				return false;
			}
			else if (document.getElementById("accountnumber").value == document.getElementById("ReceiverAccountNum").value) {
				document.getElementById("ReceiverAccountNum").style.background = "#FF9999";
				alert("Please enter proper receiver account number.");
				document.getElementById("ReceiverAccountNum").value = "";
				document.getElementById("ReceiverAccountNum").focus();
				return false;
			}

			//amount
			if (document.getElementById("amount").value == "") {
				document.getElementById("amount").style.background = "#FF9999";
				alert("Please enter amount.");
				document.getElementById("amount").value = "";
				document.getElementById("amount").focus();
				return false;
			}
			else if (isNaN(document.getElementById("amount").value)) {
				document.getElementById("amount").style.background = "#FF9999";
				alert("Please enter proper amount.");
				document.getElementById("amount").value = "";
				document.getElementById("amount").focus();
				return false;
			}
			else if (document.getElementById("amount").value < 100) {
				document.getElementById("amount").style.background = "#FF9999";
				alert("Please enter amount more than 100.");
				document.getElementById("amount").value = "";
				document.getElementById("amount").focus();
				return false;
			}
			if (document.getElementById("amount").value > 25000) {
				document.getElementById("amount").style.background = "#FF9999";
				alert("Please amount cannot be more than Rs.25000/-");
				document.getElementById("amount").value = "";
				document.getElementById("amount").focus();
				return false;
			}

			//Captcha
			if (document.getElementById("captcha").value == "") {
				document.getElementById("captcha").style.background = "#FF9999";
				alert("Please enter captcha.");
				document.getElementById("captcha").focus();
				return false;
			}
			else if (document.getElementById("DisplayCaptacha").innerHTML != document.getElementById("captcha").value) {
				document.getElementById("captcha").style.background = "#FF9999";
				alert("Please enter proper captcha.");
				document.getElementById("captcha").focus();
				return false;
			}
			else {

				var vURL = "transferpage?amount=" + document.getElementById("amount").value + "&ReceiverAccountNum=" + document.getElementById("ReceiverAccountNum").value;

				fnSendBECall("tile-body-action-info", vURL);//display transfer details in 'tile-body-action-info'
				document.getElementById("action-form").style.display = "none";//Remove transfer form
				document.getElementById("user-service-section").style.display = "block";//display passbook
			}
		}//fnTransferAmount

		//generate captacha
		function fnGenerateCaptcha() {

			const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
			let result = '';

			for (let i = 0; i < 5; i++) {
				result += characters.charAt(Math.floor(Math.random() * characters.length));
			}
			document.getElementById("DisplayCaptacha").innerHTML = result;
		}//fnGenerateCaptcha

		//Reset password
		function fnResetPassword() {

			var vNewPassword = prompt("Please enter new password (minimum of 6 characters)) : ", "");

			if (vNewPassword == "") {
				alter("Please enter password.");
				return false;
			}
			else if (vNewPassword.length < 6) {
				alter("Password must be minimum of 6 characters.");
				return false;
			}
			else {
				var vURL = "resetpassword?username=" + document.getElementById("Username").value + "&newpassword=" + vNewPassword + "&AccountNum=" + document.getElementById("accountnumber").value;
				console.log(vURL);
				fnSendBECall("tile-body-action-info", vURL);//display deposit details in 'tile-body-action-info'
				document.getElementById("user-service-section").style.display = "block";//showing form's block
			}
		}//fnResetPassword

		//opens statement page
		function fnOpenStatementPage() {
			var vURL = "OpenStatementPage.jsp";

			document.getElementById("tile-body-action-info").innerHTML = "";
			document.getElementById("action-form").style.display = "inline-flex";

			fnSendBECall("action-form", vURL);//Transfer page gets displayed in the 'action-form' div
			document.getElementById("tile").style.display = "none";//hiding details block
			document.getElementById("DsplyStmtDetailsTbl").style.display = 'none';//hiding Statement Table
		}//fnOpenStatementPage

		// //month-annual change event
		// function fnChangeMonthAnnual() {
		// 	//month
		// 	if (document.getElementById("MonthAnnual").value == "month") {
		// 		document.getElementById("monthSection").style.display = "block";
		// 	}
		// }//fnChangeMonthAnnual

		//generate monthly or annual statement
		function fnGenerateStatement() {

			//from and to date
			if (document.getElementById("fromDate").value == "") {
				document.getElementById("fromDate").style.background = "#FF9999";
				alert("Please select date.");
				document.getElementById("fromDate").value = "";
				document.getElementById("fromDate").focus();
				return false;
			}
			else if (document.getElementById("toDate").value == "") {
				document.getElementById("toDate").style.background = "#FF9999";
				alert("Please select date.");
				document.getElementById("toDate").value = "";
				document.getElementById("toDate").focus();
				return false;
			}
			else {

				var vURL = "statement?fromDate=" + document.getElementById("fromDate").value + "&toDate=" + document.getElementById("toDate").value;

				//fnGenStmtSendBECall("tile-body-action-info", vURL);//display transfer details in 'tile-body-action-info'
				fnGenStmtSendBECall('StmtDetails', vURL);
				document.getElementById("action-form").style.display = "none";//Remove transfer form
				document.getElementById("user-service-section").style.display = "block";//display passbook
			}
		}//fnGenerateStatement

		//Send BE call
		function fnGenStmtSendBECall(vId, vURL) {
			var ajaxrequest, count = 0;

			if (window.XMLHttpRequest) {
				ajaxrequest = new XMLHttpRequest;
			}
			else if (window.ActiveXObject) {
				ajaxrequest = new ActiveXObject(Microsoft.XMLHTTP);
			}

			ajaxrequest.onreadystatechange = function () {
				if (ajaxrequest.readyState == 4) {

					var vResponse = ajaxrequest.responseText;

					var JsonObj = JSON.parse(vResponse);
					document.getElementById(vId).innerHTML = "";
					document.getElementById("DsplyStmtDetailsTbl").style.display = 'block';

					if (JsonObj.StmtDetails.length > 0) {
						for (let i = 0; i < JsonObj.StmtDetails.length; i++) {

							data = "<tr id=" + count + ">";
							data += "<td>" + JsonObj.StmtDetails[i].TrnxDate + "</td>";
							data += "<td >" + JsonObj.StmtDetails[i].Username + "</td>";
							data += "<td >" + JsonObj.StmtDetails[i].AccountNum + "</td>";
							data += "<td>" + JsonObj.StmtDetails[i].TrnxType + "</td>";
							data += "<td>" + JsonObj.StmtDetails[i].Amount + "</td>";
							data += "<td>" + JsonObj.StmtDetails[i].AvailBalance + "</td>";
							data += "<td>" + JsonObj.StmtDetails[i].Remark + "</td>";
							count++;

							document.getElementById(vId).innerHTML += data;
						}
					}
					else {
						document.getElementById(vId).innerHTML = "<tr><td colspan='7'>No Records Found.</td></tr>";
					}

				}
			};

			ajaxrequest.open("Get", (vURL ? vURL : ""), false);
			ajaxrequest.send();
		}//fnGenStmtSendBECall

		function fnTableToCSV() {

			// Variable to store the final csv data
			var csv_data = [];

			// Get each row data
			var rows = document.getElementsByTagName('tr');
			for (var i = 0; i < rows.length; i++) {

				// Get each column data
				var cols = rows[i].querySelectorAll('td,th');

				// Stores each csv row data
				var csvrow = [];
				for (var j = 0; j < cols.length; j++) {

					// Get the text data of each cell
					// of a row and push it to csvrow
					csvrow.push(cols[j].innerHTML);
				}

				// Combine each column value with comma
				csv_data.push(csvrow.join(","));
			}

			// Combine each row data with new line character
			csv_data = csv_data.join('\n');

			// Call this function to download csv file 
			fnDownloadCSVFile(csv_data);
		}//fnTableToCSV

		function fnDownloadCSVFile(csv_data) {

			// Create CSV file object and feed
			// our csv_data into it
			CSVFile = new Blob([csv_data], {
				type: "text/csv"
			});

			// Create to temporary link to initiate
			// download process
			var temp_link = document.createElement('a');

			// Download csv file
			temp_link.download = document.getElementById("Username").value + "_Statement.csv";
			var url = window.URL.createObjectURL(CSVFile);
			temp_link.href = url;

			// This link should not be displayed
			temp_link.style.display = "none";
			document.body.appendChild(temp_link);

			// Automatically click the link to
			// trigger download
			temp_link.click();
			document.body.removeChild(temp_link);
		}//fnDownloadCSVFile

		//opens Edit profile
		function fnOpenEditProfilePage() {

			var vURL = "EditProfile.jsp";

			document.getElementById("tile-body-action-info").innerHTML = "";
			document.getElementById("action-form").style.display = "inline-flex";

			fnSendBECall("action-form", vURL);//Deposit page gets displayed in the 'action-form' div
			document.getElementById("tile").style.display = "none";//hiding details block
			document.getElementById("DsplyStmtDetailsTbl").style.display = 'none';//hiding Statement Table
		}//fnOpenEditProfilePage

		//Edit Profile
		function fnEditProfile() {
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
			else {

				var vURL = "editprofile?&username=" + document.getElementById("username").value
					+ "&DOB=" + document.getElementById('DOB').value
					+ "&phone=" + document.getElementById("phone").value
					+ "&area=" + document.getElementById('area').value
					+ "&city=" + document.getElementById('city').value
					+ "&state=" + document.getElementById('state').value
					+ "&zip=" + document.getElementById('zip').value
					+ "&accountnumber=" + document.getElementById("accountnumber").value;

				console.log(vURL);
				fnSendBECall("tile-body-action-info", vURL);//display edit profile in 'tile-body-action-info'
				document.getElementById("user-service-section").style.display = "block";//showing form's block
			}
		}//fnEditProfile

		$(document).ready(function () {
			//Statement details Table
			$('#StmtDetailsTbl').DataTable({
				dom: 'Bfrtip',
				buttons: [{
					extend: 'excelHtml5',
					autoFilter: true,
					sheetName: 'Exported data'
				}],
				scrollY: 700,
				paging: false,
				autoWidth: true,
				ordering: true,
				searching: false,
				"order": [[1, "asc"]],
				"columnDefs": [
					{ "orderable": false, "targets": "_all" }
				],
			});

			$(".dataTables_info, .sorting_desc, .sorting_asc").hide();
		});
	</script>

	</html>