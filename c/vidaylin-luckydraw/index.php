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
                <h1>Enter and stand a chance to win <br />Abbott Vidaylin Minibear Gummies (worth $23.80)!</h1>
            </div>
        </div>
    </div>
</div>


<div class='container' id='content'>
    <div class='row'>
        <div class='col-sm-4 col-md-2' id='hero'>
            <img src='images/vidaylin.png' class='img-responsive' alt='Vidaylin'/>
        </div>
		<div class='col-sm-8 col-md-6' id='description'>
			<p class='lead'><strong>Vidaylin Minibear Gummies offers your children a delicious alternative: berry-flavoured chewable gummies! It is neither awful tasting nor a giant pill.</strong></p>
			<p>It only takes one gummy to nourish your children with the nutrients of 5 garden vegetables and 9 vitamins that are essential for their growth and development.</p>
			<p>Your children will be chewing on the goodness of tomato, spinach, carrot, beetroot and artichoke. They will also benefit from a dose of <em>Vitamin A, Vitamin D3, Vitamin E, Vitamin C, Vitamin B6, Vitamin B12, Niacin, Biotin and Folic Acid.</em></p>
			<p>Keep your children healthy today with Vidaylin Minibear Gummies! </p>
			<div id='winwinwin' class='clearfix'>
    		    <img src="images/winwinwin.jpg" class='pull-left' />
    			<p><strong>With Abbot's Vidaylin Minibear Gummies, it is a win-win-win situation for you.</strong></p>
    			<p>Because you, your friends, and your children benefit!<br />
				Who doesn't know that when children are happy and healthy, so are their parents!</p>
            </div>
            <p><strong>Fill in the form to stand a chance to win a free bottle of Vidaylin!</strong></p>
            <img src="images/guiding-arrow.png" alt="Guiding Arrow" class='hidden-xs hidden-sm' id="guidingarrow"/>
		</div>
        <div class='col-sm-12 col-md-4' id='mainform'>
            <?php echo $status; ?>
            <div id='formwrap'>
                <h4><strong>Enter Your Details to <br />Stand a Chance to Win!</strong></h4>
                <form method='POST'>
                    <div class='form-group'>
                        <label>Name</label>
                        <div><input type='text' required="required" value='<?php echo htmlspecialchars($name); ?>' name='name' class='form-control'/></div>
                    </div>
                    <div class='form-group'>
                        <label>Email Address</label>
                        <div><input type='email' required="required" value='<?php echo htmlspecialchars($emailaddr); ?>' name='emailaddr' class='form-control'/></div>
                    </div>
                    <div class='form-group'>
                        <label>Mobile No.</label>
                        <div><input type='text' required="required" value='<?php echo htmlspecialchars($mobile); ?>' name='mobile' class='form-control'/></div>
                    </div>
                    <div class='form-group'>
                        <label>Mailing Address (Singapore Only)</label>
                        <div><textarea type='text' required="required" name='address' class='form-control'/><?php echo htmlspecialchars($address); ?></textarea></div>
                    </div>
                    <div class='form-group'>
						<input type="checkbox" id="tnc" name="tnc" value="agree" required="required">&nbsp;&nbsp;&nbsp;I agree to the <a href="#" class='tncswal'>Terms and Conditions</a>
                    </div>
                    <div class='form-group'>
                        <div><button type='submit' class='btn btn-danger'>Get me into the lucky draw! &raquo;</button></div>
                        <input type='hidden' name='frm_submitted' value='1' />
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>


<div class='tncwrap hidden'>
	<div class='tnc'>
	<ul>    	
		<li>This Lucky Draw is valid from [Date] to [Date].</li>
		<li>Lucky Draw submission must be completed in full by the closing date. Failure to do so will result in disqualification.</li>
		<li>This Lucky Draw is open to participants residing in Singapore only, and may be withdrawn at any time at the company’s discretion.</li>
		<li>Sainhall Nutrihealth Pte Ltd will pick the Lucky Draw winners from eligible entries. No correspondence will be entertained about the results.</li>
		<li>Lucky Draw winners will be notified via email.</li>
		<li>Lucky Draw gifts are non-transferable and non-exchangeable for cash or other items, and may be subject to availability. </li>
		<li>Sainhall Nutrihealth Pte Ltd reserves the right to replace the gift item with another item of a similar value without prior notice. </li>
		<li>By participating in this lucky draw, you agree to receive future promotional/ marketing information via email from Sainhall Nutrihealth Pte Ltd.</li>
	</ul>
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