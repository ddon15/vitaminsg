<table class="list">
    <thead>
        <tr>
            <td class="right"><b><?php echo $column_order_id; ?></b></td>
            <td class="left"><b><?php echo $column_customer; ?></b></td>
            <td class="right"><b><?php echo $column_amount; ?></b></td>
            <td class="left"><b><?php echo $column_date_added; ?></b></td>
        </tr>
    </thead>
    <tbody>
        <?php if ($stats) { ?>
            <?php foreach ($stats as $entry) { ?>
                <tr>
                    <td class="right"><a href="<?php echo $order_url . $entry['order_id']; ?>" target="_blank">#<?php echo $entry['order_id']; ?></a></td>
                    <?php if ($entry['customer_id']) { ?>
                        <td class="left"><a href="<?php echo $customer_url . $entry['customer_id']; ?>" target="_blank"><?php echo $entry['customer']; ?></a></td>
                    <?php } else { ?>
                        <td class="left"><?php echo $entry['customer']; ?></td>
                    <?php } ?>
                    <td class="right"><?php echo $entry['amount']; ?></td>
                    <td class="left"><?php echo $entry['date_added']; ?></td>
                </tr>
            <?php } ?>
        <?php } else { ?>
            <tr>
                <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
            </tr>
        <?php } ?>
    </tbody>
</table>
<div class="pagination"><?php echo $pagination; ?></div>