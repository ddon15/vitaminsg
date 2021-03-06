<?php
// Heading 
$_['heading_title']                  = 'Checkout';

// Text
$_['text_cart']                      = 'Shopping Cart';
$_['text_checkout_option']           = 'Step 1: Checkout Options';
$_['text_checkout_account']          = 'Step 2: Account &amp; Billing Details';
$_['text_checkout_payment_address']  = 'Step 2: Billing Details';
$_['text_checkout_shipping_address'] = 'Step 3: Delivery Details';
$_['text_checkout_shipping_method']  = 'Step 4: Delivery Method';
$_['text_checkout_payment_method']   = 'Step 5: Payment Method';
$_['text_checkout_confirm']          = 'Step 6: Confirm Order';
$_['text_modify']                    = 'Modify &raquo;';
$_['text_new_customer']              = 'New Customer';
$_['text_returning_customer']        = 'Login - Member/ Existing Customer'; //[SB] Changed text
$_['text_checkout']                  = 'Checkout Options:';
$_['text_i_am_returning_customer']   = ' '; //[SB] Changed text
$_['text_register']                  = 'Join as Member';
$_['text_guest']                     = 'Guest Checkout';
$_['text_register_account']          = 'Register an account with us to enjoy the following benefits:
<ul style="list-style-position: inside;list-style-type:disc;"><li>Easy re-order with Vitamin.sg</li>
<li>Add your favourite items to the Wish List and share with friends</li>
<li>Be updated on exclusive coupon codes to enjoy great savings</li>';
$_['text_better_shipping']           = 'Please contact us to enquire about better shipping rates for shipping fees above $45'; //[SB] Added for per item shipping
//[MY]
//$_['text_forgotten']                 = 'Forgotten Password';
$_['text_forgotten'] = 'Forgot your password?';
$_['text_your_details']              = 'Your Personal Details';
$_['text_your_address']              = 'Your Address';
$_['text_your_password']             = 'Your Password';
$_['text_agree']           = 'You must agree to the <a class="colorbox" href="%s" alt="%s"><b>%s</b> to continue.</a>';
$_['text_address_new']               = 'I want to use a new address';
$_['text_address_existing']          = 'I want to use an existing address';
$_['text_shipping_method']           = 'Please select the preferred shipping method to use on this order.';
//[SB] Added shipping note
/*$_['text_local_shipping_note'] = '<strong>Note:</strong><ul style="list-style-type:disc;padding: 0 15px;">
<li>We have 3 delivery timeslots - <span style="color:#00A651;font-weight:bold;">Before 12 noon</span>, <span style="color:#00A651;font-weight:bold;">12.00pm to 5.00pm</span> and <span style="color:#00A651;font-weight:bold;">5.00pm to 8.00pm</span>.<br>If you wish to specify a delivery timeslot, please indicate your preference in the comments box.</li>
</ul>';*/
$_['text_local_shipping_note'] = '';

$_['text_payment_method']            = 'Please select the preferred payment method to use on this order.';
$_['text_comments']                  = 'Add Comments About Your Order';

$_['text_recurring_item']            = 'Recurring item';
$_['text_payment_profile']           = 'Payment Profile';
$_['text_trial_description']         = '%s every %d %s(s) for %d payment(s) then';
$_['text_payment_description']       = '%s every %d %s(s) for %d payment(s)';
$_['text_payment_until_canceled_description'] = '%s every %d %s(s) until canceled';
$_['text_day']                       = 'day';
$_['text_week']                      = 'week';
$_['text_semi_month']                = 'half-month';
$_['text_month']                     = 'month';
$_['text_year']                      = 'year';

$_['text_address_instructions'] = 'Block/House Number, Street Name, Unit Number'; //[SB] Added

//[SB]
$_['text_enter_coupon_hint'] = 'Do you have a Coupon Code? If you have one, please enter it at <a href="%s" style="float:none;font-weight:bold;">View Cart</a> to save on your purchase! ';

