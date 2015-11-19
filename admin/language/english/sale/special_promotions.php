<?php

//[MY]

// Heading

$_['heading_title']                         = 'Sales Promotions';



// Tab

$_['tab_main']                              = 'Promotion Information';

$_['tab_conditions']                        = 'Conditions';

$_['tab_actions']                           = 'Promotion Actions';

$_['tab_labels']                            = 'Labels';

$_['tab_stats']                             = 'Usage stats';



// Entry

$_['entry_name']                            = 'Promotion name:';

$_['entry_description']                     = 'Description:';

$_['entry_status']                          = 'Status:';

$_['entry_store']                           = 'Store:';

$_['entry_customer_group']                  = 'Customer group:';

$_['entry_coupon']                          = 'Coupon:';

$_['entry_coupon_code']                     = 'Coupon code:<br/><span class="help">Please use unique code to exclude collisions.</span>';

$_['entry_uses_total']                      = 'Uses per promotion:<br/><span class="help">The maximum number of times the promotion can be used by any customer. Leave blank or zero for unlimited.</span>';

$_['entry_uses_customer']                   = 'Uses per customer:<br/><span class="help">The maximum number of times the promotion can be used by a single customer. Leave blank or zero for unlimited.</span>';

$_['entry_date_start']                      = 'Promotion Date start:';

$_['entry_date_end']                        = 'Promotion Date end:';

$_['entry_sort_order']                      = 'Sort order:<br/><span class="help">Use only when neccessary</span>';

$_['entry_discount_type']                   = 'Discount type:';

$_['entry_discount_amount']                 = 'Discount amount:<br/><span class="help">Value of percentage discount, fixed amount discount or fixed price depending on selected discount type.</span>';

$_['entry_promo_categories']                = 'Promo categories:<br/><span class="help">(Autocomplete)</span>';

$_['entry_promo_categories_old']            = 'Promo categories:';

$_['entry_promo_products']                  = 'Promo products:<br/><span class="help">(Autocomplete)</span>';

$_['entry_promo_qty']                       = 'Promo quantity:<br/><span class="help">Quantity of promoted product.<br/> Set <b>Y</b> value here</span>';

$_['entry_discount_qty']                    = 'Maximum quantity:<br/><span class="help">Maximal number of items or times when discount should be applied in order (depends on selected discount type).  Leave blank or zero for unlimited.</span>';

$_['entry_discount_option']                 = 'Discount option:<br/><span class="help">Use this to set <b>N</b> or <b>X</b> value</span>';

$_['entry_free_shipping']                   = 'Free shipping:';

$_['entry_stop_rules_processing']           = 'Stop further rules processing:';

$_['entry_label']                           = 'Promotion label for store front:';

$_['entry_logged']                          = 'Customer Login:<br/><span class="help">Customer must be logged in to use this promotion.</span>';

$_['entry_rule_products']                   = 'Products:<br/><span class="help">Choose specific products rule will apply to. Select no products to apply rule to entire cart.<br/>(Autocomplete)</span>';

$_['entry_rule_manufacturer']             = 'Product Brands:<span><br/>(Autocomplete)</span>';

$_['entry_rule_categories']                 = 'Categories:<br/><span class="help">Choose all products under selected category.<br/>(Autocomplete)</span>';

$_['entry_rule_categories_old']             = 'Categories:<br/><span class="help">Choose all products under selected category.</span>';



$_['entry_exclusion_products']              = 'Exclusion Products';

$_['entry_exclusion_manufacturers']         = 'Exclusion Brands';



// Text

$_['text_success']                          = 'Success: You have modified special promotions!';

$_['text_general_information']              = 'General Information';

$_['text_apply_rule']                       = 'Apply the rule only if the following conditions are met (leave blank for all products)';

$_['text_update_prices']                    = 'SET PROMOTION RULES HERE';

$_['text_rule_to_products']                 = 'Apply the rule only to specified products in cart (leave blank for all items)';

$_['text_rule_to_conditions']               = 'Apply the rule only to cart products matching the following conditions (leave blank for all items)';

$_['text_no_coupon']                        = 'No coupon';

$_['text_specific_coupon']                  = 'Specific coupon';

$_['text_default']                          = 'Default';

$_['text_per_day']                          = 'per day';

$_['text_by_percent']                       = 'Percentage discount';

$_['text_by_fixed']                         = 'Fixed amount discount';

$_['text_pack_by_percent']                  = 'Product pack percentage discount';

$_['text_pack_by_fixed']                    = 'Product pack fixed price';

$_['text_n_products_fixed']                 = 'N products for fixed price';

$_['text_n_products_percent']               = 'N products with percentage discount';

