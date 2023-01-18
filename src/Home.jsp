<!DOCTYPE html>
<html lang="en">

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Plutus</title>
	<link rel="icon" type="image/x-icon" href="./images/logo.png">
	<link rel="stylesheet" href="Plutus.css" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
	<div class="db-container">
		<!--1. Navbar -->
		<%@ include file="Navbar.jsp" %>

			<!--Home Body-->
			<div class="db-body-main-content">
				<section class="service-section">
					<h2>Services</h2>
					<div class="tiles">
						<article class="tile">
							<div class="tile-header">
								<h3>Grow your Investment</h3>
							</div>
							<div class="tile-body">
								<div class="tile-body-action">
									<span class="tile-body-action-icon">
										<img src="./images/fixed-deposit.png" />
									</span>
									Fixed Deposit
								</div>
								<div class="tile-body-action">
									<span class="tile-body-action-icon">
										<img src="./images/mutual-funds.png" />
									</span>
									Mutual Funds
								</div>
								<div class="tile-body-action">
									<span class="tile-body-action-icon">
										<img src="./images/stocks.png" />
									</span>
									Invest in Stocks
								</div>
							</div>
						</article>
					</div>
				</section>

				<section class="service-section">
					<h2>Offers for you</h2>
					<div class="tiles">
						<article class="tile">
							<div class="tile-header">
								<h3>Offers for you</h3>
							</div>
							<div class="tile-body">
								<div class="tile-body-action">
									<span class="tile-body-action-icon">
										<img src="./images/homeloan.png" />
									</span>
									Start your home journey
								</div>
								<div class="tile-body-action">
									<span class="tile-body-action-icon">
										<img src="./images/loan.png" />
									</span>
									Multi-purpose
								</div>
								<div class="tile-body-action">
									<span class="tile-body-action-icon">
										<img src="./images/credit-card.png" />
									</span>
									Get Credit Card
								</div>
							</div>
						</article>
					</div>
				</section>

				<!--2. Latest transfers
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
				</section>-->
			</div>

			<!--2. Footer-->
			<%@ include file="Footer.jsp" %>
	</div>
</body>

</html>