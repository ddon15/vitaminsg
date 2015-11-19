jQuery(document).ready(function($) {
	
	function validateEmail(email) { 
	    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	    return re.test(email);
	} 
	
	$('[data-toggle="tooltip"]').tooltip();
	
	$('.tncswal').on('click', function () {
		var tnc = $(".tncwrap").html();
		swal({
			title: "Terms and Conditions",   
			text: tnc,
			type: "info",	
			confirmButtonText: "OK" });
		return false;
	});
	
	$('#addtosendy').on('click', function () {
		
		//retrieve values
		fname = $('#fname').val();
		emailaddr = $('#emailaddr').val();
		mob = $('#mobile').val();
		addr = $('#address').val();
		tnc = $('#tnc:checked').length;
		utm_source = $('#utm_source').val();
		utm_campaign = $('#utm_campaign').val();
		utm_medium = $('#utm_medium').val();
	
		//validate
		var errors = [];
		if (fname == "") {
			errors.push("Please enter your name.");
		}
		if (!validateEmail(emailaddr)) {
			errors.push("Please enter a valid email address.");
		}
		if (mob == "") {
			errors.push("Please enter a valid mobile number.");
		}
		if (addr == "") {
			errors.push("Please enter your mailing address.");
		}
		if (tnc == 0) {
			errors.push("Please agree to the terms and conditions.");
		}
		
		if (errors.length) {
			//there are errors
			
			swal({
				title: "Error",   
				text: errors.join("<br/>"),
				type: "error",	
				confirmButtonText: "OK" });
		}
		else {
			//no errors proceed with POST
			var subscribe_url = "http://www.vitamin.sg/sendy/subscribe";
			var list_id = "892gZi8LutwM8Hj0RvGMtLUg";

			var postvars = {
					name: fname,
					email: emailaddr,
					Mobile: mob,
					Address: addr,
					utm_source: utm_source,
					utm_campaign: utm_campaign,
					utm_medium: utm_medium,
					list: list_id,
					boolean: true
			};

			$.post(
				subscribe_url,
				postvars,
				function (data, textStatus, jqXHR) {
					
					if (data == "1") {
						
						//successful
						swal({
							title: "Thank You!",   
							text: "We will send you the giveaway collection details to your email address shortly.",
							type: "success",	
							confirmButtonText: "OK" });	
							
						$('#fname').val('');
						$('#emailaddr').val('');
						$('#mobile').val('');
						$('#address').val('');
						$('#tnc').val(0);
				
					}
					else {
						
						//POST, error
						
						if (data == "Already subscribed.") {
							data = "You are already signed up for this giveaway!";
						}
						if (data == "Invalid email address.") {
							data = "Please enter a valid email address";
						}
						swal({
							title: "Error",   
							text: data,
							type: "error",	
							confirmButtonText: "OK" });
					}
					
				}			
			);
		}
		return false;		
	});
	
});