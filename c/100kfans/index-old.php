<!DOCTYPE html>
<html>

<head>
	
	<meta charset="utf-8" />
	<title>Vitamin.sg - 100K Fans Celebration!</title>
	
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/ui-lightness/jquery-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
		
	<!-- JS: JQuery, JQueryUI, ChromeFrame, Modernizr, Prefix Free -->	
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/prefixfree.js"></script>
	
</head>

<body>

	<div id="container">
	
		<div id="content">
			<div class='introhead'>Only the first <strong>250</strong> get it!</div>
			<div class="intro">
				<p style="font-size: 1.2em;"><strong>100,000</strong> Hawaiian Spirulina giveaway (worth more than <strong>$21,000</strong>)!</p>
				<p>Snap a photo of yourself with the “I LOVE VITAMIN.SG” sign and send it to us – follow the instructions below. </p>
				<p>Be creative and you will win a FREE bottle of StaZen Spirulina (worth <strong>$85</strong>)!</p>				
			</div>
		
			<div class="spirulina">
				<a href="http://www.vitamin.sg/products/stazen-spirulina-pacifica-500mg-400-tablets"><img src="spirulina-img.jpg" alt="Spirulina" /></a>
			</div>
			

			
			<div class="participate">

				<h2 style="text-transform: uppercase; ">How to participate</h2>
				<img src="ilovevitamin.jpg" class="model"/>
				<ol>
					<li>Download the “I LOVE VITAMIN.SG” sign <strong><a target="blank" href="ilovevitaminsgsign.pdf">HERE</a></strong>.</li>
					<li>Be creative and take a photo shot of yourself with the sign.</li>
					<li>Send the photo to <strong>info@vitamin.sg</strong>. Please indicate the following information in the email body content:
						<ul>
							<li>Full Name</li>
							<li>Identification Number</li>
							<li>Date of Birth (i.e. 12 January 1990)</li>
							<li>Mobile No</li>
							<li>Email Address</li>
							<li>Include this liner at the end of the email: "By entering this contest, you have agreed to the terms and conditions."</li>
						</ul>
					</li>
				</ol>
				<p>Contest will end on 9 Feb 2014. Winners will be notified by 14 Feb 2014 via email on the self-collection details (for the FREE StaZen Spirulina).</p>
				<p><strong>Here are some entries for your inspiration!</strong></p>
			    <div id="images">
			    	<?php 
			    		$files = scandir ("images");
			    		shuffle($files);
			    		$i = 1;
			    		foreach ($files as $file) {
			    			$rand = rand(-15, 15);
				    		if ($file != "." && $file != ".." && $i <= 10) {
					    		echo('<img src="images/'. $file .'" style="transition-duration: 0.5s;transform:rotate('. $rand . 'deg)" />');
					    		$i++;
				    		}
			    		}
			    		
			    	 ?>
			    </div>				
			</div>
			
			<div class="terms">
				<p><strong>Terms and Conditions</strong></p>
				<ol>
					<li>This contest is open to participants residing in Singapore only.</li>
					<li>The photo naming must follow this format: firstname_lastname.jpg (i.e. john_tan.jpg or ahseng_lim.jpg).</li>
					<li>Any incorrect or incomplete information will result in the disqualification of the entry.  </li>
					<li>You agree that all the data submitted in the entry may be used by Sainhall Nutrihealth Pte Ltd for any marketing purposes. The Personal Data which relates to you will not be disclosed to any third parties without your consent (exemption applies, please refer to our <a href="http://www.vitamin.sg/page.php?CategoryID=112">Privacy Policy</a>).</li>
					<li>You hereby agree and consent to the public disclosure and use of your name and image for publicity purposes and to participate in the publicity activities in relation to the contest, without payment or compensation, if your photos win or are shortlisted.</li>
					<li>Unclaimed prizes by 28 Feb 2014 will be forfeited. </li>
					<li>Sainhall Nutrihealth Pte Ltd reserves the right to disqualify any entries deem unsuitable for the contest.</li>
					<li>Sainhall Nutrihealth Pte Ltd reserves the right at any time in our absolute discretion to cancel or modify the contest, withdraw or cancel the prizes without prior notice and without having to disclose any reason therefore and without payment or compensation whatsoever.</li>
					<li>The decision of Sainhall Nutrihealth Pte Ltd shall be final, conclusive and binding on all participants and winners, and no correspondence will be entertained.</li>
				</ol>
			</div>


		
		
		
		
		
		
		</div>



		
	</div><!-- container -->

</body>

</html>