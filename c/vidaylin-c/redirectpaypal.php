<?php 
	
	include('functions.php');
	
	$rhash = $_GET['r']; 
	$referral = get_referral_by_rhash($rhash);
	if (!$referral) {
		
		echo "Invalid Referral ID";
		exit;
		
		//invalid $rhash
	}
?>
<!doctype html>
<html>

<head>
	
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Redirect</title>

   	<?php //CDN scripts last checked - 21 May 2014 ?>

	<!-- CSS -->
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" />
	<link rel="stylesheet" href="lib/sweet-alert.css" />
	<link rel="stylesheet" href="style.css" />
		
	<!-- Javascript -->	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
	<script>
		$(function () {
			$('#paypalsubmitbutton').click();
			$('#thelink').click(function () { $('#paypalsubmitbutton').click(); });	
		});			
	</script>

	
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
	<script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->

	
</head>

<body>

	<div id="content-wrapper">
		<div class="container">
			
			
			<div id="content" class="row">	
				<div class="col-sm-12">
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<p><strong>Redirecting to Paypal</strong></p>
					<p><a id="thelink" href="#">Click here if you are not redirected in 10 seconds</a></p>
					
					<form action="https://www.paypal.com/cgi-bin/webscr" method="post" style="display: none;">
						<input type="hidden" name="custom" 				value="<?php echo $referral['hash'] ?>">
						<input type="hidden" name="cmd" 				value="_xclick">
						<input type="hidden" name="business" 			value="paypal@sainhall.com"> 
						<input type="hidden" name="lc" 					value="SG">
						<input type="hidden" name="item_name" 			value="Vidaylin Minibear Gummies with Garden Vegetables + 9 Vitamins, 60 Gummies">
						<input type="hidden" name="amount" 				value="5">
						<input type="hidden" name="currency_code" 		value="SGD">
						<input type="hidden" name="button_subtype" 		value="services">
						<input type="hidden" name="no_note" 			value="1">
						<input type="hidden" name="no_shipping" 		value="1">
						<input type="hidden" name="rm" 					value="1">
						<input type="hidden" name="return" 				value="http://www.vitamin.sg/c/vidaylin-c/thankyou.php">
						<input type="hidden" name="cancel_return" 		value="http://www.vitamin.sg/c/vidaylin-c/friend.php?r=<?php echo $referral['hash'] ?>">
						<input type="hidden" name="notify_url" 			value="http://www.vitamin.sg/c/vidaylin-c/ipn.php">
						<input type="hidden" name="bn" 					value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted">
						<input type="hidden" name="address_override" 	value="1">
						<input type="submit" border="0" id="paypalsubmitbutton" name="submit" alt="PayPal Ñ The safer, easier way to pay online.">
						<img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1">
					</form>

					
				</div><!-- /#maincontent -->

			</div><!-- /#content -->
		</div><!-- /.container -->
	</div><!-- /#content-wrapper -->
	

	<div id="footer-wrapper">
		<div class="container">
			<footer id="footer" class="row">
				
				<div class="col-sm-12 text-center">
					Copyright &copy; 2015 Sainhall Nutrihealth Pte Ltd
				</div>
				
			</footer><!-- /#footer -->
		</div><!-- /.container -->
	</div><!-- /#footer-wrapper -->

</body>

</html>