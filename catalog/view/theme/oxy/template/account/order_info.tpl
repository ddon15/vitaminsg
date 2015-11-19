<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<section id="content" class="columns op"><?php echo $content_top; ?>
  <h1><?php echo $heading_title; ?></h1>
  <ul class="breadcrumbs">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <table class="list">
    <thead>
      <tr>
        <td class="left" colspan="2"><?php echo $text_order_detail; ?></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="left" style="width: 50%;"><?php if ($invoice_no) { ?>
          <b><?php echo $text_invoice_no; ?></b> <?php echo $invoice_no; ?><br />
          <?php } ?>
          <?php //[SB] Removed order id ?>
          <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
        <td class="left" style="width: 50%;"><?php if ($payment_method) { ?>
          <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
          <?php } ?>
          <?php if ($shipping_method) { ?>
          <b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
          <?php } ?></td>
      </tr>
    </tbody>
  </table>
  <table class="list">
    <thead>
      <tr>
        <td class="left"><?php echo $text_payment_address; ?></td>
        <?php if ($shipping_address) { ?>
        <td class="left"><?php echo $text_shipping_address; ?></td>
        <?php } ?>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="left"><?php echo $payment_address; ?></td>
        <?php if ($shipping_address) { ?>
        <td class="left"><?php echo $shipping_address; ?></td>
        <?php } ?>
      </tr>
    </tbody>
  </table>
  <table class="list">
    <thead>
      <tr>
        <td class="left"><?php echo $column_name; ?></td>
        <?php //[SB] Removed model column ?>
        <td class="right"><?php echo $column_quantity; ?></td>
        <td class="right"><?php echo $column_price; ?></td>
        <td class="right"><?php echo $column_total; ?></td>
        <?php //[SB] Removed product return column ?>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($products as $product) { ?>
      <tr>
        <td class="left"><?php echo $product['name']; ?>
          <?php foreach ($product['option'] as $option) { ?>
          <br />
          &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
          <?php } ?></td>
        <?php //[SB] Removed model column ?>
		<?php //[SB] Added Redemption
		if($product['total_points'] > 0) { ?>
			<td class="right vitline"><?php echo $product['quantity']; ?></td>
			<td class="right vitline"><?php echo $text_redemption_price . $product['unit_points']; ?></td>
			<td class="right vitline"><?php echo $text_redemption_total . $product['total_points']; ?></td>
		<?php } else {?>
			<td class="right"><?php echo $product['quantity']; ?></td>
			<td class="right"><?php echo $product['price']; ?></td>
			<td class="right"><?php echo $product['total']; ?></td>
		<?php } ?>
        <?php //[SB] Removed product return column ?>
      </tr>
      <?php } ?>
      <?php foreach ($vouchers as $voucher) { ?>
      <tr>
        <td class="left"><?php echo $voucher['description']; ?></td>
        <td class="left"></td>
        <td class="right">1</td>
        <td class="right"><?php echo $voucher['amount']; ?></td>
        <td class="right"><?php echo $voucher['amount']; ?></td>
        <?php if ($products) { ?>
        <td></td>
        <?php } ?>
      </tr>
      <?php } ?>
    </tbody>
    <tfoot>
		<?php //[SB] Added Redemption
		if($redeem_total > 0) { ?>
			<tr>
				<td colspan="2"></td>
				<td class="right vitline"><b><?php echo $text_redemption_redeem_l; ?>:</b></td>
				<td class="right vitline"><?php echo $text_redemption_redeem_r . $redeem_total; ?></td>
			</tr>
		<?php } ?>
      <?php foreach ($totals as $total) { ?>
      <tr>
        <td colspan="2"></td><?php //[SB] Changed colspan from 3 to 2 ?>
        <td class="right"><b><?php echo $total['title']; ?>:</b></td>
        <td class="right"><?php echo $total['text']; ?></td>
        <?php //[SB] Removed product return column ?>
	  </tr>
      <?php } ?>
    </tfoot>
  </table>
  <?php if ($comment) { ?>
  <table class="list">
    <thead>
      <tr>
        <td class="left"><?php echo $text_comment; ?></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="left"><?php echo $comment; ?></td>
      </tr>
    </tbody>
  </table>
  <?php } ?>
  
  <?php if(false) { //[SB] Hide order histories if ($histories) { ?>
  <h2><?php echo $text_history; ?></h2>
  <table class="list">
    <thead>
      <tr>
        <td class="left"><?php echo $column_date_added; ?></td>
        <td class="left"><?php echo $column_status; ?></td>
        <td class="left"><?php echo $column_comment; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($histories as $history) { ?>
      <tr>
        <td class="left"><?php echo $history['date_added']; ?></td>
        <td class="left"><?php echo $history['status']; ?></td>
        <td class="left"><?php echo $history['comment']; ?></td>
      </tr>
      <?php } ?>
    </tbody>
  </table>
  <?php } ?>
  
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php echo $content_bottom; ?></section>
<?php echo $footer; ?> 