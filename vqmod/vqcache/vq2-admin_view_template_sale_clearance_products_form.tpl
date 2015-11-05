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
                            <td><?php echo $entry_description; ?></td>
                            <td>
                                <textarea name="description" cols="40" rows="5"><?php echo $description; ?></textarea>
                            </td>
                        </tr>
                        <tbody id="promo_products">
                            <tr>
                                <td><?php echo $entry_promo_products; ?></td>
                                <td><input type="text" name="clear_products" id="clear_products" value="<?php echo $product_name; ?>" size='100'/>
                                <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" id="product_id"/>
                                </td>
                            </tr>
                        </tbody>
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
                            <td><span class="required">*</span> <?php echo $entry_date_expiry; ?></td>
                            <td>
                                <input type="text" name="date_expiry" value="<?php echo $date_expiry == '0000-00-00' ? '' : $date_expiry; ?>" class="date" />
                            </td>
                        </tr>
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
            </form>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
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

    // Clearance Products
    $('input[name=\'clear_products\']').autocomplete({
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
                            value: item.name,//item.product_id
                            product_id:item.product_id
                        }
                    }));
                }
            });
        },
        select: function(event, ui) {
            //$('#promo_product' + ui.item.value).remove();
            
            //$('#promo_product').append('<div id="promo_product' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" /><input type="hidden" name="promo_product[]" value="' + ui.item.value + '" /></div>');

            //$('#promo_product div:odd').attr('class', 'odd');
            //$('#promo_product div:even').attr('class', 'even');
            
            $('#product_id').val(ui.item.product_id);
			$('#clear_products').val(ui.item.name);
            return true;
        }
    });
    
    /*
    $('#promo_product div img').live('click', function() {
        $(this).parent().remove();

        $('#promo_product div:odd').attr('class', 'odd');
        $('#promo_product div:even').attr('class', 'even');
    });*/

    
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
               // options: select_options[$(_holder).attr('data-values')],
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