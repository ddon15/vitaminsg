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
    <?php if (false) { ?>
        <div class="success"><?php echo $success; ?></div>
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
            <div class="buttons"><a onclick="$('#form').attr('action', '<?php echo $copy; ?>'); $('#form').attr('target', '_self'); $('#form').submit();" class="button"><span><?php echo $button_copy; ?></span></a><a href="<?php echo $insert; ?>" class="button"><span><?php echo $button_insert; ?></span></a><a onclick="$('#form').attr('action', '<?php echo $delete; ?>'); $('#form').attr('target', '_self'); $('#form').submit();" class="button"><span><?php echo $button_delete; ?></span></a></div>
        </div>
        <div class="content">
            <form action="" method="post" enctype="multipart/form-data" id="form">
                <table class="list">
                    <thead>
                        <tr>
                            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
                            <td class="left">
                                <?php if ($sort == 'name') { ?>
                                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                                <?php } else { ?>
                                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                                <?php } ?>
                            </td>
                            <td class="left">
                                <?php if ($sort == 'date_start') { ?>
                                    <a href="<?php echo $sort_date_start; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_start; ?></a>
                                <?php } else { ?>
                                    <a href="<?php echo $sort_date_start; ?>"><?php echo $column_date_start; ?></a>
                                <?php } ?>
                            </td>
                            <td class="left">
                                <?php if ($sort == 'date_end') { ?>
                                    <a href="<?php echo $sort_date_end; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_end; ?></a>
                                <?php } else { ?>
                                    <a href="<?php echo $sort_date_end; ?>"><?php echo $column_date_end; ?></a>
                                <?php } ?>
                            </td>
                            <td class="left">
                                <?php if ($sort == 'date_expiry') { ?>
                                    <a href="<?php echo $sort_date_expiry; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_expiry; ?></a>
                                <?php } else { ?>
                                    <a href="<?php echo $sort_date_expiry; ?>"><?php echo $column_date_expiry; ?></a>
                                <?php } ?>
                            </td>
                            <td class="left">
                                <?php if ($sort == 'status') { ?>
                                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                                <?php } else { ?>
                                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                                <?php } ?>
                            </td>
                            <td class="left">
                                <?php if ($sort == 'sort_order') { ?>
                                    <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                                <?php } else { ?>
                                    <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                                <?php } ?>
                            </td>
                            <td class="right"><?php echo $column_action; ?></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="filter">
                            <td></td>
                            <td>
                                <input type="text" name="filter_name" style="width:95%;" value="<?php echo $filter_name; ?>" />
                            </td>
                            <td>
                                <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" size="12" class="date" />
                            </td>
                            <td>
                                <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" size="12" class="date" />
                            </td>
                            <td>
                                <input type="text" name="filter_date_expiry" value="<?php echo $filter_date_expiry; ?>" size="12" class="date" />
                            </td>
                            <td>
                                <select name="filter_status">
                                    <option value="*"></option>
                                    <?php if ($filter_status == '0') { ?>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                    <?php if ($filter_status == '1') { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                    <?php } ?>
                                </select>
                            </td>
                            <td>
                                <input type="text" name="filter_sort_order" size="4" value="<?php echo $filter_sort_order; ?>" />
                            </td>
                            <td class="right">
                                <a onclick="filter();" class="button"><span><?php echo $button_filter; ?></span></a>
                            </td>
                        </tr>
                        <?php if ($clearance) { ?>
                            <?php foreach ($clearance as $product) { ?>
                                <tr>
                                    <td style="text-align: center;">
                                        <?php if ($product['selected']) { ?>
                                            <input type="checkbox" name="selected[]" value="<?php echo $product['clearance_id']; ?>" checked="checked" />
                                        <?php } else { ?>
                                            <input type="checkbox" name="selected[]" value="<?php echo $product['clearance_id']; ?>" />
                                        <?php } ?>
                                    </td>
                                    <td class="left"><?php echo $product['name']; ?></td>
                                    <td><?php echo $product['date_start'] == '0000-00-00' ? '' : $product['date_start']; ?></td>
                                    <td><?php echo $product['date_end'] == '0000-00-00' ? '' : $product['date_end']; ?></td>
                                    <td><?php echo $product['date_expiry'] == '0000-00-00' ? '' : $product['date_expiry']; ?></td>
                                    <td>
                                        <?php if ($product['status']) { ?>
                                            [ <a href="<?php echo $product['action_status']; ?>"><?php echo $text_enabled; ?></a> ]
                                        <?php } else { ?>
                                            [ <a href="<?php echo $product['action_status']; ?>"><?php echo $text_disabled; ?></a> ]
                                        <?php } ?>
                                    </td>
                                    <td><?php echo $product['sort_order']; ?></td>
                                    <td class="right">
                                        <?php foreach ($product['action'] as $action) { ?>
                                            [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                                        <?php } ?>
                                    </td>
                                </tr>
                            <?php } ?>
                        <?php } else { ?>
                            <tr>
                                <td class="center" colspan="7"><?php echo $text_no_results; ?></td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </form>
            <div class="pagination"><?php echo $pagination; ?></div>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
function filter() {
    var url = 'index.php?route=sale/clearance_products&token=<?php echo $token; ?>';

    var filter_name = $('input[name=\'filter_name\']').attr('value');

    if (filter_name) {
        url += '&filter_name=' + encodeURIComponent(filter_name);
    }

    var filter_date_start = $('input[name=\'filter_date_start\']').attr('value');

    if (filter_date_start) {
        url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
    }

    var filter_date_end = $('input[name=\'filter_date_end\']').attr('value');

    if (filter_date_end) {
        url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
    }

    var filter_date_expiry = $('input[name=\'filter_date_expiry\']').attr('value');

    if (filter_date_expiry) {
        url += '&filter_date_expiry=' + encodeURIComponent(filter_date_end);
    }
    
    var filter_status = $('select[name=\'filter_status\']').attr('value');

    if (filter_status != '*') {
        url += '&filter_status=' + encodeURIComponent(filter_status);
    }

    var filter_sort_order = $('input[name=\'filter_sort_order\']').attr('value');

    if (filter_sort_order) {
        url += '&filter_sort_order=' + encodeURIComponent(filter_sort_order);
    }

    location = url;
}
//--></script>
<script type="text/javascript"><!--
    $('.date').datepicker({dateFormat: 'yy-mm-dd'});

    $('#form input').keydown(function(e) {
        if (e.keyCode == 13) {
            filter();
        }
    });

    $('.warning, .success').live('click', function() {
       $(this).remove();
    });
//--></script>
<?php echo $footer; ?>