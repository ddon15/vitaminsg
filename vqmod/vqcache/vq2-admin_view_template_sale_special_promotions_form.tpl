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

<style type="text/css">
					.buttons {
						background: url('view/image/box.png') repeat-x;
						border: 1px solid #DDD;
						border-radius: 7px;
						box-shadow: 0 3px 6px #999;
						margin: -1px 0 0 !important;
						padding: 6px;
						position: fixed;
						right: 30px;
					}
				</style>
				<?php if (!empty($success) || isset($this->session->data['success'])) { ?>
					<div class="success"><?php echo (!empty($success)) ? $success : $this->session->data['success']; ?></div>
					<?php unset($this->session->data['success']); ?>
				<?php } ?>
				<?php if (isset($this->session->data['tabselected'])) { ?>
					<script type="text/javascript">
						$(window).load(function(){
							$('a[href="#<?php echo $this->session->data['tabselected']; ?>"]').click();
						});
					</script>
					<?php unset($this->session->data['tabselected']); ?>
				<?php } ?>
    <div class="box">

        <div class="heading">

            <h1><img src="view/image/order.png" alt="" /> <?php echo $heading_title; ?></h1>

            <div class="buttons"><?php $route = explode('/', $this->request->get['route']); ?>
				<?php $no_ids = array('module', 'shipping', 'payment', 'total', 'feed'); ?>
				<?php if ((!in_array($route[0], $no_ids) && $route[1] != 'setting') && !strpos($this->request->server['REQUEST_URI'], '_id')) { ?>
					<a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a>
				<?php } else { ?>
					<a onclick="$('#form').submit();" class="button"><span><?php echo $this->language->get('button_save_and_exit'); ?></span></a>
					<a onclick="$('#form').attr('action', location + '&keepediting=true' + ($('#tabs a.selected').attr('href') ? '&tabselected=' + $('#tabs a.selected').attr('href').substring(1) : '')); $('#form').submit();" class="button"><span><?php echo $this->language->get('button_save_and_keep_editing'); ?></span></a>&nbsp;
				<?php } ?><a href="<?php echo $cancel; ?>" class="button"><span><?php echo $button_cancel; ?></span></a></div>

        </div>

        <div class="content">

            <div id="vtabs" class="vtabs">

                <a href="#tab-main"><?php echo $tab_main; ?></a>

                <a href="#tab-conditions"><?php echo $tab_conditions; ?></a>

                <a href="#tab-actions"><?php echo $tab_actions; ?></a>

                <?php if ($promotion_id) { ?>

                <a href="#tab-stats"><?php echo $tab_stats; ?></a>

                <?php } ?>

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

                        <?php foreach ($languages as $language) { ?>

                        <tr>

                            <td><span class="required">*</span> <?php echo $entry_label; ?></td>

                            <td>

                                <input type="text" name="label[<?php echo $language['language_id']; ?>]" size="100" value="<?php echo isset($label[$language['language_id']]) ? $label[$language['language_id']] : ''; ?>" />

                                <?php if (isset($error_label[$language['language_id']])) { ?>

                                    <span class="error"><?php echo $error_label[$language['language_id']]; ?></span>

                                <?php } ?>

                            </td>

                        </tr>

                        <?php } ?>

                        <tr>

                            <td><?php echo $entry_description; ?></td>

                            <td>

                                <textarea name="description" cols="40" rows="5"><?php echo $description; ?></textarea>

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

                        <tr style="display:none;">

                            <td><span class="required">*</span> <?php echo $entry_store; ?></td>

                            <td>

                                <div class="scrollbox">

                                    <?php $class = 'even'; ?>

                                        <label>

                                            <input type="checkbox" name="store_ids[]" value="0" checked="checked"/>

                                            <?php echo $text_default; ?>

                                        </label>

                                    </div>

                                    <?php foreach ($stores as $store) { ?>

                                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>

                                        <div class="<?php echo $class; ?>">

                                            <label>

                                                <input type="checkbox" name="store_ids[]" value="<?php echo $store['store_id']; ?>" checked="checked" />

                                                <?php echo $store['name']; ?>

                                            </label>

                                        </div>

                                    <?php } ?>

                                </div>

                                <?php if (isset($error_store)) { ?>

                                    <span class="error"><?php echo $error_store; ?></span><br />

                                <?php } ?>

                            </td>

                        </tr>

                        <tr style="display:none;">

                            <td><span class="required">*</span> <?php echo $entry_customer_group; ?></td>

                            <td>

                                <div class="scrollbox">

                                    <?php $class = 'odd'; ?>

                                    <?php foreach ($customer_groups as $customer_group) { ?>

                                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>

                                        <div class="<?php echo $class; ?>">

                                            <label>

                                                <input type="checkbox" name="customer_group_ids[]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked"/>

                                                <?php echo $customer_group['name']; ?>

                                            </label>

                                        </div>

                                    <?php } ?>

                                </div>

                                <?php if (isset($error_customer_group)) { ?>

                                    <span class="error"><?php echo $error_customer_group; ?></span><br />

                                <?php } ?>

                            </td>

                        </tr>

                        <tr style="display:none;">

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

                        <tr style="display:none;">

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

                        <tbody id="coupon_code" style="display:none;">

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

                         <tr>

                            <td><?php echo $entry_uses_total; ?></td>

                            <td>

                                <input type="text" name="uses_total" value="<?php echo $uses_total ? $uses_total : ''; ?>" size="4" />&nbsp;<label for="uses_total_day"><?php echo $text_per_day; ?> </label><input type="checkbox" id="uses_total_day" name="uses_total_day" value="1" />

                            </td>

                        </tr>

                        <tr>

                            <td><?php echo $entry_uses_customer; ?></td>

                            <td>

                                <input type="text" name="uses_customer" value="<?php echo $uses_customer ? $uses_customer : ''; ?>" size="4" />&nbsp;<label for="uses_customer_day"><?php echo $text_per_day; ?> </label><input type="checkbox" id="uses_customer_day" name="uses_customer_day" value="1" />

                            </td>

                        </tr>

                    </table>

                </div>

                <div id="tab-conditions" class="vtabs-content">

                    <h2><?php echo $text_apply_rule; ?></h2>

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

                <div id="tab-actions" class="vtabs-content">

                    <h2><?php echo $text_update_prices; ?></h2>

                    <table class="form">

                        <tr>

                            <td><?php echo $entry_discount_type; ?></td>

                            <td>

                                <select name="discount_type">

                                    <?php if ($discount_type == 'by_percent') { ?>

                                        <option value="by_percent" selected="selected"><?php echo $text_by_percent; ?></option>

                                    <?php } else { ?>

                                        <option value="by_percent"><?php echo $text_by_percent; ?></option>

                                    <?php } ?>

                                    <?php if ($discount_type == 'by_fixed') { ?>

                                        <option value="by_fixed" selected="selected"><?php echo $text_by_fixed; ?></option>

                                    <?php } else { ?>

                                        <option value="by_fixed"><?php echo $text_by_fixed; ?></option>

                                    <?php } ?>

                                    <?php if ($discount_type == 'pack_by_percent') { ?>

                                        <option value="pack_by_percent" selected="selected"><?php echo $text_pack_by_percent; ?></option>

                                    <?php } else { ?>

                                        <option value="pack_by_percent"><?php echo $text_pack_by_percent; ?></option>

                                    <?php } ?>

                                    <?php if ($discount_type == 'pack_by_fixed') { ?>

                                        <option value="pack_by_fixed" selected="selected"><?php echo $text_pack_by_fixed; ?></option>

                                    <?php } else { ?>

                                        <option value="pack_by_fixed"><?php echo $text_pack_by_fixed; ?></option>

                                    <?php } ?>

                                    <?php if ($discount_type == 'n_products_fixed') { ?>

                                        <option value="n_products_fixed" selected="selected"><?php echo $text_n_products_fixed; ?></option>

                                    <?php } else { ?>

                                        <option value="n_products_fixed"><?php echo $text_n_products_fixed; ?></option>

                                    <?php } ?>

                                    <?php if ($discount_type == 'n_products_percent') { ?>

                                        <option value="n_products_percent" selected="selected"><?php echo $text_n_products_percent; ?></option>

                                    <?php } else { ?>

                                        <option value="n_products_percent"><?php echo $text_n_products_percent; ?></option>

                                    <?php } ?>

                                     <?php if ($discount_type == 'after_n_fixed') { ?>

                                        <option value="after_n_fixed" selected="selected"><?php echo $text_after_n_fixed; ?></option>

                                    <?php } else { ?>

                                        <option value="after_n_fixed"><?php echo $text_after_n_fixed; ?></option>

                                    <?php } ?>

                                    <?php if ($discount_type == 'after_n_percent') { ?>

                                        <option value="after_n_percent" selected="selected"><?php echo $text_after_n_percent; ?></option>

                                    <?php } else { ?>

                                        <option value="after_n_percent"><?php echo $text_after_n_percent; ?></option>

                                    <?php } ?>

                                    <?php if ($discount_type == 'buy_x_get_y_fixed') { ?>

                                        <option value="buy_x_get_y_fixed" selected="selected"><?php echo $text_buy_x_get_y_fixed; ?></option>

                                    <?php } else { ?>

                                        <option value="buy_x_get_y_fixed"><?php echo $text_buy_x_get_y_fixed; ?></option>

                                    <?php } ?>

                                    <?php if ($discount_type == 'buy_x_get_y_percent') { ?>

                                        <option value="buy_x_get_y_percent" selected="selected"><?php echo $text_buy_x_get_y_percent; ?></option>

                                    <?php } else { ?>

                                        <option value="buy_x_get_y_percent"><?php echo $text_buy_x_get_y_percent; ?></option>

                                    <?php } ?>

                                    <?php if ($discount_type == 'buy_x_cart_get_y_fixed') { ?>

                                        <option value="buy_x_cart_get_y_fixed" selected="selected"><?php echo $text_buy_x_cart_get_y_fixed; ?></option>

                                    <?php } else { ?>

                                        <option value="buy_x_cart_get_y_fixed"><?php echo $text_buy_x_cart_get_y_fixed; ?></option>

                                    <?php } ?>

                                    <?php if ($discount_type == 'buy_x_cart_get_y_percent') { ?>

                                        <option value="buy_x_cart_get_y_percent" selected="selected"><?php echo $text_buy_x_cart_get_y_percent; ?></option>

                                    <?php } else { ?>

                                        <option value="buy_x_cart_get_y_percent"><?php echo $text_buy_x_cart_get_y_percent; ?></option>

                                    <?php } ?>

                                </select>&nbsp;&nbsp;

                                <a href="#" class="promotion_help"><img valign="middle" src="view/image/promotion/info.png" alt=""></a><br/>

                                <?php if($ignore_item_qty) {

                                    $checked = ' checked="checked"';

                                } else {

                                    $checked = '';

                                } ?>

                                <input type="checkbox"<?php echo $checked; ?> id="ignore_item_qty" name="ignore_item_qty" value="1" />&nbsp;<label for="ignore_item_qty"><?php echo $text_ignore_item_qty; ?></label>

                            </td>

                        </tr>

                         <tbody id="by_percent" class="sp_hidden" style="display: none;">

                            <tr>

                                <td></td>

                                <td>

                                    <?php echo $text_by_percent_help; ?>

                                </td>

                            </tr>

                        </tbody>

                        <tbody id="by_fixed" class="sp_hidden" style="display: none;">

                            <tr>

                                <td></td>

                                <td>

                                    <?php echo $text_by_fixed_help; ?>

                                </td>

                            </tr>

                        </tbody>

                        <tbody id="pack_by_percent" class="sp_hidden" style="display: none;">

                            <tr>

                                <td></td>

                                <td>

                                    <?php echo $text_pack_by_percent_help; ?>

                                </td>

                            </tr>

                        </tbody>

                        <tbody id="pack_by_fixed" class="sp_hidden" style="display: none;">

                            <tr>

                                <td></td>

                                <td>

                                    <?php echo $text_pack_by_fixed_help; ?>

                                </td>

                            </tr>

                        </tbody>

                        <tbody id="get_y_for_each_x_spent" class="sp_hidden" style="display: none;">

                            <tr>

                                <td></td>

                                <td>

                                    <?php echo $text_get_y_for_each_x_spent_help; ?>

                                </td>

                            </tr>

                        </tbody>

                        <tbody id="n_products" class="sp_hidden" style="display: none;">

                            <tr>

                                <td></td>

                                <td>

                                    <?php echo $text_n_products_help; ?>

                                </td>

                            </tr>

                        </tbody>

                        <tbody id="each_n" class="sp_hidden" style="display: none;">

                            <tr>

                                <td></td>

                                <td>

                                    <?php echo $text_each_n_help; ?>

                                </td>

                            </tr>

                        </tbody>

                        <tbody id="each_cart_n" class="sp_hidden" style="display: none;">

                            <tr>

                                <td></td>

                                <td>

                                    <?php echo $text_each_cart_n_help; ?>

                                </td>

                            </tr>

                        </tbody>

                        <tbody id="buy_x_get_y" class="sp_hidden" style="display: none;">

                            <tr>

                                <td></td>

                                <td>

                                    <?php echo $text_buy_x_get_y_help; ?>

                                </td>

                            </tr>

                        </tbody>

                        <tbody id="buy_x_cart_get_y" class="sp_hidden" style="display: none;">

                            <tr>

                                <td></td>

                                <td>

                                    <?php echo $text_buy_x_cart_get_y_help; ?>

                                </td>

                            </tr>

                        </tbody>

                        <tbody id="after_n" class="sp_hidden" style="display: none;">

                            <tr>

                                <td></td>

                                <td>

                                    <?php echo $text_after_n_help; ?>

                                </td>

                            </tr>

                        </tbody>

                        <tbody id="after_cart_n" class="sp_hidden" style="display: none;">

                            <tr>

                                <td></td>

                                <td>

                                    <?php echo $text_after_cart_n_help; ?>

                                </td>

                            </tr>

                        </tbody>

                        <tr>

                            <td><?php echo $entry_discount_amount; ?></td>

                            <td>

                                <input type="text" name="discount_amount" value="<?php echo $discount_amount; ?>" />

                            </td>

                        </tr>

                        <tbody id="discount_option">

                            <tr>

                                <td><?php echo $entry_discount_option; ?></td>

                                <td>

                                    <input type="text" name="discount_option" value="<?php echo $discount_option; ?>" size="4" />

                                </td>

                            </tr>

                        </tbody>

                        <tbody id="promo_categories">

                            <?php if (version_compare(VERSION, '1.5.5.1') >= 0) { ?>

                                <tr>

                                    <td><?php echo $entry_promo_categories; ?></td>

                                    <td><input type="text" name="promo_categories" value="" /></td>

                                </tr>

                                <tr>

                                    <td>&nbsp;</td>

                                    <td>

                                        <div class="scrollbox" id="promo_category">

                                            <?php $class = 'odd'; ?>

                                            <?php foreach ($promo_categories as $promo_category) { ?>

                                                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>

                                                <div id="promo_category<?php echo $promo_category['category_id']; ?>" class="<?php echo $class; ?>">

                                                    <?php echo $promo_category['name']; ?><img src="view/image/delete.png" />

                                                    <input type="hidden" name="promo_category[]" value="<?php echo $promo_category['category_id']; ?>" />

                                                </div>

                                            <?php } ?>

                                        </div>

                                    </td>

                                </tr>

                            <?php } else { ?>

                                <tr>

                                   <td><?php echo $entry_promo_categories; ?></td>

                                   <td>

                                       <div class="scrollbox">

                                           <?php $class = 'odd'; ?>

                                           <?php foreach ($categories as $category) { ?>

                                               <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>

                                               <div class="<?php echo $class; ?>">

                                                   <?php if ($promo_categories && is_array($promo_categories) && in_array($category['category_id'], $promo_categories)) { ?>

                                                       <input type="checkbox" name="promo_category[]" value="<?php echo $category['category_id']; ?>" checked="checked" />

                                                   <?php } else { ?>

                                                       <input type="checkbox" name="promo_category[]" value="<?php echo $category['category_id']; ?>" />

                                                   <?php } ?>

                                                   <?php echo $category['name']; ?>

                                               </div>

                                           <?php } ?>

                                       </div>

                                   </td>

                                </tr>

                            <?php } ?>

                        </tbody>

                        <tbody id="promo_products">

                            <tr>

                                <td><?php echo $entry_promo_products; ?></td>

                                <td><input type="text" name="promo_products" value="" /></td>

                            </tr>

                            <tr>

                                <td>&nbsp;</td>

                                <td>

                                    <div class="scrollbox" id="promo_product">

                                        <?php $class = 'odd'; ?>

                                        <?php foreach ($promo_products as $promo_product) { ?>

                                            <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>

                                            <div id="promo_product<?php echo $promo_product['product_id']; ?>" class="<?php echo $class; ?>">

                                                <?php echo $promo_product['name']; ?><img src="view/image/delete.png" />

                                                <input type="hidden" name="promo_product[]" value="<?php echo $promo_product['product_id']; ?>" />

                                            </div>

                                        <?php } ?>

                                    </div>

                                </td>

                            </tr>

                            <tr>

                                <td><?php echo $entry_promo_qty; ?></td>

                                <td>

                                    <input type="text" name="promo_qty" value="<?php echo $promo_qty; ?>" size="4" />

                                </td>

                            </tr>

                        </tbody>

                        <tr>

                            <td><?php echo $entry_discount_qty; ?></td>

                            <td>

                                <input type="text" name="discount_qty" value="<?php echo $discount_qty; ?>" size="4" />

                            </td>

                        </tr>

                        <tr style="display:none;">

                            <td><?php echo $entry_free_shipping; ?></td>

                            <td>

                                <?php if($free_shipping) {

                                    $checked1 = ' checked="checked"';

                                    $checked0 = '';

                                } else {

                                    $checked1 = '';

                                    $checked0 = ' checked="checked"';

                                } ?>

                                <label for="free_shipping_1">

                                    <?php echo $text_yes; ?>

                                    <input type="radio"<?php echo $checked1; ?> id="free_shipping_1" name="free_shipping" value="1" />

                                </label>

                                <label for="free_shipping_0">

                                    <?php echo $text_no; ?>

                                    <input type="radio"<?php echo $checked0; ?> id="free_shipping_0" name="free_shipping" value="0" />

                                </label>

                            </td>

                        </tr>

                        <tr style="display:none;">

                            <td><?php echo $entry_stop_rules_processing; ?></td>

                            <td>

                                <?php if($stop_rules_processing) {

                                    $checked1 = ' checked="checked"';

                                    $checked0 = '';

                                } else {

                                    $checked1 = '';

                                    $checked0 = ' checked="checked"';

                                } ?>

                                <label for="stop_rules_processing_1">

                                    <?php echo $text_yes; ?>

                                    <input type="radio"<?php echo $checked1; ?> id="stop_rules_processing_1" name="stop_rules_processing" value="1" />

                                </label>

                                <label for="stop_rules_processing_0">

                                    <?php echo $text_no; ?>

                                    <input type="radio"<?php echo $checked0; ?> id="stop_rules_processing_0" name="stop_rules_processing" value="0" />

                                </label>

                            </td>

                        </tr>

                    </table>

                    <h2><?php echo $text_rule_to_products; ?></h2>

                    <table class="form">

                            <tr class="sp_pack">

                                <td><?php echo $entry_rule_categories; ?></td>

                                <td><input type="text" name="rule_categories" value="" /></td>

                            </tr>

                            <tr class="sp_pack">

                                <td>&nbsp;</td>

                                <td>

                                    <div class="scrollbox" id="rule_category">

                                        <?php $class = 'odd'; ?>

                                        <?php foreach ($rule_categories as $rule_category) { ?>

                                            <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>

                                            <div id="rule_category<?php echo $rule_category['category_id']; ?>" class="<?php echo $class; ?>">

                                                <?php echo $rule_category['name']; ?><img src="view/image/delete.png" />

                                                <input type="hidden" name="rule_category[]" value="<?php echo $rule_category['category_id']; ?>" />

                                            </div>

                                        <?php } ?>

                                    </div>

                                </td>

                            </tr>

                            <tr class="sp_pack">

                                <td><?php echo $entry_rule_manufacturer; ?></td>

                                <td><input type="text" name="rule_manufacturers" value="" /></td>

                            </tr>

                            <tr class="sp_pack">

                                <td>&nbsp;</td>

                                <td>

                                    <div class="scrollbox" id="rule_manufacturer">

                                        <?php $class = 'odd'; ?>

                                        <?php foreach ($rule_manufacturers as $rule_manufacturer) { ?>

                                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>

                                        <div id="rule_manufacturer<?php echo $rule_manufacturer['manufacturer_id']; ?>" class="<?php echo $class; ?>">

                                            <?php echo $rule_manufacturer['name']; ?><img src="view/image/delete.png" />

                                            <input type="hidden" name="rule_manufacturer[]" value="<?php echo $rule_manufacturer['manufacturer_id']; ?>" />

                                        </div>

                                        <?php } ?>

                                    </div>

                                </td>

                            </tr>

                            <tr>

                                <td><?php echo $entry_rule_products; ?></td>

                                <td><input type="text" name="rule_products" value="" /></td>

                            </tr>

                            <tr>

                                <td>&nbsp;</td>

                                <td>

                                    <div class="scrollbox" id="rule_product">

                                        <?php $class = 'odd'; ?>

                                        <?php foreach ($rule_products as $rule_product) { ?>

                                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>

                                        <div id="rule_product<?php echo $rule_product['product_id']; ?>" class="<?php echo $class; ?>">

                                            <?php echo $rule_product['name']; ?><img src="view/image/delete.png" />

                                            <input type="hidden" name="rule_product[]" value="<?php echo $rule_product['product_id']; ?>" />

                                        </div>

                                        <?php } ?>

                                    </div>

                                </td>

                            </tr>

                            <tr class="sp_pack">

                                <td style="color:red;font-weight:bold;"><?php echo $entry_exclusion_manufacturers;?>:</td>

                                <td><input type="text" name="rule_exclusion_manufacturers" value="" /></td>

                            </tr>

                            <tr class="sp_pack">

                                <td>&nbsp;</td>

                                <td>

                                    <div class="scrollbox" id="rule_exclusion_manufacturer">

                                        <?php $class = 'odd'; ?>

                                        <?php foreach ($rule_exclusion_manufacturers as $rule_exclusion_manufacturer) { ?>

                                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>

                                        <div id="rule_exclusion_manufacturer<?php echo $rule_exclusion_manufacturer['manufacturer_id']; ?>" class="<?php echo $class; ?>">

                                            <?php echo $rule_exclusion_manufacturer['name']; ?><img src="view/image/delete.png" />

                                            <input type="hidden" name="rule_exclusion_manufacturer[]" value="<?php echo $rule_exclusion_manufacturer['manufacturer_id']; ?>" />

                                        </div>

                                        <?php } ?>

                                    </div>

                                </td>

                            </tr>

                            <tr class="sp_pack">

                                <td style="color:red;font-weight:bold;"><?php echo $entry_exclusion_products;?>:</td>

                                <td><input type="text" name="rule_exclusion_products" value="" /></td>

                            </tr>

                            <tr class="sp_pack">

                                <td>&nbsp;</td>

                                <td>

                                    <div class="scrollbox" id="rule_exclusion_product">

                                        <?php $class = 'odd'; ?>

                                        <?php foreach ($rule_exclusion_products as $rule_exclusion_product) { ?>

                                            <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>

                                            <div id="rule_exclusion_product<?php echo $rule_exclusion_product['product_id']; ?>" class="<?php echo $class; ?>">

                                                <?php echo $rule_exclusion_product['name']; ?><img src="view/image/delete.png" />

                                                <input type="hidden" name="rule_exclusion_product[]" value="<?php echo $rule_exclusion_product['product_id']; ?>" />

                                            </div>

                                        <?php } ?>

                                    </div>

                                </td>    

                            </tr>

                    </table>




                    <h2 class="sp_pack" style="visibility: hidden;display:none;"><?php echo $text_rule_to_conditions; ?></h2>

                    <table class="form sp_pack" style="visibility:hidden;display:none;">

                        <tr>

                            <td>

                                <?php

                                    function actionsTree($actions, $scope, $key = '') {



                                        if (!$key) {

                                            $out = '<div class="rule">';

                                        } elseif ($key == '1--') {

                                            $out = '<ul class="rules" data-section="actions">';

                                        } else {

                                            $out = '<ul class="rules">';

                                        }



                                        foreach($actions as $i => $action) {

                                            $k = $key . ($i + 1);



                                            if ($key) {

                                                $out .= '<li>';

                                            }



                                            $out .= '<input type="hidden" name="rule[actions][' . $k . '][type]" value="' . $action['type'] . '" />';



                                            switch ($action['type']) {

                                                case 'rule/condition_combine':

                                                    $out .= sprintf($scope['rule_condition_combine'], '<span class="data-edit" data-type="select" data-values="all_any" data-selected="' . $action['aggregator'] . '" data-name="rule[actions][' . $k . '][aggregator]"></span>', '<span class="data-edit" data-type="select" data-values="true_false" data-selected="' . $action['value'] . '" data-name="rule[actions][' . $k . '][value]"></span>');

                                                break;

                                                case 'rule/condition_cart_product|price':

                                                    $out .= sprintf($scope['rule_condition_cart_product_price'], '<span class="data-edit" data-type="select" data-values="operators" data-selected="' . $action['operator'] . '" data-name="rule[actions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[actions][' . $k . '][value]" data-selected="' . $action['value'] . '">' . ($action['value'] ? $action['value'] : '&hellip;') . '</span>');

                                                break;

                                                case 'rule/condition_cart_product|qty':

                                                    $out .= sprintf($scope['rule_condition_cart_product_qty'], '<span class="data-edit" data-type="select" data-values="operators" data-selected="' . $action['operator'] . '" data-name="rule[actions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[actions][' . $k . '][value]" data-selected="' . $action['value'] . '">' . ($action['value'] ? $action['value'] : '&hellip;') . '</span>');

                                                break;

                                                case 'rule/condition_cart_product|total':

                                                    $out .= sprintf($scope['rule_condition_cart_product_total'], '<span class="data-edit" data-type="select" data-values="operators" data-selected="' . $action['operator'] . '" data-name="rule[actions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[actions][' . $k . '][value]" data-selected="' . $action['value'] . '">' . ($action['value'] ? $action['value'] : '&hellip;') . '</span>');

                                                break;

                                                case 'rule/condition_cart_product|manufacturer_id':

                                                    $out .= sprintf($scope['rule_condition_manufacturer_id'], '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="' . $action['operator'] . '" data-name="rule[actions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="select" data-values="manufacturers" data-name="rule[actions][' . $k . '][value]" data-selected="' . $action['value'] . '"></span>');

                                                break;

                                                case 'rule/condition_cart_product|category_id':

                                                    $out .= sprintf($scope['rule_condition_category_id'], '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="' . $action['operator'] . '" data-name="rule[actions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="select" data-values="categories" data-name="rule[actions][' . $k . '][value]" data-selected="' . $action['value'] . '"></span>');

                                                break;

                                                case 'rule/condition_cart_product|model':

                                                    $out .= sprintf($scope['rule_condition_model'], '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="' . $action['operator'] . '" data-name="rule[actions][' . $k . '][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[actions][' . $k . '][value]" data-selected="' . $action['value'] . '">' . ($action['value'] ? $action['value'] : '&hellip;') . '</span>');

                                                break;

                                            }



                                            if (strpos($action['type'], 'rule/condition_cart_product|attribute_') === 0) {

                                                $out .= $scope['values_product_conditions'][$action['type']] . ' <span class="data-edit" data-type="select" data-values="is_is_not" data-selected="' . $action['operator'] . '" data-name="rule[actions][' . $k . '][operator]"></span> <span class="data-edit" data-type="text" data-name="rule[actions][' . $k . '][value]" data-selected="' . $action['value'] . '">' . ($action['value'] ? $action['value'] : '&hellip;') . '</span>';

                                            }



                                            if (strpos($action['type'], 'rule/condition_cart_product|option_') === 0) {

                                                $out .= $scope['values_product_conditions'][$action['type']] . ' <span class="data-edit" data-type="select" data-values="is_is_not" data-selected="' . $action['operator'] . '" data-name="rule[actions][' . $k . '][operator]"></span> ';

                                                if (substr($action['type'], -strlen('select')) === 'select' || substr($action['type'], -strlen('radio')) === 'radio' || substr($action['type'], -strlen('checkbox')) === 'checkbox' || substr($action['type'], -strlen('image')) === 'image') {

                                                    $arr = explode('|', str_replace('rule/condition_cart_product|option_', '', $action['type']));

                                                    $out .= '<span class="data-edit" data-type="select" data-values="options_values_' . array_shift($arr) . '" data-selected="' . $action['value'] . '" data-name="rule[actions][' . $k . '][value]"></span>';

                                                } elseif (substr($action['type'], -strlen('text')) === 'text') {

                                                    $out .= '<span class="data-edit" data-type="text" data-name="rule[actions][' . $k . '][value]" data-selected="' . $action['value'] . '">' . ($action['value'] ? $action['value'] : '&hellip;') . '</span>';

                                                } elseif (substr($action['type'], -strlen('textarea')) === 'textarea') {

                                                    $out .= '<span class="data-edit" data-type="textarea" data-name="rule[actions][' . $k . '][value]">' . ($action['value'] ? $action['value'] : '&hellip;') . '</span>';

                                                } elseif (substr($action['type'], -strlen('datetime')) === 'datetime') {

                                                    $out .= '<span class="data-edit" data-type="text" data-name="rule[actions][' . $k . '][value]" data-class="datetime" data-selected="' . $action['value'] . '">' . ($action['value'] ? $action['value'] : '&hellip;') . '</span>';

                                                } elseif (substr($action['type'], -strlen('date')) === 'date') {

                                                    $out .= '<span class="data-edit" data-type="text" data-name="rule[actions][' . $k . '][value]" data-class="date" data-selected="' . $action['value'] . '">' . ($action['value'] ? $action['value'] : '&hellip;') . '</span>';

                                                } elseif (substr($action['type'], -strlen('time')) === 'time') {

                                                    $out .= '<span class="data-edit" data-type="text" data-name="rule[actions][' . $k . '][value]" data-class="time" data-selected="' . $action['value'] . '">' . ($action['value'] ? $action['value'] : '&hellip;') . '</span>';

                                                }

                                            }



                                            if (!$key) {

                                                $out .= '</div>';

                                            } else {

                                                $out .= '<img class="remove-rule" src="view/image/delete.png" alt="" valign="middle" />';

                                            }



                                            if (!empty($action['rules'])) {

                                                $out .= actionsTree($action['rules'], $scope, $k . '--');

                                            } elseif (!$key) {

                                                $out .= '<ul class="rules" data-section="actions">';

                                                $out .= '<li><span class="data-edit" data-rule="new" data-type="select" data-values="product_conditions"><img class="add-rule" src="view/image/add.png" alt="" valign="middle" /></span></li>';

                                                $out .= '</ul>';

                                            }



                                            if ($key) {

                                                $out.= '</li>';

                                            }

                                        }



                                        if ($key) {

                                            $out .= '<li><span class="data-edit" data-rule="new" data-type="select" data-values="product_conditions"><img class="add-rule" src="view/image/add.png" alt="" valign="middle" /></span></li>';



                                            $out .= '</ul>';

                                        }



                                        return $out;

                                    }



                                    if (empty($rule['actions'])) {

                                        $rule['actions'] = array(array('type' => 'rule/condition_combine', 'aggregator' => 'all', 'value' => '1'));

                                    }



                                    echo actionsTree($rule['actions'], $this->data);

                                ?>

                            </td>

                        </tr>

                    </table>

                </div>

             

                <?php if ($promotion_id) { ?>

                    <div id="tab-stats" class="vtabs-content">

                        <div id="stats"></div>

                    </div>

                <?php } ?>

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

