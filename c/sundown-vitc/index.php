<!doctype html>
<html>

<head>
	
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Get Your Free Bottle of Vitamin C!</title>

   	<?php //CDN scripts last checked - 21 May 2014 ?>

	<!-- CSS -->
	<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/ui-lightness/jquery-ui.min.css" />
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" />
	<link rel="stylesheet" href="lib/sweet-alert.css" />
	<link rel="stylesheet" href="style.css" />
		
	<!-- Javascript -->	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
	<script src="lib/sweet-alert.js"></script>
	<script src="scripts.js"></script>
	<script>
		
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	
	  ga('create', 'UA-49443372-1', 'auto');
	  ga('send', 'pageview');
	
	</script>	
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->

	
</head>

<body>

	<div id="header-wrapper">
		<div class="container">
			<div id="header" class="row">
				<div class="col-md-10 col-md-offset-1 col-sm-12">
					<h1>Boost Your Immunity with a Free Bottle of All-Natural Vitamin C!</h1>
				</div>
			</div>
		</div><!-- /.container -->
	</div><!-- /#header-wrapper -->

	<div id="content-wrapper">
		<div class="container">
			<div id="content" class="row">
				<div id="leftcontent" class="col-md-8 clearfix">
					
					<img src="img/sundown-vit-c.jpg" alt="Sundown Vitamin C" id="product-img" class="img-responsive" />
					
					<h2>2015 is here, and we know the new year has LOTS in store for you.</h2>
					
					<p>To accomplish all your new year resolutions and lofty goals, you need to stay healthy!
						That's why we'd like to help give you a boost!  </p>

					<p>For a limited time only, get a FREE Spirulina Green Tea sample pack and 50% off voucher! 
						<strong>Kona Green Spirulina Green Tea</strong> is a delicious blend of the Hawaiian grown 
						spirulina with organic green tea.  Enjoy this exciting blend of East and West, full with 
						awesome health benefits!</p>
													
					<p>Get Your FREE Kona Green Spirulina Green Tea Sample and 50% Off Voucher! Simply fill in the form on the right to claim your sample - while stocks last.</p>
					
				</div><!-- col-md-8 -->
				<div class='col-md-4 col-md-offset-0 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1'>
					
					<form role="form" id='theform' method="POST">
						<div class='header'>
							<p>Simply complete the form below to</p>
							<h3>Get Your FREE Sample</h3>
						</div>
						<div class='controls'>
							<div class="form-group">
								<label for="fname" class="control-label">Full Name</label>
								<div><input type="text" class="form-control" id="fname" name="fname" required="required"></div>
							</div>
							<div class="form-group">
								<label for="emailaddr" class="control-label">Email Address</label>
								<div><input type="text" class="form-control" id="emailaddr" name="emailaddr" required="required"></div>
							</div>
							<div class="form-group">
								<label for="mobile" class="control-label">Mobile No</label>
								<div><input type="text" class="form-control" id="mobile" name="mobile" required="required"></div>
							</div>
							<div class="form-group">
								<label for="mobile" class="control-label">Mailing Address</label>
								<div><textarea class="form-control" id="address" name="address" required="required" data-toggle="tooltip" data-placement="left" title="Singapore Addresses Only"></textarea></div>
							</div>
							<div class="form-group">
								<?php 
									$utm_source = $_GET['utm_source'];
									$utm_campaign = $_GET['utm_campaign'];
									$utm_medium = $_GET['utm_medium'];
									if (!$utm_source) {
										$utm_source = "(not specified)";
									}
									if (!$utm_campaign) {
										$utm_campaign = "(not specified)";
									}
									if (!$utm_medium) {
										$utm_medium = "(not specified)";
									}
								?>
								<input type="hidden" name="utm_source" id="utm_source" value="<?php echo $utm_source ?>" />
								<input type="hidden" name="utm_campaign" id="utm_campaign" value="<?php echo $utm_campaign ?>" />
								<input type="hidden" name="utm_medium" id="utm_medium" value="<?php echo $utm_medium ?>" />
								<input type="checkbox" id="tnc" name="tnc" value="agree" required="required">&nbsp;&nbsp;&nbsp;I agree to the <a href="#" class='tncswal'>Terms and Conditions</a>
							</div>
						</div>
						<div class='cta'>
							<button id="addtosendy" type="submit" class="btn btn-lg btn-primary">Send me my FREE Sample &raquo;</button>
						</div>
					</form>
				</div><!-- col-md-4 -->

		</div><!-- /.container -->
	</div><!-- /#content-wrapper -->
	

	<div id="footer-wrapper">
		<div class="container">
			<footer id="footer" class="row">
				<div class="col-sm-12 text-center">
					Copyright &copy; 2014 Sainhall Nutrihealth Pte Ltd
				</div>
			</footer><!-- /#footer -->
		</div><!-- /.container -->
	</div><!-- /#footer-wrapper -->

	<div class='tncwrap hidden'>
		<div class='tnc'>
		<ul>
			<li>This is open to participants residing in Singapore only.</li>
			<li>Limited to one sample per person.</li>
			<li>Free sample is not exchangeable for cash and/or other products.</li>
			<li>Sainhall Nutrihealth Pte Ltd reserves the right to replace the free sample with another item of similar value without prior notice.</li>
			<li>This giveaway is available only in Singapore and may be withdrawn at anytime at the company's discretion.</li>
			<li>The 50% off voucher will be applicable only to the retail price for Kona Green Spirulina Green Tea, on Vitamin.sg online store.</li>
			<li>By participating in this giveaway, you agree to receive future promotional / marketing information via email from Sainhall Nutrihealth Pte Ltd.</li>
		</ul>
		</div>
	</div>	


</body>

</html>