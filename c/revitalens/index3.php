<?php include('processform.php'); ?>
<!DOCTYPE html>
<html>

<head>
	
	<meta charset="utf-8" />
	<title>Iwant2tryRevitaLens Campaign</title>
	
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/ui-lightness/jquery-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
		
	<!-- JS: JQuery, JQueryUI, ChromeFrame, Modernizr, Prefix Free -->	
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
	
	
	
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".dpicker").datepicker({
				changeMonth: true,
				changeYear: true,
				yearRange: "1930:1996",
				dateFormat: "dd M yy"
			}).attr("readonly", "readonly");
		});
	</script>
	
</head>

<body>

	<?php echo $errors; ?>

	<div id="container">
		<div id="header">
			<img src="i/vitaminsg-logo.png" alt="vitaminsg logo" class="vitaminlogo" />
			<img src="i/abbott.png" alt="abbott" class="abbottlogo" />
		</div>
		<div id="content">
			<div id="p1">
				<div id="p1-1">
					<div id="p1-1-1">Experience Comfort and Cleanliness with</div>
					<h1>RevitaLens OcuTec<sup>®</sup> <br />Multi-Purpose <br />Disinfecting Solution</h1>					<p>Developed in cooperation with world class microbiologists, chemistry and contact lens material experts, and with input from more than 600 eye care professionals that contributed to our research! </p>
					<ul>
						<li>Delivers brilliantly Clean and Clear contact lenses</li>
						<li>Conditions your lenses</li>
						<li>Increases lens-wearing Comfort through end of day</li>
					</ul>					
				</div>
				<div id="p1-2">
					<form method="POST">
						<div class="lead"><span class="lead1">FREE STARTER KIT</span><br /><span class="lead2">60ml + $2 coupon off </span><br />your next RevitaLens purchase!</div>
						<div>
							<label>I want to try RevitaLens because:</label>
							<textarea id="iwanttotry" type="text" name="iwanttotry"  class="textbox"><?php echo $formdata['iwanttotry']; ?></textarea>
						</div>
						<div>
							<label for="fname">Name</label>
							<input id="fname" type="text" name="fname" class="textbox" value="<?php echo $formdata['fname']; ?>" />
						</div>
						<div>
							<label for="fmobile">Mobile</label>
							<input id="fmobile" type="text" name="fmobile" class="textbox" value="<?php echo $formdata['fmobile']; ?>" />
						</div>
						<div>
							<label for="fdob">D.O.B <span>(e.g. dd mmm yyyy 19 Mar 1989)</span></label>
							<input id="fdob" type="text" name="fdob" class="textbox dpicker" value="<?php echo $formdata['fdob']; ?>" />
						</div>
						<div>
							<label for="femail">Email Address</label>
							<input id="femail" type="email" name="femail" class="textbox" value="<?php echo $formdata['femail']; ?>" />
						</div>
						<div>
							<label>Mailing Address <span>(e.g. Block/House Number, Street Name, Unit Number, Postal Code)</span></label>
							<textarea id="faddress" type="text" name="faddress"  class="textbox"><?php echo $formdata['faddress']; ?></textarea>
						</div>
						<div class="wsl">150 starter kits to be given away – while stocks last!</div>						
						<div>
							<input type="submit" class="button" value="GET IT NOW" />
							<input type="hidden" name="formsubmit" value="1" />
						</div>
					</form>
				</div>
			</div><!-- /XXX -->
			<div id="p2">
				<h1 align="center"><span>Additional</span> FREE GIFT - worth $49.50</h1>
				<p align="center" class="lead3">Every week, 3 winners with the most creative answers will walk away with a <br />FREE RevitaLens Starter Kit and a StaZen Astaxanthin worth $49.50</p>
				<img src="i/astaxanthin.jpg" alt="astaxanthin" class="astaxanthin" /><div id="benefits">
					<div class="b b1">
						<div class='box'>Benefit<br /><span>1</span></div>
						<div class='below'>Protects <br />Your Vision</div>
					</div>
					<div class="b b2">
						<div class='box'>Benefit<br /><span>2</span></div>
						<div class='below'>Sun <br />Protection</div>
					</div>
					<div class="b b3">
						<div class='box'>Benefit<br /><span>3</span></div>
						<div class='below'>Powerful Antioxidant</div>
					</div>
				</div>
				<br /><br />
				
				<p align="center">Stazen Astaxanthin helps to increase blood flow to your retina:</p>
				<ul>
					<li>Protects tired eyes</li>
					<li>Helps you see better</li>
					<li>Keeps eyes young </li>
				</ul>
				<div class="clear"></div>

			</div><!-- /XXX -->
			<div id="p3" class="tnc">
				<p><strong>Terms and conditions apply:</strong></p>
				<ol>
					<li>This contest is valid from 12 May 2014 to 2 June 2014 or while stocks last.</li>
					<li>This contest is open to participants residing in Singapore.</li>
					<li>Only one entry per entrant will be accepted.</li>
					<li>Representatives of Sainhall Nutrihealth will pick the most creative amongst all eligible entries as the 3 lucky winners for StaZen Astaxanthin every week. Sainhall Nutrihealth's decision is final and binding. No correspondence will be entertained about Sainhall Nutrihealth's decision. </li>
					<li>Winners' names for Revitalens Starter Kit / StaZen Astaxanthin will be posted on Vitamin.sg Facebook page.</li>
					<li>Free samples / gifts are non-transferable and non-exchangeable for cash, and will be mailed to the mailing address submitted on the contest entry form.</li>
					<li>By entering the contest, you agree to the use of the information submitted on the contest entry form, without compensation, for Sainhall Nutrihealth's promotional and marketing purposes. </li> 
				</ol>
 

				
			</div><!-- /XXX -->
			<div id="p4">
				This contest is in no way sponsored, endorsed or administered by, or associated with, Facebook.
			</div>
		</div>
	</div><!-- container -->

</body>

</html>