<script type="text/javascript"><!--

    // Promo Categories

    $('input[name=\'promo_categories\']').autocomplete({

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

            $('#promo_category' + ui.item.value).remove();



            $('#promo_category').append('<div id="promo_category' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="promo_category[]" value="' + ui.item.value + '" /></div>');



            $('#promo_category div:odd').attr('class', 'odd');

            $('#promo_category div:even').attr('class', 'even');



            return false;

        },

        focus: function(event, ui) {

          return false;

       }

    });



    $('#promo_category div img').live('click', function() {

        $(this).parent().remove();



        $('#promo_category div:odd').attr('class', 'odd');

        $('#promo_category div:even').attr('class', 'even');

    });



    // Promo Products

    $('input[name=\'promo_products\']').autocomplete({

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

            $('#promo_product' + ui.item.value).remove();



            $('#promo_product').append('<div id="promo_product' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" /><input type="hidden" name="promo_product[]" value="' + ui.item.value + '" /></div>');



            $('#promo_product div:odd').attr('class', 'odd');

            $('#promo_product div:even').attr('class', 'even');



            return false;

        }

    });



    $('#promo_product div img').live('click', function() {

        $(this).parent().remove();



        $('#promo_product div:odd').attr('class', 'odd');

        $('#promo_product div:even').attr('class', 'even');

    });



    // Rule Categories

    $('input[name=\'rule_categories\']').autocomplete({

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

            $('#rule_category' + ui.item.value).remove();



            $('#rule_category').append('<div id="rule_category' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="rule_category[]" value="' + ui.item.value + '" /></div>');



            $('#rule_category div:odd').attr('class', 'odd');

            $('#rule_category div:even').attr('class', 'even');



            return false;

        },

        focus: function(event, ui) {

          return false;

       }

    });



    $('#rule_category div img').live('click', function() {

        $(this).parent().remove();



        $('#rule_category div:odd').attr('class', 'odd');

        $('#rule_category div:even').attr('class', 'even');

    });



    // Rule Products

    $('input[name=\'rule_products\']').autocomplete({

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

            $('#rule_product' + ui.item.value).remove();



            $('#rule_product').append('<div id="rule_product' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" /><input type="hidden" name="rule_product[]" value="' + ui.item.value + '" /></div>');



            $('#rule_product div:odd').attr('class', 'odd');

            $('#rule_product div:even').attr('class', 'even');



            return false;

        }

    });



    $('#rule_product div img').live('click', function() {

        $(this).parent().remove();



        $('#rule_product div:odd').attr('class', 'odd');

        $('#rule_product div:even').attr('class', 'even');

    });

    // Rule Manufacturer

    $('input[name=\'rule_manufacturers\']').autocomplete({

        delay: 0,

        source: function(request, response) {

            $.ajax({

                url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),

                dataType: 'json',

                data: {token: '<?php echo $token; ?>', filter_name: encodeURIComponent(request.term)},

                type: 'POST',

                success: function(json) {

                    response($.map(json, function(item) {

                        return {

                            label: item.name,

                            value: item.manufacturer_id

                        }

                    }));

                }

            });

        },

        select: function(event, ui) {

            $('#rule_manufacturer' + ui.item.value).remove();



            $('#rule_manufacturer').append('<div id="rule_manufacturer' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" /><input type="hidden" name="rule_manufacturer[]" value="' + ui.item.value + '" /></div>');



            $('#rule_manufacturer div:odd').attr('class', 'odd');

            $('#rule_manufacturer div:even').attr('class', 'even');


            return false;

        }

    });

    $('#rule_manufacturer div img').live('click', function() {

        $(this).parent().remove();



        $('#rule_manufacturer div:odd').attr('class', 'odd');

        $('#rule_manufacturer div:even').attr('class', 'even');

    });

    

      // Rule Exclusion Products

    $('input[name=\'rule_exclusion_products\']').autocomplete({

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

            $('#rule_exclusion_product' + ui.item.value).remove();



            $('#rule_exclusion_product').append('<div id="rule_exclusion_product' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" /><input type="hidden" name="rule_exclusion_product[]" value="' + ui.item.value + '" /></div>');



            $('#rule_exclusion_product div:odd').attr('class', 'odd');

            $('#rule_exclusion_product div:even').attr('class', 'even');



            return false;

        }

    });



    $('#rule_exclusion_product div img').live('click', function() {

        $(this).parent().remove();



        $('#rule_exclusion_product div:odd').attr('class', 'odd');

        $('#rule_exclusion_product div:even').attr('class', 'even');

    });

    

        

      // Rule Exclusion Products

    $('input[name=\'rule_exclusion_manufacturers\']').autocomplete({

        delay: 0,

        source: function(request, response) {

            $.ajax({

                url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),

                dataType: 'json',

                data: {token: '<?php echo $token; ?>', filter_name: encodeURIComponent(request.term)},

                type: 'POST',

                success: function(json) {

                    response($.map(json, function(item) {

                        return {

                            label: item.name,

                            value: item.manufacturer_id

                        }

                    }));

                }

            });

        },

        select: function(event, ui) {

            $('#rule_exclusion_manufacturer' + ui.item.value).remove();



            $('#rule_exclusion_manufacturer').append('<div id="rule_exclusion_manufacturer' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" /><input type="hidden" name="rule_exclusion_manufacturer[]" value="' + ui.item.value + '" /></div>');



            $('#rule_exclusion_manufacturer div:odd').attr('class', 'odd');

            $('#rule_exclusion_manufacturer div:even').attr('class', 'even');



            return false;

        }

    });



    $('#rule_exclusion_manufacturer div img').live('click', function() {

        $(this).parent().remove();



        $('#rule_exclusion_manufacturer div:odd').attr('class', 'odd');

        $('#rule_exclusion_manufacturer div:even').attr('class', 'even');

    });

