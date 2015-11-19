<?php
	header("Location: http://www.vitamin.sg/c/offer-ended");
	exit;
	
	include('functions.php');
	
	$status = ""; 
	if ($_POST['frm_submitted'] == "1") {
				
		//retrieve
		$mname = $_POST['mname'];
		$memail = $_POST['memail'];
		$mmobile = $_POST['mmobile'];
		$maddress = $_POST['maddress'];
		$friendname = $_POST['friendname'];
		$friendemail = $_POST['friendemail'];
		
		//preprocess
		if (! is_array($friendname)) {
			$friendname = array();
		}
		if (! is_array($friendemail)) {
			$friendemail = array();
		}
		$friendname = array_pad($friendname, 5, "");
		$friendemail = array_pad($friendemail, 5, "");
		
		//validate
		$errors = array();
		if ($mname == "") {
			$errors[] = "Please enter your name";
		}
		if (!filter_var($memail, FILTER_VALIDATE_EMAIL)) {
			$errors[] = "Please enter a valid email address";
		}
		if ($mmobile == "") {
			$errors[] = "Please enter your mobile number";
		}
		if ($maddress == "") {
			$errors[] = "Please enter your address";
		}
		
		$atleastonefriend = false;
		for ($i = 0; $i <= 4; $i++) {
			if ( ($friendname[$i] != "") && (!filter_var($friendemail[$i], FILTER_VALIDATE_EMAIL)) ) {
				$errors[] = "Please enter a valid email address for friend #" . ($i+1);
			}
			
			if ( ($friendname[$i] != "") && ($friendemail[$i] != "") ) {
				$atleastonefriend = true;
			}
		}
		if (!$atleastonefriend) {
			$errors[] = "Please enter as least one friend's name and email address";
		}
		
		if (get_member_by_email($memail)) {
			$errors[] = "You can only submit once!";
		}
				
		//process
		if (sizeof($errors)) {
			//errors - show error message
			
			$status = "<div class='errors'><ul><li>" . implode("</li><li>", $errors). "</li></ul></div>";
			
		}
		else {
			//no errors
			
			$member = array();
			$member['mname'] = $mname;
			$member['memail'] = $memail;
			$member['mmobile'] = $mmobile;
			$member['maddress'] = $maddress;
			
			$referrals = array();
			for ($i = 0; $i <= 4; $i++) {
				if ($friendname[$i] != "" && $friendemail[$i] != "") {
					$referrals[$friendemail[$i]] = array(
						'name' => $friendname[$i],
						'email' => $friendemail[$i],
					);
				}				
			}//for
			
			add_member_referral($member, $referrals);
			
			$status = "<div class='success'>Thank you! We will notify your friends about the offer!</div>";
			
			$mname = "";
			$maddress = "";
			$mmobile = "";
			$maddress = "";
			$friendemail = array_pad(array(), 5, "");
			$friendname = array_pad(array(), 5, "");
			
			
		}//sizeof errors
		
	}//frm_submitted
	
?>
<!doctype html>
<html>