//[SB] Added Redemption
//$_['text_redemption_price']    = 'Vit$ '; 
//$_['text_redemption_total']    = 'Vit$ ';
$_['text_redemption_redeem_l']    = 'Item Redemption';
$_['text_redemption_redeem_r']    = '%s VIT$';

// Column
$_['column_name']                    = 'Product Name';
$_['column_model']                   = 'Model';
$_['column_quantity']                = 'Quantity';
$_['column_price']                   = 'Price';
$_['column_total']                   = 'Total';

// Entry
$_['entry_email_address']            = 'E-Mail Address:';
$_['entry_email']                    = 'E-Mail:';
$_['entry_password']                 = 'Password:';
$_['entry_confirm']                  = 'Confirm Password:';
$_['entry_firstname']                = 'First Name:';
$_['entry_lastname']                 = 'Last Name:';
$_['entry_telephone']                = 'Mobile Number:'; //[SB] Changed from telephone
$_['entry_dob']                      = 'Date of Birth:'; //[SB] Changed from dob
$_['entry_fax']                      = 'Fax:';
$_['entry_company']                  = 'Company:';
$_['entry_customer_group']           = 'Business Type:';
$_['entry_company_id']               = 'Company ID:';
$_['entry_tax_id']                   = 'Tax ID:';
$_['entry_address_1']                = 'Address 1:';
$_['entry_address_2']                = 'Address 2:';
$_['entry_postcode']                 = 'Postal Code:'; //[SB] Changed from Post Code
$_['entry_city']                     = 'City:';
$_['entry_country']                  = 'Country:';
$_['entry_zone']                     = 'Region / State:';
$_['entry_newsletter']               = 'I wish to subscribe to the %s newsletter.';
$_['entry_shipping'] 	             = 'My delivery and billing addresses are the same.';

// Error
$_['error_warning']                  = 'There was a problem while trying to process your order! If the problem persists please try selecting a different payment method or you can contact the store owner by <a href="%s">clicking here</a>.';
$_['error_login']                    = 'Warning: No match for E-Mail Address and/or Password.';
$_['error_approved']                 = 'Warning: Your account requires approval before you can login.';
$_['error_exists']                   = 'Warning: E-Mail Address is already registered!';//[MY]
$_['error_firstname']                = 'First Name must be between 1 and 32 characters!';
$_['error_lastname']                 = 'Last Name must be between 1 and 32 characters!';
$_['error_email']                    = 'E-Mail Address does not appear to be valid!';
$_['error_telephone']                = 'Telephone must be between 3 and 32 characters!';
$_['error_password']                 = 'Password must be between 3 and 20 characters!';
$_['error_confirm']                  = 'Password confirmation does not match password!';
$_['error_company_id']               = 'Company ID required!';
$_['error_tax_id']                   = 'Tax ID required!';
$_['error_vat']                      = 'VAT number is invalid!';
$_['error_address_1']                = 'Address 1 must be between 3 and 128 characters!';
$_['error_city']                     = 'City must be between 2 and 128 characters!';
$_['error_postcode']                 = 'Postcode must be between 2 and 10 characters!';
$_['error_country']                  = 'Please select a country!';
$_['error_zone']                     = 'Please select a region / state!';
$_['error_agree']                    = 'Warning: You must agree to the %s!';
$_['error_address']                  = 'Warning: You must select address!';
$_['error_shipping']                 = 'Warning: Shipping method required!';
$_['error_no_shipping']              = 'Warning: No Shipping options are available. Please <a href="%s">contact us</a> for assistance!';
$_['error_payment']                  = 'Warning: Payment method required!';
$_['error_no_payment']               = 'Warning: No Payment options are available. Please <a href="%s">contact us</a> for assistance!';

$_['text_trial']                    = '%s every %s %s for %s payments then ';
$_['text_recurring']                = '%s every %s %s';
$_['text_length']                   = ' for %s payments';

//[SB] Added Referral
$_['text_referral_total']  = 'Referrer';
?>
