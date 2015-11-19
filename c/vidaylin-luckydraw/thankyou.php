<?php include ('processform.php'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    
    <title>Vidaylin Lucky Draw</title>
    
    <!-- Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Noto+Sans:400,700|Lora:700' rel='stylesheet' type='text/css'>
    <link href="lib/sweet-alert.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet">
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>


<div id='header-wrap'>
    <div class='container' id='header'>
        <div class='row'>
            <div class='col-sm-12'>
                <img src="images/logo.png" alt="Abbott and Vitamin Logo" class='img-responsive' />
                <h1>Thank You!</h1>
            </div>
        </div>
    </div>
</div>


<div class='container' id='content'>
    <div class='row'>
		<div class='col-sm-12' id='thankyou-description'>
			<p class='lead'>Thank You for Entering the Lucky Draw Contest!</p>
			<p>As Lucky Draw winners will be notified via email, do check your email to receive updates.</p>
			<p>You may be one of the Lucky Draw winners to get a free Abbott Vidaylin Minibear Gummies (worth S$23.80)!</p>
		</div>
    </div>

</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="lib/sweet-alert.js"></script>
<script>
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
</script>

</body>
</html>