<head>
	
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Get a Free Bottle of Vidaylin Minibear Gummies!</title>

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
								<h1>Get your CNY Gift worth S$58.80 today!</h1>	
								<p>Here's how:</p>

														
								<p style="font-size: 1.2em;"><strong>1. Tell your friends about our Vidaylin Minibear Gummies super deal.</strong></p>
								<p>Tell 5 friends about Vidaylin Minibear Gummies by filling in the form below. Each of your friends will receive an email with a link that is tagged to your Vitamin.sg account.</p>
								<p style="font-size: 1.2em;"><strong>2. Get Vidaylin Minibear Gummies for free (worth S$23.80)</strong></p>
								<p>Via your link, your friends can get Vidaylin Minibear Gummies for <span style="text-decoration:underline">just S$5</span>, which is a whopping 79% discount! When any of your referred friends makes a purchase of Vidaylin Minibear Gummies, you will receive a bottle for free (limited to one)! Both you and your friends will also get to enjoy free delivery!</p>
								
								<div class="aboutvidaylin clearfix">
									<img id="heroimg" src="vidaylin.png" class="pull-right" />
									<p><strong>More about Abbott's Vidaylin Minibear Gummies...</strong></p>
									<p>Vidaylin Minibear Gummies offers your children a delicious alternative: berry-flavoured chewable gummies! It is neither awful tasting nor a giant pill. </p>
									<p>It only takes one gummy to nourish your children with the nutrients of 5 garden vegetables and 9 vitamins that are essential for their growth and development.</p>
									<p>Your children will be chewing on the goodness of tomato, spinach, carrot, beetroot and artichoke. They will also benefit from a dose of <em>Vitamin A, Vitamin D3, Vitamin E, Vitamin C, Vitamin B6, Vitamin B12, Niacin, Biotin and Folic Acid.</em></p>
									<p>Keep your children healthy today with Vidaylin Minibear Gummies! </p>
									<p style="font-style: italic; font-weight: bold; font-size: 1.2em; margin-top: 30px; margin-bottom: 30px; color: #777;">
										With Abbot's Vidaylin Minibear Gummies, it is a win-win-win situation for you.<br />
										Because you, your friends, and your children benefit!<br />
										Who doesn't know that when children are happy and healthy, so are their parents!</p>	
								</div>
										
								<p style="font-size: 1.2em;"><strong>3. Get even more rewards</strong></p>
								<p>Together with the purchase, you and your friends will each receive a free 1 year Vitamin.sg membership (worth S$35), as well as a Buy 1 Free 1 coupon for your next purchase of Vidaylin Minibear Gummies</p>
							</div>
							<div class="col-sm-12">
								<div style="padding: 15px 25px; margin-top: 15px; border-radius: 15px; background-color: #e1f6ff; border: 4px solid #106a90; text-align: center;">
									<h2>Total Rewards</h2>
									2 x Vidaylin Minibear Gummies – S$47.60<br />
									2 x 1 Year Vitamin.sg Membership – S$70</p>
									<p style="font-size: 1.2em;"><strong>Total: S$117.60</strong></p>
								</div>
							</div>



							<div class='col-sm-12'>
								<p style="font-size: 200%; font-weight: bold; color: #f00; text-align: center; margin-top: 15px;">That's a combined value of S$117.60 for just S$5!</p>
								<p style="text-align: center; font-weight: bold; ">Offer ends on 1 March 2015. <br />Get it fast before its gone - refer 5 friends today!</p> 
							</div>
						</div>
										
						<div class="row">
							<div class="col-md-4 col-sm-6">
								<div class='your-details'>
									<h3 id='theform'>Your Details</h3>
									
									<div class='yourdetails'>
										<div class="form-group">
											<label for="fname" class="control-label">Name</label>
											<div><input type="text" class="form-control" id="mname" name="mname" value="<?php echo htmlentities($mname); ?>" required="required"></div>
										</div>
										<div class="form-group">
											<label for="emailaddr" class="control-label">Email Address</label>
											<div><input type="text" class="form-control" id="memail" name="memail" value="<?php echo htmlentities($memail); ?>"required="required"></div>
										</div>
										<div class="form-group">
											<label for="mobile" class="control-label">Mobile No</label>
											<div><input type="text" class="form-control" id="mmobile" name="mmobile" value="<?php echo htmlentities($mmobile); ?>"required="required"></div>
										</div>
										<div class="form-group">
											<label for="mobile" class="control-label">Mailing Address (Singapore Only)</label>
											<div><textarea class="form-control" id="maddress" name="maddress" required="required"><?php echo htmlentities($maddress); ?></textarea></div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="col-md-8 col-sm-6">
								<div class='your-friends-details'>
									<h3>Your Friends' Details</h3>

									<div class='frienddetails form-horizontal'>
										
										<div class="form-group">
											<label class="control-label col-lg-2 col-md-2 col-sm-12 col-xs-12 main-label" >Friend #1</label>
											<label class="control-label col-lg-1 col-md-1 col-sm-2" >Name</label>
											<div class="col-lg-4 col-md-4 col-sm-10">
												<input type="text" class="form-control" name="friendname[]" value="<?php echo htmlentities($friendname[0]); ?>" required="required">
											</div>
											<label class="control-label col-lg-1 col-md-1 col-sm-2" >Email</label>
											<div class="col-lg-4 col-md-4 col-sm-10">
												<input type="email" class="form-control" name="friendemail[]" value="<?php echo htmlentities($friendemail[0]); ?>"  required="required">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2 col-md-2 col-sm-12 col-xs-12  main-label " >Friend #2</label>
											<label class="control-label col-lg-1 col-md-1 col-sm-2" >Name</label>
											<div class="col-lg-4 col-md-4 col-sm-10">
												<input type="text" class="form-control" name="friendname[]" value="<?php echo htmlentities($friendname[1]); ?>">
											</div>
											<label class="control-label col-lg-1 col-md-1 col-sm-2" >Email</label>
											<div class="col-lg-4 col-md-4 col-sm-10">
												<input type="email" class="form-control" name="friendemail[]" value="<?php echo htmlentities($friendemail[1]); ?>">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2 col-md-2 col-sm-12 col-xs-12 main-label" >Friend #3</label>
											<label class="control-label col-lg-1 col-md-1 col-sm-2" >Name</label>
											<div class="col-lg-4 col-md-4 col-sm-10">
												<input type="text" class="form-control" name="friendname[]" value="<?php echo htmlentities($friendname[2]); ?>">
											</div>
											<label class="control-label col-lg-1 col-md-1 col-sm-2" >Email</label>
											<div class="col-lg-4 col-md-4 col-sm-10">
												<input type="email" class="form-control" name="friendemail[]" value="<?php echo htmlentities($friendemail[2]); ?>">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-lg-2 col-md-2 col-sm-12 col-xs-12 main-label" >Friend #4</label>
											<label class="control-label col-lg-1 col-md-1 col-sm-2" >Name</label>
											<div class="col-lg-4 col-md-4 col-sm-10">
												<input type="text" class="form-control" name="friendname[]" value="<?php echo htmlentities($friendname[3]); ?>">
											</div>
											<label class="control-label col-lg-1 col-md-1 col-sm-2" >Email</label>
											<div class="col-lg-4 col-md-4 col-sm-10">
												<input type="email" class="form-control" name="friendemail[]" value="<?php echo htmlentities($friendemail[3]); ?>">
											</div>
										</div>


										<div class="form-group">
											<label class="control-label col-lg-2 col-md-2 col-sm-12 col-xs-12 main-label" >Friend #5</label>
											<label class="control-label col-lg-1 col-md-1 col-sm-2" >Name</label>
											<div class="col-lg-4 col-md-4 col-sm-10">
												<input type="text" class="form-control" name="friendname[]" value="<?php echo htmlentities($friendname[4]); ?>">
											</div>
											<label class="control-label col-lg-1 col-md-1 col-sm-2" >Email</label>
											<div class="col-lg-4 col-md-4 col-sm-10">
												<input type="email" class="form-control" name="friendemail[]" value="<?php echo htmlentities($friendemail[4]); ?>">
											</div>
										</div>

									</div>

								</div>									
							</div>
							
							
							<div class="col-sm-12 tncs">
								<p><input type="checkbox" id="tnc" name="tnc" value="agree" required="required">&nbsp;&nbsp;&nbsp;I agree to the <a href="#" class='tncswal'>Terms and Conditions</a></p>
								<p><input type="submit" class="btn btn-lg btn-danger" value="Send This Great Deal to My Friends! &raquo;" />
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
		<li>Limited to one bottle per customer.</li>
		<li>Free sample is not exchangeable for cash and/or other products.</li>
		<li>Sainhall Nutrihealth Pte Ltd reserves the right to replace the free sample with another item of similar value without prior notice.</li>
		<li>This offer is available only in Singapore and may be withdrawn at anytime at the company's discretion.</li>
		<li>By participating in this giveaway, you agree to receive future promotional / marketing information via email from Sainhall Nutrihealth Pte Ltd.</li>
		<li>All benefits of this campaign are awarded on the condition that the referred friend(s) of the Vitamin.sg customer make a purchase of Vidaylin Minibear Gummies via their unique referral link. Every Vitamin.sg customer is entitled to a maximum of 1 free bottle of Vidaylin Minibear Gummies. </li>
	</ul>
	</div>
</div>	


</body>

</html>