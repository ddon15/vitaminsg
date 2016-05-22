<script type="text/javaScript">
function validateNewsletterSub() {
    
	var sub_name = $("#newsletter_sub_name").val();
	var valid = true;
	if(sub_name=="" || sub_name==null) {
		$("#newsletter_sub_name_error").css('display','inline');
		valid = false;
	}
	else {
		$("#newsletter_sub_name_error").css('display','none');
	}
	
    var sub_email = $("#newsletter_sub_email").val();
	var mail_test = /\S+@\S+\.\S+/;
    if (!mail_test.test(sub_email) || sub_email=="" || sub_email==null) {
		$("#newsletter_sub_email_error").css('display','inline');
		valid = false;
	}
	else {
		$("#newsletter_sub_email_error").css('display','none');
	}

	if($("#newsletter_sub_consent").prop('checked')) {
		$("#newsletter_sub_consent_error").css('display','none');
	}
	else {
		$("#newsletter_sub_consent_error").css('display','inline');
		valid = false;
	}
	
	return valid;
}
</script>

<form id="vit_newsletter_subscribe" name="vit_newsletter_subscribe" onsubmit="return validateNewsletterSub();" action="http://www.vitamin.sg/sendy/subscribe" method="post" target="_blank" accept-charset="utf-8">
	<div class="footer_subscribe clearfix">
		<p>*Name: <input id="newsletter_sub_name" name="name" type="text" />
		<span id="newsletter_sub_name_error" style="display:none;color:#ef4035;">Please enter a valid name</span></p>
		<p>*Email: <input id="newsletter_sub_email" name="email" type="text" />
		<span id="newsletter_sub_email_error" style="display:none;;color:#ef4035;">Please enter a valid email</span></p>
		<input type="hidden" name="list" value="yZwGsjX1gik65kz6Fsovpw">
		<div>
		<p><input id="newsletter_sub_consent" name="subscribe_consent" type="checkbox" /> I consent to the use of my particulars provided to receive the latest updates on new product, exclusive offers, promotions and contests from Vitamin.sg.
		<span id="newsletter_sub_consent_error" style="display:none;color:#ef4035;">Please consent to the terms</span></p>
		</div>

		<div class="buttons">
			<div class="right"><input type="submit" value="Send me the hottest deals!" class="button" /></div>
		</div>
	</div>
</form>