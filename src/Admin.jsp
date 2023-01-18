<html>

<head>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<title>Plutus</title>
	<link rel="icon" type="image/x-icon" href="./images/logo.png">
	<link rel="stylesheet" href="Plutus.css" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>

</head>

<body>
	<div class="db-container">
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
					<a href="#" class="active" onClick="fnSendBECall('UserDetails', 'userdetails'); ">Customers Info</a>
					<a href="NewAccount.jsp" class="active">Add Account</a>
					<a href="Home.jsp" class="active">Logout</a>
				</div>
			</div>

			<!--User Profile Icon-->
			<div class="db-header-actions">
				<button class="user-profile">
					<span id="user-profile-name">
						<%=session.getAttribute("sess_AdminName") !=null ? session.getAttribute("sess_AdminName") : ""
							%>
					</span>
					<span><img id="user-profile-icon" src="images/user1.jpeg" /></span>
				</button>
			</div>
		</header>
		<!--2. Admin body-->
		<div class="db-body-main-content" id="DsplyUserDetailsTbl">
			<input type="text" id="search-input" onKeyUp="fnSearchByName()" placeholder="Search for names.." />
			<table id="UserDetailsTbl" border="1">
				<thead>
					<tr>
						<th>Operations</th>
						<th>Account Number</th>
						<th onclick="fnSortByName()">Name</th>
						<th>Amount</th>
						<th>Address</th>
						<th>Phone</th>
						<th>DOB</th>
						<th>Gender</th>
						<th>Edit</th>
					</tr>
				</thead>
				<tbody id="UserDetails" style="overflow-y:auto;"></tbody>
			</table>

			<!-- Displaying New account-->
			<div style="display:flex; width:90%; ">

				<!-- Displaying New account form -->
				<div class="card" id="action-form" style="display:none; margin:1rem auto;"></div>

				<!-- Displaying New account, Close account details -->
				<section class="service-section" id="admin-service-section" style="display:none;">
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

		<!-- Generate Customer Statement details dialog -->
		<div id="StatementSection" title="Generate Customer Statement" style="display:none;">
			<form class="card-form">
				<div class="input">
					<label class="input-label">Username</label>
					<input type="text" id="username" name="username" class="input-field" required disabled value='' />
				</div>
				<div class="input">
					<label class="input-label">Account Number</label>
					<input type="text" name="accountnumber" id="accountnumber" class="input-field" required disabled
						value='' />
				</div>
				<div>
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
					<button type="button" class="action-button" onClick="fnGenerateStatement()">Generate
						Statement</button>
				</div>
			</form>
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

		<!-- Deposit Section -->
		<div id="DepositSection" title="Deposit" style="display:none;">
			<form class="card-form">
				<div class="input">
					<label class="input-label">Username</label>
					<input type="text" id="deposit-username" name="deposit-username" class="input-field" required
						disabled value='' />
				</div>
				<div class="input">
					<label class="input-label">Account Number</label>
					<input type="text" name="deposit-accountnumber" id="deposit-accountnumber" class="input-field"
						required disabled value='' />
				</div>
				<div class="input">
					<label class="input-label">Amount</label>
					<input type="text" name="deposit-amount" id="deposit-amount" class="input-field" required />
				</div>
				<br />
				<div class="action">
					<button type="button" class="action-button" onClick="fnDepositAmount()">Deposit</button>
				</div>
			</form>
		</div>

		<!-- Withdraw Section -->
		<div id="WithdrawSection" title="Withdraw" style="display:none;">
			<form class="card-form">
				<div class="input">
					<label class="input-label">Username</label>
					<input type="text" id="withdraw-username" name="withdraw-username" class="input-field" required
						disabled value='' />
				</div>
				<div class="input">
					<label class="input-label">Account Number</label>
					<input type="text" name="withdraw-accountnumber" id="withdraw-accountnumber" class="input-field"
						required disabled value='' />
				</div>
				<div class="input">
					<label class="input-label">Amount</label>
					<input type="text" name="withdraw-amount" id="withdraw-amount" class="input-field" required />
				</div>
				<br />
				<div class="action">
					<button type="button" class="action-button" onClick="fnWithdrawAmount()">Withdraw</button>
				</div>
			</form>
		</div>

		<!-- Edit Profile Section -->
		<div id="EditProfileSection" title="Edit Profile" style="display:none;">
			<form class="card-form">
				<div class="input">
					<label class="input-label">Account Number</label>
					<input type="text" name="cus-accountnumber" id="cus-accountnumber" class="input-field" disabled
						required value='' />
				</div>
				<div class="input">
					<label class="input-label">Username</label>
					<input type="text" id="cus-username" name="cus-username" class="input-field" required value='' />
				</div>
				<div class="input">
					<label class="input-label">Phone</label>
					<input type="text" class="input-field" name="cus-phone" id="cus-phone" value="" maxlength="10"
						required />
				</div>
				<div class="input">
					<label class="input-label">DOB</label>
					<input type="date" class="input-field" name="cus-DOB" id="cus-DOB" value="" required />
				</div>
				<tr>
					<td>
						<div class="input">
							<label class="input-label">Male</label>
							<input type="radio" name="cus-gender" id="male" class="input-field" value="male" />
						</div>
					</td>
					<td>
						<div class="input">
							<label class="input-label">Female</label>
							<input type="radio" name="cus-gender" id="female" class="input-field" value="female" />
						</div>
					</td>
				</tr>
				<div class="input">
					<label class="input-label">Area</label>
					<input type="text" class="input-field" name="cus-area" id="cus-area" value="" />
				</div>
				<div class="input">
					<label class="input-label">City</label>
					<input type="text" class="input-field" name="cus-city" id="cus-city" value="" />
				</div>
				<div class="input">
					<label class="input-label">State</label>
					<input type="text" class="input-field" name="cus-state" id="cus-state" value="" />
				</div>
				<div class="input">
					<label class="input-label">ZIP</label>
					<input type="text" class="input-field" name="cus-zip" id="cus-zip" value="" maxlength="6" />
				</div>
				<br />
				<div class="action">
					<button type="button" class="action-button" onClick="fnEditProfile()">Update Profile</button>
				</div>
			</form>
		</div>

		<!--3. Footer-->
		<%@ include file="Footer.jsp" %>
	</div>
