<?php
// Heading
//[MY]
$_['heading_title'] = 'Your Order Has Been Submitted!';

// Text

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

//[MY]
$_['text_customer'] = $conversion_tracking . '<p>We have successfully received your order and payment for Order No. %s.</p>
    <p>You can view your order history on <a href="%s">My Account</a> > <a href="%s">Order History</a>.</p>
    <p>For purchase with downloadable content, you can download it from <a href="%s">My Account</a> > <a href="%s">Downloads</a></p>
    <p>For any enquiries, please <a href="%s">contact us</a>.</p>
    <p>Thank you for shopping at Vitamin.sg!</p>';
$_['text_guest'] = $conversion_tracking . '<p>We have successfully received your order and payment for Order No. %s.</p>
    <p>For any enquiries, please <a href="%s">contact us</a>.</p>
    <p>Thank you for shopping at Vitamin.sg!</p>';
//$_['text_customer'] = '<p>Your order has been successfully processed!</p><p>You can view your order history by going to the <a href="%s">my account</a> page and by clicking on <a href="%s">history</a>.</p><p>If your purchase has an associated download, you can go to the account <a href="%s">downloads</a> page to view them.</p><p>Please direct any questions you have to the <a href="%s">store owner</a>.</p><p>Thanks for shopping with us online!</p>';
//$_['text_guest']    = '<p>Your order has been successfully processed!</p><p>Please direct any questions you have to the <a href="%s">store owner</a>.</p><p>Thanks for shopping with us online!</p>';
$_['text_basket']   = 'Shopping Cart';
$_['text_checkout'] = 'Checkout';
$_['text_success']  = 'Success';

?>