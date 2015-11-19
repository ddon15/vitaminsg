<?php include "processform.php"; ?>
<!DOCTYPE html>
<html>

<head>
	
	<meta charset="utf-8" />
	<title>October Warehouse Sale</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/ui-lightness/jquery-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
		
	<!-- JS: JQuery, JQueryUI, ChromeFrame, Modernizr, Prefix Free -->	
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.min.js"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
	<script type="text/javascript" src="scripts.js"></script>
	
	<!-- IE Conditional Comments -->
	<!--[if lt IE 10]>
		<link rel="stylesheet" type="text/css" href="ie/ie9.css" media="screen" />
		<script type="text/javascript" src="ie/ie9.js"></script>
	<![endif]-->

	
</head>

<body>

	<div id="container">
		<div class="clearfix">
			<div class="left">
				<div class="s1">
					<div class="lhead">
						<div class="r1"><span>3 Days Only</span> Warehouse</div>
						<div class="r2">Sale</div>
						<div class="r3">Branded Health, Beauty and Personal Care Products</div>
						<div class="r4">23 to 25 Oct, 11am to 7pm</div>
					</div>
							
					<div id="cart"><a href="http://www.vitamin.sg"><img src="images/cart.png" alt="cart"/></a></div>
					<div id="visitus">Visit at us 59 Jalan Pemimpin, #02-02 L&Y Building</div>
				</div>
				<div class="s2">
					<div id="memberspecials"><span>Vitamin.sg</span><br />Member specials</div>
					<div id="specials" class="clearfix">
						<div>$10 OFF + 500 VIT$<br /><span>For every $300* spend</span></div>
						<div>$15 OFF + 1000 VIT$<br /><span>For every $400* spend</span></div>
						<div>$25 OFF + 1500 VIT$<br /><span>For every $500* spend</span></div>
					</div>
					<div id="singletxn">*in a single transaction</div>
				</div>
				<div class="s3">
					<div id="publicspecials">Public specials - Spend and Redeem</div>
					<div id="pspecials" class="clearfix">
						<div>
							<img src="images/pspecial1.png" alt="Tea Tree Therapy Pack" />
							Sign up for 1-year Vitamin.sg membership at $35* and Receive a Tea Tree Therapy Pack.<br /><br />
							<span>*Get an additional 1-year FREE</span>
						</div>
						<div>
							<img src="images/pspecial2.png" alt="Wellness Pack" />
							Spend $150 Nett in a single receipt and redeem a $10 voucher + Wellness Pack
						</div>
					</div>
				</div>
			</div>
			<div class="right">
				<div class="rhead">
					<div class="r1"><span>3 Days Only</span> Warehouse</div>
					<div class="r2">Sale</div>
					<div class="r3">Branded Health, Beauty and Personal Care Products</div>
					<div class="r4">23 to 25 Oct, 11am to 7pm</div>
				</div>
				<form method="post">
					<div id="form1">Register for your FREE GIFTS*!</div>
					<div id="form2">Fill in this form to receive a code. This code allows you to redeem a $10 Vitamin.sg discount voucher + Wellness Pack (worth $50) when you spend $150 at our Warehouse Sale from 23 to 25 Oct.<br /><br />*First come, first serve basis</div>
					<input type="text" name="firstname" id="firstname" placeholder="First Name" value="<?php echo $formdata['ffname']; ?>">
					<input type="text" name="lastname" id="lastname" placeholder="Last Name" value="<?php echo $formdata['flname']; ?>">
					<input type="text" name="dob" id="dob" placeholder="Date of Birth (dd/mm/yyyy)" value="<?php echo $formdata['fdob']; ?>">
					<input type="text" name="emailaddr" id="emailaddr" placeholder="Email Address" value="<?php echo $formdata['femail']; ?>">
					<input type="text" name="mobileno" id="mobileno" placeholder="Mobile Number" value="<?php echo $formdata['fmobile']; ?>">
					<div id="tnc">
						<p><strong>Please read the terms and conditions carefully. By submitting your details, you agree to be bound by these terms and conditions.</strong></p>
						<ul>
							<li>Special code to redeem your freebies will be sent to the registered email address. For more details, please check your email.</li>
							<li>Quote the special code to redeem your FREE $10 discount voucher + Abbott Wellness pack for a minimum single-receipt purchase of $150 at Vitamin.sg Warehouse Sale from 23 to 25 Oct 2014 at 59 Jalan Pemimpin, #02-02 L&Y Building. Limited to 1st 100 participants.</li>
							<li>$10 discount voucher is valid for use upon next purchase at www.vitamin.sg and expires on 30 Nov 2014.</li>
							<li>Unclaimed freebies will not be available after 25 Oct 2014.</li>
							<li>You will receive marketing information via email and SMS from Vitamin.sg. This information will include new products, promotions, contests and health articles/tips. If you change your mind at any time and wish to un-subscribe, you may do so easily via the un-subscribe link found on each email and SMS.</li>
						</ul>
					</div>
					<div id="agreetnc">
						<label><input type="checkbox" name="agree" id="agree" /> I have read and agree to the <strong>terms and conditions</strong></label>
					</div>
					<input type="submit" id="submitform" value="REGISTER" />
					<input type="hidden" name="frm_submitted" value="1" />
				</form>
				
			</div>
		</div>
		<div id="featuredbrands">			
			<div id="bhead">Featured Brands:</div>
			<div id="blogo">
				<img src="images/brands1.png" alt="brands1" />
				<img src="images/brands2.png" alt="brands2" />
				<img src="images/brands3.png" alt="brands3" />
				<img src="images/brands4.png" alt="brands4" />
			</div>
		</div>
		
	</div><!-- container -->
	<?php if ($errors): ?>
		<script>
			alert("<?php echo $errors; ?>");
		</script>	
	<?php endif; ?>

</body>

</html>