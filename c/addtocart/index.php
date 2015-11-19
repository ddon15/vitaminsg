<?php
	$pid = $_GET['p'];
	
	$qty = $_GET['q'];
	if (!$qty) { $qty = 1; }
	
	$coupon = $_GET['c'];
	
	$utm_source = $_GET['utm_source'];
	$utm_medium = $_GET['utm_medium'];
	$utm_campaign = $_GET['utm_campaign'];
?>

<!DOCTYPE html>
<html>

<head>
	
	<meta charset="utf-8" />
	<title>Add To Cart</title>
			
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script>
		var cart_address = "http://www.vitamin.sg/index.php?route=checkout/cart";
		var product_id = <?php echo $pid ?>;
		var quantity = <?php echo $qty; ?>;
		var coupon = "<?php echo $coupon ?>";
		var utm_source = "<?php echo $utm_source ?>";
		var utm_medium = "<?php echo $utm_medium ?>";
		var utm_campaign = "<?php echo $utm_campaign ?>";
		
		var ga_tag = "";
		if (utm_source != "") {
			ga_tag = "&utm_source=" + utm_source + "&utm_medium=" + utm_medium + "&utm_campaign=" + utm_campaign;
		}
		 
		
		$(document).ready(function () {
			
			setTimeout(function(){ 
				$.ajax({
					//add to cart
					type: "POST",
					url: cart_address + "/add",
					data: {
						product_id: product_id,
						quantity: quantity
					},
					success: function () {
						if (coupon != "") {
							$.ajax({
								//apply coupon code
								type: "POST",
								url: cart_address,
								data: {
									coupon: coupon,
									next: "coupon"
								},
								success: function () {
									window.location = cart_address + ga_tag;						
								}
							});//ajax							
						}
						else {
							window.location = cart_address + ga_tag;
						}
					}//success
				});//ajax				
			}, 1000);
			
		});
	</script>
</head>

<body>

<!DOCTYPE html>
<html>
	
	<p style="text-align: center; margin-top: 200px; font-family: Arial;">
		<img src="ajax-loader.gif" alt="Loading" /><br /><br />
		Redirecting...
	</p>
	
</html>