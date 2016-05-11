<?php

/**
 * @author Malcolm [MY]
 */
// Heading  
$_['heading_title'] = 'Sales Promotion';
$_['heading_promotion_items'] = 'Select Products That will be affected ONLY';
$_['heading_promotion_details'] = 'Promotion Details & Rules';

// Text
$_['text_send'] = 'Send';
$_['text_success'] = 'Success: You have modified sales promotion!';
$_['text_wait'] = 'Please Wait!';
$_['text_percent'] = 'Percentage';
$_['text_amount'] = 'Fixed Amount';
$_['text_price'] = 'Fixed Price';
$_['text_buy_x_get_y_fixed'] = 'Buy X Get Y for fixed price';
$_['text_buy_x_get_y_percent'] = 'Buy X Get Y with percentage discount';
$_['text_n_products_fixed'] = 'N products for fixed price';
$_['text_n_products_percent'] = 'N products with percentage discount';
$_['text_buy_x_get_y_percent']              = 'Buy X Get Y with percentage discount';
$_['text_buy_x_get_y_fixed']                = 'Buy X Get Y for fixed price';
$_['text_buy_x_cart_get_y_percent']         = 'Buy X in cart Get Y with percentage discount';
$_['text_buy_x_cart_get_y_fixed']           = 'Buy X in cart Get Y for fixed price';

// Column
$_['column_name'] = 'Sales Promotion Name';
$_['column_amount'] = 'Amount';
$_['column_status'] = 'Status';
$_['column_discount'] = 'Discount';
$_['column_discount_type'] = 'Discount Type';
$_['column_date_end'] = 'Date End';
$_['column_date_start'] = 'Date Start';
$_['column_date_added'] = 'Date Added';
$_['column_action'] = 'Action';
$_['column_order_id'] = 'Order ID';
$_['column_customer'] = 'Customer';

// Entry
$_['entry_name'] = 'Promotion Name:';
$_['entry_description'] = 'Description:<br/><span class="help">Description is shown on product detail page</span>';
$_['entry_code'] = 'Code:<br /><span class="help">The code the customer enters to get the discount</span>';
$_['entry_type'] = 'Type:<br /><span class="help">Percentage or Fixed Amount</span>';
$_['entry_discount'] = 'Discount:<br/><span class="help">Value of percentage discount, fixed amount discount or fixed price depending on selected discount type.</span>';
$_['entry_discount_type'] = 'Discount Type:';
$_['entry_discount_qty'] = 'Maximum quantity:<br/><span class="help">Maximal number of items or times when discount should be applied in order (depends on selected discount type).  Leave blank or zero for unlimited.</span>';
$_['entry_discount_option'] = 'Discount option:';
$_['entry_promo_qty'] = 'Promo Qty:<br/><span class="help">Quantity of promoted products aka "Y"</span>';
$_['entry_total'] = 'Total Amount:<br /><span class="help">The total amount that must reached before the coupon is valid.</span>';
$_['entry_category'] = 'Promo Categories:<br /><span class="help">Choose all products under selected category.(Autocomplete)</span>';
$_['entry_product'] = 'Promo Products:<br /><span class="help">Choose specific products the coupon will apply to. Select no products to apply promotion to entire cart.(autocomplete)</span>';
$_['entry_promo_discount_products'] = 'Affected Products:<br /><span class="help">Products in the "Y" list</span>';
$_['entry_manufacturer'] = "Brand (Manufacturer)";
$_['entry_date_start'] = 'Date Start:';
$_['entry_date_end'] = 'Date End:';
$_['entry_uses_total'] = 'Uses Per Promotion:<br /><span class="help">The maximum number of times the promotion can be used by any customer. Leave blank for unlimited</span>';
$_['entry_uses_customer'] = 'Uses Per Customer:<br /><span class="help">The maximum number of times the promotoin can be used by a single customer. Leave blank for unlimited</span>';
$_['entry_status'] = 'Status:';

