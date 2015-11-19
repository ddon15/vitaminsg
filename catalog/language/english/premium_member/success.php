<?php
// Heading
$_['heading_title'] = 'You are now a Vitamin.sg Member!';

$conversion_tracking = '<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1054953748;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "kg3wCLjWkQkQlKKF9wM";
var google_conversion_value = 1.000000;
var google_remarketing_only = false;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/1054953748/?value=1.000000&amp;label=kg3wCLjWkQkQlKKF9wM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>';

// Text
//$_['text_message']  = '<p>Thank You for becoming our Premium Member! You can now take advantage of Premium privileges such as exclusive product offers and invitation to seminars.</p> <p>A confirmation has been sent to the provided email address.</p>';
//[MY]
$_['text_message'] = $conversion_tracking . '<p>Thank you for registering with <a href="index.php">Vitamin.sg</a>! </p>
                      <p>We’ve sent you an email, detailing the instructions and benefits of registering an account with us.</p>
                      <p>Begin your shopping experience at <a href="index.php?route=account/login">Vitamin.sg</a>! </p>';

$_['text_premium_member']  = 'Member';
$_['text_success']  = 'Success';

?>