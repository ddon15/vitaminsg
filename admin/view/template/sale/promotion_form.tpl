<?php //[MY]?>
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
            <h1><img src="view/image/customer.png" alt="" /> <?php echo $heading_title; ?></h1>
            <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
        </div>
        <div class="content">
            <div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a>
                <?php if ($promotion_id) { ?>
                <a href="#tab-history"><?php echo $tab_history; ?></a>
                <?php } ?>
            </div>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <div id="tab-general">
                    <table class="form">
                        <tr>
                            <td><span class="required">*</span> <?php echo $entry_name; ?></td>
                            <td><input name="name" value="<?php echo $name; ?>" size="100" />
                                <?php if ($error_name) { ?>
                                <span class="error"><?php echo $error_name; ?></span>
                                <?php } ?></td>
                        </tr>
                        <tr>

                            <td><?php echo $entry_description; ?></td>
                            <td>
                                <textarea name="description" cols="40" rows="5"><?php if(isset($description)){ echo $description; } ?></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="required">*</span>&nbsp;<?php echo $entry_status; ?></td>
                            <td><select name="status">
                                    <?php if ($status) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select></td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_date_start; ?></td>
                            <td><input type="text" name="date_start" value="<?php echo $date_start; ?>" size="12" id="date-start" /></td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_date_end; ?></td>
                            <td><input type="text" name="date_end" value="<?php echo $date_end; ?>" size="12" id="date-end" /></td>
                        </tr>
                    </table>

                    <h2><img src="view/image/customer.png" alt="" /> <?php echo $heading_promotion_details; ?></h2>
                    <table class="form">
                        <tr>
                            <td><?php echo $entry_discount_type; ?></td>
                            <td><select name="discount_type">
                                    <?php if ($discount_type == 'buy_x_get_y_fixed') { ?>
                                    <option value="buy_x_get_y_fixed" selected="selected"><?php echo $text_buy_x_get_y_fixed; ?></option>
                                    <?php } else { ?>
                                    <option value="buy_x_get_y_fixed"><?php echo  $text_buy_x_get_y_fixed; ?></option>
                                    <?php } ?>
                                    <?php if ($discount_type == 'buy_x_get_y_percent') { ?>
                                    <option value="buy_x_get_y_percent" selected="selected"><?php echo $text_buy_x_get_y_percent; ?></option>
                                    <?php } else { ?>
                                    <option value="buy_x_get_y_percent"><?php echo $text_buy_x_get_y_percent; ?></option>
                                    <?php } ?>s
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
                                </select>
                                <a href="#" class="promotion_help"><img valign="middle" src="view/image/promotion/info.png" alt=""></a><br/>
                            </td>                            
                        </tr>
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
                        <tbody id="n_products" class="sp_hidden" style="display: none;">
                            <tr>
                                <td></td>
                                <td>
                                    <?php echo $text_n_products_help; ?>
                                </td>
                            </tr>
                        </tbody>
                        <tr>
                            <td><?php echo $entry_discount; ?></td>
                            <td><input type="text" name="discount" value="<?php echo $discount; ?>" /></td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_discount_qty;?></td>
                            <td><input type="text" name="discount_qty" value="<?php echo $discount_qty; ?>" size="4" /></td>
                        </tr
                        <tbody id="discount_option">
                        <tr>
                            <td><?php echo $entry_discount_option; ?></td>
                            <td>
                                <input type="text" name="discount_option" value="<?php echo $discount_option; ?>" size="4" />
                            </td>
                        </tr>
                        </tbody>
                        <tr>
                            <td><?php echo $entry_product; ?></td>
                            <td><input type="text" name="product" value="" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><div id="promotion-product" class="scrollbox">
                                    <?php $class = 'odd'; ?>
                                    <?php foreach ($promotion_product as $promotion_product) { ?>
                                    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                    <div id="promotion-product<?php echo $promotion_product['product_id']; ?>" class="<?php echo $class; ?>"> <?php echo $promotion_product['name']; ?><img src="view/image/delete.png" alt="" />
                                        <input type="hidden" name="promotion_product[]" value="<?php echo $promotion_product['product_id']; ?>" />
                                    </div>
                                    <?php } ?>
                                </div></td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_category; ?></td>
                            <td><input type="text" name="category" value="" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><div id="promotion-category" class="scrollbox">
                                    <?php $class = 'odd'; ?>
                                    <?php foreach ($promotion_category as $promotion_category) { ?>
                                    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                    <div id="promotion-category<?php echo $promotion_category['promotion_id']; ?>" class="<?php echo $class; ?>"> <?php echo $promotion_category['name']; ?><img src="view/image/delete.png" alt="" />
                                        <input type="hidden" name="promotion_category[]" value="<?php echo $promotion_category['category_id']; ?>" />
                                    </div>
                                    <?php } ?>
                                </div></td>
                        </tr>
                    </table>

                    <table class="form" id="promo_products">
                        <tr>
                            <td colspan="2"><h2><img src="view/image/customer.png" alt="" /> <?php echo $heading_promotion_items; ?></h2></td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_promo_qty; ?></td>
                            <td><input type="text" name="promo_qty" value="<?php echo $promo_qty; ?>" size="4"/></td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_promo_discount_products; ?></td>
                            <td><input type="text" name="promo_discount_products" value="" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <div class="scrollbox" id="promo_discount_product">
                                    <?php $class = 'odd'; ?>
                                    <?php foreach ($promo_discount_products as $promo_discount_product) { ?>
                                    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                    <div id="promo_discount_product<?php echo $promo_discount_product['product_id']; ?>" class="<?php echo $class; ?>">
                                        <?php echo $promo_discount_product['name']; ?><img src="view/image/delete.png" />
                                        <input type="hidden" name="promo_discount_product[]" value="<?php echo $promo_discount_product['product_id']; ?>" />
                                    </div>
                                    <?php } ?>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td><?php echo $entry_uses_total; ?></td>
                            <td><input type="text" name="uses_total" value="<?php echo $uses_total; ?>" /></td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_uses_customer; ?></td>
                            <td><input type="text" name="uses_customer" value="<?php echo $uses_customer; ?>" /></td>
                        </tr>
                    </table>
                </div>
                <?php if ($promotion_id) { ?>
                <div id="tab-history">
                    <div id="history"></div>
                </div>
                <?php } ?>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript"><!--

    // Manufacturer
    $('input[name=\'manufacturer\']').autocomplete({
        delay: 500,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request.term),
                dataType: 'json',
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
            $('input[name=\'manufacturer\']').attr('value', ui.item.label);
            $('input[name=\'manufacturer_id\']').attr('value', ui.item.value);

            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });

    $('input[name=\'category[]\']').bind('change', function() {
        var filter_category_id = this;

        $.ajax({
            url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_category_id=' + filter_category_id.value + '&limit=10000',
            dataType: 'json',
            success: function(json) {
                for (i = 0; i < json.length; i++) {
                    if ($(filter_category_id).attr('checked') == 'checked') {
                        $('#promotion-product' + json[i]['product_id']).remove();

                        $('#promotion-product').append('<div id="promotion-product' + json[i]['product_id'] + '">' + json[i]['name'] + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="promotion_product[]" value="' + json[i]['product_id'] + '" /></div>');
                    } else {
                        $('#promotion-product' + json[i]['product_id']).remove();
                    }
                }

                $('#promotion-product div:odd').attr('class', 'odd');
                $('#promotion-product div:even').attr('class', 'even');
            }
        });
    });

    $('input[name=\'product\']').autocomplete({
        delay: 500,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request.term),
                dataType: 'json',
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
            $('#promotion-product' + ui.item.value).remove();

            $('#promotion-product').append('<div id="promotion-product' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="promotion_product[]" value="' + ui.item.value + '" /></div>');

            $('#promotion-product div:odd').attr('class', 'odd');
            $('#promotion-product div:even').attr('class', 'even');

            $('input[name=\'product\']').val('');

            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });

    $('#promotion-product div img').live('click', function() {
        $(this).parent().remove();

        $('#promotion-product div:odd').attr('class', 'odd');
        $('#promotion-product div:even').attr('class', 'even');
    });


    $('input[name=\'category\']').autocomplete({
        delay: 500,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request.term),
                dataType: 'json',
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
            $('#promotion-category' + ui.item.value).remove();

            $('#promotion-category').append('<div id="product-category' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="promotion_category[]" value="' + ui.item.value + '" /></div>');

            $('#promotion-category div:odd').attr('class', 'odd');
            $('#promotion-category div:even').attr('class', 'even');

            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });

    $('#promotion-category div img').live('click', function() {
        $(this).parent().remove();

        $('#promotion-category div:odd').attr('class', 'odd');
        $('#promotion-category div:even').attr('class', 'even');
    });
//--></script> 


<script type="text/javascript"><!--
    //affected goods 
    $('input[name=\'promo_discount_categories\']').autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request.term),
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
            $('#promo_discount_category' + ui.item.value).remove();

            $('#promo_discount_category').append('<div id="promo_discount_category' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="promo_discount_category[]" value="' + ui.item.value + '" /></div>');

            $('#promo_discount_category div:odd').attr('class', 'odd');
            $('#promo_discount_category div:even').attr('class', 'even');

            return false;
        },
        focus: function(event, ui) {
            return false;
        }
    });

    $('#promo_discount_category div img').live('click', function() {
        $(this).parent().remove();

        $('#promo_discount_category div:odd').attr('class', 'odd');
        $('#promo_discount_category div:even').attr('class', 'even');
    });

    // Promo Products
    $('input[name=\'promo_discount_products\']').autocomplete({
        delay: 0,
        source: function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request.term),
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
            $('#promo_discount_product' + ui.item.value).remove();

            $('#promo_discount_product').append('<div id="promo_discount_product' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" /><input type="hidden" name="promo_discount_product[]" value="' + ui.item.value + '" /></div>');

            $('#promo_discount_product div:odd').attr('class', 'odd');
            $('#promo_discount_product div:even').attr('class', 'even');

            return false;
        }
    });

    $('#promo_discount_product div img').live('click', function() {
        $(this).parent().remove();

        $('#promo_discount_product div:odd').attr('class', 'odd');
        $('#promo_discount_product div:even').attr('class', 'even');
    });


    $('select[name=discount_type]').bind('change', function(){
            $('.sp_hidden').hide();
            $('.sp_pack').show();
            
            if ($(this).val() == 'buy_x_get_y_percent' || $(this).val() == 'buy_x_get_y_fixed') {
                $('#promo_categories').show();
                $('#promo_products').show();
            } else {
                $('#promo_categories').hide();
                $('#promo_products').hide();
            }

            if ($(this).val() == 'buy_x_get_y_percent' || $(this).val() == 'buy_x_get_y_fixed' || $(this).val() == 'buy_x_cart_get_y_percent' || $(this).val() == 'buy_x_cart_get_y_fixed') {
                $('#discount_option').show();
            } else if ($(this).val() == 'n_products_percent' || $(this).val() == 'n_products_fixed') {
                $('#discount_option').show();
            } else {
                $('#discount_option').hide();
            }
    });
    
    $('a.promotion_help').click(function(e) {
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


//--></script>
<script type="text/javascript"><!--
$('#date-start').datepicker({dateFormat: 'yy-mm-dd'});
    $('#date-end').datepicker({dateFormat: 'yy-mm-dd'});
//--></script>
<?php if ($promotion_id) { ?>
<script type="text/javascript"><!--
$('#history .pagination a').live('click', function() {
        $('#history').load(this.href);

        return false;
    });

    $('#history').load('index.php?route=sale/promotion/history&token=<?php echo $token; ?>&promotion_id=<?php echo $promotion_id; ?>');
//--></script>
<?php } ?>
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 

<?php echo $footer; ?>