$_['text_get_y_for_each_x_spent_help']      = '<i>You can use this discount type to create offers based on sub-total of cart.<br>Sub-total of cart counted only from products which matched to cart rules.<br/>For example "For each 300$ spent get 40$ off".</i><br/><br/><b>X</b> is value to indicate how much money customer will have spent to get <b>Y</b> discount.<br/><b>Y</b> value is how much money customer will get in discount.<br/>Use <b>Discount option</b> field to set <b>X</b> value and <b>Discount amount</b> field to set <b>Y</b> value.';
$_['text_n_products_help']                  = '<i>You can use this discount type to create offers based on quantity of products in cart.<br>For example "Three items from specific category will be discounted (or will have defined fixed price)."</i><br/><br/><b>N</b> is value to indicate amount of products. Use <b>Discount option</b> field to set <b>N</b> value.<br>Notice: When calculating discount, cheaper products is discounded fisrt.';
$_['text_each_n_help']                      = '<i>You can use this discount type to create offers based on quantity of specific product.<br>For example "Each third item in quantity of specific product will be discounted (or will have defined fixed price)."</i><br/><br/><b>N</b> is value to indicate frequency for "Each" in amount of product. Use <b>Discount option</b> field to set <b>N</b> value.';
$_['text_each_cart_n_help']                 = '<i>You can use this discount type to create offers based on quantity of products in cart (quantity of specific product can be ignored).<br>For example "Each third product in cart will be discounted (or will have defined fixed price).<br>Notice: When calculating discount, products is sorted by price from low to high."</i><br/><br/><b>N</b> is value to indicate frequency for "Each" in cart entries. Use <b>Discount option</b> field to set <b>N</b> value.';
$_['text_buy_x_get_y_help']                 = '<i>You can use this discount type to create offers of type "if specific product with defined quantity found in cart, then apply discount to specified product".<br>For example "Buy Product1 and get Product2 with discount or for fixed price" or "Buy three items of Product1 and get Product2 for free".<br/>The cheapest promo product in cart will be discounted.</i><br/><br/><b>X</b> is value to indicate the amount of product customer will have to buy in order to get one <b>Y</b> product discounted.<br/>Use <b>Discount option</b> field to set <b>X</b> value.<br/>Use <b>Promo categories</b> and <b>Promo products</b> to indicate which products will be discounted when added to cart, that\'s Y value.<br/>If you want discounted item to be free, set <b>Discount amount</b> to 100 and select <b>Discount type</b> - ' . $_['text_buy_x_get_y_percent'] . '.';
$_['text_buy_x_cart_get_y_help']            = '<i>You can use this discount type to create offers of type "if specific product(s) found in cart, then apply discount to specified product(s)".<br>For example "Buy Product1 and Product2 to get Product3 with discount or for fixed price" or "Buy 5 items from Category1 to get 6th(cheapest) for free".<br/>The cheapest promo product in cart will be discounted.</i><br/><br/><b>X</b> is value to indicate the amount of product customer will have to buy in order to get one <b>Y</b> product discounted.<br/>Use <b>Discount option</b> field to set <b>X</b> value.<br/>Use <b>Promo categories</b> and <b>Promo products</b> to indicate which products will be discounted when added to cart, that\'s Y value.<br/>If you want discounted item to be free, set <b>Discount amount</b> to 100 and select <b>Discount type</b> - ' . $_['text_buy_x_cart_get_y_percent'] . '.';
$_['text_after_n_help']                     = '<i>You can use this discount type to create discounts based on quantity of specific product.<br>For example "All items after fifth in quantity of specific product will be discounted (or will have defined fixed price)."</i><br/><br/><b>N</b> is value to indicate the amount of product customer will have to buy in order to get next ones with discount.<br/>Use <b>Discount option</b> field to set <b>N</b> value.';
$_['text_after_cart_n_help']                = '<i>You can use this discount type to create discounts based on quantity of products in cart (quantity of specific product can be ignored optionally).<br>For example "All products after fifth in cart will be discounted (or will have defined fixed price).<br>Notice: When calculating discount, products is sorted by price from high to low."</i><br/><br/><b>N</b> is value to indicate the amount of cart entries will have to be in order to get next ones with discount.<br/>Use <b>Discount option</b> field to set <b>N</b> value.';
$_['text_by_fixed_help']                    = '<i>You can use this discount type to create fixed amount discounts.<br/>Don\'t forget that you can play with condition and action rules to create discount which will be available only when created rules are met.</i>';
$_['text_by_percent_help']                  = '<i>You can use this discount type to create percentage discounts.<br/>Don\'t forget that you can play with condition and action rules to create discount which will be available only when created rules are met.</i>';

// Error
$_['error_permission'] = 'Warning: You do not have permission to modify promotions!';
$_['error_exists'] = 'Warning: Promotion name already in use!';
$_['error_amount'] = 'Amount must be greater than or equal to 1!';
$_['error_order'] = 'Warning: This promotion cannot be deleted as it is part of an <a href="%s">order</a>!';
?>
