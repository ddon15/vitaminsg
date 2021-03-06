<?php echo $header; ?>

<div id="content">

  <div class="breadcrumb">

    <?php foreach ($breadcrumbs as $breadcrumb) { ?>

    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>

    <?php } ?>

  </div>

  <div class="box">

    <div class="heading">

      <h1><img src="view/image/report.png" alt="" /> <?php echo $heading_title; ?></h1>

    </div>

    <div class="content">

      <table class="form">

        <tr>

          <td><?php echo $entry_date_from; ?>

            <input type="text" name="filter_date_from" value="<?php echo $filter_date_from; ?>" id="date-from" size="12" /></td>

          <td><?php echo $entry_date_end; ?>

            <input type="hidden" name="filter_date_end" value="<?php echo $filter_date_end; ?>" id="date-end" size="12" /></td>

          <td style="text-align: right;"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>

        </tr>

      </table>

      <table class="list">

        <thead>

          <tr>

            <td class="left"><?php echo $column_customer; ?></td>

            <td class="left"><?php echo $column_email; ?></td>

            <td class="left"><?php echo $column_customer_group; ?></td>

            <td class="left"><?php echo $column_status; ?></td>

            <td class="left"><?php echo $column_expiry_date; ?></td>

          </tr>

        </thead>

        <tbody>

          <?php if ($customers) { ?>

          <?php foreach ($customers as $customer) { ?>

          <tr>

            <td class="left"><?php echo $customer['name']; ?></td>

            <td class="left"><?php echo $customer['email']; ?></td>

            <td class="left"><?php echo $customer['customer_group']; ?></td>

            <td class="left"><?php echo $customer['status']; ?></td>

            <td class="left"><?php echo substr($customer['expiry_date'], 0, 10); ?></td>

            <!--<td class="right"><?php foreach ($customer['action'] as $action) { ?>

              [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]

              <?php } ?></td>-->

          </tr>

          <?php } ?>

          <?php } else { ?>

          <tr>

            <td class="center" colspan="8"><?php echo $text_no_results; ?></td>

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

	url = 'index.php?route=report/customer_expiry&token=<?php echo $token; ?>';

	

	var filter_date_from = $('input[name=\'filter_date_from\']').attr('value');

	

	if (filter_date_from) {

		url += '&filter_date_from=' + encodeURIComponent(filter_date_from);

	}



	var filter_date_end = $('input[name=\'filter_date_end\']').attr('value');

	

	if (filter_date_end) {

		url += '&filter_date_end=' + encodeURIComponent(filter_date_end);

	}

	

	location = url;

}

//--></script> 

<script type="text/javascript"><!--

$(document).ready(function() {

	$('#date-from').datepicker({dateFormat: 'yy-mm-dd'});

	

	$('#date-end').datepicker({dateFormat: 'yy-mm-dd'});

});

//--></script> 

<?php echo $footer; ?>