
jQuery(document).ready(function($) {
	

	/* Cross Browser Placeholder */
	if(!Modernizr.input.placeholder){
		$('[placeholder]').focus(function() {
			var input = $(this);
			if (input.val() == input.attr('placeholder')) {
				input.val('');
				input.removeClass('placeholder');
				}
		})
		.blur(function() {
			var input = $(this);
			if (input.val() == '' || input.val() == input.attr('placeholder')) {
				input.addClass('placeholder');
				input.val(input.attr('placeholder'));
			}
		})
		.blur();
			$('[placeholder]').parents('form').submit(function() {
			$(this).find('[placeholder]').each(function() {
				var input = $(this);
				if (input.val() == input.attr('placeholder')) {
					input.val('');
				}
			})
		});
	}

	
	$('#submitform').on('click', function () {
	
		if ($('#agree').filter(":checked").length != 1) {
			alert("Please read and agree to the terms and conditions");
			return false;
		}
		else {
	
			var errors = new Array();
					
			if ($("#firstname").val().trim() == "") {
				errors.push('Please enter your first name');
			}
			if ($("#lastname").val().trim() == "") {
				errors.push('Please enter your last name');
			}
			if ($("#dob").val().trim() == "") {
				errors.push('Please enter your date of birth');
			}
			if ($("#emailaddr").val().trim() == "") {
				errors.push('Please enter your email address');
			}
			if ($("#mobileno").val().trim() == "") {
				errors.push('Please enter your mobile number');
			}
			
			if (errors.length) {
				alert(errors.join("\n"));
				return false;
			}
		}
			
	});	
	
});