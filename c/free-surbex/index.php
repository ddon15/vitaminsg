<?php
	ob_start();
	include 'helper.php';

	$status = "";
	$mname = "";
	$memail = "";
	$mmobile = "";
	$maddress = "";
	$errors = [];

	if (Helper::isFormSubmitted()) {
		$errors = Helper::validateFormData($_POST);

		if (sizeof($errors))
			$status = "<div class='alert alert-danger'><ul><li>" . implode("</li><li>", $errors). "</li></ul></div>";
		else {
			$member = [];
			$member['mname'] = $_POST['mname'];
			$member['memail'] = $_POST['memail'];
			$member['mmobile'] = $_POST['mmobile'];
			$member['maddress'] =  $_POST['maddress'];
			
			Helper::sendEmail($member);
			
			header('Location:http://www.vitamin.sg/c/free-surbex/success.php', 301);
			exit();
		}	
	}
?>
<!doctype html>
<html>

<head>
	
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Get Your Free Gift (Worth $37.20) Today!</title>

   	<?php //CDN scripts last checked - 21 May 2014 ?>

	<!-- CSS -->
	<!-- <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" /> -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" />
	<link rel="stylesheet" href="lib/sweet-alert.css" />
	<link rel="stylesheet" href="lib/bs3/bootstrap-tagsinput.css" />
	<link rel="stylesheet" href="style.css" />
		
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
								<img src="logo.png" id="logo" class="img-responsive" />

								<?php echo $status;  ?>

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
											<div><input type="email" class="form-control" id="memail" name="memail" value="<?php echo htmlentities($memail); ?>"required="required"></div>
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
								<p class="font-size-22px"><b>Step 2</b>. LIKE our page and SHARE this offer with your friends via Facebook or Email, and they too will recieve a free bottle of Surbex Natopherol Vegicaps when they complete the registration form.</p>
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
								   <div class = "col-sm-8 col-md-4" id="fb-like-container" data-liked="0">
								      <a href = "#" class = "thumbnail" id="fb-like" style="padding: 17px 51px;">
								        <!-- <img src = "like-us-on-facebook.png" alt = "Like Us on Facebook"> -->
								      	<div class="fb-like" data-href="https://www.facebook.com/vitaminsg/" data-width="1" data-layout="standard" data-action="like" data-size="large" data-show-faces="true" data-share="false"></div>
								      </a>
								   </div>
								   
								   <div class = "col-sm-8 col-md-4" id="fb-shared-container" data-shared="0">
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
	<!-- Modal -->
	<div class="modal fade bs-example-modal-sm" data-emailed="0" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Send To:</h4>
	      </div>
	      <div class="modal-body">
	      	<span>1. Type your friend's email address and press the enter/return key to add it. </span> <br>
	      	<span>2. Add as many friends as you want. </span><br>
	      	<span>3. When you're done, hit "Send" to share with your friends! </span>
	      	<div class="">
	      		<select multiple data-role="tagsinput" id="tg"></select>
	      	</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	        <button type="button" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Sending.." class="btn btn-success" id="btn-send"><i class="fa fa-paper-plane" aria-hidden="true"></i> Send</button>
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



<!-- Javascript Libraries -->	
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.20/angular.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

<script src="lib/sweet-alert.js"></script>
<script src="lib/bs3/bootstrap-tagsinput.js"></script>
<script src="lib/bs3/bootstrap-tagsinput-angular.js"></script>
<script src="scripts.js"></script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-4090630-2', 'auto');
  ga('send', 'pageview');
</script>