$_['text_each_n_fixed']                     = 'Each N-th for fixed price';

$_['text_each_n_percent']                   = 'Each N-th with percentage discount';

$_['text_each_cart_n_fixed']                = 'Each N-th in cart for fixed price';

$_['text_each_cart_n_percent']              = 'Each N-th in cart with percentage discount';

$_['text_buy_x_get_y_percent']              = 'Buy X Get Y with percentage discount';

$_['text_buy_x_get_y_fixed']                = 'Buy X Get Y for fixed price';

$_['text_buy_x_cart_get_y_percent']         = 'Buy X in cart Get Y with percentage discount';

$_['text_buy_x_cart_get_y_fixed']           = 'Buy X in cart Get Y for fixed price';

$_['text_after_n_fixed']                    = 'All after N for fixed price';

$_['text_after_n_percent']                  = 'All after N with percentage discount';

$_['text_after_cart_n_fixed']               = 'All in cart after N for fixed price';

$_['text_after_cart_n_percent']             = 'All in cart after N with percentage discount';

$_['text_get_y_for_each_x_spent']           = 'Get %sY%s for each %sX%s spent';

$_['text_ignore_item_qty']                  = 'ignore cart item quantity';



$_['text_get_y_for_each_x_spent_help']      = '<i>You can use this discount type to create offers based on sub-total of cart.<br>Sub-total of cart counted only from products which matched to cart rules.<br/>For example "For each 300$ spent get 40$ off".</i><br/><br/><b>X</b> is value to indicate how much money customer will have spent to get <b>Y</b> discount.<br/><b>Y</b> value is how much money customer will get in discount.<br/>Use <b>Discount option</b> field to set <b>X</b> value and <b>Discount amount</b> field to set <b>Y</b> value.';

$_['text_n_products_help']                  = '<i>You can use this discount type to create offers based on quantity of products in cart.<br>For example "Three items from specific category will be discounted (or will have defined fixed price)."</i><br/><br/><b>N</b> is value to indicate amount of products. Use <b>Discount option</b> field to set <b>N</b> value.<br>Notice: When calculating discount, cheaper products is discounded fisrt.';

$_['text_each_n_help']                      = '<i>You can use this discount type to create offers based on quantity of specific product.<br>For example "Each third item in quantity of specific product will be discounted (or will have defined fixed price)."</i><br/><br/><b>N</b> is value to indicate frequency for "Each" in amount of product. Use <b>Discount option</b> field to set <b>N</b> value.';

$_['text_each_cart_n_help']                 = '<i>You can use this discount type to create offers based on quantity of products in cart (quantity of specific product can be ignored).<br>For example "Each third product in cart will be discounted (or will have defined fixed price).<br>Notice: When calculating discount, products is sorted by price from low to high."</i><br/><br/><b>N</b> is value to indicate frequency for "Each" in cart entries. Use <b>Discount option</b> field to set <b>N</b> value.';

$_['text_buy_x_get_y_help']                 = '<i>You can use this discount type to create offers of type "if specific product with defined quantity found in cart, then apply discount to specified product".<br>For example "Buy Product1 and get Product2 with discount or for fixed price" or "Buy three items of Product1 and get Product2 for free".<br/>The cheapest promo product in cart will be discounted.</i><br/><br/><b>X</b> is value to indicate the amount of product customer will have to buy in order to get one <b>Y</b> product discounted.<br/>Use <b>Discount option</b> field to set <b>X</b> value.<br/>Use <b>Promo categories</b> and <b>Promo products</b> to indicate which products will be discounted when added to cart, that\'s Y value.<br/>If you want discounted item to be free, set <b>Discount amount</b> to 100 and select <b>Discount type</b> - ' . $_['text_buy_x_get_y_percent'] . '. <br/>This <b>does not apply</b> to if Y is the same product as X. <br/>If item X and item Y is the same please enter the total number of products for a promotion to be valid eg. Buy 1 get 1 free (Set Discount Option to 2).<br/> Use Gift Promotions instead if you want the item to be gifted automatically.';

$_['text_buy_x_cart_get_y_help']            = '<i>You can use this discount type to create offers of type "if specific product(s) found in cart, then apply discount to specified product(s)".<br>For example "Buy Product1 and Product2 to get Product3 with discount or for fixed price" or "Buy 5 items from Category1 to get 6th(cheapest) for free".<br/>The cheapest promo product in cart will be discounted.</i><br/><br/><b>X</b> is value to indicate the amount of product customer will have to buy in order to get one <b>Y</b> product discounted.<br/>Use <b>Discount option</b> field to set <b>X</b> value.<br/>Use <b>Promo categories</b> and <b>Promo products</b> to indicate which products will be discounted when added to cart, that\'s Y value.<br/>If you want discounted item to be free, set <b>Discount amount</b> to 100 and select <b>Discount type</b> - ' . $_['text_buy_x_cart_get_y_percent'] .'. <br/>This <b>does not apply</b> to if Y is the same product as X. <br/>If item X and item Y is the same please enter the total number of products for a promotion to be valid eg. Buy 1 get 1 free (Set Discount Option to 2).<br/> Use Gift Promotions instead if you want the item to be gifted automatically.';

