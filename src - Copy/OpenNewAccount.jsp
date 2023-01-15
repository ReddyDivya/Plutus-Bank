<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Plutus</title>
	<link rel="icon" type="image/x-icon" href="./images/logo.png">
	<link rel="stylesheet" href="Plutus.css" type="text/css">
</head>

<body>
	<div class="db-container">
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
						<label class="input-label">Full Name</label>
						<input type="text" id="fullname" name="fullname" class="input-field" value="Divya" required />
					</div>
					<div class="input">
						<label class="input-label">Password</label>
						<input type="password" name="password" id="password" class="input-field" value="divya123"
							required />
					</div>
					<div class="input">
						<label class="input-label">Confirm Password</label>
						<input type="password" name="repassword" id="repassword" class="input-field" value="divya123"
							required />
					</div>
					<div class="input">
						<label class="input-label">DOB</label>
						<input type="password" name="dob" id="dob" class="input-field" value="divya123" required />
					</div>
					<div class="input">
						<label class="input-label">Gender</label>
						<input type="radio" class="input-field" name="gender" value="female" id='female' required checked>Female</input>
						<input type="radio" class="input-field" name="gender" value="male" id='male' required>Male</input>
					</div>
					
					<div class="action">
						<button type="button" class="action-button" onClick="fnUserLogin()">LOGIN</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

</html>

<div id="NewAccount" align="center">
	<h1>ADD ACCOUNT</h1>
	<TABLE align="center">
		<form name="form1">
			<tr>
				<td><span id="Manditory_Fields">*</span><b>USER NAME</b></td>
				<td> <input type="text" placeholder=" Name" spellcheck="true" name="tname" id="tname1"
						onblur="Upper_Case(this.id)" required /></td>
			</tr>
			<tr>
				<td><span id="Manditory_Fields">*</span><b>PASSWORD</b></td>
				<td><input type="password" placeholder=" Password" name="tpwd1" id="tpwd" maxlength="10" /></td>
			</tr>
			<tr>
				<td><span id="Manditory_Fields">*</span><b>CONFIRM PASSWORD</b></td>
				<td><input type="password" placeholder="Comfirm Password" name="tpwd2" id="rtpwd" maxlength="10" /></td>
			</tr>
			<tr>
				<td><span id="Manditory_Fields">*</span><b>DOB</b></td>
				<td><input type="date" placeholder="Date Of Birth" name="dob" id="dob" required onkeypress='bd(dob1)' />
				</td>
			</tr>
			<tr>
				<td><span id="Manditory_Fields">*</span><b>GENDER</b></td>
				<td><input type="radio" name="gen" value="female" id='female' required checked>FEMALE</input></td>
				<td><input type="radio" name="gen" value="male" id='male' required>MALE</input></td>
			</tr>
			<tr>
				<td><span id="Manditory_Fields">*</span><b>AMOUNT </b></td>
				<td><input type="text" placeholder=" Amount" name="tamt" id="tamt1" /></td>
			</tr>
			<tr>
				<td><span id="Manditory_Fields">*</span><b>ADDRESS </b></td>
				<td><input type="text" placeholder=" Address" name="taddr" id="taddr1"
						onkeypress="Upper_Case(this.id)" /></td>
			</tr>
			<tr>
				<td><span id="Manditory_Fields">*</span><b>PHONE </b></td>
				<td><input type="text" placeholder=" Mobile number" name="tphn" id="tphn1" maxlength="10" required />
				</td>
			</tr>
		</form>
	</table>
	<input type="submit" value="Add Account" onClick="fnAddNewAccount()" />
</div>