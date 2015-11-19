<?php
	// if (date("Y-m-d") > '2015-02-09') {
	//	header("Location: http://www.vitamin.sg/c/offer-ended");
	//	exit;
	// }
	
	include('functions.php');
	
	$status = ""; 
	
	$rhash = $_GET['r']; 
	$referral = get_referral_by_rhash($rhash);
	
	if (!$referral) {
		
		echo "Invalid Referral ID";
		exit;
		
		//invalid $rhash
	}
	else {
		
		$member = get_member_by_id($referral['memberid']);		
		
		if ($_POST['frm_submitted'] == "1") {
					
			//retrieve
			$referral['hash'] = $rhash;
			$referral['name'] = $_POST['mname'];
			$referral['email'] = $_POST['memail'];
			$referral['mobile'] = $_POST['mmobile'];
			$referral['address'] = $_POST['maddress'];
			
			//validate
			$errors = array();
			if ($referral['name'] == "") {
				$errors[] = "Please enter your name";
			}
			if (!filter_var($referral['email'], FILTER_VALIDATE_EMAIL)) {
				$errors[] = "Please enter a valid email address";
			}
			if ($referral['mobile'] == "") {
				$errors[] = "Please enter your mobile number";
			}
			if ($referral['address'] == "") {
				$errors[] = "Please enter your address";
			}
			if ($referral['dateclaimed'] != "0000-00-00 00:00:00") {
				$errors[] = "You can only purchase once";
			}
							
			//process
			if (sizeof($errors)) {
				//errors - show error message
				
				$status = "<div class='errors'><ul><li>" . implode("</li><li>", $errors). "</li></ul></div>";
				
			}
			else {
				//no errors
				
				add_referral_claim($referral);
				header("Location: redirectpaypal.php?r=" . $rhash);
				exit;
								
			}//sizeof errors
			
		}//frm_submitted

		
	} //if (referral)
	
?>
<!doctype html>
<html>

<head>
	
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Purchase Vidaylin Minibear Gummies for Just S$5!</title>

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
					
					<form role="form" method="POST">



						<div class="row">
							<div class='col-sm-12'>
								<?php echo $status;  ?>
								
								<img src="logo.png" id="logo" class="img-responsive" />
								<h1>Help <?php echo $member['name']; ?> get Vidaylin Minibear Gummies for free, and get it for yourself for just S$5! </h1>
								<p>Here's how:</p>
								
								<p style="font-size: 1.2em;"><strong>1.	Accept <?php echo $member['name']; ?>'s invitation</strong></p>
								<p>Keep your children healthy by trying your friend's recommendation of Vidaylin Minibear Gummies!</p>
								<p style="font-size: 1.2em;"><strong>2.	Get Vidaylin Minibear Gummies for just S$5 (U.P. S$23.80) </strong></p>
								<p>Because of your friend's invitation, you can get Vidaylin Minibear Gummies from Vitamin.sg for <span style='text-decoration:underline'>just S$5.</span> This is a whopping 79% discount! Delivery is free!</p>
								<div class="aboutvidaylin clearfix">
									<img id="heroimg" src="vidaylin.png" class="pull-right" />
									<p><strong>More about Abbott's Vidaylin Minibear Gummies...</strong></p>
									<p>Vidaylin Minibear Gummies offers your children a delicious alternative: berry-flavoured chewable gummies! It is neither awful tasting nor a giant pill. </p>
									<p>It only takes one gummy to nourish your children with the nutrients of 5 garden vegetables and 9 vitamins that are essential for their growth and development.</p>
									<p>Your children will be chewing on the goodness of tomato, spinach, carrot, beetroot and artichoke. They will also benefit from a dose of <em>Vitamin A, Vitamin D3, Vitamin E, Vitamin C, Vitamin B6, Vitamin B12, Niacin, Biotin and Folic Acid. </em></p>
									<p>Keep your children healthy today with Vidaylin Minibear Gummies!</p>
									<p style="font-style: italic; font-weight: bold; font-size: 1.2em; margin-top: 30px; margin-bottom: 30px; color: #777;">
										With Vidaylin Minibear Gummies, it is a win-win-win situation for you.<br />
										Because you, your friends, and your children benefit!<br />
										Who doesn't know that when children are happy and healthy, so are their parents!</p>	
								</div>
								
								
								<p style="font-size: 1.2em;"><strong>3.	You and your friend are rewarded!</strong></p>
								<p>Now that you have purchased Vidaylin Minibear Gummies, <?php echo $member['name']; ?> gets a bottle for FREE! Both you and <?php echo $member['name']; ?> also get to enjoy these benefits:</p>
								<ul>
									<li style="list-style: none;">i)	A free 1 year Vitamin.sg membership (worth S$35); and</li>
									<li style="list-style: none;">ii)	A Buy 1 Free 1 coupon for your next purchase of Vidaylin Minibear Gummies.</li>
								</ul>					
								<p><strong>HURRY! This offer ends on 8 March 2015!</strong></p>
							</div>
						</div>
						
										
						<div class="row">
							<div class="col-sm-12">
								<div class='your-details'>
									<h3 id="theform">Fill in the form below to get Vidaylin Minibear Gummies (worth S$23.80) for S$5 today! </h3>
									
									<div class='yourdetails'>
										<div class="form-group">
											<label for="fname" class="control-label">Name</label>
											<div><input type="text" class="form-control" id="mname" name="mname" value="<?php echo htmlentities($referral['name']); ?>" required="required"></div>
										</div>
										<div class="form-group">
											<label for="emailaddr" class="control-label">Email Address</label>
											<div><input type="text" class="form-control" id="memail" name="memail" value="<?php echo htmlentities($referral['email']); ?>"required="required"></div>
										</div>
										<div class="form-group">
											<label for="mobile" class="control-label">Mobile No</label>
											<div><input type="text" class="form-control" id="mmobile" name="mmobile" value="<?php echo htmlentities($referral['mobile']); ?>"required="required"></div>
										</div>
										<div class="form-group">
											<label for="mobile" class="control-label">Mailing Address (Singapore Only)</label>
											<div><textarea class="form-control" id="maddress" name="maddress" required="required"><?php echo htmlentities($referral['address']); ?></textarea></div>
										</div>
									</div>
								</div>
							</div>							
							
							<div class="col-sm-12 tncs">
								<p><input type="checkbox" id="tnc" name="tnc" value="agree" required="required">&nbsp;&nbsp;&nbsp;I agree to the <a href="#" class='tncswal'>Terms and Conditions</a></p>
								<p><input type="submit" class="btn btn-lg btn-danger" value="* Get Vidaylin Minibear Gummies today! &raquo;" />
								<input type="hidden" name="frm_submitted" value="1" /></p>
							</div>
														
							
						</div>
										
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

<div class='tncwrap hidden'>
	<div class='tnc'>
	<ul>
		<li>This is open to participants residing in Singapore only.</li>
		<li>Limited to one bottle per person.</li>
		<li>This offer is available only in Singapore and may be withdrawn at anytime at the company's discretion.</li>
		<li>By participating in this offer, you agree to receive future promotional / marketing information via email from Sainhall Nutrihealth Pte Ltd.</li>
	</ul>
	</div>
</div>	


</body>

</html>