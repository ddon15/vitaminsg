<?php include('header.php'); ?>

<section id="midsection"><div class="row">

	<section id="content" class="asta twelve columns">

		<div id="astalp">

			<?php echo $status; ?>

			<div id="alogo"><img src="logo.png" alt="logo" /></div>
			
			<div class="clearfix">
				<div id='mainbox'>
					<img src="mainbox.jpg" alt="main box" id="mb" />
					<img src="mainbox2.jpg" alt="main box" id="mb2" />
				</div>
				
				<div id="theform"><form method="post">
					<h2>REGISTER TO REDEEM</h2>
					<ul>
						<li>50% off discount code for StaZen Astaxanthin (U.P. $49.50) and;</li>
						<li>FREE Astaxanthin Book by William Sears, Best Selling Author of over 40 books (worth $20) and;</li>
						<li>FREE CLIF LUNA Nutrition Bars (worth $10) and;</li>
						<li>FREE delivery <em>(for Singapore addresses only)</em></li>
					</ul>
					<div><input type="text" placeholder="First Name" name="fname" value="<?php echo $formdata['fname']; ?>" required="required" /></div>
					<div><input type="text" placeholder="Last Name" name="lname" value="<?php echo $formdata['lname']; ?>" required="required" /></div>
					<div><input type="text" placeholder="Mobile No." name="mobile" value="<?php echo $formdata['mobile']; ?>" required="required" /></div>
					<div><input type="email" placeholder="Email Address" name="email" value="<?php echo $formdata['email']; ?>" required="required" /></div>
					<div id="tnc"><input type="checkbox" name="tnc" value="1" required="required"/> I have read and agreed to the <a id="gotnc" href="#">Terms and Conditions</a></div>
					<div><input type="submit" value="Submit" id="submitbtn"/><input type='hidden' name='frm_submitted' value='1' /></div>
				</form></div>
			</div>
			<div id="aftermain"></div>

		</div>

		<div id="lightbox">
			<div id="lightbox-wrapper">
				<div id="lightbox-content">
					<div id="lightbox-close">x</div>
					<h2>Terms & Condition</h2>
					<p>Please read the terms and conditions carefully. By submitting your details, you agree to be bound by these terms and conditions.</p>
					<ol>
						<li>Discount code for 50% off StaZen Astaxanthin will be sent to the registered email address. </li>
						<li>Free delivery (for Singapore addresses only) only applies if used together with the discount coupon.</li>
						<li>Free Astaxanthin book will be included if purchase for StaZen Astaxanthin is made using the discount coupon.</li>
						<li>If no purchase is made, FREE CLIF LUNA Nutrition Bars have to be self-collected at 59 Jalan Pemimpin, #02-02 L&Y Building, Singapore 577218 by 21 Nov 2014. (Operating hours: Mon to Fri, 9am to 5pm)</li>
						<li>Unclaimed freebies will not be available after 21 Nov 2014.</li>
						<li>You will receive marketing information via email and SMS from Vitamin.sg. This information will include new products, promotions, contests and health articles/tips. If you change your mind at any time and wish to un-subscribe, you may do so easily via the un-subscribe link found on each email and SMS.</li>
					</ol>
				</div>
			</div>
		</div>

		
	</section>

</div></section>


<?php include('footer.php'); ?>