$_['text_after_n_help']                     = '<i>You can use this discount type to create discounts based on quantity of specific product.<br>For example "All items after fifth in quantity of specific product will be discounted (or will have defined fixed price)."</i><br/><br/><b>N</b> is value to indicate the amount of product customer will have to buy in order to get next ones with discount.<br/>Use <b>Discount option</b> field to set <b>N</b> value.';

$_['text_after_cart_n_help']                = '<i>You can use this discount type to create discounts based on quantity of products in cart (quantity of specific product can be ignored optionally).<br>For example "All products after fifth in cart will be discounted (or will have defined fixed price).<br>Notice: When calculating discount, products is sorted by price from high to low."</i><br/><br/><b>N</b> is value to indicate the amount of cart entries will have to be in order to get next ones with discount.<br/>Use <b>Discount option</b> field to set <b>N</b> value.';

$_['text_by_fixed_help']                    = '<i>You can use this discount type to create fixed amount discounts.<br/>Don\'t forget that you can play with condition and action rules to create discount which will be available only when created rules are met.</i>';

$_['text_by_percent_help']                  = '<i>You can use this discount type to create percentage discounts.<br/>Don\'t forget that you can play with condition and action rules to create discount which will be available only when created rules are met.</i>';



$_['text_pack_by_fixed_help']               = '<i>You can use this discount type to create bundle promotions "Bundle of products is found in cart, then selected products will be at fixed price".<br>For example "Buy Product1 and Product2 and get them for 20$ each" or <br/>"Buy three items of Product1 and three items of Product2 and get Product3 for 10$" or <br/>"Buy Product1 & Product2 for 50$ (discount amount set to 25$)".<br/>Fixed price applied to cheapest promo products in cart first.</i><br/><br/><b>X</b> is value to indicate the quantity of each product in pack to get fixed price for selected <b>Y</b> products.<br/>Use <b>Discount option</b> field to set <b>X</b> value.<br/>Use <b>Discount Amount</b> to set the fixed price of each item.<br/><br/>Use <b>Promo categories</b> and <b>Promo products</b> to indicate which products will have fixed price when added to cart, that\'s Y value.<br/>If you want discounted item to be free, set <b>Discount amount</b> to 100 and select <b>Discount type</b> - ' . $_['text_pack_by_percent'] . '.';

$_['text_pack_by_percent_help']             = '<i>You can use this discount type to create discounts of type "if pack of specific products (with defined quantity) is found in cart, then apply discount to selected products".<br>For example "Buy Product1 and Product2 and get 40% discount for them" or "Buy three items of Product1 and three items of Product2 and get Product3 for free".<br/>The cheapest promo products in cart discounted firstly.</i><br/><br/><b>X</b> is value to indicate the quantity of each product in pack to get selected <b>Y</b> products discounted.<br/>Use <b>Discount option</b> field to set <b>X</b> value.<br/>Use <b>Promo categories</b> and <b>Promo products</b> to indicate which products will be discounted when added to cart, that\'s Y value.<br/>If you want discounted item to be free, set <b>Discount amount</b> to 100.';



// Column

$_['column_name']                           = 'Promotion name';

$_['column_coupon_code']                    = 'Coupon Code';

$_['column_date_start']                     = 'Date Start';

$_['column_date_end']                       = 'Date End';

$_['column_status']                         = 'Status';

$_['column_sort_order']                     = 'Priority';

$_['column_action']                         = 'Action';

$_['column_order_id']                       = 'Order ID';

$_['column_customer']                       = 'Customer';

$_['column_amount']                         = 'Amount';

$_['column_date_added']                     = 'Date Added';



// Error

$_['error_name']                            = 'Promotion name should be defined.';

$_['error_discount_amount']                 = 'Discount amount should be greater than 0.';

$_['error_label']                           = 'Labels should be defined in all languages.';

$_['error_coupon_code']                     = 'Coupon code should be defined.';

$_['error_customer_group']                  = 'At least one customer group should be selected.';

$_['error_store']                           = 'At least one store should be selected.';

$_['error_notice']                          = 'Please check form for errors and fix them.';

$_['error_permission']                      = 'Warning: You do not have permission to modify special promotions!';