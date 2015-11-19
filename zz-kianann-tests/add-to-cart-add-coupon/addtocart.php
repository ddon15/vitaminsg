<!DOCTYPE html>
<html>

<head>
	
	<meta charset="utf-8" />
	<title>Add To Cart</title>
			
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script>
		var cart_address = "http://www.vitamin.sg/index.php?route=checkout/cart";
		var product_id = 1510; //vidaylin minibear gummies
		var quantity = 1;
		var coupon = "15AVGCS1";
		var utm_source = "landingpage";
		var utm_medium = "banner";
		var utm_campaign = "vidaylin";
		
		$(document).ready(function () {
			$(".addtocart").on("click", function () {
				$.ajax({
					//add to cart
					type: "POST",
					url: cart_address + "/add",
					data: {
						product_id: product_id,
						quantity: quantity
					},
					success: function () {
						$.ajax({
							//apply coupon code
							type: "POST",
							url: cart_address,
							data: {
								coupon: coupon,
								next: "coupon"
							},
							success: function () {
								window.location = cart_address + "&utm_source=" + utm_source + "&utm_medium=" + utm_medium + "&utm_campaign=" + utm_campaign;
							}
						});//ajax
					}//success
				});//ajax
			});//onclick
		});
	</script>

	<style>
		#addtocart {
			text-align: center;
			cursor: pointer;
		}
	</style>
	
</head>

<body>

<!DOCTYPE html>
<html>

	
	<div id="addtocart">
		<img src="paypal-addtocart.png" class="addtocart" alt="Add To Cart" />
	</div>	

</html>