//--></script>

<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>

<script type="text/javascript"><!--

    $(document).ready(function() {

        $('.vtabs a').tabs();

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



        $('select[name=discount_type]').bind('change', function(){

            $('.sp_hidden').hide();

            $('.sp_pack').show();



            $('label[for=ignore_item_qty]').hide();

            $('#ignore_item_qty').hide();



            if ($(this).val() == 'buy_x_get_y_percent' || $(this).val() == 'buy_x_get_y_fixed') {

                $('#promo_categories').show();

                $('#promo_products').show();

            } else if ($(this).val() == 'buy_x_cart_get_y_percent' || $(this).val() == 'buy_x_cart_get_y_fixed') {

                $('#promo_categories').show();

                $('#promo_products').show();



                $('label[for=ignore_item_qty]').show();

                $('#ignore_item_qty').show();

            } else if ($(this).val() == 'pack_by_percent' || $(this).val() == 'pack_by_fixed') {

                $('#promo_categories').show();

                $('#promo_products').show();

            } else {

                $('#promo_categories').hide();

                $('#promo_products').hide();

            }



            if ($(this).val() == 'buy_x_get_y_percent' || $(this).val() == 'buy_x_get_y_fixed' || $(this).val() == 'buy_x_cart_get_y_percent' || $(this).val() == 'buy_x_cart_get_y_fixed') {

                $('#discount_option').show();

            } else if ($(this).val() == 'get_y_for_each_x_spent') {

                $('#discount_option').show();

            } else if ($(this).val() == 'n_products_percent' || $(this).val() == 'n_products_fixed') {

                $('#discount_option').show();

            } else if ($(this).val() == 'each_n_percent' || $(this).val() == 'each_n_fixed') {

                $('#discount_option').show();

            } else if ($(this).val() == 'each_cart_n_percent' || $(this).val() == 'each_cart_n_fixed') {

                $('#discount_option').show();

                $('label[for=ignore_item_qty]').show();

                $('#ignore_item_qty').show();

            } else if ($(this).val() == 'after_n_percent' || $(this).val() == 'after_n_fixed') {

                $('#discount_option').show();

            } else if ($(this).val() == 'after_cart_n_percent' || $(this).val() == 'after_cart_n_fixed') {

                $('#discount_option').show();

                $('label[for=ignore_item_qty]').show();

                $('#ignore_item_qty').show();

            } else if ($(this).val() == 'pack_by_percent' || $(this).val() == 'pack_by_fixed') {

                $('#discount_option').show();

                $('.sp_pack').hide();

            } else {

                $('#discount_option').hide();

            }

        });



        $('select[name=discount_type]').trigger('change');



        $('a.promotion_help').click(function(e){

            e.preventDefault();



            var _this = $('select[name=discount_type]');



            if (_this.val() == 'buy_x_get_y_percent' || _this.val() == 'buy_x_get_y_fixed') {

                $('#buy_x_get_y').toggle();

            } else if (_this.val() == 'buy_x_cart_get_y_percent' || _this.val() == 'buy_x_cart_get_y_fixed') {

                $('#buy_x_cart_get_y').toggle();

            } else if (_this.val() == 'get_y_for_each_x_spent') {

                $('#get_y_for_each_x_spent').toggle();

            } else if (_this.val() == 'n_products_percent' || _this.val() == 'n_products_fixed') {

                $('#n_products').toggle();

            } else if (_this.val() == 'each_n_percent' || _this.val() == 'each_n_fixed') {

                $('#each_n').toggle();

            } else if (_this.val() == 'each_cart_n_percent' || _this.val() == 'each_cart_n_fixed') {

                $('#each_cart_n').toggle();

            } else if (_this.val() == 'after_n_percent' || _this.val() == 'after_n_fixed') {

                $('#after_n').toggle();

            } else if (_this.val() == 'after_cart_n_percent' || _this.val() == 'after_cart_n_fixed') {

                $('#after_cart_n').toggle();

            } else if (_this.val() == 'by_percent') {

                $('#by_percent').toggle();

            } else if (_this.val() == 'by_fixed') {

                $('#by_fixed').toggle();

            } else if (_this.val() == 'pack_by_percent') {

                $('#pack_by_percent').toggle();

            } else if (_this.val() == 'pack_by_fixed') {

                $('#pack_by_fixed').toggle();

            }



            return false;

        });



        $('.data-edit select').live('change', function() {

            $(this).blur();

        });



        $('.remove-rule').live('click', function() {

            $(this).parent().remove();

        });



        $('.warning, .success').live('click', function() {

           $(this).remove();

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

            case 'rule/condition_cart_product|manufacturer_id':

                html += '<?php echo sprintf($rule_condition_manufacturer_id, '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="select" data-values="manufacturers" data-selected="" data-name="rule[{section}][{id}][value]"></span>') ?>';

                break;

            case 'rule/condition_cart_product|category_id':

                html += '<?php echo sprintf($rule_condition_category_id, '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="select" data-values="categories" data-selected="" data-name="rule[{section}][{id}][value]"></span>') ?>';

                break;

            case 'rule/condition_cart_product|model':

                html += '<?php echo sprintf($rule_condition_model, '<span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span>', '<span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>') ?>';

                break;

        }



        if (type.startsWith('rule/condition_cart_product|attribute_')) {

            html += select_options.product_conditions[type] + ' <span class="data-edit" data-type="select" data-values="is_is_not" data-selected="==" data-name="rule[{section}][{id}][operator]"></span> <span class="data-edit" data-type="text" data-name="rule[{section}][{id}][value]">&hellip;</span>';

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



<?php if ($promotion_id) { ?>

<script type="text/javascript"><!--

    $('#stats .pagination a').live('click', function() {

        $('#stats').load(this.href);

        return false;

    });

    $('#stats').load('index.php?route=sale/special_promotions/stats&token=<?php echo $token; ?>&promotion_id=<?php echo $promotion_id; ?>');

//--></script>

<?php } ?>

<?php echo $footer; ?>