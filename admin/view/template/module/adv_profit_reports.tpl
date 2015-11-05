<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>  
  <?php if ($warning) { ?>
  <div class="warning"><?php echo $warning; ?></div>
  <?php } ?>  
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?> 
  <?php if (empty($vqmod_available)) { ?>
  <div class="warning"><?php echo $error_vqmod; ?></div>
  <?php } ?>        
  <?php foreach ($sc_geo_zones as $sc_geo_zone) { ?>
  <?php if (${'error_shipping_cost_' . $sc_geo_zone['geo_zone_id'] . '_total'}) { ?>
  <div class="warning"><?php echo $error_shipping_cost_total; ?> [<?php echo $sc_geo_zone['name']; ?>]</div>
  <?php } ?>   
  <?php if (${'error_shipping_cost_' . $sc_geo_zone['geo_zone_id'] . '_rate'}) { ?>
  <div class="warning"><?php echo $error_shipping_cost_rate; ?> [<?php echo $sc_geo_zone['name']; ?>]</div>
  <?php } ?>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <?php if (!empty($vqmod_available)) { ?>
      <div class="buttons"><?php if ($this->user->hasPermission('access', 'report/adv_sale_profit') or $this->user->hasPermission('access', 'report/adv_customer_profit')) { ?><a onclick="jQuery('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><?php } ?><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
      <?php } ?>
    </div>
    <div class="content">
    <?php if (!empty($vqmod_available)) { ?>
    <div id="tabs" class="htabs"><a href="#tab_product_cost"><?php echo $tab_product_cost; ?></a><?php if ($this->user->hasPermission('access', 'report/adv_sale_profit') or $this->user->hasPermission('access', 'report/adv_customer_profit')) { ?><a href="#tab_payment_cost"><?php echo $tab_payment_cost; ?></a><a href="#tab_shipping_cost"><?php echo $tab_shipping_cost; ?></a><?php } ?><a id="about" href="#tab-about"><?php echo $tab_about; ?></a></div> 
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">	
      	
      	<div id="tab_product_cost">
		<table class="form">
        <tr>
          <td><?php echo $entry_import_export; ?></td>
          <td><?php echo $entry_category; ?>
            <select name="filter_category">
			  <?php if ($filter_category == 0) { ?>
			  <option value="0" selected="selected"><?php echo $text_all; ?></option>
			  <?php } else { ?>
			  <option value="0"><?php echo $text_all; ?></option>
			  <?php } ?>
              <?php foreach ($categories as $category) { ?>
              <?php if ($category['category_id'] == $filter_category) { ?>
              <option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>&nbsp;
            <?php echo $entry_manufacturer; ?>
		    <select name="filter_manufacturer">
			  <?php if ($filter_manufacturer == 0) { ?>
			  <option value="0" selected="selected"><?php echo $text_all; ?></option>
			  <?php } else { ?>
			  <option value="0"><?php echo $text_all; ?></option>
			  <?php } ?>
              <?php foreach ($manufacturers as $manufacturer) { ?>
              <?php if ($manufacturer['manufacturer_id'] == $filter_manufacturer) { ?>
              <option value="<?php echo $manufacturer['manufacturer_id']; ?>" selected="selected"><?php echo $manufacturer['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option> 
              <?php } ?>
              <?php } ?>
            </select>&nbsp;
            <?php echo $entry_prod_status; ?>
            <select name="filter_status">
              <option value="*"><?php echo $text_all; ?></option>
                <?php if ($filter_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <?php } ?>
                <?php if (!is_null($filter_status) && !$filter_status) { ?>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } ?>
            </select><br />
			<input onclick="exportExcel();" type="button" class="button" style="border: 2px solid #000000; margin-top:10px;" value="<?php echo $button_export; ?>" />&nbsp;<?php echo $text_export; ?><br />
            <input type="file" name="upload" /><br />
            <input onclick="jQuery('#form').submit();" type="button" class="button" style="border: 2px solid #000000;" value="<?php echo $button_import; ?>" />&nbsp;<?php echo $text_import; ?></td>
        </tr>        
        <tr>
          <td><?php echo $entry_set_order_product_cost; ?></td>
          <td><?php echo $text_set_set_order_product_cost; ?>
          <input onclick="show_order_product_cost_confirm()" type="button" class="button" style="border: 2px solid #000000; margin-top:10px;" value="<?php echo $button_set_rder_product_cost; ?>" /></td>
        </tr>
        </table>
		</div>

	<?php if ($this->user->hasPermission('access', 'report/adv_sale_profit') or $this->user->hasPermission('access', 'report/adv_customer_profit')) { ?>	        
		<div id="tab_payment_cost">
		<table class="form">
        <tr>
          <td><?php echo $entry_adv_payment_cost_status; ?></td>
          <td><select name="adv_payment_cost_status">
              <?php if ($adv_payment_cost_status) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>       
     	</table>
	  <br/>
        <table id="adv_payment_cost" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $entry_adv_payment_cost_payment_type; ?></td>
              <td class="left"><?php echo $entry_adv_payment_cost_total; ?></td>
              <td class="left"><?php echo $entry_adv_payment_cost_percentage; ?></td>              
              <td class="left"><?php echo $entry_adv_payment_cost_fixed_fee; ?></td>
			  <td class="left"><?php echo $entry_adv_payment_cost_geo_zone; ?></td>
              <td></td>
            </tr>
          </thead>

          <?php if ($adv_payment_cost_types) { ?>
		   <?php $adv_payment_cost_types_row = 0; ?>
			<?php foreach ($adv_payment_cost_types as $adv_payment_cost_type) { ?>
			  <tbody id="adv_payment_cost_types_row<?php echo $adv_payment_cost_types_row; ?>">
				<tr>
				  <td class="left">
					<select name="adv_payment_cost_type[<?php echo $adv_payment_cost_types_row; ?>][pc_paymentkey]">
					  <?php foreach ($payment_types as $payment_type) { ?>
						  <?php  if ($payment_type['paymentkey'] == $adv_payment_cost_type['pc_paymentkey']) { ?>
							<option value="<?php echo $payment_type['paymentkey']; ?>" selected><?php echo $payment_type['name']; ?></option>
						  <?php } else { ?>
							<option value="<?php echo $payment_type['paymentkey']; ?>"><?php echo $payment_type['name']; ?></option>
						  <?php } ?>
					  <?php } ?>
					</select>
				  </td> 
				  <td class="left">
				  <input type="text" name="adv_payment_cost_type[<?php echo $adv_payment_cost_types_row; ?>][pc_order_total]" value="<?php echo $adv_payment_cost_type['pc_order_total']; ?>" />
				  </td>                  
				  <td class="left">
				  <input type="text" name="adv_payment_cost_type[<?php echo $adv_payment_cost_types_row; ?>][pc_percentage]" value="<?php echo $adv_payment_cost_type['pc_percentage']; ?>" />
				  </td>
				  <td class="left">
				  <input type="text" name="adv_payment_cost_type[<?php echo $adv_payment_cost_types_row; ?>][pc_fixed]" value="<?php echo $adv_payment_cost_type['pc_fixed']; ?>" />
				  </td>
				  <td class="left">
				    <select name="adv_payment_cost_type[<?php echo $adv_payment_cost_types_row; ?>][pc_geozone]">
					  <option value="0" <?php if($adv_payment_cost_type['pc_geozone'] == 0) { echo 'selected'; } ?>><?php echo $text_all_zones; ?></option>
					  <?php foreach ($pc_geo_zones as $pc_geo_zone) { ?>
						  <?php  if ($pc_geo_zone['geo_zone_id'] == $adv_payment_cost_type['pc_geozone']) { ?>
							<option value="<?php echo $pc_geo_zone['geo_zone_id']; ?>" selected><?php echo $pc_geo_zone['name']; ?></option>
						  <?php } else { ?>
							<option value="<?php echo $pc_geo_zone['geo_zone_id']; ?>"><?php echo $pc_geo_zone['name']; ?></option>
						  <?php } ?>
					  <?php } ?>
					</select>
				  </td>
				  <td class="left"><a onclick="jQuery('#adv_payment_cost_types_row<?php echo $adv_payment_cost_types_row; ?>').remove();" class="button"><span><?php echo $button_remove_payment; ?></span></a></td>
				</tr>
			  </tbody>
            <?php $adv_payment_cost_types_row++; ?>
  		    <?php } ?>
          <?php } else { ?>
		     <?php $adv_payment_cost_types_row = 0; ?>
		  <?php } ?>
		  
		  <tfoot>
            <tr>
              <td colspan="5"></td>
              <td class="left"><a onclick="addPaymentType();" class="button"><span><?php echo $button_add_payment; ?></span></a></td>
            </tr>
          </tfoot>
        </table>        
		</div>
        
      	<div id="tab_shipping_cost">
      <div class="vtabs"><a href="#tab-general"><?php echo $tab_general; ?></a>
        <?php foreach ($sc_geo_zones as $sc_geo_zone) { ?>
        <a href="#tab-geo-zone<?php echo $sc_geo_zone['geo_zone_id']; ?>"><?php echo $sc_geo_zone['name']; ?></a>
        <?php } ?>
      </div>
        <div id="tab-general" class="vtabs-content">
		<table class="form">
            <tr>
              <td><?php echo $entry_adv_shipping_cost_status; ?></td>
              <td><select name="adv_shipping_cost_weight_status">
                  <?php if ($adv_shipping_cost_weight_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>         
        </table>
		</div>   
        <?php foreach ($sc_geo_zones as $sc_geo_zone) { ?>
        <div id="tab-geo-zone<?php echo $sc_geo_zone['geo_zone_id']; ?>" class="vtabs-content">
          <table class="form">
        	<tr>
          	  <td><?php echo $entry_adv_shipping_cost_total; ?></td>
			  <td><input type="text" name="adv_shipping_cost_weight_<?php echo $sc_geo_zone['geo_zone_id']; ?>_total" value="<?php echo ${'adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_total'}; ?>" />
          	  <br />
          	  <?php if (${'error_shipping_cost_' . $sc_geo_zone['geo_zone_id'] . '_total'}) { ?>
          	  <span class="error"><?php echo ${'error_shipping_cost_' . $sc_geo_zone['geo_zone_id'] . '_total'}; ?></span>
          	  <?php } ?></td>
            </tr>              
            <tr>
              <td><?php echo $entry_adv_shipping_cost_rate; ?></td>
              <td><textarea name="adv_shipping_cost_weight_<?php echo $sc_geo_zone['geo_zone_id']; ?>_rate" cols="40" rows="5"><?php echo ${'adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_rate'}; ?></textarea>
          	  <br />
         	  <?php if (${'error_shipping_cost_' . $sc_geo_zone['geo_zone_id'] . '_rate'}) { ?>
         	  <span class="error"><?php echo ${'error_shipping_cost_' . $sc_geo_zone['geo_zone_id'] . '_rate'}; ?></span>
        	  <?php } ?></td>              
            </tr>        
            <tr>
              <td><?php echo $entry_status; ?></td>
              <td><select name="adv_shipping_cost_weight_<?php echo $sc_geo_zone['geo_zone_id']; ?>_status">
                  <?php if (${'adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_status'}) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
        </div>
        <?php } ?>
        </div>
     <?php } ?>
        
     <div id="tab-about">
     <div id="adv_sale_profit"></div>
     <div id="adv_product_profit"></div>
     <div id="adv_customer_profit"></div>
     <div align="center"><img src="view/image/adv_reports/adv_logo.jpg" /></div>
     </div>
     
     <?php } ?>
      </form>
    </div>
  </div>
</div> 
<?php if ($adv_sop_ext_version && $adv_sop_version && $adv_sop_version['version'] != $adv_sop_current_version) { ?>  
<script type="text/javascript"><!--
jQuery('#about').append('<img id=\"warning\" src=\"view/image/warning.png\" width=\"15\" height=\"15\" align=\"absmiddle\" hspace=\"5\" border=\"0\" />');  jQuery('#about').css({'background-color': '#FFD1D1','border': '1px solid #F8ACAC','color': 'red','text-decoration': 'blink'});
//--></script> 
<?php } elseif ($adv_ppp_ext_version && $adv_ppp_version && $adv_ppp_version['version'] != $adv_ppp_current_version) { ?>  
<script type="text/javascript"><!--
jQuery('#about').append('<img id=\"warning\" src=\"view/image/warning.png\" width=\"15\" height=\"15\" align=\"absmiddle\" hspace=\"5\" border=\"0\" />');  jQuery('#about').css({'background-color': '#FFD1D1','border': '1px solid #F8ACAC','color': 'red','text-decoration': 'blink'});
//--></script> 
<?php } elseif ($adv_cop_ext_version && $adv_cop_version && $adv_cop_version['version'] != $adv_cop_current_version) { ?>  
<script type="text/javascript"><!--
jQuery('#about').append('<img id=\"warning\" src=\"view/image/warning.png\" width=\"15\" height=\"15\" align=\"absmiddle\" hspace=\"5\" border=\"0\" />');  jQuery('#about').css({'background-color': '#FFD1D1','border': '1px solid #F8ACAC','color': 'red','text-decoration': 'blink'});
//--></script> 
<?php } ?>
<script type="text/javascript"><!--
function exportExcel() {
	url = 'index.php?route=module/adv_profit_reports&token=<?php echo $token; ?>';
			
	var filter_category = jQuery('select[name=\'filter_category\']').attr('value');
	var filter_manufacturer = jQuery('select[name=\'filter_manufacturer\']').attr('value');	
	var filter_status = jQuery('select[name=\'filter_status\']').attr('value');	
	
	if (filter_category) {
		url += '&filter_category=' + encodeURIComponent(filter_category) + '&filter_manufacturer=' + encodeURIComponent(filter_manufacturer) + '&filter_status=' + encodeURIComponent(filter_status) + '&export=xls';
	}
	
	location = url;
}

function show_order_product_cost_confirm() {
	var r = confirm("<?php echo $text_set_order_product_cost_confirm ;?>");
	if (r==true) {
		window.location = "<?php echo htmlspecialchars_decode($url_set_order_product_cost) ;?>";
	} else {
		//alert("You pressed Cancel!");
	}
}
//--></script>
<script type="text/javascript"><!--
jQuery('.htabs a').tabs();
jQuery('.vtabs a').tabs();
//--></script> 
<script type="text/javascript"><!--
var adv_payment_cost_types_row = <?php echo $adv_payment_cost_types_row; ?>;

function addPaymentType() {
	html  = '<tbody id="adv_payment_cost_types_row' + adv_payment_cost_types_row + '">';
	html += '<tr>';
	html += '<td class="left"><select name="adv_payment_cost_type[' + adv_payment_cost_types_row + '][pc_paymentkey]"><?php foreach ($payment_types as $payment_type) { ?>';
	html += '<option value="<?php echo $payment_type["paymentkey"]; ?>"><?php echo $payment_type["name"]; ?></option><?php } ?>';
	html += '<td class="left"><input type="text" name="adv_payment_cost_type[' + adv_payment_cost_types_row + '][pc_order_total]" value="0.00" /></td>';
	html += '<td class="left"><input type="text" name="adv_payment_cost_type[' + adv_payment_cost_types_row + '][pc_percentage]" value="0.00" /></td>';
	html += '<td class="left"><input type="text" name="adv_payment_cost_type[' + adv_payment_cost_types_row + '][pc_fixed]" value="0.00" /></td>';
	html += '<td class="left"><select name="adv_payment_cost_type[' + adv_payment_cost_types_row + '][pc_geozone]">';
    html += '<option value="0" selected><?php echo $text_all_zones; ?></option>';
    html += '<?php foreach ($pc_geo_zones as $pc_geo_zone) { ?>';
    html += '<option value="<?php echo $pc_geo_zone["geo_zone_id"]; ?>"><?php echo $pc_geo_zone["name"]; ?></option>';
    html += '<?php } ?></select></td>';
	html += '<td class="left"><a onclick="jQuery(\'#adv_payment_cost_types_row' + adv_payment_cost_types_row + '\').remove();" class="button"><span><?php echo $button_remove_payment; ?></span></a></td>';
	html += '</tr>';
	html += '</tbody>';

	jQuery('#adv_payment_cost > tfoot').before(html);

	adv_payment_cost_types_row++;
}
//--></script>
<?php echo $footer; ?>