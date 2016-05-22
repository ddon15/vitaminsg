<?php
// Heading 
$_['heading_title']        = 'Register for Membership';

// Text
$_['text_title']         = 'PERKS OF BECOMING A<br><strong>VITAMIN.SG MEMBER</strong>';
$_['text_subscribe_price']         = '<strong>$35.00</strong> <span style="font-size:18px;text-decoration:line-through;">U.P. $70</span><br><span style="font-size:16px">2 YEARS SUBSCRIPTION</span>';

$freegift_enddate = "2015-12-31 00:00";
$num_freegift_left = intval((strtotime($freegift_enddate) - time()) / ( 60 * 60 * 24 ) * 1.33) ;
//$num_freegift_left = 117;
$_['text_freegift']         = '<span>NEW MEMBERS GET A</span><br/><strong>FREE Blackmores Fish Oil 1000, 120s<br />(Worth $32.00)</strong><br /><span><em>Limited Qty: ' . $num_freegift_left . '  Bottles Left!</em></span>';

$_['text_account']         = 'Membership';
$_['text_register']        = 'Register';
$_['text_account_already'] = 'If you already have an account with us, please login at the <a href="%s">login page</a>.';

$_['text_perks_member_special']        = '10% STOREWIDE<br>INSTANTLY<br>&nbsp;';
$_['text_perks_product_offer']        = 'EARN POINTS,<br>CASH REBATES,<br>REDEEM GIFTS';
$_['text_perks_health_newsletter']        = 'FIRST-HAND<br>UPDATES<br>&nbsp;';
$_['text_perks_seminar_invitation']        = 'MEMBER-ONLY<br>INVITATION<br>&nbsp;';

$_['text_intro']    = '<strong>Vitamin.sg</strong> membership offers you exclusivity to special promotions, discounts, events and rewards. It\'s our way of saying THANK YOU!
<br><br>
<strong>It pays to get these all year round privileges:</strong>
<ul>
	<li>10% off all items, up to 50% off selected items. Brand exclusions apply.</li>
	<li><a style="font-size: 16px;" href="/index.php?route=rewards/home">Earn Vit$ for your purchases</a></li>
	<li><a style="font-size: 16px;" href="/index.php?route=rewards/earn_redeem">Redeem Vit$ to offset purchases / for attractive gifts</a></li>
	<li>Be rewarded with exclusive treats</li>
	<li>Exclusive invitations to special events</li>
	<li>Receive first-hand updates on health articles/tips, new product info, discounts, special offers and exciting contests</li>
</ul>
And most importantly, <strong>Vitamin.sg</strong> member can track order status, reorder conveniently, view purchase history and update your particulars easily!';

$_['text_your_details']    = 'Your Personal Details';
$_['text_your_address']    = 'Your Address';
$_['text_notifications']      = 'Notifications';
$_['text_signup']      = 'I want to subscribe to the following:';
$_['text_your_password']   = 'Your Password';
$_['text_agree']           = 'You must agree to the <a class="colorbox" href="%s" alt="%s"><b>%s</b> to continue.</a>';
$_['text_address_instructions'] = 'Block/House Number and Street Name';
$_['text_address2_instructions'] = 'Unit Number - if applicable';

$_['text_password_instructions'] = 'Password must be between 8-20 character length.';

$_['text_male']    = 'Male';
$_['text_female']    = 'Female';

$_['text_id_number_help'] = 'NRIC - for Singaporeans, e.g. S1234567A; Passport No. - for non-Singaporeans';

// Entry
$_['entry_firstname']      = 'First Name:';
$_['entry_lastname']       = 'Last Name:';
$_['entry_email']          = 'E-Mail:';
$_['entry_id_number']      = 'NRIC / Passport No.:';

$_['entry_telephone']      = 'Mobile Number:';
$_['entry_address_1']      = 'Address 1:';
$_['entry_address_2']      = 'Address 2:';
$_['entry_postcode']       = 'Postal Code:';
$_['entry_city']           = 'City:';
$_['entry_country']        = 'Country:';
$_['entry_zone']           = 'Region / State:';
$_['entry_newsletter']     = 'E-Newsletter:';
$_['entry_sms']     	   = 'SMS:';
$_['entry_password']       = 'Password:';
$_['entry_confirm']        = 'Confirm Password:';

$_['entry_dob'] = 'Date of Birth:';
$_['entry_gender'] = 'Gender:';
$_['entry_health_interest'] = 'Health Interest:';

// Error
$_['error_firstname']      = 'Please enter a valid First name';
$_['error_lastname']       = 'Please enter a valid Last name';
$_['error_email']          = 'Please enter a valid email';
$_['error_id_number']      = 'Please enter a valid NRIC/Passport Number';
$_['error_telephone']      = 'Please enter a valid mobile number';
$_['error_password']       = 'Password must be between 8 and 20 characters';
$_['error_confirm']        = 'Please enter the same password';
$_['error_address_1']      = 'Please enter a valid address';
$_['error_city']           = 'Please enter a valid city';
$_['error_postcode']       = 'Please enter a valid postal code';
$_['error_country']        = 'Please select a country';
$_['error_zone']           = 'Please select a region / state';
$_['error_agree']          = 'Warning: You must agree to the %s';

$_['error_firstname_empty']          = 'First Name is required';
$_['error_lastname_empty']           = 'Last Name is required';
$_['error_email_empty']               = 'Email is required';
$_['error_id_number_empty']           = 'NRIC/Passport Number is required';
$_['error_telephone_empty']           = 'Mobile Number is required';
$_['error_dob_empty']                 = 'DOB is required';
//$_['error_password_empty']            = 'Password must be between 8 and 20 characters';
$_['error_confirm_empty']             = 'Confirmation Password is required';
$_['error_address_1_empty']           = 'Address is required';
$_['error_city_empty']                = 'City is required';
$_['error_postcode_empty']            = 'Postal Code is required';
$_['error_country_empty']             = 'Country is required';
$_['error_zone_empty']                = 'Zone is required';

$_['error_dob'] = 'Please enter your Date of Birth in YYYY-MM-DD format';

$_['error_warning']          = 'Please verify your entries';
$_['error_account_exists'] = 'An account with the email entered already exists. Please login to the account if you want to extend your membership.';
?>