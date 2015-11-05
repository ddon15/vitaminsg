<?php
// Heading  
$_['heading_title']          = 'Shopping Cart';

// Text
$_['text_success']           = 'You have added <a href="%s">%s</a> to your <a href="%s">shopping cart</a>!'; //[SB] Removed "Success:"
$_['text_remove']            = 'You have modified your shopping cart!'; //[SB] Removed "Success:"
$_['text_coupon']            = 'Your coupon discount has been applied!'; //[SB] Removed "Success:"
$_['text_voucher']           = 'Your gift voucher discount has been applied!'; //[SB] Removed "Success:"
$_['text_reward']            = 'Your VIT$ has been applied!'; //[SB] Changed Reward
$_['text_shipping']          = 'Your shipping estimate has been applied!'; //[SB] Removed "Success:"
$_['text_login']             = 'Attention: You must <a href="%s">login</a> or <a href="%s">create an account</a> to view prices!';
//$_['text_points']            = 'VIT$: %s'; //[SB] Changed Reward
$_['text_items']             = '%s item(s) - %s';
$_['text_referral']          = 'Your referral is verified.'; //[SB] Added Referral
$_['text_referral_total']    = 'Referrer'; //[SB] Added Referral
//[MY]
$_['text_next']              = 'What do you want to do next?';

$_['text_next_choice']       = 'Choose if you have a discount code or VIT$ you want to use or would like to estimate your delivery cost.'; //[SB] Changed Reward
$_['text_use_coupon']        = 'Use Coupon Code';
$_['text_use_voucher']       = 'Use Gift Voucher';
$_['text_use_reward']        = 'Redeem VIT$ (Balance: %s VIT$)'; //[SB] Changed Reward
$_['text_set_referral']      = 'Get Referral Coupon'; //[SB] Added Referral
$_['text_shipping_estimate'] = 'Estimate Shipping &amp; Taxes';
$_['text_shipping_detail']   = 'Enter your destination to get a shipping estimate.';
$_['text_shipping_method']   = 'Please select the preferred shipping method to use on this order.';
$_['text_empty']             = 'Your shopping cart is empty!';
$_['text_until_cancelled']   = 'until cancelled';
$_['text_recurring_item']    = 'Recurring item';
$_['text_payment_profile']   = 'Payment Profile';
$_['text_trial_description'] = '%s every %d %s(s) for %d payment(s) then';
$_['text_payment_description'] = '%s every %d %s(s) for %d payment(s)';
$_['text_payment_until_canceled_description'] = '%s every %d %s(s) until canceled';
$_['text_day']               = 'day';
$_['text_week']              = 'week';
$_['text_semi_month']        = 'half-month';
$_['text_month']             = 'month';
$_['text_year']              = 'year';

$_['text_percent_discount']  = '%d&#37; discount';
$_['text_percent_sale']  = '%d&#37; SALE';

//[SB] Added Redemption
$_['text_redemption_usual']    = '-'; 
//$_['text_redemption_unit']    = 'Vit$ ';
//$_['text_redemption_total']    = 'Vit$ ';
$_['text_redemption_redeem_l']    = 'Item Redemption';
$_['text_redemption_redeem_r']    = '%s VIT$';

// Column
$_['column_image']           = 'Image';
$_['column_name']            = 'Product Name';
$_['column_model']           = 'Model';
$_['column_quantity']        = 'Quantity';
$_['column_usual_price']     = 'Usual Price'; //[SB] Display usual price
$_['column_price']           = 'Unit Price';
$_['column_total']           = 'Total';

// Entry
$_['entry_coupon']           = 'Enter your coupon here:';
$_['entry_voucher']          = 'Enter your gift voucher code here:';
$_['entry_reward']           = 'VIT$ to redeem (Min %s, Max %s):'; //[SB] Changed Reward
$_['entry_country']          = 'Country:';
$_['entry_zone']             = 'Region / State:';
$_['entry_postcode']         = 'Post Code:';
$_['entry_referral']         = 'Referrer\'s Email Address:'; //[SB] Added Referral
$_['button_referral']        = 'Verify'; //[SB] Added Referral

// Error
$_['error_stock']            = 'Products marked with *** are not available in the desired quantity or not in stock!';
$_['error_redeem']           = 'Please apply %s VIT$ for the redemption items in your cart.';
$_['error_minimum']          = 'Minimum order amount for %s is %s!';	
$_['error_required']         = '%s required!';	
$_['error_product']          = 'Warning: There are no products in your cart!';	
$_['error_coupon']           = 'You have entered an invalid, expired or fully redeemed coupon code.';//[MY]
$_['error_voucher']          = 'Gift Voucher is either invalid or the balance has been used up!';
$_['error_reward']           = 'Please enter the amount of VIT$ to use!'; //[SB] Changed Reward	
$_['error_points']           = 'You don\'t have %s VIT$ yet'; //[SB] Changed Reward	
$_['error_referral']         = 'The referral email you have entered is invalid.'; //[SB] Added Referral	
$_['error_maximum']          = 'The maximum number of VIT$ that can be applied is %s!';
$_['error_postcode']         = 'Postcode must be between 2 and 10 characters!';
$_['error_country']          = 'Please select a country!';
$_['error_zone']             = 'Please select a region / state!';
$_['error_shipping']         = 'Warning: Shipping method required!';
$_['error_no_shipping']      = 'Warning: No Shipping options are available. Please <a href="%s">contact us</a> for assistance!';
$_['error_profile_required'] = 'Please select a payment profile!';

$_['text_trial']             = '%s every %s %s for %s payments then ';
$_['text_recurring']         = '%s every %s %s';
$_['text_length']            = ' for %s payments';
?>