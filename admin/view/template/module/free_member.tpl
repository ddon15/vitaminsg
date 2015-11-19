<?php echo $header;?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a
                href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/module.png" alt=""/> <?php echo $heading_title; ?></h1>

            <div class="buttons">
                <a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a>
                <a onclick="$('form').attr('action', '<?php echo $delete; ?>'); $('form').submit();"
                   class="button"><?php echo $button_delete; ?></a>
            </div>
        </div>
        <div class="content">
            <form action="" method="post" enctype="multipart/form-data" id="form">
                <table class="list">
                    <thead>
                    <tr>
                        <td width="1" style="text-align: center;"><input type="checkbox"
                                                                         onclick="$('input[name*=\'selected\']').attr('checked', this.checked);"/>
                        </td>
                        <td class="left"><?php if ($sort == 'claim_code') { ?>
                            <a href="<?php echo $sort_claim_code; ?>"
                               class="<?php echo strtolower($order); ?>"><?php echo $label_claim_code; ?></a>
                            <?php } else { ?>
                            <a href="<?php echo $sort_claim_code; ?>"><?php echo $label_claim_code; ?></a>
                            <?php } ?>
                        </td>
                        <td class="left"><?php if ($sort == 'description') { ?>
                            <a href="<?php echo $sort_description; ?>"
                               class="<?php echo strtolower($order); ?>"><?php echo $label_code_description; ?></a>
                            <?php } else { ?>
                            <a href="<?php echo $sort_description; ?>"><?php echo $label_code_description; ?></a>
                            <?php } ?>
                        </td>
                        <td class="right"><?php if ($sort == 'max_usage') { ?>
                            <a href="<?php echo $sort_max_usage; ?>"
                               class="<?php echo strtolower($order); ?>"><?php echo $label_max_usage; ?></a>
                            <?php } else { ?>
                            <a href="<?php echo $sort_max_usage; ?>"><?php echo $label_max_usage; ?></a>
                            <?php } ?>
                        </td>
                        <td class="left"><?php if ($sort == 'start_date') { ?>
                            <a href="<?php echo $sort_start_date; ?>"
                               class="<?php echo strtolower($order); ?>"><?php echo $label_start_date; ?></a>
                            <?php } else { ?>
                            <a href="<?php echo $sort_start_date; ?>"><?php echo $label_start_date; ?></a>
                            <?php } ?>
                        </td>
                        <td class="left"><?php if ($sort == 'end_date') { ?>
                            <a href="<?php echo $sort_end_date; ?>"
                               class="<?php echo strtolower($order); ?>"><?php echo $label_end_date; ?></a>
                            <?php } else { ?>
                            <a href="<?php echo $sort_end_date; ?>"><?php echo $label_end_date; ?></a>
                            <?php } ?>
                        </td>
                        <td class="left"><?php if ($sort == 'created') { ?>
                            <a href="<?php echo $sort_date_added; ?>"
                               class="<?php echo strtolower($order); ?>"><?php echo $label_date_added; ?></a>
                            <?php } else { ?>
                            <a href="<?php echo $sort_date_added; ?>"><?php echo $label_date_added; ?></a>
                            <?php } ?>
                        </td>
                        <td class="right"><?php if ($sort == 'used') { ?>
                            <a href="<?php echo $sort_usage; ?>"
                               class="<?php echo strtolower($order); ?>"><?php echo $label_usage; ?></a>
                            <?php } else { ?>
                            <a href="<?php echo $sort_usage; ?>"><?php echo $label_usage; ?></a>
                            <?php } ?>
                        </td>
                        <td class="right"><?php echo $label_action; ?></td>
                    </tr>
                    <tbody>
                    <tr class="filter">
                        <td></td>
                        <td><input type="text" name="filter_claim_code" value="<?php echo $filter_claim_code; ?>"/></td>
                        <td><input type="text" name="filter_claim_description"
                                   value="<?php echo $filter_claim_description; ?>"/></td>
                        <td class="right"><input type="text" name="filter_max_usage" value="<?php echo $filter_max_usage; ?>"/></td>
                        <td><input type="text" name="filter_start_date" value="<?php echo $filter_start_date; ?>"
                                   size="12" class="date"/></td>
                        <td><input type="text" name="filter_end_date" value="<?php echo $filter_end_date; ?>" size="12"
                                   id="date" class="date"/></td>
                        <td><input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>"
                                   size="12" class="date"/></td>
                        <td>&nbsp;</td>
                        <td align="right"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>
                    </tr>
                    <?php if ($claimCodes) { ?>
                    <?php
                        foreach ($claimCodes as $claimCode) { ?>
                    <tr>
                        <td style="text-align: center;"><?php if ($claimCode['selected']) { ?>
                            <input type="checkbox" name="selected[]" value="<?php echo $claimCode['claim_code_id']; ?>"
                                   checked="checked"/>
                            <?php } else { ?>
                            <input type="checkbox" name="selected[]"
                                   value="<?php echo $claimCode['claim_code_id']; ?>"/>
                            <?php } ?></td>
                        <td class="left"><?php echo $claimCode['claim_code']; ?></td>
                        <td class="left"><?php echo $claimCode['code_description']; ?></td>
                        <td class="right"><?php echo $claimCode['max_usage']; ?></td>
                        <td class="left"><?php echo date('d/m/Y', strtotime($claimCode['start_date'])); ?></td>
                        <td class="left"><?php echo date('d/m/Y', strtotime($claimCode['end_date'])); ?></td>
                        <td class="left"><?php echo date('d/m/Y', strtotime($claimCode['date_added'])); ?></td>
                        <td class="right"><?php echo $claimCode['usage']; ?></td>
                        <td class="right"><?php foreach ($claimCode['action'] as $action) { ?>
                            [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                            <?php } ?></td>
                    </tr>
                    <?php } ?>
                    <?php } else { ?>
                    <tr>
                        <td class="center" colspan="10"><?php echo $text_no_results; ?></td>
                    </tr>
                    <?php } ?>
                    </tbody>
                    </thead>
                </table>
            </form>
            <div class="pagination"><?php echo $pagination; ?></div>
        </div>
    </div>
    <script type="text/javascript"><!--
        function filter() {
            url = 'index.php?route=module/free_member&token=<?php echo $token; ?>';

            var filter_claim_code = $('input[name=\'filter_claim_code\']').attr('value');

            if (filter_claim_code) {
                url += '&filter_claim_code=' + encodeURIComponent(filter_claim_code);
            }

            var filter_claim_description = $('input[name=\'filter_claim_description\']').attr('value');

            if (filter_claim_description) {
                url += '&filter_claim_description=' + encodeURIComponent(filter_claim_description);
            }

            var filter_max_usage = $('input[name=\'filter_max_usage\']').attr('value');

            if (filter_max_usage) {
                url += '&filter_max_usage=' + encodeURIComponent(filter_max_usage);
            }

            var filter_start_date = $('input[name=\'filter_start_date\']').attr('value');

            if (filter_start_date) {
                url += '&filter_start_date=' + encodeURIComponent(filter_start_date);
            }

            var filter_end_date = $('input[name=\'filter_end_date\']').attr('value');

            if (filter_end_date) {
                url += '&filter_end_date=' + encodeURIComponent(filter_end_date);
            }

            var filter_date_added = $('input[name=\'filter_date_added\']').attr('value');

            if (filter_date_added) {
                url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
            }
            location = url;
        }

        $(document).ready(function () {
            $('.date').datepicker({changeMonth: true, changeYear: true, dateFormat: 'yy-mm-dd'});
        });
        //--></script>
    <?php echo $footer; ?>