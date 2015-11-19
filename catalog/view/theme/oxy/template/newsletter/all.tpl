<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<section id="content" class="columns op"><?php echo $content_top; ?>
  <h1><?php echo $heading_title; ?></h1>
  <ul class="breadcrumbs">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul> 
  <?php echo $description; ?>
  
  <script type="text/javaScript">
function validateNewsletterSub2() {
    
	var sub_name = $("#newsletter_sub_name2").val();
	var valid = true;
	if(sub_name=="" || sub_name==null) {
		$("#newsletter_sub_name_error2").css('display','inline');
		valid = false;
	}
	else {
		$("#newsletter_sub_name_error2").css('display','none');
	}
	
    var sub_email = $("#newsletter_sub_email2").val();
	var mail_test = /\S+@\S+\.\S+/;
    if (!mail_test.test(sub_email) || sub_email=="" || sub_email==null) {
		$("#newsletter_sub_email_error2").css('display','inline');
		valid = false;
	}
	else {
		$("#newsletter_sub_email_error2").css('display','none');
	}

	if($("#newsletter_sub_consent2").prop('checked')) {
		$("#newsletter_sub_consent_error2").css('display','none');
	}
	else {
		$("#newsletter_sub_consent_error2").css('display','inline');
		valid = false;
	}
	
	return valid;
}
</script>

	<p>Enjoy $10 off when you subscribe to our eNewsletter.</p>

	<form id="vit_newsletter_subscribe2" onsubmit="return validateNewsletterSub2();" action="http://www.vitamin.sg/sendy/subscribe" method="post" target="_blank" accept-charset="utf-8">
		<div class="content">
			<table class="form">
				<tbody><tr>
					<td><span class="required">*</span> Name: </td>
					<td><input id="newsletter_sub_name2" name="name" type="text" />
						<span id="newsletter_sub_name_error2" style="display:none;color:#ef4035;">Please enter a valid name</span>
					</td>
				</tr>
				<tr>
					<td><span class="required">*</span> Email: </td>
					<td><input id="newsletter_sub_email2" name="email" type="text" />
						<span id="newsletter_sub_email_error2" style="display:none;;color:#ef4035;">Please enter a valid email</span></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="hidden" name="list" value="yZwGsjX1gik65kz6Fsovpw">
						<input id="newsletter_sub_consent2" name="subscribe_consent" type="checkbox" /> I consent to the use of my particulars provided to receive the latest updates on new product, exclusive offers, promotions and contests from Vitamin.sg.
						<span id="newsletter_sub_consent_error2" style="display:none;color:#ef4035;">Please consent to the terms</span></td>
				</tr>
			</tbody></table> <!-- end table.form -->
		</div>
		<div class="buttons">
			<div class="right"><input type="submit" value="Subscribe" class="button" /></div>
		</div>
	</form>
 
  
</section>
<?php echo $footer; ?>
