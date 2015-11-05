jQuery(document).ready(function($) {
	$('#lightbox-close').on('click', function() {
		$('#lightbox').fadeOut();
		return false;
	});
	$('#gotnc').on('click', function() {
		$('#lightbox').fadeIn();
		return false;
	});
	
});