<script>
	// This is called with the results from from FB.getLoginStatus().
	function statusChangeCallback(response) {
		// console.log('statusChangeCallback');
		// console.log(response);
		// The response object is returned with a status field that lets the
		// app know the current login status of the person.
		// Full docs on the response object can be found in the documentation
		// for FB.getLoginStatus().
		if (response.status === 'connected') {
		  // Logged into your app and Facebook.
		  testAPI();
		  getUserLikes();
		} else if (response.status === 'not_authorized') {
		 	// The person is logged into Facebook, but not your app.
		 	console.log('Not Authorized');
		} else {
		  	// The person is not logged into Facebook, so we're not sure if
		  	// they are logged into this app or not.
			console.log('No fb user login');
		}
	}

	// This function is called when someone finishes with the Login
	// Button.  See the onlogin handler attached to it in the sample
	// code below.
	function checkLoginState() {
		FB.getLoginStatus(function(response) {
		  statusChangeCallback(response);
		});
	}

	window.fbAsyncInit = function() {
		FB.init({
		appId      : '648956708589658',
		cookie     : true,  // enable cookies to allow the server to access 
		                    // the session
		xfbml      : true,  // parse social plugins on this page
		version    : 'v2.5' // use graph api version 2.5
	});

	// Now that we've initialized the JavaScript SDK, we call 
	// FB.getLoginStatus().  This function gets the state of the
	// person visiting this page and can return one of three states to
	// the callback you provide.  They can be:
	//
	// 1. Logged into your app ('connected')
	// 2. Logged into Facebook, but not your app ('not_authorized')
	// 3. Not logged into Facebook and can't tell if they are logged into
	//    your app or not.
	//
	// These three cases are handled in the callback function.

	FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	});

	};

	// Load the SDK asynchronously
	(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) return;
	js = d.createElement(s); js.id = id;
	js.src = "//connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	// Here we run a very simple test of the Graph API after login is
	// successful.  See statusChangeCallback() for when this call is made.
	function testAPI() {
		FB.api('/me', function(response) {
		  console.log('Facebook Login user: ' + response.name);
		});
	};

	function getUserLikes() {
		FB.api('/me/likes/164602346987323', function(response) {
		  console.log(response.data);
		  if (response.data) {
		  	$("#fb-like-container").data("liked", "1");
		  }
		});
	};
</script>

<script type="text/javascript">
	$(document).ready(function(e) {
		var isShared = 0;

		$('#form-reg').on('submit', function(e) {
			var thisForm = $(this);

			FB.api('/me/likes/164602346987323', function(response) {
				console.log(response.data);
				if (response.data && isShared) {
					return true;
				} else {
					alert('Help your friends get a free bottle too! Please like our page and share this giveaway with your friends via Facebook or email to proceed. Thank you.');
					return false;
				}
			});
			
			thisForm.submit();

			e.preventDefault();
		});

		$('#share-btn').on('click', function(e) {
			FB.ui(
			{
				method: 'feed',
				name: 'Offer',
				link: 'https://www.vitamin.sg/c/free-surbex',
				href: 'https://www.facebook.com/vitaminsg/posts/1010990432348506',
				// picture: 'http://fbrell.com/f8.jpg',
				// caption: 'Reference Documentation',
				// description: 'Dialogs provide a simple, consistent interface for applications to interface with users.'
			},
			function(response) {
			 	if (response && response.post_id) {
			  		$("#fb-shared-container").data("shared", "1");
			  		isShared = 1;
			   		console.log('Post was published');
			  } else {
			  		console.log('Post was not published');
			  }
			});
			e.preventDefault();
		});

		$('select#tg').tagsinput({
		  allowDuplicates: false
		});

		$('#btn-send').on('click', function(e) {
			var emails = $('select#tg').val();
			var elem = $(this);
			var senderEmail = $('#memail').val();
			var senderName = $('#mname').val();


			if (!senderEmail) {
				alert('You have not yet provided your email address.');
				$('.bs-example-modal-sm').modal('hide');
				return;
			}

			elem.button('loading');

			$.ajax({
				url: 'sendemail.php',
				type: 'post',
				data: {emails: emails, sender_email:senderEmail, sender_name: senderName },
				async: false,
				dataType: 'json',
				success: function(response) {
					if (response.success) {
						isShared = 1;
						setTimeout(function() {
					       elem.button('reset');
					       $('select#tg').tagsinput('removeAll');
					       alert('You have successfully shared this free offer to your friends.');
					       $('.bs-example-modal-sm').modal('hide');
					       $("#myModal").data("emailed", "1");
					   	}, 3000);
					} else {
						console.log(response.message);
					}
				}
			});
		});

		// $('a#fb-like').on('click', function(e) {
		// 	e.preventDefault();
		// 	FB.login(function(response) {
		// 		FB.api(
		// 		    "/164602346987323/likes",
		// 		    "POST",
		// 		    function (response) {
		// 				console.log(response);
		// 				if (response && !response.error) {
		// 					/* handle the result */
		// 					$('#fb-like-container').data('liked', '1');
		// 				}
		// 		    }
		// 		);
		// 	}, {
		// 	    scope: 'publish_actions, publish_pages', 
		// 	    return_scopes: true
		// 	});
		// });
	});
</script>
</body>
</html>