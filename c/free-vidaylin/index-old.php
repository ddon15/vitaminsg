<?php
	$status = "";
	$mname = "";
	$memail = "";
	$mmobile = "";
	$maddress = "";
	$mcode = "";

	if (isset($_POST['frm_submitted']) && $_POST['frm_submitted'] == "1") {
				
		//retrieve
		$mname = $_POST['mname'];
		$memail = $_POST['memail'];
		$mmobile = $_POST['mmobile'];
		$maddress = $_POST['maddress'];
		$mcode = $_POST['mcode'];
		
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
		if (trim($mcode) == "") {
			$errors[] = "Please enter your claim code";
		}
		
		
		//validate claim code
		$mcode = strtoupper($mcode);
		$claimcodes = file_get_contents('claimcodes.txt');
		$claimcodes = unserialize($claimcodes);
		if (array_search($mcode, $claimcodes) === false) {
			$errors[] = "Invalid claim code";
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
			$member['mcode'] = $mcode;
			
			//admin email
			$to = "info@vitamin.sg";
			//$to = "kianann@vitamin.sg";
			$subject = "Submission: Free Abbott Vidaylin Minibear Gummies";
			$from = "Vitamin.sg <info@vitamin.sg>";
			$message = <<<ENDDOC
A submission has been made for a free bottle of Vidaylin Gummies.<br /><br />
===========================================================<br /><br />
<strong>Name:</strong> {mem_name}<br/><br />
<strong>Email:</strong> {mem_email}<br/><br />
<strong>Mobile:</strong> {mem_mobile}<br/><br />
<strong>Address:</strong> {mem_address}<br/><br />
<strong>Claim Code:</strong> {mem_code}<br/><br />
===========================================================<br />
ENDDOC;
			$message = str_replace("{mem_name}", $mname, $message);
			$message = str_replace("{mem_email}", $memail, $message);
			$message = str_replace("{mem_mobile}", $mmobile, $message);
			$message = str_replace("{mem_address}", $maddress, $message);
			$message = str_replace("{mem_code}", $mcode, $message);
			
			$headers = "MIME-Version: 1.0" . "\r\n";
			$headers .= "Content-type: text/html; charset=iso-8859-1" . "\r\n";
			$headers .= "From: " . $from . "\r\n";	
			mail($to, $subject, $message, $headers);

			
			$fileentry = json_encode($member) . "\n";
			$fp = fopen("entries.txt", 'a');
			fputs($fp, $fileentry);
			fclose($fp);

			//sender email
			$to = $memail;
			$subject = "Submission Received: Free Abbott Vidaylin Minibear Gummies";
			$from = "Vitamin.sg <info@vitamin.sg>";
			$message = <<<ENDDOC
Thank you for your submission for your free bottle of Abbott Vidaylin Minibear Gummies.<br /><br />
You will be hearing from us shortly.<br /><br />
Here is a copy of the information you sent to us:<br /><br />
===========================================================<br /><br />
<strong>Name:</strong> {mem_name}<br/><br />
<strong>Email:</strong> {mem_email}<br/><br />
<strong>Mobile:</strong> {mem_mobile}<br/><br />
<strong>Address:</strong> {mem_address}<br /><br />
<strong>Claim Code:</strong> {mem_code}<br/><br />
===========================================================<br /><br />
Vitamin.sg
ENDDOC;
			$message = str_replace("{mem_name}", $mname, $message);
			$message = str_replace("{mem_email}", $memail, $message);
			$message = str_replace("{mem_mobile}", $mmobile, $message);
			$message = str_replace("{mem_address}", $maddress, $message);
			$message = str_replace("{mem_code}", $mcode, $message);
			
			$headers = "MIME-Version: 1.0" . "\r\n";
			$headers .= "Content-type: text/html; charset=iso-8859-1" . "\r\n";
			$headers .= "From: " . $from . "\r\n";	
			mail($to, $subject, $message, $headers);


			
			$status = "<div class='success'>Thank you! You will hear from us shortly!</div>";
			
			$mname = "";
			$memail = "";
			$mmobile = "";
			$maddress = "";
			$mcode = "";
			
			
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
	
	  ga('create', 'UA-4090630-2', 'auto');
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
								<h1>Get Your Free Gift (Worth $23.80) Today!</h1>	
								
								<div class="aboutvidaylin clearfix">
									<img id="heroimg" src="vidaylin.png" class="pull-right" />
									<h3>Nourish your children for optimal growth and development with Abbott!</h3>
									<p>Abbott's Vidaylin Minibear Gummies are berry-flavoured chewable gummies that your children are sure to love. </p>
									<p>Every delicious gummy nourishes your children with the nutrients of 5 garden vegetables and 9 vitamins.</p>
									<p>Your children will be chewing on the goodness of tomatoes, spinach, carrots, beetroot and artichoke. They will also be benefitting from a healthy dose of Vitamin A, Vitamin D3, Vitamin E, Vitamin C, Vitamin B6, Vitamin B12, Niacin, Biotin, and Folic Acid. It is everything that is essential for a healthy child’s growth and development.</p>
									<p>Keep your children healthy today with Vidaylin Minibear Gummies!</p>
								</div>
																
								<p>Here's how:</p>

														
								<p>1. Complete the registration form below and we will send you your gift absolutely FREE.</p>

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
										<div class="form-group">
											<label for="code" class="control-label">Claim Code</label>
											<div><input type="text" class="form-control" id="mcode" name="mcode" value="<?php echo htmlentities($mcode); ?>"required="required"></div>
										</div>
									</div>
								</div>
								<div class="col-sm-12 tncs">
									<p><input type="checkbox" id="tnc" name="tnc" value="agree" required="required">&nbsp;&nbsp;&nbsp;I agree to the <a href="#" class='tncswal'>Terms and Conditions</a></p>
									<p><input type="submit" class="btn btn-lg btn-danger" value="Get a Free Bottle of Vidaylin! &raquo;" />
									<input type="hidden" name="frm_submitted" value="1" /></p>
								</div>

								<p>2. Share this offer with your friends, and they too will receive a free bottle of Vidaylin when they complete the registration form.</p>
								
								<p>3. This offer is available on a "first come first serve" basis while stock lasts.</p>
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
		<li>Free sample is not exchangeable for cash and/or other products.</li>
		<li>Sainhall Nutrihealth Pte Ltd reserves the right to replace the free sample with another item of similar value without prior notice.</li>
		<li>This offer is available only in Singapore and may be withdrawn at anytime at the company's discretion.</li>
		<li>By participating in this giveaway, you agree to receive future promotional / marketing information via email from Sainhall Nutrihealth Pte Ltd.</li>
	</ul>
	</div>
</div>	


</body>

</html>