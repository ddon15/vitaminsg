jQuery(document).ready(function($) {
	
	$('img.heart').on('click', function () {

		$theheart = $(this);
		
		if ($theheart.hasClass('raw')) {
		
			$(this).removeClass('raw');
			$.post(
				'result.php',
				{ 
					frmmobile: $('#frmmobile').val(), 
					ticket: $('#ticket').val()
				},
				function (data) {
					$('#message .win').html("<strong>" + data + "</strong>");
					$("img.heart").not($theheart).hide();
					$theheart
						.attr('src', 'images/heartopen.png')
						.css('zIndex', 20)
						.animate({
							top: "0",
							left: "19px",
							width: "802px",
							height: "698px",
							}, 
							400, 
							'swing', 
							function () {
								$('#message').fadeIn();
							}
						);
					
				}
			); // post
			
		}
	});
	
});