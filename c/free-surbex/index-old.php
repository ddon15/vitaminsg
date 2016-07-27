<?php
	$status = "";
	$mname = "";
	$memail = "";
	$mmobile = "";
	$maddress = "";

	if (($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['frm_submitted']) && $_POST['frm_submitted'] == "1")) {
				
		//retrieve
		$mname = $_POST['mname'];
		$memail = $_POST['memail'];
		$mmobile = $_POST['mmobile'];
		$maddress = $_POST['maddress'];
		// $mcode = $_POST['mcode'];
		
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
		// if (trim($mcode) == "") {
		// 	$errors[] = "Please enter your claim code";
		// }
		
		
		// //validate claim code
		// $mcode = strtoupper($mcode);
		// $claimcodes = file_get_contents('claimcodes.txt');
		// $claimcodes = unserialize($claimcodes);
		// if (array_search($mcode, $claimcodes) === false) {
		// 	$errors[] = "Invalid claim code";
		// }

		
						
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
			// $member['mcode'] = $mcode;
			
			//admin email
			$to = "info@vitamin.sg";
			//$to = "kianann@vitamin.sg";
			$subject = "Submission: Free Abbott Surbex Natopherol Vegicaps";
			$from = "Vitamin.sg <info@vitamin.sg>";
			$message = <<<ENDDOC
A submission has been made for a free bottle of Surbex Natopherol Vegicaps.<br /><br />
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
			$subject = "Submission Received: Free Abbott Surbex Natopherol Vegicaps";
			$from = "Vitamin.sg <info@vitamin.sg>";
			$message = <<<ENDDOC
Thank you for your submission for your free bottle of Abbott Surbex Natopherol Vegicaps.<br /><br />
You will be hearing from us shortly.<br /><br />
Here is a copy of the information you sent to us:<br /><br />
===========================================================<br /><br />
<strong>Name:</strong> {mem_name}<br/><br />
<strong>Email:</strong> {mem_email}<br/><br />
<strong>Mobile:</strong> {mem_mobile}<br/><br />
<strong>Address:</strong> {mem_address}<br /><br />
===========================================================<br /><br />
Vitamin.sg
ENDDOC;
			$message = str_replace("{mem_name}", $mname, $message);
			$message = str_replace("{mem_email}", $memail, $message);
			$message = str_replace("{mem_mobile}", $mmobile, $message);
			$message = str_replace("{mem_address}", $maddress, $message);
			
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
	
	<title>Get Your Free Gift (Worth $37.20) Today!</title>

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
	<script src="taggle.js"></script>
	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	
	  ga('create', 'UA-4090630-2', 'auto');
	  ga('send', 'pageview');
	
	</script>
	<style type="text/css">
		#exTab1 .tab-content {
		  color : #1D1818;
		  background-color: #E8F9FF;
		  padding : 5px 15px;
		}
		/* remove border radius for the tab */
		#exTab1 .nav-pills > li > a {
		  border-radius: 0;
		}

		.tab-pane {
			padding: 10px;
		}

		.features {
			font-weight: bolder;
		}

		.font-size-30px {
			font-size: 30px;
		}


		.font-size-22px {
			font-size: 22px;
		}


		.font-size-12px {
			font-size: 12px;
		}

		.social-media-box {
			text-align: center;
			margin: 30px 77px 0px;
		}

		.image-size {
			height: 330px !important;
			width: 191px !important;
		}

		.social-media img{
			height: 90px !important;
		}

	</style>
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
					
					<form role="form" id="form-reg" method="POST">
						
						<div class="row">
							<div class='col-sm-12'>
								<?php echo $status;  ?>
								<img src="logo.png" id="logo" class="img-responsive" />
								<h1>Get Your Free Gift (Worth $37.20) Today!</h1>	
								
								<div class="aboutvidaylin clearfix">
									<div id="exTab1" class="row">	
										<ul  class="nav nav-pills">
											<li class="active">
												<a  href="#1a" data-toggle="tab">English</a>
											</li>
											<li>
												<a href="#2a" data-toggle="tab">华语/華語</a>
											</li>
											<li>
												<a href="#3a" data-toggle="tab">Bahasa</a>
											</li>
										</ul>

										<div class="tab-content clearfix">
											<img id="heroimg" src="surbex.png" class="pull-right image-size " />
											<div class="tab-pane active" id="1a">
												<h3>Protection from free-radical damage with a Natural Source of Vitamin E from Abbott</h3>
												<p>Abbott’s Surbex Natopherol ® Vegicaps capsules are a Vitamin E supplement for adults.</p>
												<p><b>Features:</b></p>
												<ul>
													<li>Derived from plant based active ingredient</li>
													<li>Contains the active source of natural Vitamin E d-alpha tocopherol</li>
													<li><b>400 I.U. Vitamin E</b> acts as an antioxidant to fight off free radical generation</li>
													<li>Uses plant based capsule</li>
													<li>Soft and easy to swallow</li>
													<li>Convenient once-a-day dosage</li>
													<li>To be taken after a proper meal</li>
													<li>Suitable for vegetarian</li>
												</ul>
											</div>
											<div class="tab-pane" id="2a">
												<div class="tab-pane active" id="1a">
												<h3>天然维他命E</h3>
												<p><b>用处: </b>  适合成人服用的维他命E补剂品。</p>
												<p><b>特点: </b></p>
												<ul>
													<li>提炼自有效植物成份</li>
													<li>富含活性的天然维他命E d-alpha tocopherol(生育酚)</li>
													<li><b>400 I.U.维他命E</b>作为抗氧化剂以防御自由基的伤害</li>
													<li>由海藻制成的胶囊，不含任何动物成分</li>
													<li>柔软且容易吞服</li>
													<li>每天只需一粒，方便食用</li>
													<li>需在进餐后服用</li>
													<li>适合素食者</li>
												</ul>
											</div>
											</div>
											<div class="tab-pane" id="3a">
												<h3>Sumber Vitamin E Semulajadi.</h3>
												<p><b>KEGUNAAN:</b>  Supplemen Vitamin E untuk orang dewasa.</p>
												<p><b>CIRI-CIRI: </b></p>
												<ul>
													<li>Diekstrak daripada bahan aktif daripada tumbuhan semula jadi</li>
													<li>Mengandungi sumber Vitamin E semula jadi yang aktif d-alfa tokoferol</li>
													<li><b>400 I.U. Vitamin E</b> bertindak sebagai antioksidan untuk melawan serangan radikal bebas</li>
													<li>Kapsul yang diperbuat daripada bahan yang berasal daripada rumpai laut</li>
													<li>Lembut dan senang ditelan</li>
													<li>Pengambilan satu kapsul sehari</li>
													<li>Diambil selepas sajian seimbang</li>
													<li>Sesuai untuk vegetarian</li>
												</ul>
											</div>
										</div>
									  </div>
								</div>
																
								<p class="font-size-30px">Here's how:</p>

								<p class="font-size-22px"><b>Step 1</b>. Complete the registration form below for us to mail you your gift absolutly FREE.</p>

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
								<br>
								<p class="font-size-22px"><b>Step 2</b>. Share this offer with your friends, and they too will recieve a free bottle of Surbex Natopherol Vegicaps when they complete the registration form.</p>
								<!-- <div class="row text-center">
									<div class="fb-post" data-href="https://www.facebook.com/vitaminsg/posts/1003350073112542" data-width="500" data-show-text="true"><blockquote cite="https://www.facebook.com/vitaminsg/posts/1003350073112542" class="fb-xfbml-parse-ignore"><p>Did you know: Good things come in bundles... and now that applies to vitamins too!

									Launching our Sundown Naturals...</p>Posted by <a href="https://www.facebook.com/vitaminsg/">Vitamin.SG</a> on&nbsp;<a href="https://www.facebook.com/vitaminsg/posts/1003350073112542">Thursday, July 21, 2016</a></blockquote></div>
								</div>
								<div class="row ">
									<div class="col-sm-12 social-media-box">
										<div class="fb-like" data-href="https://www.facebook.com/vitaminsg/?fref=ts" data-layout="standard" data-action="like" data-size="large" data-show-faces="false" data-share="false"></div>
									</div>
								</div> -->
								<div class = "row social-media">
								   <div class = "col-sm-8 col-md-4">
								      <a href = "https://www.facebook.com/vitaminsg/" class = "thumbnail" id="fb-like">
								         <img src = "like-us-on-facebook.png" alt = "Like Us on Facebook">
								      </a>
								      <div class="fb-like" data-href="https://www.facebook.com/vitaminsg/" data-layout="button_count" data-action="like" data-size="small" data-show-faces="false" data-share="false"></div>
								   </div>
								   
								   <div class = "col-sm-8 col-md-4">
								      <a href = "#" class = "thumbnail" id="share-btn">
								         <img src = "FB_share.png" alt = "Share Post">
								      </a>
								   </div>
								   
								   <div class = "col-sm-8 col-md-4">
								      <a href="#" class = "thumbnail" data-toggle="modal" data-target=".bs-example-modal-sm">
								         <img src = "icon_invite_friends.png.jpeg" alt = "Invite Friends">
								      </a>
								   </div>
									
								</div>
								<div class="col-sm-12 tncs">
									<p><input type="checkbox" id="tnc" name="tnc" value="agree" required="required">&nbsp;&nbsp;&nbsp;<span class="">I agree to the</span> <a href="#" class='tncswal'>Terms and Conditions</a></p>
									<p><input type="submit" class="btn btn-lg btn-danger font-size-22px" value="Get a Free Bottle of Surbex Natopherol Vegicaps! &raquo;" />
									<input type="hidden" name="frm_submitted" value="1" /></p>
								</div>

								<br>
								<br>
							

							</div>
						</div>
						<br/>
						<br/>
						<div class="row">
						<p class="text-center">This offer is available on a "first come first serve" basis while stock lasts.</p>
						</div>
																		
					</form>
					
				</div><!-- /#maincontent -->

			</div><!-- /#content -->
		</div><!-- /.container -->
	</div><!-- /#content-wrapper -->
	
	<!-- Modals -->
	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div class="form-group">
	        <label for="comment">Enter Email of your friends:</label>
	        <div id="taggle-email"></div>
	      </div>
	    </div>
	  </div>
	</div>

	<div id="footer-wrapper">
		<div class="container">
			<footer id="footer" class="row">
				
				<div class="col-sm-12 text-center">
					Copyright &copy; 2016 Sainhall Nutrihealth Pte Ltd
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

