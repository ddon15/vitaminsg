jQuery(document).ready(function($) {
	
	function validateEmail(email) { 
	    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	    return re.test(email);
	} 	
	
	
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
		reso = $('#resolution').val();
		vsource = $('#vsource').val();
		tnc = $('#tnc:checked').length;
	
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
		if (reso == "") {
			errors.push("Please let us know your 2015 new year's resolutions.");
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
			var list_id = "SdtXLNzINsEt0t6PhIvJhQ";

			var postvars = {
					name: fname,
					email: emailaddr,
					Mobile: mob,
					Address: addr,
					Resolution: reso,
					list: list_id,
					boolean: true
			};
			if (vsource != '') {
				postvars.vsource = vsource;
			}

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
						$('#reso').val('');
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