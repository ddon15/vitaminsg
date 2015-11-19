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
            <h1><img src="view/image/total.png" alt="" /> <?php echo $heading_title; ?></h1>
            <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a href="<?php echo $cancel; ?>" class="button"><span><?php echo $button_cancel; ?></span></a></div>
        </div>
        <div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
               
                <table class="form">
                    <tr>
                        <td><?php echo $entry_status; ?></td>
                        <td>
                            <select name="special_promotions_status">
                                <?php if ($special_promotions_status) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_sort_order; ?></td>
                        <td><input type="text" name="special_promotions_sort_order" value="<?php echo $special_promotions_sort_order; ?>" size="1" /></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_skip_special; ?></td>
                        <td>
                            <?php if($special_promotions_skip_special) {
                                $checked1 = ' checked="checked"';
                                $checked0 = '';
                            } else {
                                $checked1 = '';
                                $checked0 = ' checked="checked"';
                            } ?>
                            <label for="skip_special_1"><?php echo $text_yes; ?></label>
                            <input type="radio"<?php echo $checked1; ?> id="skip_special_1" name="special_promotions_skip_special" value="1" />
                            <label for="skip_special_0"><?php echo $text_no; ?></label>
                            <input type="radio"<?php echo $checked0; ?> id="skip_special_0" name="special_promotions_skip_special" value="0" />
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_show_product_names; ?></td>
                        <td>
                            <?php if($special_promotions_show_product_names) {
                                $checked1 = ' checked="checked"';
                                $checked0 = '';
                            } else {
                                $checked1 = '';
                                $checked0 = ' checked="checked"';
                            } ?>
                            <label for="show_product_names_1"><?php echo $text_yes; ?></label>
                            <input type="radio"<?php echo $checked1; ?> id="show_product_names_1" name="special_promotions_show_product_names" value="1" />
                            <label for="show_product_names_0"><?php echo $text_no; ?></label>
                            <input type="radio"<?php echo $checked0; ?> id="show_product_names_0" name="special_promotions_show_product_names" value="0" />
                        </td>
                    </tr>
                    <tr style="display:none;">
                        <td><?php echo $entry_include_tax; ?></td>
                        <td>
                            <?php if($special_promotions_include_tax) {
                                $checked1 = ' checked="checked"';
                                $checked0 = '';
                            } else {
                                $checked1 = '';
                                $checked0 = ' checked="checked"';
                            } ?>
                            <label for="include_tax_1"><?php echo $text_yes; ?></label>
                            <input type="radio"<?php echo $checked1; ?> id="include_tax_1" name="special_promotions_include_tax" value="1" />
                            <label for="include_tax_0"><?php echo $text_no; ?></label>
                            <input type="radio"<?php echo $checked0; ?> id="include_tax_0" name="special_promotions_include_tax" value="0" />
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_select_promotion; ?></td>
                        <td>
                            <?php if($special_promotions_select_promotion) {
                                $checked1 = ' checked="checked"';
                                $checked0 = '';
                            } else {
                                $checked1 = '';
                                $checked0 = ' checked="checked"';
                            } ?>
                            <label for="select_promotion_1"><?php echo $text_yes; ?></label>
                            <input type="radio"<?php echo $checked1; ?> id="select_promotion_1" name="special_promotions_select_promotion" value="1" />
                            <label for="select_promotion_0"><?php echo $text_no; ?></label>
                            <input type="radio"<?php echo $checked0; ?> id="select_promotion_0" name="special_promotions_select_promotion" value="0" />
                        </td>
                    </tr>
                    <tr style="display:none;">
                        <td colspan="2"><b><?php echo $text_banners_options; ?></b></td>
                    </tr>
                    <tr style="display:none;">
                        <td><?php echo $entry_dynamic_banners; ?></td>
                        <td>
                            <?php if($special_promotions_dynamic_banners) {
                                $checked1 = ' checked="checked"';
                                $checked0 = '';
                            } else {
                                $checked1 = '';
                                $checked0 = ' checked="checked"';
                            } ?>
                            <label for="dynamic_banners_1"><?php echo $text_yes; ?></label>
                            <input type="radio"<?php echo $checked1; ?> id="dynamic_banners_1" name="special_promotions_dynamic_banners" value="1" />
                            <label for="dynamic_banners_0"><?php echo $text_no; ?></label>
                            <input type="radio"<?php echo $checked0; ?> id="dynamic_banners_0" name="special_promotions_dynamic_banners" value="0" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><b><?php echo $text_coupons; ?></b></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_multiply_coupons; ?></td>
                        <td>
                            <?php if($special_promotions_multiply_coupons) {
                                $checked1 = ' checked="checked"';
                                $checked0 = '';
                            } else {
                                $checked1 = '';
                                $checked0 = ' checked="checked"';
                            } ?>
                            <label for="multiply_coupons_1"><?php echo $text_yes; ?></label>
                            <input type="radio"<?php echo $checked1; ?> id="multiply_coupons_1" name="special_promotions_multiply_coupons" value="1" />
                            <label for="multiply_coupons_0"><?php echo $text_no; ?></label>
                            <input type="radio"<?php echo $checked0; ?> id="multiply_coupons_0" name="special_promotions_multiply_coupons" value="0" />
                        </td>
                    </tr>
                    <tr style="display:none;">
                        <td><?php echo $entry_ci_coupons; ?></td>
                        <td>
                            <?php if($special_promotions_ci_coupons) {
                                $checked1 = ' checked="checked"';
                                $checked0 = '';
                            } else {
                                $checked1 = '';
                                $checked0 = ' checked="checked"';
                            } ?>
                            <label for="ci_coupons_1"><?php echo $text_yes; ?></label>
                            <input type="radio"<?php echo $checked1; ?> id="ci_coupons_1" name="special_promotions_ci_coupons" value="1" />
                            <label for="ci_coupons_0"><?php echo $text_no; ?></label>
                            <input type="radio"<?php echo $checked0; ?> id="ci_coupons_0" name="special_promotions_ci_coupons" value="0" />
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_disable_oc_coupons; ?></td>
                        <td>
                            <?php if($special_promotions_disable_oc_coupons) {
                                $checked1 = ' checked="checked"';
                                $checked0 = '';
                            } else {
                                $checked1 = '';
                                $checked0 = ' checked="checked"';
                            } ?>
                            <label for="disable_oc_coupons_1"><?php echo $text_yes; ?></label>
                            <input type="radio"<?php echo $checked1; ?> id="disable_oc_coupons_1" name="special_promotions_disable_oc_coupons" value="1" />
                            <label for="disable_oc_coupons_0"><?php echo $text_no; ?></label>
                            <input type="radio"<?php echo $checked0; ?> id="disable_oc_coupons_0" name="special_promotions_disable_oc_coupons" value="0" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><b><?php echo $text_shipping; ?></b></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_geo_zone; ?></td>
                        <td>
                            <select name="special_promotions_shipping_geo_zone_id">
                                <option value="0"><?php echo $text_all_zones; ?></option>
                                <?php foreach ($geo_zones as $geo_zone) { ?>
                                    <?php if ($geo_zone['geo_zone_id'] == $special_promotions_shipping_geo_zone_id) { ?>
                                        <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                                    <?php } else { ?>
                                        <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                                    <?php } ?>
                                <?php } ?>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_shipping_sort_order; ?></td>
                        <td>
                            <input type="text" name="special_promotions_shipping_sort_order" value="<?php echo $special_promotions_shipping_sort_order; ?>" size="1"/>
                        </td>
                    </tr>
                </table>

            </form>
        </div>
    </div>
</div>
<?php echo $footer; ?>