<div id="fb-root"></div>

<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '648956708589658',
      xfbml      : true,
      version    : 'v2.7'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>

<script>(function(d, s, id) {d
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.7";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<script type="text/javascript">
	var isShared = 0;
	document.getElementById('share-btn').onclick = function(e) {
		FB.ui(
		{
		  method: 'feed',
		  name: 'Offer',
		  link: 'http://www.vit.sg/c/free-surbex/',
		  href: 'http://www.vit.sg/c/free-surbex/',
		  // picture: 'http://fbrell.com/f8.jpg',
		  // caption: 'Reference Documentation',
		  // description: 'Dialogs provide a simple, consistent interface for applications to interface with users.'
		},
		function(response) {
		 	if (response && response.post_id) {
		  		isShared = 1;
		   		console.log('Post was published');
		  } else {
		  		console.log('Post was not published');
		  }
		});

		e.preventDefault();
	}

	document.getElementById('fb-like').onclick = function() {
		console.log('test');
		$('fb:like').trigger('click');
	}

	$(document).ready(function(e) {
		$('#form-reg').on('submit', function(e) {
			if (!isShared) {
				alert('Share this information to your friends so they too can avail this Free Gift we are giving away.');
				return;
			}

			$(this).submit();

			e.preventDefault();
		});

		new Taggle('taggle-email', {
	    	placeholder: 'Type email and press enter to add.',
	    	allowDuplicates: false
		});
</script>
</body>

</html>