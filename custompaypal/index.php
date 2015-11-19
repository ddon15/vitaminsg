<!DOCTYPE html>
<html>

<head>
	
	<meta charset="utf-8" />
	<title>Vitamin.sg Custom Paypal Payment Page</title>
	
	<link type="text/css" rel="stylesheet" href="style.css" media="screen" />
	
	<!-- JS: JQuery, JQueryUI, ChromeFrame, Modernizr, Prefix Free -->	
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/chrome-frame/1.0.2/CFInstall.min.js"></script>
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/prefixfree.js"></script>
	
	<!-- IE Conditional Comments -->
	<!--[if lt IE 10]>
		<script type="text/javascript" src="ie/ie9.css"></script>
	<![endif]-->
	
	
	<style>
		body { background-color: #eee; }
		#container { width: 600px; margin: 0 auto; background-color: #fff; padding: 10px; font-family: Arial; }
		h1 { font-size: 22px; }
	</style>
	
</head>

<body>

	<div id="container">
	
		<h1>Vitamin.sg Custom Paypal Payment Page</h1>
		
		<div id="content">
			
			<?php if ($_GET['id'] && $_GET['amt']):  ?>
			
			<div>
				<p>Order Number: #<?php echo $_GET['id']; ?></p>
				<p>Amount: <?php echo $_GET['amt']; ?></p>
				
			</div>
			
			<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
			<input type="hidden" name="cmd" value="_xclick">
			<input type="hidden" name="business" value="paypal@sainhall.com">
			<input type="hidden" name="lc" value="SG">
			<input type="hidden" name="item_name" value="Vitamin.sg Order #<?php echo $_GET['id']; ?>">
			<input type="hidden" name="amount" value="<?php echo $_GET['amt']; ?>">
			<input type="hidden" name="currency_code" value="SGD">
			<input type="hidden" name="button_subtype" value="services">
			<input type="hidden" name="no_note" value="0">
			<input type="hidden" name="cn" value="Add special instructions to the seller:">
			<input type="hidden" name="no_shipping" value="2">
			<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted">
			<input type="image" src="https://www.paypalobjects.com/en_GB/SG/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal – The safer, easier way to pay online.">
			<img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1">
			</form>
			
			<?php else: ?>
			
			<form method="GET">
				Order Number: <input type="text" name="id" value=""/><br />
				Amount: <input type="text" name="amt" value=""/><br />
				<input type="submit"/>
			</form>
			
			<?php endif; ?>
			
		</div>

		
	</div><!-- container -->

</body>

</html>