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
    <?php if ($success) { ?>
    <div class="success"><?php echo $success; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/payment.png" alt="" />&nbsp;<?php echo $heading_title; ?></h1>
            <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="document.getElementById('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
        </div>
        <div class="content">
            <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
                <table class="list">
                    <thead>
                        <tr>
                            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
                            <td class="left"><?php if ($sort == 'p.name') { ?>
                                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                                <?php } else { ?>
                                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                                <?php } ?></td>
                            <td class="left">
                                <?php echo $column_discount; ?></a>
                            </td>
                             <td class="left">
                                <?php echo $column_discount_type; ?></a>
                            </td>
                            <td class="left"><?php if ($sort == 'p.date_start') { ?>
                                <a href="<?php echo $sort_date_start; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_start; ?></a>
                                <?php } else { ?>
                                <a href="<?php echo $sort_date_start; ?>"><?php echo $column_date_start; ?></a>
                                <?php } ?></td>
                            <td class="left"><?php if ($sort == 'p.date_end') { ?>
                                <a href="<?php echo $sort_date_end; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_end; ?></a>
                                <?php } else { ?>
                                <a href="<?php echo $sort_date_end; ?>"><?php echo $column_date_end; ?></a>
                                <?php } ?></td>
                            <td class="left"><?php if ($sort == 'p.status') { ?>
                                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                                <?php } else { ?>
                                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                                <?php } ?></td>
                            <td class="right"><?php echo $column_action; ?></td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if ($promotions) { ?>
                        <?php foreach ($promotions as $promotion) { ?>
                        <tr>
                            <td style="text-align: center;"><?php if ($promotion['selected']) { ?>
                                <input type="checkbox" name="selected[]" value="<?php echo $promotion['promotion_id']; ?>" checked="checked" />
                                <?php } else { ?>
                                <input type="checkbox" name="selected[]" value="<?php echo $promotion['promotion_id']; ?>" />
                                <?php } ?></td>
                            <td class="left"><?php echo $promotion['name']; ?></td>
                            <td class="left"><?php echo $promotion['discount']; ?></td>
                            <td class="left"><?php echo $promotion['discount_type']; ?></td>
                            <td class="left"><?php echo $promotion['date_start']; ?></td>
                            <td class="left"><?php echo $promotion['date_end']; ?></td>
                            <td class="left"><?php echo $promotion['status']; ?></td>
                            <td class="right"><?php foreach ($promotion['action'] as $action) { ?>
                                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                                <?php } ?></td>
                        </tr>
                        <?php } ?>
                        <?php } else { ?>
                        <tr>
                            <td class="center" colspan="9"><?php echo $text_no_results; ?></td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </form>
            <div class="pagination"><?php echo $pagination; ?></div>
        </div>
    </div>
</div>
<?php echo $footer; ?>