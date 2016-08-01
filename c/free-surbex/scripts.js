jQuery(document).ready(function($) {
	$('.tncswal').on('click', function () {
		var tnc = $(".tncwrap").html();
		swal({
			title: "Terms and Conditions",   
			text: tnc,
			type: "info",	
			confirmButtonText: "OK" });
		return false;
	});
});