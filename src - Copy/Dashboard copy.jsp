<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<title>Plutus</title>
	<link rel="icon" type="image/x-icon" href="./images/logo-icon.jpg">
	<link rel="stylesheet" href="ApnaBank.css" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
	<div class="db-container">

		<!--1. Navbar -->
		<%@ include file="Navbar.jsp" %>

			<!--Dashboard Body-->
			<!--1. Services-->
			<div class="db-body-main-content">
				<section class="service-section">
					<h2>Services</h2>
					<div class="tiles">
						<article class="tile">
							<div class="tile-header">
								<h3>
									<span>Electricity</span>
									<span>UrkEnergo LTD.</span>
								</h3>
							</div>
							<a href="#">
								<span>Go to service</span>
								<span class="icon-button">
									&nbsp;<i class="fa fa-arrow-right"></i>
								</span>
							</a>
						</article>
						<article class="tile">
							<div class="tile-header">
								<h3>
									<span>Heating Gas</span>
									<span>Gazprom UA</span>
								</h3>
							</div>
							<a href="#">
								<span>Go to service</span>
								<span class="icon-button">
									&nbsp;<i class="fa fa-arrow-right"></i>
								</span>
							</a>
						</article>
						<article class="tile">
							<div class="tile-header">
								<h3>
									<span>Tax online</span>
									<span>Kharkov 62 str.</span>
								</h3>
							</div>
							<a href="#">
								<span>Go to service</span>
								<span class="icon-button">
									&nbsp;<i class="fa fa-arrow-right"></i>
								</span>
							</a>
						</article>
					</div>
				</section>

				<!-- 2. Latest transfers
				<section class="transfer-section">
					<div class="transfer-section-header">
						<h2>Latest transfers</h2>
					</div>
					<div class="transfers">
						<div class="transfer">
							<div class="transfer-logo">
								<img src="https://assets.codepen.io/285131/apple.svg" />
							</div>
							<dl class="transfer-details">
								<div>
									<dt>Apple Inc.</dt>
									<dd>Apple ID Payment</dd>
								</div>
								<div>
									<dt>28 Oct. 21</dt>
									<dd>Date payment</dd>
								</div>
							</dl>
							<div class="transfer-number">
								<i class="fa fa-rupee"></i>550
							</div>
						</div>
						<div class="transfer">
							<div class="transfer-logo">
								<img src="https://assets.codepen.io/285131/pinterest.svg" />
							</div>
							<dl class="transfer-details">
								<div>
									<dt>Pinterest</dt>
									<dd>2 year subscription</dd>
								</div>
								<div>
									<dt>26 Oct. 21</dt>
									<dd>Date payment</dd>
								</div>
							</dl>
							<div class="transfer-number">
								<i class="fa fa-rupee"></i> 120
							</div>
						</div>
						<div class="transfer">
							<div class="transfer-logo">
								<img src="https://assets.codepen.io/285131/warner-bros.svg" />
							</div>
							<dl class="transfer-details">
								<div>
									<dt>Book My Show</dt>
									<dd>Cinema</dd>
								</div>
								<div>
									<dt>01 Nov. 21</dt>
									<dd>Date payment</dd>
								</div>
							</dl>
							<div class="transfer-number">
								<i class="fa fa-rupee"></i> 250
							</div>
						</div>
					</div>
				</section> -->
			</div>

			<!--2. Footer-->
			<%@ include file="Footer.jsp" %>
	</div>

	<!-- 	
	<div id="DisplayPageBorder">
		<div id="DisplayPage" style="width:100%;display:inline-flex;">
			<div id="heading" align="left">
				<br>APANA-BANK
			</div>
			<div id="ADL" align="right" style="width:100%;display:inline-flex;">
				<div id='Admin_Icon'>
					<br><br><a href="AdminLogin.jsp"> <img src='images/icons8-Admin-50.png' /></a><br>Admin Login
				</div>
				&nbsp;&nbsp;&nbsp;
				<div id='UserLog_Icon'>
					<br><br><a href="Login.jsp"> <img src='images/icons8-People-50.png' /></a><br>User Login
				</div>
				&nbsp;&nbsp;
				<div id='About_us'>
					<%@ include file="Headings_Home.jsp" %><br><a href="About.jsp"><u>ABOUT US</u></a>
				</div>
			</div>
		</div>
		<div id='wel' style="width:100%;display:inline-flex;">
			<!<img class = "myslides" src="images/HomeP_1.jpg" align ='center' style = "width:80%;">
							<img class = "myslides" src="images/HomeP_4.jpg" align ='center' style = "width:80%;">
							<img class = "myslides" src="images/HomeP_5.jpg" align ='center' style = "width:80%;">>
			<div id="DisplayPageImg" style="display:inline-block; width:100%;">
				<img id="myPic" src="images/bibank.jpg" align='left' style="width:90%;">
			</div>
			<div id='Wel_Text' align='center'>
				<br><br>
				<h1>WELCOME </h1>
				<p>TO</p>
				<h1>APANA BANK</h1>
			</div>
		</div>
	</div> -->
</body>
<script>
	/*var index = 0;
	image();
	function image()
	{
		var x = document.getElementsByClassName("myslides");
		for(var i =0;i<x.length;i++)
		{
			x[i].style.display = 'none';
			
		}
		index++;
		if(index>x.length)
		{
			index =1;
		}
		x[index-1].style.display = 'block';
		setTimeout(image,2000);	
	}	*/


	// Get the modal
	// var modal = document.getElementById('user-signup');

	// // When the user clicks anywhere outside of the modal, close it
	// window.onclick = function (event) {
	// 	if (event.target == modal) {
	// 		modal.style.display = "none";
	// 	}
	// }
	// //signup
	// function fnSignup() {
	// 	document.getElementById("user-signup").style.display = "block";
	// }
</script>

</html>