</body>
<script type="text/javascript">



	fnSendBECall('UserDetails', 'userdetails');

	//Send BE call
	function fnSendBECall(vId, vURL) {
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
				console.log('response >> ', vResponse);

				var JsonObj = JSON.parse(vResponse);
				document.getElementById(vId).innerHTML = "";

				if (JsonObj.info.length > 0) {
					for (let i = 0; i < JsonObj.info.length; i++) {
						console.log(JsonObj.info);
						data = `<tr id=" + count + "><td width=13%;><img src='images/editprofile.png' style='display:inline' title="Edit Profile" onclick='fnOpenEditProfile("${JsonObj.info[i].Id}", "${JsonObj.info[i].Name}", "${JsonObj.info[i].Phone}", "${JsonObj.info[i].Area}", "${JsonObj.info[i].City}", "${JsonObj.info[i].State}", "${JsonObj.info[i].Zip}", "${JsonObj.info[i].dob}", "${JsonObj.info[i].Gender}" )' width = '20' height = '20' />&nbsp;<img src='images/download.svg' style='display:inline' title="Generate statement" onclick='fnOpenStatement(${JsonObj.info[i].Id}, "${JsonObj.info[i].Name}", "${JsonObj.info[i].DOB}", "${JsonObj.info[i].Gender}" )' width = '20' height = '20' />&nbsp;<img src='images/deposit.png' style='display:inline' title="Deposit" onclick='fnOpenDeposit(${JsonObj.info[i].Id}, "${JsonObj.info[i].Name}" )' width = '20' height = '20' />&nbsp;<img src='images/withdraw.png' style='display:inline' title="Withdraw" onclick='fnOpenWithdraw(${JsonObj.info[i].Id}, "${JsonObj.info[i].Name}")' width = '20' height = '20' /></td >`;
						data += "<td>" + JsonObj.info[i].Id + "</td>";
						data += "<td >" + JsonObj.info[i].Name + "</td>";
						data += "<td>" + JsonObj.info[i].Amount + "</td>";
						data += "<td>" + JsonObj.info[i].Address + "</td>";
						data += "<td>" + JsonObj.info[i].Phone + "</td>";
						data += "<td>" + JsonObj.info[i].dob + "</td>";
						data += "<td>" + JsonObj.info[i].Gender + "</td>";
						data += "<td><img src='images/delete.png' onclick='fnCloseAccount(" + JsonObj.info[i].Id + ", " + JsonObj.info[i].Amount + ")' width='30' height='30'/></td></tr>";
						count++;

						document.getElementById(vId).innerHTML += data;
					}
				}
				else {
					document.getElementById(vId).innerHTML = "<tr><td colspan='8'>No Records Found.</td></tr>";
				}

				document.getElementById("DsplyUserDetailsTbl").style.display = "block";//displaying Usersdetails table
				document.getElementById("DsplyStmtDetailsTbl").style.display = "none";//hiding Statement table
			}
		};

		ajaxrequest.open("Get", (vURL ? vURL : ""), false);
		ajaxrequest.send();
	}//fnSendBECall


	//Opens new account
	function fnOpenNewAccountPage() {
		var vURL = "NewAccount.jsp";

		//displaying new account form
		document.getElementById("tile-body-action-info").innerHTML = "";
		document.getElementById("action-form").style.display = "inline-flex";

		fnSendBECall("action-form", vURL);//Add account page gets displayed in the 'action-form' div
		document.getElementById("tile").style.display = "none";//hiding details block
	}//fnOpenNewAccountPage

	function fnAddNewAccount() {

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
			document.getElementById("amount").value = "";
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
			document.getElementById("phone").value = "";
			document.getElementById("phone").focus();
			return false
		}

		//address
		if (document.getElementById("address").value == "") {
			document.getElementById("address").style.background == "#FF9999";
			alert("Please enter address.");
			document.getElementById("address").focus();
			return false;
		}
		else if (!isNaN(document.getElementById("address").value)) {
			document.getElementById("address").style.background = "#FF9999";
			alert("Please enter proper address.");
			document.getElementById("address").value = "";
			document.getElementById("address").focus();
			return false;
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
			document.getElementById("password").value = "";
			document.getElementById("password").focus();
			return false;
		}
		else if (document.getElementById("password").value != document.getElementById("repassword").value) {
			document.getElementById("password").style.background = "#FF9999";
			alert("Please check your password.");
			document.getElementById("repassword").value = "";
			document.getElementById("repassword").focus();
			return false;
		}
		else {

			var vURL = "newaccount?&username=" + document.getElementById("username").value
				+ "&address=" + document.getElementById("address").value
				+ "&amount=" + document.getElementById("amount").value
				+ "&password=" + document.getElementById("password").value
				+ "&repassword=" + document.getElementById("repassword").value
				+ "&phone=" + document.getElementById("phone").value
				+ "&DOB=" + document.getElementById('DOB').value
				+ "&gender= " + document.getElementById('female').checked;

			fnSendBECall("tile-body-action-info", vURL);
			document.getElementById("admin-service-section").style.display = "block";//showing form's block
		}
	}//fnAddNewAccount

	//opens close account page
	function fnOpenCloseAccountPage() {
		var vURL = "CloseAccount.jsp";

		document.getElementById("tile-body-action-info").innerHTML = "";
		document.getElementById("action-form").style.display = "inline-flex";

		fnSendBECall("action-form", vURL);//Deposit page gets displayed in the 'action-form' div
		document.getElementById("tile").style.display = "none";//hiding details block
	}//fnOpenCloseAccountPage

	function fnCloseAccount(vAccountNumber, vBalanceAmount) {

		if (vBalanceAmount > 0) {
			alert("Unable to close account: " + vAccountNumber + ". You have balance of " + vBalanceAmount + ". Empty your account before closing the account.");
		}
		else {
			var vURL = "closeaccount?accountnumber=" + vAccountNumber;

			fnSendBECall('', vURL);
			fnSendBECall('UserDetails', 'userdetails');
		}
	}//fnCloseAccount

	// /*
	// 			//closes account
	// 			function fnCloseAccount() {
	// 				var vURL = "closeaccount?accountnumber=" + AA + "&Date=" + date_time;

	// 				id = "tbodyResult";
	// 				fnSendBECall();
	// 				document.getElementById("CloseUpdate").style.display = "none";
	// 				document.getElementById("thtable").style.display = "block";
	// 				//document.getElementById("Tablebutton").style.display = "block";
	// 				document.getElementById("thtable").style.display = "block";
	// 				//document.getElementById("UpdateButtons").style.display = "block";
	// 				document.getElementById("Forms_Display").style.display = "block";
	// 				document.getElementById("User_Result_Display").style.display = "block";
	// 			}//fnCloseAccount

	/* 
				var arr = [];
				function edit(d, count) {
					var data = "";
					document.getElementById("User_Details_Table_Display").style.display = "block";
					var row_id = count;
					this.AA = d;
					data = "<tr>";
					for (var i = 0; i < 7; i++) {
						arr[i] = document.getElementById(row_id).getElementsByTagName("td")[i].innerHTML;
						data += "<td>" + arr[i] + "</td>";
						EditName = arr[1];
						EditAddress = arr[3];
						EditPhn = arr[4];
					}
					data += "</tr>";
					document.getElementById("Selected_Table_Result_Display_Body").innerHTML = data;
					document.getElementById("Up_But").style.display = "block";
					this.fnSendBECall();
				}
			
				function fun() {
					this.url = "sample";
					id = "tablebody";
					val = 1;
					fnSendBECall();
					document.getElementById("thtable").style.display = "block";
					document.getElementById("ADmain").style.display = "block";
					document.getElementById("UpdateButtons").style.display = "block";
					document.getElementById("CommentDisplay").style.display = "none";
					document.getElementById("Forms_Display").style.display = "none";
					document.getElementById("User_Result_Display").style.display = "none";
				}//fun
			
				//search for details from the all customer information
				function fnSearch() {
					var input, filter, S_table, tr, td, i;
					input = document.getElementById("myInput");
					filter = input.value.toUpperCase();
					S_table = document.getElementById("thtable");
					tr = S_table.getElementsByTagName("tr");
					for (i = 0; i < tr.length; i++) {
						td = tr[i].getElementsByTagName("td")[1];
						if (td) {
							if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
								tr[i].style.display = "";
							}
							else {
								tr[i].style.display = "none";
							}
						}
					}
				}//fnSearch
			
				//sort details from the all customer information
				function fnSortByName() {
					var Sort_table, sort_rows, value, i, x, y, Val;
					Sort_table = document.getElementById("tablebody");
					value = true;
					while (value) {
						value = false;
						sort_rows = Sort_table.getElementsByTagName("TR");
						for (i = 0; i < (sort_rows.length - 1); i++) {
							Val = false;
							x = sort_rows[i].getElementsByTagName("TD")[1];
							y = sort_rows[i + 1].getElementsByTagName("TD")[1];
							if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
								Val = true;
								break;
							}
						}
						if (Val) {
			
							sort_rows[i].parentNode.insertBefore(sort_rows[i + 1], sort_rows[i]);
							//alert(sort_rows[i + 1].innerHTML);
							value = true;
						}
					}
				}//fnSortByName
			
				//Changing letters into uppercase on keypress
				function Upper_Case(v) {
					var a = document.getElementById(v);
					a.value = a.value.toUpperCase();
				}//Upper_Case
			*/

	//search by name
	function fnSearchByName() {

		var vfilter = document.getElementById("search-input").value.toUpperCase();
		var vUserDetailsTbl = document.getElementById("UserDetailsTbl");
		var TRow = vUserDetailsTbl.getElementsByTagName("tr");

		for (var i = 0; i < TRow.length; i++) {

			var vTDataCell = TRow[i].getElementsByTagName("td")[1];

			if (vTDataCell) {
				if (vTDataCell.innerHTML.toUpperCase().indexOf(vfilter) > -1) {
					// document.getElementById("UserDetailsTbl").insertRow(2).innerHTML = "No records found";
				}
				else {
					TRow[i].style.display = "none";//don't show "not matching" rows
				}
			}
		}
	}//fnSearchByName

	//sort by name
	function fnSortByName() {
		var vSortNames, vRows, index, Val;
		vSortNames = document.getElementById("UserDetails");

		let value = true;

		while (value) {

			value = false;

			vRows = vSortNames.getElementsByTagName("TR");

			for (index = 0; index < (vRows.length - 1); index++) {

				Val = false;
				if (vRows[index].getElementsByTagName("TD")[1].innerHTML.toLowerCase() > vRows[index + 1].getElementsByTagName("TD")[1].innerHTML.toLowerCase()) {
					Val = true;
					break;
				}
			}
			if (Val) {

				vRows[index].parentNode.insertBefore(vRows[index + 1], vRows[index]);
				value = true;
			}
		}
	}//fnSortByName

	//Generate customer statement
	function fnOpenStatement(vID, vUserName) {

		document.getElementById("accountnumber").value = vID;
		document.getElementById("username").value = vUserName;
		document.getElementById("fromDate").value = "";
		document.getElementById("toDate").value = "";

		$("#StatementSection").dialog({
			dialogClass: "no-close",
			modal: true
		});

		document.getElementById("StatementSection").style.display = 'block';
	}//fnOpenStatement

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

			var vURL = "statement?fromDate=" + document.getElementById("fromDate").value + "&toDate=" + document.getElementById("toDate").value + "&username=" + document.getElementById("username").value + "&accountnumber=" + document.getElementById("accountnumber").value;

			//fnGenStmtSendBECall("tile-body-action-info", vURL);//display transfer details in 'tile-body-action-info'
			fnGenStmtSendBECall('StmtDetails', vURL);
			document.getElementById("action-form").style.display = "none";//Remove transfer form
			document.getElementById("DsplyUserDetailsTbl").style.display = "none";//hiding Usersdetails table
			document.getElementById("StatementSection").style.display = "none";//hiding Usersdetails table
			$("#StatementSection").dialog("destroy");
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

		var myTable = document.getElementsByTagName("table")[1];//Statement details table

		// Get each row data
		var rows = myTable.getElementsByTagName("tr");

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
		temp_link.download = document.getElementById("username").value + "_Statement.csv";
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

	//Opening Deposit dialog
	function fnOpenDeposit(vID, vUserName) {

		document.getElementById("deposit-accountnumber").value = vID;
		document.getElementById("deposit-username").value = vUserName;
		document.getElementById("deposit-amount").value = "";

		$("#DepositSection").dialog({
			dialogClass: "no-close",
			modal: true
		});

		document.getElementById("DepositSection").style.display = 'block';
	}//fnOpenDeposit

	//deposit amount
	function fnDepositAmount() {
		if (document.getElementById("deposit-amount").value == "") {
			document.getElementById("deposit-amount").style.background = "#FF9999";
			alert("Please enter amount.");
			document.getElementById("deposit-amount").value = "";
			document.getElementById("deposit-amount").focus();
			return false;
		}
		if (document.getElementById("deposit-amount").value < 100) {
			document.getElementById("deposit-amount").style.background = "#FF9999";
			alert('Please enter amount more than 100/-');
			document.getElementById("deposit-amount").value = "";
			document.getElementById("deposit-amount").focus();
			return false;
		}
		else if (isNaN(document.getElementById("deposit-amount").value)) {
			document.getElementById("deposit-amount").style.background = "#FF9999";
			alert('Please enter proper amount.');
			document.getElementById("deposit-amount").value = "";
			document.getElementById("deposit-amount").focus();
			return false;
		}
		else {

			var vURL = "depositpage?Amount=" + document.getElementById("deposit-amount").value + "&username=" + document.getElementById("deposit-username").value + "&accountnumber=" + document.getElementById("deposit-accountnumber").value;

			fnSendBECall("action-form", vURL);//Add account page gets displayed in the 'action-form' div
			document.getElementById("tile").style.display = "none";//hiding details block
			$("#DepositSection").dialog("destroy");//destroy deposit dialog section
			fnSendBECall('UserDetails', 'userdetails');//updating the customer details
		}
	}//fnDepositAmount

	//Opening Withdraw dialog
	function fnOpenWithdraw(vID, vUserName) {

		document.getElementById("withdraw-accountnumber").value = vID;
		document.getElementById("withdraw-username").value = vUserName;
		document.getElementById("withdraw-amount").value = "";

		$("#WithdrawSection").dialog({
			dialogClass: "no-close",
			modal: true
		});

		document.getElementById("WithdrawSection").style.display = 'block';
	}//fnOpenWithdraw

	//Withdraw amount
	function fnWithdrawAmount() {
		if (document.getElementById("withdraw-amount").value == "") {
			document.getElementById("withdraw-amount").style.background = "#FF9999";
			alert("Please enter amount.");
			document.getElementById("withdraw-amount").value = "";
			document.getElementById("withdraw-amount").focus();
			return false;
		}
		if (document.getElementById("withdraw-amount").value < 100) {
			document.getElementById("withdraw-amount").style.background = "#FF9999";
			alert('Please enter amount more than 100/-');
			document.getElementById("withdraw-amount").value = "";
			document.getElementById("withdraw-amount").focus();
			return false;
		}
		else if (isNaN(document.getElementById("withdraw-amount").value)) {
			document.getElementById("withdraw-amount").style.background = "#FF9999";
			alert('Please enter proper amount.');
			document.getElementById("withdraw-amount").value = "";
			document.getElementById("withdraw-amount").focus();
			return false;
		}
		else {

			var vURL = "withdrawpage?amount=" + document.getElementById("withdraw-amount").value + "&username=" + document.getElementById("withdraw-username").value + "&accountnumber=" + document.getElementById("withdraw-accountnumber").value;

			fnSendBECall("action-form", vURL);//Add account page gets displayed in the 'action-form' div
			document.getElementById("tile").style.display = "none";//hiding details block
			$("#WithdrawSection").dialog("destroy");//destroy withdraw dialog section
			fnSendBECall('UserDetails', 'userdetails');//updating the customer details
		}
	}//fnWithdrawAmount

	//Opening Edit profile dialog
	function fnOpenEditProfile(vAccountNum, vUserName, vPhone, vArea, vCity, vState, vZip, vDOB, vGender) {

		document.getElementById("cus-accountnumber").value = vAccountNum;
		document.getElementById("cus-username").value = vUserName;
		document.getElementById("cus-phone").value = vPhone;
		document.getElementById("cus-area").value = vArea;
		document.getElementById("cus-city").value = vCity;
		document.getElementById("cus-state").value = vState;
		document.getElementById("cus-zip").value = vZip;
		document.getElementById("cus-DOB").value = vDOB;

		if (vGender.trim() == "Female")
			document.getElementById("female").checked = true;
		else
			document.getElementById("male").checked = true;

		$("#EditProfileSection").dialog({
			dialogClass: "no-close",
			modal: true
		});

		document.getElementById("EditProfileSection").style.display = 'block';
	}//fnOpenEditProfile

	//Edit Profile
	function fnEditProfile() {
		//username
		if (document.getElementById("cus-username").value == "") {
			document.getElementById("cus-username").style.background == "#FF9999";
			alert("Please enter username.");
			document.getElementById("cus-username").focus();
			return false;
		}
		else if (!isNaN(document.getElementById("cus-username").value)) {
			document.getElementById("cus-username").style.background = "#FF9999";
			alert("Please enter proper username.");
			document.getElementById("cus-username").value = "";
			document.getElementById("cus-username").focus();
			return false;
		}

		//phone
		if (document.getElementById("cus-phone").value == "") {
			document.getElementById("cus-phone").style.background == "#FF9999";
			alert("Please enter phone number.");
			document.getElementById("cus-phone").focus();
			return false;
		}
		else if (document.getElementById("cus-phone").value.length < 10) {
			document.getElementById("cus-phone").style.background = "#FF9999";
			alert("Plese enter phone number with 10 digits.");
			document.getElementById("cus-phone").focus();
			return false
		}

		//area
		if (document.getElementById("cus-area").value == "") {
			document.getElementById("cus-area").style.background == "#FF9999";
			alert("Please enter area.");
			document.getElementById("cus-area").focus();
			return false;
		}
		else if (!isNaN(document.getElementById("cus-area").value)) {
			document.getElementById("cus-area").style.background = "#FF9999";
			alert("Please enter proper area.");
			document.getElementById("cus-area").value = "";
			document.getElementById("cus-area").focus();
			return false;
		}

		//city
		if (document.getElementById("cus-city").value == "") {
			document.getElementById("cus-city").style.background == "#FF9999";
			alert("Please enter city.");
			document.getElementById("cus-city").focus();
			return false;
		}
		else if (!isNaN(document.getElementById("cus-city").value)) {
			document.getElementById("cus-city").style.background = "#FF9999";
			alert("Please enter proper city.");
			document.getElementById("cus-city").value = "";
			document.getElementById("cus-city").focus();
			return false;
		}

		//state
		if (document.getElementById("cus-state").value == "") {
			document.getElementById("cus-state").style.background == "#FF9999";
			alert("Please enter state.");
			document.getElementById("cus-state").focus();
			return false;
		}
		else if (!isNaN(document.getElementById("cus-state").value)) {
			document.getElementById("cus-state").style.background = "#FF9999";
			alert("Please enter proper state.");
			document.getElementById("cus-state").value = "";
			document.getElementById("cus-state").focus();
			return false;
		}

		//zip
		if (document.getElementById("cus-zip").value == "") {
			document.getElementById("cus-zip").style.background == "#FF9999";
			alert("Please enter zip.");
			document.getElementById("cus-zip").focus();
			return false;
		}
		else if (document.getElementById("cus-zip").value.length < 6) {
			document.getElementById("cus-zip").style.background = "#FF9999";
			alert("Please enter proper zip.");
			document.getElementById("cus-zip").focus();
			return false
		}
		else {

			var vURL = "editprofile?&username=" + document.getElementById("cus-username").value
				+ "&DOB=" + document.getElementById('cus-DOB').value
				+ "&phone=" + document.getElementById("cus-phone").value
				+ "&area=" + document.getElementById('cus-area').value
				+ "&city=" + document.getElementById('cus-city').value
				+ "&state=" + document.getElementById('cus-state').value
				+ "&zip=" + document.getElementById('cus-zip').value
				+ "&accountnumber=" + document.getElementById("cus-accountnumber").value;

			fnSendBECall("action-form", vURL);//Add account page gets displayed in the 'action-form' div
			document.getElementById("tile").style.display = "none";//hiding details block
			$("#EditProfileSection").dialog("destroy");//destroy deposit dialog section
			fnSendBECall('UserDetails', 'userdetails');//updating the customer details
		}
	}//fnEditProfile

	$(document).ready(function () {
		$('#StmtDetailsTbl').DataTable({
			scrollY: 770,
			paging: false,
			autoWidth: true,
			ordering: true,
			searching: false,
			"order": [[1, "asc"]],
			"columnDefs": [
				{ "orderable": false, "targets": "_all" }
			]
		});

		$(".dataTables_info, .sorting_desc, .sorting_asc").hide();
	});

</script>

</html>