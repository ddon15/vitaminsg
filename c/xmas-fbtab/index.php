<!DOCTYPE html>
<html>

<head>
	
	<meta charset="utf-8" />
	<title>Vitamin.sg Xmas Giveaway</title>
	
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/ui-lightness/jquery-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
		
	<!-- JS: JQuery, JQueryUI, ChromeFrame, Modernizr, Prefix Free -->	
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/prefixfree.js"></script>
	
	<!-- IE Conditional Comments -->
	<!--[if lt IE 10]>
		<link rel="stylesheet" type="text/css" href="ie/ie9.css" media="screen" />
		<script type="text/javascript" src="ie/ie9.js"></script>
	<![endif]-->
	
	<style>
		body { background-color: #800000; } 
		form { padding: 20px; width: 700px; border: 4px dotted #fff; margin: 0 auto; text-align: center; }
		form label { display: inline-block; }
		form input[type=text] { -webkit-appearance: none; padding: 10px; width: 280px; border: 1px solid #000; }
		form input[type=submit] { background-color: #888; border-radius: 30px; border: 1px solid #888; padding: 10px 25px; color: #000; cursor: pointer; background: linear-gradient(#efefef 0%, #888 100%); }
		form select { padding: 10px; border: 1px solid #000; border-radius: 0; width: 300px; }
		form div { margin: 10px 0;}
		.tnc { font-size: 75%; width: 690px; margin: 10px auto; }
		a:link, a:visited, a:hover { color: #fff; }
	</style>
	
	<script>
		jQuery(document).ready(function($) {
			$('#btnsubmit').on('click', function () {
				
				var emailfilter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				
				frmprefer = $('#frmprefer').val();
				frmwhyprefer = $('#frmwhyprefer').val();
				frmname = $('#frmname').val();
				frmemail = $('#frmemail').val();
				frmmobile = $('#frmmobile').val();
				frmreferrer = $('#frmreferrer').val();
				
				
				errors = [];
				if (frmprefer == "") {
					errors.push('Please enter which supplement brand you prefer.');
				}
				if (frmwhyprefer == "") {
					errors.push('Please enter why you prefer the brand.');
				}
				if (frmname.trim() == "") {
					errors.push('Please enter your name.');
				}
				if (!emailfilter.test(frmemail)) {
					errors.push('Please enter a valid email address');
				}
				if (frmmobile.trim() == "") {
					errors.push('Please enter your mobile number.');
				}
				
				if (errors.length > 0) {
					
					errorstr = errors.join('\n');
					alert(errorstr);
					
					
				}
				else {
					
					$.post(
						'process.php',
						{
							prefer		: 	frmprefer,
							whyprefer	: 	frmwhyprefer,
							name		: 	frmname,
							email		: 	frmemail,
							mobile		: 	frmmobile,
							referrer	: 	frmreferrer,
						},
						function () {
							alert('Thank you. Your information has been submitted.');
						}
					);
				}
				
				
				return false;
								
				
			});	
		});
	</script>
	
</head>

<body>
	<div style="width: 720px; margin: 20px auto; font-family: Arial; color: #fff;">
	
	<img src="xmas-esterc-shortstack-banner-closed.jpg" alt="xmas-esterc-shortstack-banner-closed" width="" height="" />
	<p align="center"><a href="http://www.vitamin.sg">Return to Vitamin.sg »</a></p>
	
	<?php /* 
	
	<img src="http://www.vitamin.sg/xmas-fbtab/fan.jpg" alt="Christmas Giveaway" width="810" height="747" />
	
	
	
    <form>
	    
	    <div>
	    	<label for="frmname">What is Your Preferred Vitamin Brand? *</label><br />
	    	<select name="frmprefer" id="frmprefer">
	    		<option>American Health</option>
	    		<option>Berroca</option>
	    		<option>Blackmores</option>
	    		<option>Centrum</option>
	    		<option>Deva</option>
	    		<option>Holista</option>
	    		<option>Holistic Way</option>
	    		<option>Kordel'’'s</option>
	    		<option>Kyolic</option>
	    		<option>Nature'’'s Way</option>
	    		<option>Novomel</option>
	    		<option>Nutrex Hawaii</option>
	    		<option>Ocean Health</option>
	    		<option>Redoxon</option>
	    		<option>Stazen</option>
	    		<option>Twinlab</option>
	    		<option>VitaHealth</option>
	    		<option>Webber Natural's</option>
	    	</select>
	    </div>
	    <div>
	    	<label for="frmname">Why do You Prefer this Brand? *</label><br />
	    	<select name="frmwhyprefer" id="frmwhyprefer">
	    		<option>Price is cheap</option>
	    		<option>Promotions are always available</option>
	    		<option>Wide variety</option>
	    		<option>Recommended by friends / relatives</option>
	    		<option>Recommended by health physician</option>
	    		<option>Tried before and find it beneficial to health</option>
	    	</select>
	    </div>
	    <div>
	    	<label for="frmname">Name *</label><br />
	    	<input type="text" id="frmname" name="frmname"/>
	    </div>
	    <div>
	    	<label for="frmemail">Email *</label><br />
	    	<input type="text" id="frmemail" name="frmemail"/>
	    </div>
	    <div>
	    	<label for="frmmobile">Mobile *</label><br />
	    	<input type="text" id="frmmobile" name="frmmobile"/>
	    </div>
	    <div>
	    	<label for="frmreferrer">Referrer</label><br />
	    	<input type="text" id="frmreferrer" name="frmreferrer"/>
	    </div>
	    <div><input type="submit" id="btnsubmit" value="Submit"></div>
	    
    </form>

	<div class="tnc">
		<p>This giveaway is applicable to participants residing in Singapore only. This giveaway ends on 31 December 2013. This promotion is in no way sponsored, endorsed or administered by, or associated with, Facebook. You are providing your information to Sainhall Nutrihealth Pte Ltd and not to Facebook. The information you provide will only be used for administering the giveaway, as well as for Sainhall Nutrihealth Pte Ltd marketing purpose.  Sainhall Nutrihealth will not disclose your personal details to external parties, subject to compliance with applicable laws and regulations.</p>
		<p>Limited to one bottle per person.  Self-Collection: AMERICAN HEALTH - Non-Acidic Ester-C (worth $16) must be collected no later by 8 January 2014. Please bring along your NRIC for identification purpose. Name submitted must be identical to the name reflected on the NRIC. Collection location: 59 Jalan Pemimpin, #02-02 L&amp;Y Building, S(577218). Collection Timing: Monday to Friday, 9am to 5pm.</p>
		<p>Send by email: $20 Vitamin.sg voucher will be sent out by 3 January 2014</p>
	</div>
	 */ ?>
	</div>
</body>

</html>