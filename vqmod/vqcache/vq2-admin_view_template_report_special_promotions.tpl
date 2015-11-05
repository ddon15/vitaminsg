<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
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
            <h1><img src="view/image/report.png" alt="" /> <?php echo $heading_title; ?></h1>
        </div>
        <div class="content">
            <table class="form">
                <tr>
                    <td>
                        <?php echo $entry_date_start; ?>
                        <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" id="date-start" size="12" />
                    </td>
                    <td>
                        <?php echo $entry_date_end; ?>
                        <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" id="date-end" size="12" />
                    </td>
                    <td>
                        <?php echo $entry_group; ?>
                        <select name="filter_group">
                            <?php foreach ($groups as $groups) { ?>
                                <?php if ($groups['value'] == $filter_group) { ?>
                                    <option value="<?php echo $groups['value']; ?>" selected="selected"><?php echo $groups['text']; ?></option>
                                <?php } else { ?>
                                    <option value="<?php echo $groups['value']; ?>"><?php echo $groups['text']; ?></option>
                                <?php } ?>
                            <?php } ?>
                        </select>
                    </td>
                    <td>
                        <?php echo $entry_promotion; ?>
                        <select name="filter_promotion_id">
                            <option value="0"><?php echo $text_all_promotions; ?></option>
                            <?php foreach ($promotions as $promotion) { ?>
                                <?php if ($promotion['promotion_id'] == $filter_promotion_id) { ?>
                                    <option value="<?php echo $promotion['promotion_id']; ?>" selected="selected"><?php echo $promotion['name']; ?></option>
                                <?php } else { ?>
                                    <option value="<?php echo $promotion['promotion_id']; ?>"><?php echo $promotion['name']; ?></option>
                                <?php } ?>
                            <?php } ?>
                        </select>
                    </td>
                    <td style="text-align: right;"><a onclick="filter();" class="button"><span><?php echo $button_filter; ?></span></a></td>
                </tr>
            </table>
            <table class="list">
                <thead>
                    <tr>
                        <td class="left"><?php echo $column_date_start; ?></td>
                        <td class="left"><?php echo $column_date_end; ?></td>
                        <td class="right"><?php echo $column_orders; ?></td>
                        <td class="right"><?php echo $column_products; ?></td>
                        <td class="right"><?php echo $column_tax; ?></td>
                        <td class="right"><?php echo $column_total; ?></td>
                        <td class="right"><?php echo $column_discounted; ?></td>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($orders) { ?>
                        <?php foreach ($orders as $order) { ?>
                            <tr>
                                <td class="left"><?php echo $order['date_start']; ?></td>
                                <td class="left"><?php echo $order['date_end']; ?></td>
                                <td class="right"><?php echo $order['orders']; ?></td>
                                <td class="right"><?php echo $order['products']; ?></td>
                                <td class="right"><?php echo $order['tax']; ?></td>
                                <td class="right"><?php echo $order['total']; ?></td>
                                <td class="right"><?php echo $order['discounted']; ?></td>
                            </tr>
                        <?php } ?>
                    <?php } else { ?>
                        <tr>
                            <td class="center" colspan="7"><?php echo $text_no_results; ?></td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
            <div class="pagination"><?php echo $pagination; ?></div>
        </div>
    </div>
</div>

<script type="text/javascript"><!--
function filter() {
    url = 'index.php?route=report/special_promotions&token=<?php echo $token; ?>';

    var filter_date_start = $('input[name=\'filter_date_start\']').attr('value');

    if (filter_date_start) {
        url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
    }

    var filter_date_end = $('input[name=\'filter_date_end\']').attr('value');

    if (filter_date_end) {
        url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
    }

    var filter_group = $('select[name=\'filter_group\']').attr('value');

    if (filter_group) {
        url += '&filter_group=' + encodeURIComponent(filter_group);
    }

    var filter_promotion_id = $('select[name=\'filter_promotion_id\']').attr('value');

    if (filter_promotion_id != 0) {
        url += '&filter_promotion_id=' + encodeURIComponent(filter_promotion_id);
    }

    location = url;
}
//--></script>
<script type="text/javascript"><!--
$(document).ready(function() {
    $('#date-start').datepicker({dateFormat: 'yy-mm-dd'});
    $('#date-end').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script>
<?php echo $footer; ?>