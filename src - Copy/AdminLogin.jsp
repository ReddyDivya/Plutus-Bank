<html>

<head>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<title>Plutus</title>
	<link rel="icon" type="image/x-icon" href="./images/logo.png">
	<link rel="stylesheet" href="Plutus.css" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
	<div class="db-container">
		<!--1. Navbar -->
		<%@ include file="Navbar.jsp" %>

			<div class="db-body-main-content">
				<!--2. Admin Login-->
				<div class="card" id="admin-login">
					<div class="card-image">
						<img src="./images/logo.png" />
						<h2 class="card-heading">
							LOGIN
						</h2>
					</div>
					<form class="card-form" action="AdminLogin" method="GET">
						<div class="input">
							<label class="input-label">Full Name</label>
							<input type="text" id="adminfullname" name="adminname" class="input-field" value="admin"
								required />
						</div>
						<div class="input">
							<label class="input-label">Password</label>
							<input type="password" id="adminpassword" name="adminpassword" class="input-field"
								value="admin" required />
						</div>
						<div id="LoginMsg" style="display:none"></div>
						<br />
						<div class="action">
							<button type="submit" class="action-button">LOGIN</button>
						</div>
					</form>
					<div class="card-info">
						<p> --------------------- Or ----------------------</p>
						<a href="UserLogin.jsp" class="button">User Login</a>
					</div>
				</div>
			</div>

			<!--2. Footer-->
			<%@ include file="Footer.jsp" %>
	</div>
</body>

</html>