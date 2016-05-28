<style type="text/css">
    #tab-products table.form {
        margin-bottom: 0;
    }

    #tab-products img {
        border: 1px solid #ccc;
    }

    #tab-products table.option-image td {
        border-bottom: none;
        border-right: none;
    }

    #tab-products table.list tbody tr:hover td {
        background: none;
    }

    #tab-products table.form > tbody > tr:last-child > td {
        border-bottom: none;
    }

    #tab-products table.form > tbody > tr > td:last-child {
        border-right: none;
    }
</style>
<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/order.png" alt="" /> <?php echo $heading_title; ?></h1>
            <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a href="<?php echo $cancel; ?>" class="button"><span><?php echo $button_cancel; ?></span></a></div>
        </div>
        <div class="content">
            <div class="main-vtabs vtabs">
                <a href="#tab-main"><?php echo $tab_main; ?></a>
                <a href="#tab-products"><?php echo $tab_products; ?></a>
                <a href="#tab-cart-conditions"><?php echo $tab_cart_conditions; ?></a>
            </div>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <div id="tab-main" class="vtabs-content">
                    <h2><?php echo $text_general_information; ?></h2>
                    <table class="form">
                        <tr>
                            <td><span class="required">*</span> <?php echo $entry_name; ?></td>
                            <td>
                                <input type="text" name="name" value="<?php echo $name; ?>" size="100" />
                                <?php if (isset($error_name)) { ?>
                                    <span class="error"><?php echo $error_name; ?></span><br />
                                <?php } ?>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="required">*</span> <?php echo $entry_status; ?></td>
                            <td>
                                <?php if($status) {
                                    $checked1 = ' checked="checked"';
                                    $checked0 = '';
                                } else {
                                    $checked1 = '';
                                    $checked0 = ' checked="checked"';
                                } ?>
                                <label for="status_1">
                                    <?php echo $text_enabled; ?>
                                    <input type="radio"<?php echo $checked1; ?> id="status_1" name="status" value="1" />
                                </label>
                                <label for="status_0">
                                    <?php echo $text_disabled; ?>
                                    <input type="radio"<?php echo $checked0; ?> id="status_0" name="status" value="0" />
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="required">*</span> <?php echo $entry_store; ?></td>
                            <td>
                                <div class="scrollbox">
                                    <?php $class = 'even'; ?>
                                    <div class="<?php echo $class; ?>">
                                        <?php if (in_array(0, $store_ids)) { ?>
                                            <label>
                                                <input type="checkbox" name="store_ids[]" value="0" checked="checked" />
                                                <?php echo $text_default; ?>
                                            </label>
                                        <?php } else { ?>
                                            <label>
                                                <input type="checkbox" name="store_ids[]" value="0" />
                                                <?php echo $text_default; ?>
                                            </label>
                                        <?php } ?>
                                    </div>
                                    <?php foreach ($stores as $store) { ?>
                                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                        <div class="<?php echo $class; ?>">
                                            <?php if (in_array($store['store_id'], $store_ids)) { ?>
                                                <label>
                                                    <input type="checkbox" name="store_ids[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                                                    <?php echo $store['name']; ?>
                                                </label>
                                            <?php } else { ?>
                                                <label>
                                                    <input type="checkbox" name="store_ids[]" value="<?php echo $store['store_id']; ?>" />
                                                    <?php echo $store['name']; ?>
                                                </label>
                                            <?php } ?>
                                        </div>
                                    <?php } ?>
                                </div>
                                <?php if (isset($error_store)) { ?>
                                    <span class="error"><?php echo $error_store; ?></span><br />
                                <?php } ?>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="required">*</span> <?php echo $entry_customer_group; ?></td>
                            <td>
                                <div class="scrollbox">
                                    <?php $class = 'odd'; ?>
                                    <?php foreach ($customer_groups as $customer_group) { ?>
                                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                        <div class="<?php echo $class; ?>">
                                            <?php if (in_array($customer_group['customer_group_id'], $customer_group_ids)) { ?>
                                                <label>
                                                    <input type="checkbox" name="customer_group_ids[]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                                                    <?php echo $customer_group['name']; ?>
                                                </label>
                                            <?php } else { ?>
                                                <label>
                                                    <input type="checkbox" name="customer_group_ids[]" value="<?php echo $customer_group['customer_group_id']; ?>" />
                                                    <?php echo $customer_group['name']; ?>
                                                </label>
                                            <?php } ?>
                                        </div>
                                    <?php } ?>
                                </div>
                                <?php if (isset($error_customer_group)) { ?>
                                    <span class="error"><?php echo $error_customer_group; ?></span><br />
                                <?php } ?>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_logged; ?></td>
                            <td>
                                <?php if ($logged) { ?>
                                    <label>
                                        <?php echo $text_yes; ?>
                                        <input type="radio" name="logged" value="1" checked="checked" />
                                    </label>
                                    <label>
                                        <?php echo $text_no; ?>
                                        <input type="radio" name="logged" value="0" />
                                    </label>
                                <?php } else { ?>
                                    <label>
                                        <?php echo $text_yes; ?>
                                        <input type="radio" name="logged" value="1" />
                                    </label>
                                    <label>
                                        <?php echo $text_no; ?>
                                        <input type="radio" name="logged" value="0" checked="checked" />
                                    </label>
                                <?php } ?>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_coupon; ?></td>
                            <td>
                                <select name="coupon_type">
                                    <?php if ($coupon_type) { ?>
                                        <option value="0"><?php echo $text_no_coupon; ?></option>
                                        <option value="1" selected="selected"><?php echo $text_specific_coupon; ?></option>
                                    <?php } else { ?>
                                        <option value="0" selected="selected"><?php echo $text_no_coupon; ?></option>
                                        <option value="1"><?php echo $text_specific_coupon; ?></option>
                                    <?php } ?>
                                </select>
                            </td>
                        </tr>
                        <tbody id="coupon_code">
                            <tr>
                                <td><span class="required">*</span> <?php echo $entry_coupon_code; ?></td>
                                <td>
                                    <input type="text" name="coupon_code" value="<?php echo $coupon_code; ?>" />
                                    <?php if (isset($error_coupon_code)) { ?>
                                        <span class="error"><?php echo $error_coupon_code; ?></span><br />
                                    <?php } ?>
                                </td>
                            </tr>
                        </tbody>
                        <tr>
                            <td><?php echo $entry_date_start; ?></td>
                            <td>
                                <input type="text" name="date_start" value="<?php echo $date_start == '0000-00-00' ? '' : $date_start; ?>" class="date" />
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_date_end; ?></td>
                            <td>
                                <input type="text" name="date_end" value="<?php echo $date_end == '0000-00-00' ? '' : $date_end; ?>" class="date" />
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_sort_order; ?></td>
                            <td>
                                <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="4" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="tab-products" class="vtabs-content">
                    <table class="list">
                        <tbody>
                            <?php $product_row = 1; ?>
                            <?php foreach ($products as $product) { ?>
                                <tr id="row-product-<?php echo $product_row; ?>">
                                    <td class="left">
                                        <table class="form">
                                            <tr>
                                                <td><?php echo $entry_product; ?></td>
                                                <td>
                                                    <input data-row="<?php echo $product_row; ?>" type="text" name="ac_product" value="<?php echo isset($product['name']) ? $product['name'] : ''; ?>" size="60" />
                                                    <input type="hidden" name="product[<?php echo $product_row; ?>][product_id]" value="<?php echo isset($product['product_id']) ? $product['product_id'] : ''; ?>" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><?php echo $entry_quantity; ?></td>
                                                <td>
                                                    <input type="text" name="product[<?php echo $product_row; ?>][quantity]" value="<?php echo isset($product['quantity']) ? $product['quantity'] : ''; ?>" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><?php echo $entry_remove; ?></td>
                                                <td>
                                                    <?php if (!empty($product['remove'])) { ?>
                                                        <label>
                                                            <?php echo $text_yes; ?>
                                                            <input type="radio" name="product[<?php echo $product_row; ?>][remove]" value="1" checked="checked" />
                                                        </label>
                                                        <label>
                                                            <?php echo $text_no; ?>
                                                            <input type="radio" name="product[<?php echo $product_row; ?>][remove]" value="0" />
                                                        </label>
                                                    <?php } else { ?>
                                                        <label>
                                                            <?php echo $text_yes; ?>
                                                            <input type="radio" name="product[<?php echo $product_row; ?>][remove]" value="1" />
                                                        </label>
                                                        <label>
                                                            <?php echo $text_no; ?>
                                                            <input type="radio" name="product[<?php echo $product_row; ?>][remove]" value="0" checked="checked" />
                                                        </label>
                                                    <?php } ?>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td class="product-info">
                                                    <input type="hidden" name="product[<?php echo $product_row; ?>][name]" value="<?php echo isset($product['name']) ? $product['name'] : ''; ?>" />
                                                    <input type="hidden" name="product[<?php echo $product_row; ?>][model]" value="<?php echo isset($product['model']) ? $product['model'] : ''; ?>" />
                                                    <input type="hidden" name="product[<?php echo $product_row; ?>][image]" value="<?php echo isset($product['image']) ? $product['image'] : ''; ?>" />

                                                    <h2><?php echo isset($product['name']) ? $product['name'] : ''; ?></h2>
                                                    <h4><?php echo isset($product['model']) ? $product['model'] : ''; ?></h4>
                                                    <img src="<?php echo isset($product['image']) ? $product['image'] : ''; ?>" alt="<?php echo isset($product['name']) ? $product['name'] : ''; ?>" />
                                                    <?php if (isset($product['options']) && is_array($product['options']) && $product['options']) { ?>
                                                        <h3><?php echo $text_option; ?></h3>
                                                        <?php foreach ($product['options'] as $option) { ?>
                                                            <?php if ($option['type'] == 'select') { ?>
                                                                <div id="product-<?php echo $product_row; ?>-option-<?php echo $option['product_option_id']; ?>" class="option">
                                                                    <?php if ($option['required']) { ?>
                                                                        <span class="required">*</span>
                                                                    <?php } ?>
                                                                    <b><?php echo $option['name']; ?>:</b><br/>
                                                                    <select name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]">
                                                                        <?php if (!empty($product['option'][$option['product_option_id']])) { ?>
                                                                            <option value=""><?php echo $text_select; ?></option>
                                                                        <?php } else { ?>
                                                                            <option value="" selected="selected"><?php echo $text_select; ?></option>
                                                                        <?php } ?>
                                                                        <?php foreach ($option['option_value'] as $option_value) { ?>
                                                                            <?php if (!empty($product['option'][$option['product_option_id']]) && $product['option'][$option['product_option_id']] == $option_value['product_option_value_id']) { ?>
                                                                                <option value="<?php echo $option_value['product_option_value_id']; ?>" selected="selected">
                                                                            <?php } else { ?>
                                                                                <option value="<?php echo $option_value['product_option_value_id']; ?>">
                                                                            <?php } ?>
                                                                                    <?php echo $option_value['name']; ?>
                                                                                </option>
                                                                        <?php } ?>
                                                                    </select>
                                                                </div>
                                                                <br/>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'radio') { ?>
                                                                <div id="product-<?php echo $product_row; ?>-option-<?php echo $option['product_option_id']; ?>" class="option">
                                                                    <?php if ($option['required']) { ?>
                                                                        <span class="required">*</span>
                                                                    <?php } ?>
                                                                    <b><?php echo $option['name']; ?>:</b><br/>
                                                                    <?php foreach ($option['option_value'] as $option_value) { ?>
                                                                        <?php if (!empty($product['option'][$option['product_option_id']]) && $product['option'][$option['product_option_id']] == $option_value['product_option_value_id']) { ?>
                                                                            <input type="radio" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="product-<?php echo $product_row; ?>-option-value-<?php echo $option_value['product_option_value_id']; ?>" checked="checked"/>
                                                                        <?php } else { ?>
                                                                            <input type="radio" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="product-<?php echo $product_row; ?>-option-value-<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                        <?php } ?>
                                                                        <label for="product-<?php echo $product_row; ?>-option-value-<?php echo $option_value['product_option_value_id']; ?>">
                                                                            <?php echo $option_value['name']; ?>
                                                                        </label>
                                                                        <br/>
                                                                    <?php } ?>
                                                                </div>
                                                                <br/>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'checkbox') { ?>
                                                                <div id="product-<?php echo $product_row; ?>-option-<?php echo $option['product_option_id']; ?>" class="option">
                                                                    <?php if ($option['required']) { ?>
                                                                        <span class="required">*</span>
                                                                    <?php } ?>
                                                                    <b><?php echo $option['name']; ?>:</b><br/>
                                                                    <?php foreach ($option['option_value'] as $option_value) { ?>
                                                                        <?php if (!empty($product['option'][$option['product_option_id']]) && in_array($option_value['product_option_value_id'], $product['option'][$option['product_option_id']])) { ?>
                                                                            <input type="checkbox" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="product-<?php echo $product_row; ?>-option-value-<?php echo $option_value['product_option_value_id']; ?>" checked="checked"/>
                                                                        <?php } else { ?>
                                                                            <input type="checkbox" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="product-<?php echo $product_row; ?>-option-value-<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                        <?php } ?>
                                                                        <label for="product-<?php echo $product_row; ?>-option-value-<?php echo $option_value['product_option_value_id']; ?>">
                                                                            <?php echo $option_value['name']; ?>
                                                                        </label>
                                                                        <br/>
                                                                    <?php } ?>
                                                                </div>
                                                                <br/>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'image') { ?>
                                                                <div id="product-<?php echo $product_row; ?>-option-<?php echo $option['product_option_id']; ?>" class="option">
                                                                    <?php if ($option['required']) { ?>
                                                                        <span class="required">*</span>
                                                                    <?php } ?>
                                                                    <b><?php echo $option['name']; ?>:</b><br/>
                                                                    <table class="option-image">
                                                                        <?php foreach ($option['option_value'] as $option_value) { ?>
                                                                            <tr>
                                                                                <td style="width: 1px;">
                                                                                    <?php if (!empty($product['option'][$option['product_option_id']]) && $product['option'][$option['product_option_id']] == $option_value['product_option_value_id']) { ?>
                                                                                        <input type="radio" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="product-<?php echo $product_row; ?>-option-value-<?php echo $option_value['product_option_value_id']; ?>" checked="checked"/>
                                                                                    <?php } else { ?>
                                                                                        <input type="radio" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="product-<?php echo $product_row; ?>-option-value-<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                                    <?php } ?>
                                                                                </td>
                                                                                <td>
                                                                                    <label for="product-<?php echo $product_row; ?>-option-value-<?php echo $option_value['product_option_value_id']; ?>">
                                                                                        <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name']; ?>"/>
                                                                                    </label>
                                                                                </td>
                                                                                <td>
                                                                                    <label for="product-<?php echo $product_row; ?>-option-value-<?php echo $option_value['product_option_value_id']; ?>">
                                                                                        <?php echo $option_value['name']; ?>
                                                                                    </label>
                                                                                </td>
                                                                            </tr>
                                                                        <?php } ?>
                                                                    </table>
                                                                </div>
                                                                <br/>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'text') { ?>
                                                                <div id="product-<?php echo $product_row; ?>-option-<?php echo $option['product_option_id']; ?>" class="option">
                                                                    <?php if ($option['required']) { ?>
                                                                        <span class="required">*</span>
                                                                    <?php } ?>
                                                                    <b><?php echo $option['name']; ?>:</b><br/>
                                                                    <input type="text" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" value="<?php echo (!empty($product['option'][$option['product_option_id']]) ? $product['option'][$option['product_option_id']] : ''); ?>"/>
                                                                </div>
                                                                <br/>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'textarea') { ?>
                                                                <div id="product-<?php echo $product_row; ?>-option-<?php echo $option['product_option_id']; ?>" class="option">
                                                                    <?php if ($option['required']) { ?>
                                                                        <span class="required">*</span>
                                                                    <?php } ?>
                                                                    <b><?php echo $option['name']; ?>:</b><br/>
                                                                    <textarea name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo (!empty($product['option'][$option['product_option_id']]) ? $product['option'][$option['product_option_id']] : ''); ?></textarea>
                                                                </div>
                                                                <br/>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'date') { ?>
                                                                <div id="product-<?php echo $product_row; ?>-option-<?php echo $option['product_option_id']; ?>" class="option">
                                                                    <?php if ($option['required']) { ?>
                                                                        <span class="required">*</span>
                                                                    <?php } ?>
                                                                    <b><?php echo $option['name']; ?>:</b><br/>
                                                                    <input type="text" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" value="<?php echo (!empty($product['option'][$option['product_option_id']]) ? $product['option'][$option['product_option_id']] : ''); ?>" class="date"/>
                                                                </div>
                                                                <br/>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'datetime') { ?>
                                                                <div id="product-<?php echo $product_row; ?>-option-<?php echo $option['product_option_id']; ?>" class="option">
                                                                    <?php if ($option['required']) { ?>
                                                                        <span class="required">*</span>
                                                                    <?php } ?>
                                                                    <b><?php echo $option['name']; ?>:</b><br/>
                                                                    <input type="text" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" value="<?php echo (!empty($product['option'][$option['product_option_id']]) ? $product['option'][$option['product_option_id']] : ''); ?>" class="datetime"/>
                                                                </div>
                                                                <br/>
                                                            <?php } ?>
                                                            <?php if ($option['type'] == 'time') { ?>
                                                                <div id="product-<?php echo $product_row; ?>-option-<?php echo $option['product_option_id']; ?>" class="option">
                                                                    <?php if ($option['required']) { ?>
                                                                        <span class="required">*</span>
                                                                    <?php } ?>
                                                                    <b><?php echo $option['name']; ?>:</b><br/>
                                                                    <input type="text" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" value="<?php echo (!empty($product['option'][$option['product_option_id']]) ? $product['option'][$option['product_option_id']] : ''); ?>" class="time"/>
                                                                </div>
                                                                <br/>
                                                            <?php } ?>
                                                        <?php } ?>
                                                    <?php } ?>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <a onclick="$('#row-product-<?php echo $product_row; ?>').remove();" class="button"><span><?php echo $button_remove; ?></span></a>
                                    </td>
                                </tr>
                                <?php $product_row++; ?>
                            <?php } ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td style="width:100%;">&nbsp;</td>
                                <td class="left">
                                    <a onclick="addProduct()" class="button"><span><?php echo $button_add_product; ?></span></a>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <div id="tab-cart-conditions" class="vtabs-content">
                    <h2><?php echo $text_rule_to_cart_products; ?></h2>
                    <table class="form">
                        <tr>
                            <td><?php echo $entry_cart_products; ?></td>
                            <td><input type="text" name="cart_products" value="" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <div class="scrollbox" id="cart_product">
                                    <?php $class = 'odd'; ?>
                                    <?php foreach ($cart_products as $cart_product) { ?>
                                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                        <div id="cart_product<?php echo $cart_product['product_id']; ?>" class="<?php echo $class; ?>">
                                            <?php echo $cart_product['name']; ?><img src="view/image/delete.png" />
                                            <input type="hidden" name="cart_product[]" value="<?php echo $cart_product['product_id']; ?>" />
                                        </div>
                                    <?php } ?>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <h2><?php echo $text_rule_to_cart_categories; ?></h2>
                    <table class="form">
                        <?php if (version_compare(VERSION, '1.5.5.1') >= 0) { ?>
                            <tr>
                                <td><?php echo $entry_cart_categories; ?></td>
                                <td><input type="text" name="cart_categories" value="" /></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <div class="scrollbox" id="cart_category">
                                        <?php $class = 'odd'; ?>
                                        <?php foreach ($cart_categories as $cart_category) { ?>
                                            <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                            <div id="cart_category<?php echo $cart_category['category_id']; ?>" class="<?php echo $class; ?>">
                                                <?php echo $cart_category['name']; ?><img src="view/image/delete.png" />
                                                <input type="hidden" name="cart_category[]" value="<?php echo $cart_category['category_id']; ?>" />
                                            </div>
                                        <?php } ?>
                                    </div>
                                </td>
                            </tr>
                        <?php } else { ?>
                            <tr>
                                <td><?php echo $entry_cart_categories; ?></td>
                                <td>
                                    <div class="scrollbox">
                                        <?php $class = 'odd'; ?>
                                        <?php foreach ($categories as $category) { ?>
                                            <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                            <div class="<?php echo $class; ?>">
                                                <?php if ($cart_categories && is_array($cart_categories) && in_array($category['category_id'], $cart_categories)) { ?>
                                                    <input type="checkbox" name="cart_category[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                                                <?php } else { ?>
                                                    <input type="checkbox" name="cart_category[]" value="<?php echo $category['category_id']; ?>" />
                                                <?php } ?>
                                                <?php echo $category['name']; ?>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </td>
                            </tr>
                        <?php } ?>
                    </table>
                    <h2><?php echo $text_conditions; ?></h2>
                    <table class="form">
                        <tr>
                            <td>
                                <?php
                                    function conditionsTree($conditions, $scope, $key = '', $product = '') {

                                        if (!$key) {
                                            $out = '<div class="rule">';
                                        } elseif ($key == '1--') {
                                            $out = '<ul class="rules" data-section="conditions">';
                                        } else {
                                            $out = '<ul class="rules">';
                                        }

                                        foreach($conditions as $i => $condition) {
                                            $k = $key . ($i + 1);

                                            if ($key) {
                                                $out .= '<li>';
                                            }

                                            $out .= '<input type="hidden" name="rule[conditions][' . $k . '][type]" value="' . $condition['type'] . '" />';

                                            switch ($condition['type']) {
                                                case 'rule/condition_product_found':
                                                    $out .= sprintf($scope['rule_condition_product_found'], '<span class="data-edit" data-type="select" data-values="found_not_found" data-selected="' . $condition['value'] . '" data-name="rule[conditions][' . $k . '][value]"></span>', '<span class="data-edit" data-type="select" data-values="all_any" data-selected="' . $condition['aggregator'] . '" data-name="rule[conditions][' . $k . '][aggregator]"></span>');
                                                break;
                                                case 'rule/condition_product_subselect':
                                                    $out .= sprintf($scope['rule_condition_product_subselect'], '<span class="data-edit" data-type="select" data-values="total_qty_amount" data-selected="' . $condition['attribute'] . '" data-name="rule[conditions][' . $k . '][attribute]"></span>', '<span class="data-edit" data-type="select" data-values="operators" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '">' . ($condition['value'] >= 0 ? $condition['value'] : '&hellip;') . '</span>', '<span class="data-edit" data-type="select" data-values="all_any" data-selected="' . $condition['aggregator'] . '" data-name="rule[conditions][' . $k . '][aggregator]"></span>');
                                                break;
                                                case 'rule/condition_combine':
                                                    $out .= sprintf($scope['rule_condition_combine'], '<span class="data-edit" data-type="select" data-values="all_any" data-selected="' . $condition['aggregator'] . '" data-name="rule[conditions][' . $k . '][aggregator]"></span>', '<span class="data-edit" data-type="select" data-values="true_false" data-selected="' . $condition['value'] . '" data-name="rule[conditions][' . $k . '][value]"></span>');
                                                break;
                                                case 'rule/condition_cart|base_subtotal':
                                                    $out .= sprintf($scope['rule_condition_cart_base_subtotal'], '<span class="data-edit" data-type="select" data-values="operators" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '">' . ($condition['value'] >= 0 ? $condition['value'] : '&hellip;') . '</span>');
                                                break;
                                                case 'rule/condition_cart|total_qty':
                                                    $out .= sprintf($scope['rule_condition_cart_total_qty'], '<span class="data-edit" data-type="select" data-values="operators" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '">' . ($condition['value'] >= 0 ? $condition['value'] : '&hellip;') . '</span>');
                                                break;
                                                case 'rule/condition_cart|diff_qty':
                                                    $out .= sprintf($scope['rule_condition_cart_diff_qty'], '<span class="data-edit" data-type="select" data-values="operators" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '">' . ($condition['value'] >= 0 ? $condition['value'] : '&hellip;') . '</span>');
                                                break;
                                                case 'rule/condition_cart|weight':
                                                    $out .= sprintf($scope['rule_condition_cart_weight'], '<span class="data-edit" data-type="select" data-values="operators" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '">' . ($condition['value'] >= 0 ? $condition['value'] : '&hellip;') . '</span>');
                                                break;
                                                case 'rule/condition_cart|payment_method':
                                                    $out .= sprintf($scope['rule_condition_cart_payment_method'], '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="select" data-values="payment_methods" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '"></span>');
                                                break;
                                                case 'rule/condition_cart|shipping_method':
                                                    $out .= sprintf($scope['rule_condition_cart_shipping_method'], '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="select" data-values="shipping_methods" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '"></span>');
                                                break;
                                                case 'rule/condition_cart|shipping_postcode':
                                                    $out .= sprintf($scope['rule_condition_cart_shipping_postcode'], '<span class="data-edit" data-type="select" data-values="operators" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '">' . ($condition['value'] ? $condition['value'] : '&hellip;') . '</span>');
                                                break;
                                                case 'rule/condition_cart|shipping_zone_id':
                                                    $out .= sprintf($scope['rule_condition_cart_shipping_zone_id'], '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="select" data-values="zones" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '"></span>');
                                                break;
                                                case 'rule/condition_cart|shipping_country_id':
                                                    $out .= sprintf($scope['rule_condition_cart_shipping_country_id'], '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="select" data-values="countries" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '"></span>');
                                                break;
                                                case 'rule/condition_customer|store_id':
                                                    $out .= sprintf($scope['rule_condition_customer_store_id'], '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="select" data-values="stores" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '"></span>');
                                                break;
                                                case 'rule/condition_customer|customer_group_id':
                                                    $out .= sprintf($scope['rule_condition_customer_group_id'], '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="select" data-values="customer_groups" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '"></span>');
                                                break;
                                                case 'rule/condition_customer|registration_date':
                                                    $out .= sprintf($scope['rule_condition_customer_registration_date'], '<span class="data-edit" data-type="select" data-values="operators" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-class="date" data-selected="' . $condition['value'] . '">' . ($condition['value'] ? $condition['value'] : '&hellip;') . '</span>');
                                                break;
                                                case 'rule/condition_customer|email':
                                                    $out .= sprintf($scope['rule_condition_customer_email'], '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '">' . ($condition['value'] ? $condition['value'] : '&hellip;') . '</span>');
                                                break;
                                                case 'rule/condition_customer|firstname':
                                                    $out .= sprintf($scope['rule_condition_customer_firstname'], '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '">' . ($condition['value'] ? $condition['value'] : '&hellip;') . '</span>');
                                                break;
                                                case 'rule/condition_customer|lastname':
                                                    $out .= sprintf($scope['rule_condition_customer_lastname'], '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '">' . ($condition['value'] ? $condition['value'] : '&hellip;') . '</span>');
                                                break;
                                                case 'rule/condition_orders|order_num':
                                                    $out .= sprintf($scope['rule_condition_orders_order_num'], '<span class="data-edit" data-type="select" data-values="operators" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '">' . ($condition['value'] >= 0 ? $condition['value'] : '&hellip;') . '</span>');
                                                break;
                                                case 'rule/condition_orders|sales_amount':
                                                    $out .= sprintf($scope['rule_condition_orders_sales_amount'], '<span class="data-edit" data-type="select" data-values="operators" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '">' . ($condition['value'] >= 0 ? $condition['value'] : '&hellip;') . '</span>');
                                                break;
                                                case 'rule/condition_cart_product|price':
                                                    $out .= sprintf($scope['rule_condition_cart_product_price'], '<span class="data-edit" data-type="select" data-values="operators" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '">' . ($condition['value'] >= 0 ? $condition['value'] : '&hellip;') . '</span>');
                                                break;
                                                case 'rule/condition_cart_product|qty':
                                                    $out .= sprintf($scope['rule_condition_cart_product_qty'], '<span class="data-edit" data-type="select" data-values="operators" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '">' . ($condition['value'] >= 0 ? $condition['value'] : '&hellip;') . '</span>');
                                                break;
                                                case 'rule/condition_cart_product|total':
                                                    $out .= sprintf($scope['rule_condition_cart_product_total'], '<span class="data-edit" data-type="select" data-values="operators" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '">' . ($condition['value'] >= 0 ? $condition['value'] : '&hellip;') . '</span>');
                                                break;
                                                case 'rule/condition_cart_product|manufacturer_id':
                                                    $out .= sprintf($scope['rule_condition_manufacturer_id'], '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="select" data-values="manufacturers" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '"></span>');
                                                break;
                                                case 'rule/condition_cart_product|category_id':
                                                    $out .= sprintf($scope['rule_condition_category_id'], '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="select" data-values="categories" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '"></span>');
                                                break;
                                                case 'rule/condition_cart_product|model':
                                                    $out .= sprintf($scope['rule_condition_model'], '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '">' . ($condition['value'] ? $condition['value'] : '&hellip;') . '</span>');
                                                break;
                                            }

                                            if (strpos($condition['type'], 'rule/condition_cart_product|attribute_') === 0) {
                                                $out .= $scope['values_product_conditions'][$condition['type']] . ' <span class="data-edit" data-type="select" data-values="is_is_not" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span> <span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '">' . ($condition['value'] ? $condition['value'] : '&hellip;') . '</span>';
                                            }

                                            if (strpos($condition['type'], 'rule/condition_cart_product|option_') === 0) {
                                                $out .= $scope['values_product_conditions'][$condition['type']] . ' <span class="data-edit" data-type="select" data-values="is_is_not" data-selected="' . $condition['operator'] . '" data-name="rule[conditions][' . $k . '][operator]"></span> ';
                                                if (substr($condition['type'], -strlen('select')) === 'select' || substr($condition['type'], -strlen('radio')) === 'radio' || substr($condition['type'], -strlen('checkbox')) === 'checkbox' || substr($condition['type'], -strlen('image')) === 'image') {
                                                    $arr = explode('|', str_replace('rule/condition_cart_product|option_', '', $condition['type']));
                                                    $out .= '<span class="data-edit" data-type="select" data-values="options_values_' . array_shift($arr) . '" data-selected="' . $condition['value'] . '" data-name="rule[conditions][' . $k . '][value]"></span>';
                                                } elseif (substr($condition['type'], -strlen('text')) === 'text') {
                                                    $out .= '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-selected="' . $condition['value'] . '">' . ($condition['value'] ? $condition['value'] : '&hellip;') . '</span>';
                                                } elseif (substr($condition['type'], -strlen('textarea')) === 'textarea') {
                                                    $out .= '<span class="data-edit" data-type="textarea" data-name="rule[conditions][' . $k . '][value]">' . ($condition['value'] ? $condition['value'] : '&hellip;') . '</span>';
                                                } elseif (substr($condition['type'], -strlen('datetime')) === 'datetime') {
                                                    $out .= '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-class="datetime" data-selected="' . $condition['value'] . '">' . ($condition['value'] ? $condition['value'] : '&hellip;') . '</span>';
                                                } elseif (substr($condition['type'], -strlen('date')) === 'date') {
                                                    $out .= '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-class="date" data-selected="' . $condition['value'] . '">' . ($condition['value'] ? $condition['value'] : '&hellip;') . '</span>';
                                                } elseif (substr($condition['type'], -strlen('time')) === 'time') {
                                                    $out .= '<span class="data-edit" data-type="text" data-name="rule[conditions][' . $k . '][value]" data-class="time" data-selected="' . $condition['value'] . '">' . ($condition['value'] ? $condition['value'] : '&hellip;') . '</span>';
                                                }
                                            }

                                            if (!$key) {
                                                $out .= '</div>';
                                            } else {
                                                $out .= '<img class="remove-rule" src="view/image/delete.png" alt="" valign="middle" />';
                                            }

                                            if (!empty($condition['rules'])) {
                                                $out .= conditionsTree($condition['rules'], $scope, $k . '--', (($product || $condition['type'] == 'rule/condition_product_found' || $condition['type'] == 'rule/condition_product_subselect') ? '1' : ''));
                                            } elseif (!$key) {
                                                $out .= '<ul class="rules" data-section="conditions">';
                                                $out .= '<li><span class="data-edit" data-rule="new" data-type="select" data-values="' . (($product || $condition['type'] == 'rule/condition_product_found' || $condition['type'] == 'rule/condition_product_subselect') ? 'product_conditions' : 'conditions') . '"><img class="add-rule" src="view/image/add.png" alt="" valign="middle" /></span></li>';
                                                $out .= '</ul>';
                                            }

                                            if ($key) {
                                                $out.= '</li>';
                                            }
                                        }

                                        if ($key) {
                                            $out .= '<li><span class="data-edit" data-rule="new" data-type="select" data-values="' . ($product ? 'product_conditions' : 'conditions') . '"><img class="add-rule" src="view/image/add.png" alt="" valign="middle" /></span></li>';

                                            $out .= '</ul>';
                                        }

                                        return $out;
                                    }

                                    if (empty($rule['conditions'])) {
                                        $rule['conditions'] = array(array('type' => 'rule/condition_combine', 'aggregator' => 'all', 'value' => '1'));
                                    }

                                    echo conditionsTree($rule['conditions'], $this->data);
                                ?>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
    var select_options = {
        all_any: $.parseJSON('<?php echo addslashes(json_encode($values_all_any)); ?>'),
        true_false: $.parseJSON('<?php echo addslashes(json_encode($values_true_false)); ?>'),
        conditions: $.parseJSON('<?php echo addslashes(json_encode($values_conditions)); ?>'),
        product_conditions: $.parseJSON('<?php echo addslashes(json_encode($values_product_conditions)); ?>'),
        found_not_found: $.parseJSON('<?php echo addslashes(json_encode($values_found_not_found)); ?>'),
        total_qty_amount: $.parseJSON('<?php echo addslashes(json_encode($values_total_qty_amount)); ?>'),
        operators: $.parseJSON('<?php echo addslashes(json_encode($values_operator)); ?>'),
        is_is_not: $.parseJSON('<?php echo addslashes(json_encode($values_is_is_not)); ?>'),
        payment_methods: $.parseJSON('<?php echo addslashes(json_encode($values_payment_methods)); ?>'),
        shipping_methods: $.parseJSON('<?php echo addslashes(json_encode($values_shipping_methods)); ?>'),
        countries: $.parseJSON('<?php echo addslashes(json_encode($values_countries)); ?>'),
        zones: $.parseJSON('<?php echo addslashes(json_encode($values_zones)); ?>'),
        stores: $.parseJSON('<?php echo addslashes(json_encode($values_stores)); ?>'),
        customer_groups: $.parseJSON('<?php echo addslashes(json_encode($values_customer_groups)); ?>'),
        manufacturers: $.parseJSON('<?php echo addslashes(json_encode($values_manufacturers)); ?>'),
        categories: $.parseJSON('<?php echo addslashes(json_encode($values_categories)); ?>'),
        <?php $i = 0; foreach($values_options_values as $option_id => $options_values) { ?>
        options_values_<?php echo $option_id; ?>: $.parseJSON('<?php echo addslashes(json_encode($options_values)); ?>')<?php if ($i < (count($values_options_values) - 1)) { ?>,<?php } ?>
        <?php $i++; } $i = 0; ?>
    }

    if (typeof String.prototype.startsWith != 'function') {
        String.prototype.startsWith = function (str){
            return this.slice(0, str.length) == str;
        };
    }
    if (typeof String.prototype.endsWith != 'function') {
        String.prototype.endsWith = function (str){
            return this.slice(-str.length) == str;
        };
    }
//--></script>
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript"><!--
    $(document).ready(function() {

        $('.main-vtabs a').tabs();
        $('.htabs a').tabs();

        $('.date').datepicker({dateFormat: 'yy-mm-dd'});

        $('.datetime').datetimepicker({
            dateFormat: 'yy-mm-dd',
            timeFormat: 'h:m'
        });

        $('.time').timepicker({timeFormat: 'h:m'});

        $('select[name=coupon_type]').bind('change', function(){
            if ($(this).val() > 0) {
                $('#coupon_code').show();
            } else {
                $('#coupon_code').hide();
            }
        });

        $('select[name=coupon_type]').trigger('change');

        $('.data-edit select').live('change', function() {
            $(this).blur();
        });

        $('.remove-rule').live('click', function() {
            $(this).parent().remove();
        });

        $('.warning, .success').live('click', function() {
           $(this).remove();
        });

        $('input[name=ac_product]').autocomplete({
            delay: 0,
            source: function(request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
                    dataType: 'json',
                    data: {token: '<?php echo $token; ?>', filter_name: encodeURIComponent(request.term)},
                    type: 'POST',
                    success: function(json) {
                        response($.map(json, function(item) {
                            return {
                                label: item.name,
                                value: item.product_id
                            }
                        }));
                    }
                });
            },
            select: function(event, ui) {
                $(this).val(ui.item.label);
                $(this).next().val(ui.item.value);
                $(this).closest('.form').find('.product-info').load('index.php?route=sale/special_triggers/product&token=<?php echo $token; ?>&product_id=' + ui.item.value + '&product_row=' + $(this).attr('data-row'));
                return false;
            }
        });

    });
//--></script>
<script type="text/javascript"><!--
    function refresh_edit() {
        $('.data-edit').each(function(i) {
            var _holder = this;
            $.data(_holder, 'editable.type', $(_holder).attr('data-type'));
            !$.data(_holder, 'editable.options') && $(_holder).editable({
                type: $(_holder).attr('data-type'),
                name: $(_holder).attr('data-name'),
                editClass: $(_holder).attr('data-class'),
                options: select_options[$(_holder).attr('data-values')],
                submit: ($(_holder).attr('data-class') == 'date' || $(_holder).attr('data-class') == 'time' || $(_holder).attr('data-class') == 'datetime') ? '&nbsp;<img src="view/image/success.png" alt="" valign="middle" />' : null,
                onEdit: function(content) {
                    if ($(_holder).attr('data-type') == 'text') {
                        var _input = $(_holder).find('input');

                        if ($(_holder).attr('data-class') == 'date') {
                            _input.datepicker({dateFormat: 'yy-mm-dd'}).datepicker('show');
                        }

                        if ($(_holder).attr('data-class') == 'time') {
                            _input.timepicker({timeFormat: 'h:m'}).timepicker('show');
                        }

                        if ($(_holder).attr('data-class') == 'datetime') {
                            _input.datetimepicker({dateFormat: 'yy-mm-dd', timeFormat: 'h:m'}).datetimepicker('show');
                        }

                        if (content.current == '…') {
                            _input.val('');
                        }
                    }

                    if ($(_holder).attr('data-type') == 'textarea' && content.current == '…') {
                        $(_holder).find('textarea').val('');
                    }
                },
                onSubmit: function(content) {
                    if ($.data(_holder, 'editable.type') != 'select') {
                        if (content.current && content.current != '&hellip;') {
                            $(_holder).next().val(content.current);
                        } else {
                            $(_holder).next().val('');
                            $(_holder).html('&hellip;');
                        }
                    } else {
                        $(_holder).attr('data-selected', content.current_val);
                        $(_holder).next().val(content.current_val);
                    }
                    if ($.data(_holder, 'editable.type') == 'select' && $(_holder).attr('data-rule') == 'new') {
                        var id = $(_holder).parent().index() + 1,
                            holder_list = $(_holder).parent().parent(),
                            parents, section, product_conditions;

                        parents = holder_list.parentsUntil('td', 'li');
                        $.each(parents, function(index, item) {
                            id = ($(item).index() + 1) + '--' + id;
                        });

                        id = '1--' + id;

                        $(_holder).editable('destroy');

                        section = $(_holder).parents('ul.rules').last().attr('data-section');

                        product_conditions = $(_holder).parents('ul[data-section="actions"]').length > 0 || $(_holder).attr('data-values') == 'product_conditions';

                        if (content.current_val) {
                            $(_holder).parent().replaceWith(get_part(content.current_val, id, section, product_conditions));
                            holder_list.append(get_part('rule/new', 0, section, product_conditions));
                        } else {
                            $(_holder).parent().replaceWith(get_part('rule/new', 0, section, product_conditions));
                        }
                    }

                    refresh_edit();
                }
            });
        });
    }
    refresh_edit();

    function get_part(type, id, section, product_conditions) {
        if (type == 'add') {
            return '<span class="data-edit" data-rule="new" data-type="select" data-values="' + (product_conditions ? 'product_conditions' : 'conditions') + '"><img class="add-rule" src="view/image/add.png" alt="" valign="middle" /></span>';
        } else if (type == 'remove') {
            return '<img class="remove-rule" src="view/image/delete.png" alt="" valign="middle" />';
        }

        var html = '';
        html += '<li>';

        if (id) {
            html += '<input type="hidden" name="rule[' + section + '][' + id + '][type]" value="' + type + '"/>';
        }

        switch (type) {
            case 'rule/new':
                html += get_part('add', 0, section, product_conditions);
                break;
            case 'rule/condition_product_found':
                html += '<?php echo sprintf($rule_condition_product_found, '<span class="data-edit" data-type="select" data-values="found_not_found" data-selected="1" data-name="rule[{section}][{id}][value]"></span>', '<span class="data-edit" data-type="select" data-values="all_any" data-selected="all" data-name="rule[{section}][{id}][aggregator]"></span>') ?>';
                break;
            case 'rule/condition_product_subselect':
                html += '<?php echo sprintf($rule_condition_product_subselect, '<span class="data-edit" data-type="select" data-values="total_qty_amount" data-selected="qty" data-name="rule[{section}][{id}][attribute]"></span>', '<span class="data-edit" data-type="select" data-values="operators" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>', '<span class="data-edit" data-type="select" data-values="all_any" data-selected="all" data-name="rule[{section}][{id}][aggregator]"></span>') ?>';
                break;
            case 'rule/condition_combine':
                html += '<?php echo sprintf($rule_condition_combine, '<span class="data-edit" data-type="select" data-values="all_any" data-selected="all" data-name="rule[{section}][{id}][aggregator]"></span>', '<span class="data-edit" data-type="select" data-values="true_false" data-selected="1" data-name="rule[{section}][{id}][value]"></span>') ?>';
                break;
            case 'rule/condition_cart|base_subtotal':
                html += '<?php echo sprintf($rule_condition_cart_base_subtotal, '<span class="data-edit" data-type="select" data-values="operators" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>') ?>';
                break;
            case 'rule/condition_cart|total_qty':
                html += '<?php echo sprintf($rule_condition_cart_total_qty, '<span class="data-edit" data-type="select" data-values="operators" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>') ?>';
                break;
            case 'rule/condition_cart|diff_qty':
                html += '<?php echo sprintf($rule_condition_cart_diff_qty, '<span class="data-edit" data-type="select" data-values="operators" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>') ?>';
                break;
            case 'rule/condition_cart|weight':
                html += '<?php echo sprintf($rule_condition_cart_weight, '<span class="data-edit" data-type="select" data-values="operators" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>') ?>';
                break;
            case 'rule/condition_cart|payment_method':
                html += '<?php echo sprintf($rule_condition_cart_payment_method, '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="select" data-values="payment_methods" data-selected="" data-name="rule[{section}][{id}][value]"></span>') ?>';
                break;
            case 'rule/condition_cart|shipping_method':
                html += '<?php echo sprintf($rule_condition_cart_shipping_method, '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="select" data-values="shipping_methods" data-selected="" data-name="rule[{section}][{id}][value]"></span>') ?>';
                break;
            case 'rule/condition_cart|shipping_postcode':
                html += '<?php echo sprintf($rule_condition_cart_shipping_postcode, '<span class="data-edit" data-type="select" data-values="operators" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>') ?>';
                break;
            case 'rule/condition_cart|shipping_zone_id':
                html += '<?php echo sprintf($rule_condition_cart_shipping_zone_id, '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="select" data-values="zones" data-selected="" data-name="rule[{section}][{id}][value]"></span>') ?>';
                break;
            case 'rule/condition_cart|shipping_country_id':
                html += '<?php echo sprintf($rule_condition_cart_shipping_country_id, '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="select" data-values="countries" data-selected="" data-name="rule[{section}][{id}][value]"></span>') ?>';
                break;
            case 'rule/condition_customer|store_id':
                html += '<?php echo sprintf($rule_condition_customer_store_id, '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="select" data-values="stores" data-selected="" data-name="rule[{section}][{id}][value]"></span>') ?>';
                break;
            case 'rule/condition_customer|customer_group_id':
                html += '<?php echo sprintf($rule_condition_customer_group_id, '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="select" data-values="customer_groups" data-selected="" data-name="rule[{section}][{id}][value]"></span>') ?>';
                break;
            case 'rule/condition_customer|registration_date':
                html += '<?php echo sprintf($rule_condition_customer_registration_date, '<span class="data-edit" data-type="select" data-values="operators" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]" data-class="date">&hellip;</span>') ?>';
                break;
            case 'rule/condition_customer|email':
                html += '<?php echo sprintf($rule_condition_customer_email, '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>') ?>';
                break;
            case 'rule/condition_customer|firstname':
                html += '<?php echo sprintf($rule_condition_customer_firstname, '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>') ?>';
                break;
            case 'rule/condition_customer|lastname':
                html += '<?php echo sprintf($rule_condition_customer_lastname, '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>') ?>';
                break;
            case 'rule/condition_orders|order_num':
                html += '<?php echo sprintf($rule_condition_orders_order_num, '<span class="data-edit" data-type="select" data-values="operators" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>') ?>';
                break;
            case 'rule/condition_orders|sales_amount':
                html += '<?php echo sprintf($rule_condition_orders_sales_amount, '<span class="data-edit" data-type="select" data-values="operators" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>') ?>';
                break;
            case 'rule/condition_cart_product|price':
                html += '<?php echo sprintf($rule_condition_cart_product_price, '<span class="data-edit" data-type="select" data-values="operators" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>') ?>';
                break;
            case 'rule/condition_cart_product|qty':
                html += '<?php echo sprintf($rule_condition_cart_product_qty, '<span class="data-edit" data-type="select" data-values="operators" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>') ?>';
                break;
            case 'rule/condition_cart_product|total':
                html += '<?php echo sprintf($rule_condition_cart_product_total, '<span class="data-edit" data-type="select" data-values="operators" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>') ?>';
                break;
            case 'rule/condition_product|manufacturer_id':
            case 'rule/condition_cart_product|manufacturer_id':
                html += '<?php echo sprintf($rule_condition_manufacturer_id, '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="select" data-values="manufacturers" data-selected="" data-name="rule[{section}][{id}][value]"></span>') ?>';
                break;
            case 'rule/condition_product|category_id':
            case 'rule/condition_cart_product|category_id':
                html += '<?php echo sprintf($rule_condition_category_id, '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="select" data-values="categories" data-selected="" data-name="rule[{section}][{id}][value]"></span>') ?>';
                break;
            case 'rule/condition_product|model':
            case 'rule/condition_cart_product|model':
                html += '<?php echo sprintf($rule_condition_model, '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>') ?>';
                break;
        }

        if (type.startsWith('rule/condition_cart_product|attribute_')) {
            html += select_options.product_conditions[type] + ' <span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span> <span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>';
        }

        if (type.startsWith('rule/condition_product|attribute_')) {
            html += select_options.product_conditions_page[type] + ' <span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span> <span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>';
        }

        if (type.startsWith('rule/condition_cart_product|option_')) {
            html += select_options.product_conditions[type] + ' <span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span> ';
            if (type.endsWith('select') || type.endsWith('radio') || type.endsWith('checkbox') || type.endsWith('image')) {
                html += '<span class="data-edit" data-type="select" data-values="options_values_' + type.replace('rule/condition_cart_product|option_', '').split('|').slice(0, 1) + '" data-selected="" data-name="rule[{section}][{id}][value]"></span>';
            } else if (type.endsWith('text')) {
                html += '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>';
            } else if (type.endsWith('textarea')) {
                html += '<span class="data-edit" data-type="textarea" data-name="rule[{section}][{id}][value]">&hellip;</span>';
            } else if (type.endsWith('datetime')) {
                html += '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]" data-class="datetime">&hellip;</span>';
            } else if (type.endsWith('date')) {
                html += '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]" data-class="date">&hellip;</span>';
            } else if (type.endsWith('time')) {
                html += '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]" data-class="time">&hellip;</span>';
            }
        }

        if (type.startsWith('rule/condition_product|option_')) {
            html += select_options.product_conditions_page[type] + ' <span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span> ';
            if (type.endsWith('select') || type.endsWith('radio') || type.endsWith('checkbox') || type.endsWith('image')) {
                html += '<span class="data-edit" data-type="select" data-values="options_values_' + type.replace('rule/condition_product|option_', '').split('|').slice(0, 1) + '" data-selected="" data-name="rule[{section}][{id}][value]"></span>';
            } else if (type.endsWith('text')) {
                html += '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>';
            } else if (type.endsWith('textarea')) {
                html += '<span class="data-edit" data-type="textarea" data-name="rule[{section}][{id}][value]">&hellip;</span>';
            } else if (type.endsWith('datetime')) {
                html += '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]" data-class="datetime">&hellip;</span>';
            } else if (type.endsWith('date')) {
                html += '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]" data-class="date">&hellip;</span>';
            } else if (type.endsWith('time')) {
                html += '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]" data-class="time">&hellip;</span>';
            }
        }

        if (type != 'rule/new') {
            html += get_part('remove');
        }

        if (type == 'rule/condition_product_found' || type == 'rule/condition_product_subselect' || (type == 'rule/condition_combine' && product_conditions)) {
            html += '<ul class="rules" data-section="actions">';
            html += get_part('rule/new', 0, section, true);
            html += '</ul>';
        } else if (type == 'rule/condition_combine') {
            html += '<ul class="rules">';
            html += get_part('rule/new', 0, section, (section == 'actions'));
            html += '</ul>';
        }

        html += '</li>';

        return html.replace(/\{section\}/g, section).replace(/\{id\}/g, id);
    }
//--></script>
<script type="text/javascript"><!--
    // Cart Categories
    $('input[name=\'cart_categories\']').autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
                dataType: 'json',
                data: {token: '<?php echo $token; ?>', filter_name: encodeURIComponent(request.term)},
                type: 'POST',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item.name,
                            value: item.category_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#cart_category' + ui.item.value).remove();

            $('#cart_category').append('<div id="cart_category' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="cart_category[]" value="' + ui.item.value + '" /></div>');

            $('#cart_category div:odd').attr('class', 'odd');
            $('#cart_category div:even').attr('class', 'even');

            return false;
        },
        focus: function(event, ui) {
          return false;
       }
    });

    $('#cart_category div img').live('click', function() {
        $(this).parent().remove();

        $('#cart_category div:odd').attr('class', 'odd');
        $('#cart_category div:even').attr('class', 'even');
    });

    // Cart Products
    $('input[name=\'cart_products\']').autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
                dataType: 'json',
                data: {token: '<?php echo $token; ?>', filter_name: encodeURIComponent(request.term)},
                type: 'POST',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item.name,
                            value: item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            $('#cart_product' + ui.item.value).remove();

            $('#cart_product').append('<div id="cart_product' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" /><input type="hidden" name="cart_product[]" value="' + ui.item.value + '" /></div>');

            $('#cart_product div:odd').attr('class', 'odd');
            $('#cart_product div:even').attr('class', 'even');

            return false;
        }
    });

    $('#cart_product div img').live('click', function() {
        $(this).parent().remove();

        $('#cart_product div:odd').attr('class', 'odd');
        $('#cart_product div:even').attr('class', 'even');
    });
//--></script>
<script type="text/javascript"><!--
    var product_row = <?php echo $product_row; ?>;

    function addProduct() {
        var html  = '<tr id="row-product-' + product_row + '">';
        html += '   <td class="left">';
        html += '       <table class="form">';
        html += '           <tr>';
        html += '               <td><?php echo $entry_product; ?></td>';
        html += '               <td>';
        html += '                   <input data-row="' + product_row + '" type="text" name="ac_product_' + product_row + '" value="" size="60" />';
        html += '                   <input type="hidden" name="product[' + product_row + '][product_id]" value="" />';
        html += '               </td>';
        html += '           </tr>';
        html += '           <tr>';
        html += '               <td><?php echo $entry_quantity; ?></td>';
        html += '               <td>';
        html += '                   <input type="text" name="product[' + product_row + '][quantity]" value="1" size="4" />';
        html += '               </td>';
        html += '           </tr>';
        html += '           <tr>';
        html += '               <td><?php echo $entry_remove; ?></td>';
        html += '               <td>';
        html += '                   <label><?php echo $text_yes; ?><input type="radio" name="product[' + product_row + '][remove]" value="1" /></label>';
        html += '                   <label><?php echo $text_no; ?><input type="radio" name="product[' + product_row + '][remove]" value="0" checked="checked" /></label>';
        html += '               </td>';
        html += '           </tr>';
        html += '           <tr>';
        html += '               <td>&nbsp;</td>';
        html += '               <td class="product-info"></td>';
        html += '           </tr>';
        html += '       </table>';
        html += '   </td>';
        html += '   <td>';
        html += '       <a onclick="$(\'#row-product-' + product_row + '\').remove();" class="button"><span><?php echo $button_remove; ?></span></a>';
        html += '   </td>';
        html += '</tr>';

        $('#tab-products table.list > tbody').append(html);

        // Products
        $('input[name="ac_product_' + product_row + '"]').autocomplete({
            delay: 0,
            source: function(request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
                    dataType: 'json',
                    data: {token: '<?php echo $token; ?>', filter_name: encodeURIComponent(request.term)},
                    type: 'POST',
                    success: function(json) {
                        response($.map(json, function(item) {
                            return {
                                label: item.name,
                                value: item.product_id
                            }
                        }));
                    }
                });
            },
            select: function(event, ui) {
                $(this).val(ui.item.label);
                $(this).next().val(ui.item.value);
                $(this).closest('.form').find('.product-info').load('index.php?route=sale/special_triggers/product&token=<?php echo $token; ?>&product_id=' + ui.item.value + '&product_row=' + $(this).attr('data-row'));
                return false;
            }
        });

        product_row++;
    }
//--></script>
<?php echo $footer; ?>