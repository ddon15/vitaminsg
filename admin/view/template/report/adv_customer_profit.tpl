<?php echo $header; ?>
<?php if (!defined('_JEXEC')) { ?>
<script type="text/javascript">
jQuery(document).ready(function() { 
  jQuery("#content_report").hide(); 
  jQuery(window).load(function() { 
    	jQuery("#content_report").show(); 
    	jQuery("#content-loading").hide(); 
  	});
});
</script>
<div id="content-loading" style="position: absolute; background-color:white; layer-background-color:white; height:100%; width:100%; text-align:center;"><img src="view/image/adv_reports/page_loading.gif" border="0"></div>
<?php } ?>
<style type="text/css">
.box > .content_report {
	padding: 10px;
	border-left: 1px solid #CCCCCC;
	border-right: 1px solid #CCCCCC;
	border-bottom: 1px solid #CCCCCC;
	min-height: 300px;
}
.list_main {
	border-collapse: collapse;
	width: 100%;
	border-top: 1px solid #DDDDDD;
	border-left: 1px solid #DDDDDD;	
	margin-bottom: 10px;
}
.list_main td {
	border-right: 1px solid #DDDDDD;
	border-bottom: 1px solid #DDDDDD;	
}
.list_main thead td {
	background-color: #E5E5E5;
	padding: 0px 5px;
	font-weight: bold;	
}
.list_main tbody td {
	vertical-align: middle;
	padding: 0px 5px;
}
.list_main .left {
	text-align: left;
	padding: 7px;
}
.list_main .right {
	text-align: right;
	padding: 7px;
}
.list_main .center {
	text-align: center;
	padding: 3px;
}
.list_main .noresult {
	text-align: center;
	padding: 7px;
}

.list_detail {
	border-collapse: collapse;
	width: 100%;
	border-top: 1px solid #DDDDDD;
	border-left: 1px solid #DDDDDD;
	margin-top: 10px;
	margin-bottom: 10px;
}
.list_detail td {
	border-right: 1px solid #DDDDDD;
	border-bottom: 1px solid #DDDDDD;
}
.list_detail thead td {
	background-color: #F0F0F0;
	padding: 0px 3px;
	font-size: 11px;
	font-weight: bold;
}
.list_detail tbody td {
	padding: 0px 3px;
	font-size: 11px;	
}
.list_detail .left {
	text-align: left;
	padding: 3px;
}
.list_detail .right {
	text-align: right;
	padding: 3px;
}
.list_detail .center {
	text-align: center;
	padding: 3px;
}
		
.export_item {
  text-decoration: none;
  cursor: pointer;
}
.export_item a {
  text-decoration: none;
}
.export_item :hover {
  opacity: 0.7;
  -moz-opacity: 0.7;
  -ms-filter: "alpha(opacity=70)"; /* IE 8 */
  filter: alpha(opacity=70); /* IE < 8 */
} 
a.cbutton {
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 15px 5px 15px;
	-webkit-border-radius: 5px 5px 5px 5px;
	-moz-border-radius: 5px 5px 5px 5px;
	-khtml-border-radius: 5px 5px 5px 5px;
	border-radius: 5px 5px 5px 5px;
}

.pagination_report {
	padding:3px;
	margin:3px;
	text-align:right;
	margin-top:10px;
}
.pagination_report a {
	padding: 4px 8px 4px 8px;
	margin-right: 2px;
	border: 1px solid #ddd;
	text-decoration: none; 
	color: #666;
}
.pagination_report a:hover, .pagination_report a:active {
	padding: 4px 8px 4px 8px;
	margin-right: 2px;
	border: 1px solid #c0c0c0;
}
.pagination_report span.current {
	padding: 4px 8px 4px 8px;
	margin-right: 2px;
	border: 1px solid #a0a0a0;
	font-weight: bold;
	background-color: #f0f0f0;
	color: #666;
}
.pagination_report span.disabled {
	padding: 4px 8px 4px 8px;
	margin-right: 2px;
	border: 1px solid #f3f3f3;
	color: #ccc;
}

.ui-dialog .ui-dialog-content {
  background: #f3f3f3 !important;
} 

.styled-select-type {
	background-color: #ffcc99;
	padding: 3px;
 	border: 1px solid #999;
    -moz-border-radius: 3px; 
    border-radius: 3px;
}
.styled-select {
	background-color: #E7EFEF;
	padding: 3px;
 	border: 1px solid #999;
    -moz-border-radius: 3px; 
    border-radius: 3px;
}

a.multiSelect {
	background: #FFF url(view/image/adv_reports/dropdown.blue.png) right center no-repeat;
	border: solid 1px #BBB;
	padding-right: 20px;
	margin-top: 4px;
	height: 18px;
	position: relative;
	cursor: default;
	text-decoration: none;
	color: black;
	display: -moz-inline-stack;
	display: inline-block;
	vertical-align: middle;
}
a.multiSelect:link, a.multiSelect:visited, a.multiSelect:hover, a.multiSelect:active {
	color: black;
	text-decoration: none;
	padding-top: 2px;	
}
a.multiSelect span {
	margin: 1px 0px 2px 4px;
	overflow: hidden;
	display: -moz-inline-stack;
	display: inline-block;
	white-space: nowrap;
	min-width: 105px;	
}
.multiSelectOptions {
	margin-top: 2px;	
	overflow-y: auto;
	overflow-x: hidden;
	border: solid 1px #B2B2B2;
	background: #FFF;
	min-width: 105px;	
}
.multiSelectOptions LABEL {
	padding: 0px 2px;
	display: block;
	white-space: nowrap;
}
.multiSelectOptions LABEL.optGroup {
	font-weight: bold;
}
.multiSelectOptions .optGroupContainer LABEL {
	padding-left: 10px;
}
.multiSelectOptions.optGroupHasCheckboxes .optGroupContainer LABEL {
	padding-left: 18px;
}
.multiSelectOptions input {
	vertical-align: middle;
}
.multiSelectOptions LABEL.checked {
	background-color: #dce5f8;
}
.multiSelectOptions LABEL.selectAll {
	border-bottom: dotted 1px #CCC;
}
.multiSelectOptions LABEL.hover {
	background-color: #3399ff;
	color: white;
}
</style>
<form method="post" action="index.php?route=report/adv_customer_profit&token=<?php echo $token; ?>" id="report" name="report"> 
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <div class="box">
    <div class="heading">
      <h1><div style="float:left;"><img src="view/image/report.png" alt="" /> <?php echo $heading_title; ?></div><div style="float:left;"><span class="vtip" title="<?php echo $text_profit_help; ?>"><img style="padding-left:3px;" src="view/image/adv_reports/profit_info.png" alt="" /></span></div></h1><span style="float:right; padding-top:5px; padding-right:5px; font-size:11px; color:#666; text-align:right;"><?php echo $heading_version; ?></span></div>
      <div align="right" style="height:38px; background-color:#F0F0F0; border: 1px solid #DDDDDD; margin-top:5px;">
      <div style="padding-top: 7px; margin-right: 5px;"><?php echo $entry_customer_type; ?>
		<select name="filter_types" class="styled-select-type"> 
            <?php if (!$filter_types) { ?>        
            <option value="3" selected="selected"><?php echo $text_all_cust_types; ?></option> 
            <?php } else { ?>
            <option value="3"><?php echo $text_all_cust_types; ?></option> 
            <?php } ?>                      
            <?php if ($filter_types == '1') { ?>
            <option value="1" selected="selected"><?php echo $text_registered; ?></option>
            <?php } else { ?>
            <option value="1"><?php echo $text_registered; ?></option>
            <?php } ?>
            <?php if ($filter_types == '0') { ?>
            <option value="0" selected="selected"><?php echo $text_guest; ?></option>
            <?php } else { ?>
            <option value="0"><?php echo $text_guest; ?></option>
            <?php } ?>
            <?php if ($filter_types == '2') { ?>
            <option value="2" selected="selected"><?php echo $text_new; ?></option>
            <?php } else { ?>
            <option value="2"><?php echo $text_new; ?></option>
            <?php } ?>             
          </select>&nbsp;&nbsp; 
          <?php echo $entry_group; ?>
          <select name="filter_group" class="styled-select" <?php echo ($filter_details == 4) ? 'disabled="disabled"' : '' ?>> 
            <?php foreach ($groups as $groups) { ?>
            <?php if ($groups['value'] == $filter_group) { ?>
            <option value="<?php echo $groups['value']; ?>" selected="selected"><?php echo $groups['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $groups['value']; ?>"><?php echo $groups['text']; ?></option>
            <?php } ?>
            <?php } ?>
          	<?php if ($filter_details == 4) { ?>
			<option selected="selected">----</option>
			<?php } ?>
          </select>&nbsp;&nbsp;           
          <?php echo $entry_sort_by; ?>
		  <select name="filter_sort" class="styled-select" <?php echo ($filter_details == 4) ? 'disabled="disabled"' : '' ?>>
            <?php if ($filter_sort == 'date') { ?>
            <option value="date" selected="selected"><?php echo $column_date; ?></option>
            <?php } else { ?>
            <option value="date"><?php echo $column_date; ?></option>
            <?php } ?>          
            <?php if ($filter_sort == 'customer_id') { ?>
            <option value="customer_id" selected="selected"><?php echo $column_id; ?></option>
            <?php } else { ?>
            <option value="customer_id"><?php echo $column_id; ?></option>
            <?php } ?>
            <?php if ($filter_sort == 'cust_name') { ?>
            <option value="cust_name" selected="selected"><?php echo $column_customer; ?></option>
            <?php } else { ?>
            <option value="cust_name"><?php echo $column_customer; ?></option>
            <?php } ?>
            <?php if ($filter_sort == 'cust_company') { ?>
            <option value="cust_company" selected="selected"><?php echo $column_company; ?></option>
            <?php } else { ?>
            <option value="cust_company"><?php echo $column_company; ?></option>
            <?php } ?>            
            <?php if ($filter_sort == 'cust_email') { ?>
            <option value="cust_email" selected="selected"><?php echo $column_email; ?></option>
            <?php } else { ?>
            <option value="cust_email"><?php echo $column_email; ?></option>
            <?php } ?>
            <?php if ($filter_sort == 'cust_telephone') { ?>
            <option value="cust_telephone" selected="selected"><?php echo $column_telephone; ?></option>
            <?php } else { ?>
            <option value="cust_telephone"><?php echo $column_telephone; ?></option>
            <?php } ?>            
            <?php if ($filter_sort == 'cust_country') { ?>
            <option value="cust_country" selected="selected"><?php echo $column_country; ?></option>
            <?php } else { ?>
            <option value="cust_country"><?php echo $column_country; ?></option>
            <?php } ?>            
            <?php if ($filter_sort == 'cust_group_reg') { ?>
            <option value="cust_group_reg" selected="selected"><?php echo $column_customer_group; ?></option>
            <?php } else { ?>
            <option value="cust_group_reg"><?php echo $column_customer_group; ?></option>
            <?php } ?>
            <?php if ($filter_sort == 'cust_status') { ?>
            <option value="cust_status" selected="selected"><?php echo $column_status; ?></option>
            <?php } else { ?>
            <option value="cust_status"><?php echo $column_status; ?></option>
            <?php } ?>
            <?php if ($filter_sort == 'cust_ip') { ?>
            <option value="cust_ip" selected="selected"><?php echo $column_ip; ?></option>
            <?php } else { ?>
            <option value="cust_ip"><?php echo $column_ip; ?></option>
            <?php } ?>
            <?php if ($filter_sort == 'mostrecent') { ?>
            <option value="mostrecent" selected="selected"><?php echo $column_mostrecent; ?></option>
            <?php } else { ?>
            <option value="mostrecent"><?php echo $column_mostrecent; ?></option>
            <?php } ?>                                                                                                        
            <?php if (!$filter_sort or $filter_sort == 'orders') { ?>
            <option value="orders" selected="selected"><?php echo $column_orders; ?></option>
            <?php } else { ?>
            <option value="orders"><?php echo $column_orders; ?></option>
            <?php } ?>
            <?php if ($filter_sort == 'products') { ?>
            <option value="products" selected="selected"><?php echo $column_products; ?></option>
            <?php } else { ?>
            <option value="products"><?php echo $column_products; ?></option>
            <?php } ?>
            <?php if ($filter_sort == 'total') { ?>
            <option value="total" selected="selected"><?php echo $column_value; ?></option>
            <?php } else { ?>
            <option value="total"><?php echo $column_value; ?></option>
            <?php } ?>            
            <?php if ($filter_sort == 'sales') { ?>
            <option value="sales" selected="selected"><?php echo $column_total_sales; ?></option>
            <?php } else { ?>
            <option value="sales"><?php echo $column_total_sales; ?></option>
            <?php } ?>            
            <?php if ($filter_sort == 'costs') { ?>
            <option value="costs" selected="selected"><?php echo $column_total_costs; ?></option>
            <?php } else { ?>
            <option value="costs"><?php echo $column_total_costs; ?></option>
            <?php } ?>              
            <?php if ($filter_sort == 'profit') { ?>
            <option value="profit" selected="selected"><?php echo $column_total_profit; ?></option>
            <?php } else { ?>
            <option value="profit"><?php echo $column_total_profit; ?></option>
            <?php } ?>
            <?php if ($filter_sort == 'profit_margin') { ?>
            <option value="profit_margin" selected="selected"><?php echo $column_profit_margin; ?></option>
            <?php } else { ?>
            <option value="profit_margin"><?php echo $column_profit_margin; ?></option>
            <?php } ?>
          	<?php if ($filter_details == 4) { ?>
			<option selected="selected">----</option>
			<?php } ?>
          </select>&nbsp;&nbsp; 
          <?php echo $entry_show_details; ?>
		  <select name="filter_details" class="styled-select">                      
            <?php if (!$filter_details or $filter_details == '0') { ?>
            <option value="0" selected="selected"><?php echo $text_no_details; ?></option>
            <?php } else { ?>
            <option value="0"><?php echo $text_no_details; ?></option>
            <?php } ?>
            <?php if ($filter_details == '1') { ?>
            <option value="1" selected="selected"><?php echo $text_order_list; ?></option>
            <?php } else { ?>
            <option value="1"><?php echo $text_order_list; ?></option>
            <?php } ?>
            <?php if ($filter_details == '2') { ?>
            <option value="2" selected="selected"><?php echo $text_product_list; ?></option>
            <?php } else { ?>
            <option value="2"><?php echo $text_product_list; ?></option>
            <?php } ?>  
            <?php if ($filter_details == '3') { ?>
            <option value="3" selected="selected"><?php echo $text_address_list; ?></option>
            <?php } else { ?>
            <option value="3"><?php echo $text_address_list; ?></option>
            <?php } ?>               
            <?php if ($filter_details == '4') { ?>
            <option value="4" selected="selected"><?php echo $text_all_details; ?></option>
            <?php } else { ?>
            <option value="4"><?php echo $text_all_details; ?></option>
            <?php } ?>                              
          </select>&nbsp;&nbsp; 
          <?php echo $entry_limit; ?>
		  <select name="filter_limit" class="styled-select"> 
            <?php if ($filter_limit == '10') { ?>
            <option value="10" selected="selected">10</option>
            <?php } else { ?>
            <option value="10">10</option>
            <?php } ?>                                
            <?php if (!$filter_limit or $filter_limit == '25') { ?>
            <option value="25" selected="selected">25</option>
            <?php } else { ?>
            <option value="25">25</option>
            <?php } ?>
            <?php if ($filter_limit == '50') { ?>
            <option value="50" selected="selected">50</option>
            <?php } else { ?>
            <option value="50">50</option>
            <?php } ?>
            <?php if ($filter_limit == '100') { ?>
            <option value="100" selected="selected">100</option>
            <?php } else { ?>
            <option value="100">100</option>
            <?php } ?>                        
          </select>&nbsp; <a id="button" onclick="jQuery('#report').submit();" class="cbutton" style="background:#069;"><span><?php echo $button_filter; ?></span></a>&nbsp;<?php if ($customers) { ?><?php if (($filter_range != 'all_time' && ($filter_group == 'year' or $filter_group == 'quarter' or $filter_group == 'month')) or ($filter_range == 'all_time' && $filter_group == 'year')) { ?><a id="show_tab_chart" class="cbutton" style="background:#930;"><span><?php echo $button_chart; ?></span></a><?php } ?><?php } ?>&nbsp;<a id="show_tab_export" class="cbutton" style="background:#699;"><span><?php echo $button_export; ?></span></a>&nbsp;<a id="settings" class="cbutton" style="background:#666;"><span><?php echo $button_settings; ?></span></a></div>
    </div>
    <div class="content_report">
<script type="text/javascript"><!--
jQuery(document).ready(function() {
var prev = {start: 0, stop: 0},
    cont = jQuery('#pagination_content #element');
	
jQuery('.pagination_report').paging(cont.length, {
	format: '[< ncnnn! >]',
	perpage: '<?php echo $filter_limit; ?>',	
	lapping: 0,
	page: null, // we await hashchange() event
			onSelect: function() {

				var data = this.slice;

				cont.slice(prev[0], prev[1]).css('display', 'none');
				cont.slice(data[0], data[1]).fadeIn(0);

				prev = data;

				return true; // locate!
			},
			onFormat: function (type) {

				switch (type) {

					case 'block':

						if (!this.active)
							return '<span class="disabled">' + this.value + '</span>';
						else if (this.value != this.page)
							return '<em><a href="index.php?route=report/adv_customer_profit&token=<?php echo $token; ?>#' + this.value + '">' + this.value + '</a></em>';
						return '<span class="current">' + this.value + '</span>';

					case 'next':

						if (this.active) {
							return '<a href="index.php?route=report/adv_customer_profit&token=<?php echo $token; ?>#' + this.value + '" class="next">Next &gt;</a>';
						}
						return '';						

					case 'prev':

						if (this.active) {
							return '<a href="index.php?route=report/adv_customer_profit&token=<?php echo $token; ?>#' + this.value + '" class="prev">&lt; Previous</a>';
						}	
						return '';						

					case 'first':

						if (this.active) {
							return '<?php echo $text_pagin_page; ?> ' + this.page + ' <?php echo $text_pagin_of; ?> ' + this.pages + '&nbsp;&nbsp;<a href="index.php?route=report/adv_customer_profit&token=<?php echo $token; ?>#' + this.value + '" class="first">|&lt;</a>';
						}	
						return '<?php echo $text_pagin_page; ?> ' + this.page + ' <?php echo $text_pagin_of; ?> ' + this.pages + '&nbsp;&nbsp';
							
					case 'last':

						if (this.active) {
							return '<a href="index.php?route=report/adv_customer_profit&token=<?php echo $token; ?>#' + this.value + '" class="prev">&gt;|</a>&nbsp;&nbsp;(' + cont.length + ' <?php echo $text_pagin_results; ?>)';
						}
						return '&nbsp;&nbsp;(' + cont.length + ' <?php echo $text_pagin_results; ?>)';					

				}
				return ''; // return nothing for missing branches
			}
});
});		
//--></script>         
<script type="text/javascript"><!--
function getStorage(key_prefix) {
    // this function will return us an object with a "set" and "get" method
    if (window.localStorage) {
        // use localStorage:
        return {
            set: function(id, data) {
                localStorage.setItem(key_prefix+id, data);
            },
            get: function(id) {
                return localStorage.getItem(key_prefix+id);
            }
        };
    }
}

jQuery(document).ready(function() {
    // a key must is used for the cookie/storage
    var storedData = getStorage('com_mysite_checkboxes_'); 
    
    jQuery('div.check input:checkbox').bind('change',function(){
        jQuery('#'+this.id+'_filter').toggle(jQuery(this).is(':checked'));
        jQuery('#'+this.id+'_title').toggle(jQuery(this).is(':checked'));
			<?php if ($customers) {
					foreach ($customers as $key => $customer) {
						echo "jQuery('#'+this.id+'_" . $customer['order_id'] . "_title').toggle(jQuery(this).is(':checked')); ";
						echo "jQuery('#'+this.id+'_" . $customer['order_id'] . "').toggle(jQuery(this).is(':checked')); ";						
					}			
			} 
			;?>		
        jQuery('#'+this.id+'_total').toggle(jQuery(this).is(':checked'));			
        // save the data on change
        storedData.set(this.id, jQuery(this).is(':checked')?'checked':'not');
    }).each(function() {
        // on load, set the value to what we read from storage:
        var val = storedData.get(this.id);
        if (val == 'checked') jQuery(this).attr('checked', 'checked');
        if (val == 'not') jQuery(this).removeAttr('checked');
        if (val) jQuery(this).trigger('change');
    });
});
//--></script>
<div id="settings_window" style="display:none">
<div class="check">
<table align="center" cellspacing="0" cellpadding="0">   
    <tr><td>
    <table width="100%" cellspacing="0" cellpadding="0" style="background:#FFEFDF; border:1px solid #CCCCCC; padding:3px;"> 
    <tr><td width="1%" nowrap="nowrap">&nbsp;<?php echo $text_formula_setting1; ?> &nbsp;</td>
    <td width="1%" nowrap="nowrap"><select name="adv_profit_reports_formula_cop1">
    <?php if ($adv_profit_reports_formula_cop1) { ?>
	<option value="1" selected="selected"><?php echo $text_yes; ?></option>
	<option value="0"><?php echo $text_no; ?></option>
	<?php } else { ?>
	<option value="1"><?php echo $text_yes; ?></option>
	<option value="0" selected="selected"><?php echo $text_no; ?></option>
	<?php } ?>
	</select></td>
    <td rowspan="3" align="center"><a onclick="jQuery('#report').submit();" class="cbutton" style="background:#069;"><span><?php echo $button_save; ?></span></a>&nbsp;<a onclick="location = '<?php echo $settings; ?>'" class="cbutton" style="background:#666;"><span><?php echo $button_module_settings; ?></span></a></td></tr> 
    <tr><td width="1%" nowrap="nowrap">&nbsp;<?php echo $text_formula_setting2; ?> &nbsp;</td>
    <td width="1%" nowrap="nowrap"><select name="adv_profit_reports_formula_cop2">
    <?php if ($adv_profit_reports_formula_cop2) { ?>
	<option value="1" selected="selected"><?php echo $text_yes; ?></option>
	<option value="0"><?php echo $text_no; ?></option>
	<?php } else { ?>
	<option value="1"><?php echo $text_yes; ?></option>
	<option value="0" selected="selected"><?php echo $text_no; ?></option>
	<?php } ?>
	</select></td></tr> 
    <tr><td width="1%" nowrap="nowrap">&nbsp;<?php echo $text_formula_setting3; ?> &nbsp;</td>
    <td width="1%" nowrap="nowrap"><select name="adv_profit_reports_formula_cop3">
    <?php if ($adv_profit_reports_formula_cop3) { ?>
	<option value="1" selected="selected"><?php echo $text_yes; ?></option>
	<option value="0"><?php echo $text_no; ?></option>
	<?php } else { ?>
	<option value="1"><?php echo $text_yes; ?></option>
	<option value="0" selected="selected"><?php echo $text_no; ?></option>
	<?php } ?>
	</select></td></tr> 
    </table>
    </td></tr> 
    <tr><td><br />
      &nbsp;<span style="font-size:14px; font-weight:bold;"><?php echo $text_filtering_options; ?></span><br />        
      <table width="100%" cellspacing="0" cellpadding="3" style="background:#E7EFEF; border:1px solid #DDDDDD; margin-top:3px;">
        <tr>
          <td>       
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop2" checked="checked" type="checkbox"><label for="cop2"><?php echo substr($entry_store,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop3" checked="checked" type="checkbox"><label for="cop3"><?php echo substr($entry_currency,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop4a" checked="checked" type="checkbox"><label for="cop4a"><?php echo substr($entry_tax,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop4c" checked="checked" type="checkbox"><label for="cop4c"><?php echo substr($entry_tax_classes,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop4b" checked="checked" type="checkbox"><label for="cop4b"><?php echo substr($entry_geo_zone,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop5" checked="checked" type="checkbox"><label for="cop5"><?php echo substr($entry_customer_group,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop6" checked="checked" type="checkbox"><label for="cop6"><?php echo substr($entry_customer_status,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop7" checked="checked" type="checkbox"><label for="cop7"><?php echo substr($entry_customer_name,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop8a" checked="checked" type="checkbox"><label for="cop8a"><?php echo substr($entry_customer_email,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop8b" checked="checked" type="checkbox"><label for="cop8b"><?php echo substr($entry_customer_telephone,0,-1); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop8c" checked="checked" type="checkbox"><label for="cop8c"><?php echo substr($entry_ip,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop17a" checked="checked" type="checkbox"><label for="cop17a"><?php echo substr($entry_payment_company,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop17b" checked="checked" type="checkbox"><label for="cop17b"><?php echo substr($entry_payment_address,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop17c" checked="checked" type="checkbox"><label for="cop17c"><?php echo substr($entry_payment_city,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop17d" checked="checked" type="checkbox"><label for="cop17d"><?php echo substr($entry_payment_zone,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop17e" checked="checked" type="checkbox"><label for="cop17e"><?php echo substr($entry_payment_postcode,0,-1); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop17f" checked="checked" type="checkbox"><label for="cop17f"><?php echo substr($entry_payment_country,0,-1); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop13" checked="checked" type="checkbox"><label for="cop13"><?php echo substr($entry_payment_method,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop16a" checked="checked" type="checkbox"><label for="cop16a"><?php echo substr($entry_shipping_company,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop16b" checked="checked" type="checkbox"><label for="cop16b"><?php echo substr($entry_shipping_address,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop16c" checked="checked" type="checkbox"><label for="cop16c"><?php echo substr($entry_shipping_city,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop16d" checked="checked" type="checkbox"><label for="cop16d"><?php echo substr($entry_shipping_zone,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop16e" checked="checked" type="checkbox"><label for="cop16e"><?php echo substr($entry_shipping_postcode,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop16f" checked="checked" type="checkbox"><label for="cop16f"><?php echo substr($entry_shipping_country,0,-1); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop14" checked="checked" type="checkbox"><label for="cop14"><?php echo substr($entry_shipping_method,0,-1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop9d" checked="checked" type="checkbox"><label for="cop9d"><?php echo substr($entry_category,0,-1); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop9e" checked="checked" type="checkbox"><label for="cop9e"><?php echo substr($entry_manufacturer,0,-1); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop9a" checked="checked" type="checkbox"><label for="cop9a"><?php echo substr($entry_sku,0,-1); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop9b" checked="checked" type="checkbox"><label for="cop9b"><?php echo substr($entry_product,0,-1); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop9c" checked="checked" type="checkbox"><label for="cop9c"><?php echo substr($entry_model,0,-1); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop10" checked="checked" type="checkbox"><label for="cop10"><?php echo substr($entry_option,0,-1); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop18" checked="checked" type="checkbox"><label for="cop18"><?php echo substr($entry_attributes,0,-1); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop11" checked="checked" type="checkbox"><label for="cop11"><?php echo substr($entry_location,0,-1); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop12a" checked="checked" type="checkbox"><label for="cop12a"><?php echo substr($entry_affiliate_name,0,-1); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop12b" checked="checked" type="checkbox"><label for="cop12b"><?php echo substr($entry_affiliate_email,0,-1); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop15a" checked="checked" type="checkbox"><label for="cop15a"><?php echo substr($entry_coupon_name,0,-1); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop15b" checked="checked" type="checkbox"><label for="cop15b"><?php echo substr($entry_coupon_code,0,-1); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop19" checked="checked" type="checkbox"><label for="cop19"><?php echo substr($entry_voucher_code,0,-1); ?></label></div>
          </td>                                                                                                                        
        </tr>
      </table><br />
      &nbsp;<span style="font-size:14px; font-weight:bold;"><?php echo $text_column_settings; ?></span><br />  
      <table width="100%" cellspacing="0" cellpadding="3" style="background:#E5E5E5; border:1px solid #DDDDDD; margin-top:3px;">
        <tr>
          <td>
            &nbsp;<span style="font-size:11px; font-weight:bold;"><?php echo $text_mv_columns; ?></span><br />      
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop20" name="cop20" checked="checked" type="checkbox"><label for="cop20"><?php echo $column_id; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop21" name="cop21" checked="checked" type="checkbox"><label for="cop21"><?php echo $column_customer; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop22" name="cop22" checked="checked" type="checkbox"><label for="cop22"><?php echo $column_email; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop35" name="cop35" checked="checked" type="checkbox"><label for="cop35"><?php echo $column_telephone; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop34" name="cop34" checked="checked" type="checkbox"><label for="cop34"><?php echo $column_country; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop23" name="cop23" checked="checked" type="checkbox"><label for="cop23"><?php echo $column_customer_group; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop24" name="cop24" checked="checked" type="checkbox"><label for="cop24"><?php echo $column_status; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop25" name="cop25" checked="checked" type="checkbox"><label for="cop25"><?php echo $column_ip; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop26" name="cop26" checked="checked" type="checkbox"><label for="cop26"><?php echo $column_mostrecent; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop27" name="cop27" checked="checked" type="checkbox"><label for="cop27"><?php echo $column_orders; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop28" name="cop28" checked="checked" type="checkbox"><label for="cop28"><?php echo $column_products; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop30" name="cop30" checked="checked" type="checkbox"><label for="cop30"><?php echo $column_value; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop29" name="cop29" checked="checked" type="checkbox"><label for="cop29"><?php echo $column_total_sales; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop31" name="cop31" checked="checked" type="checkbox"><label for="cop31"><?php echo $column_total_costs; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop32" name="cop32" checked="checked" type="checkbox"><label for="cop32"><?php echo $column_total_profit; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop33" name="cop33" checked="checked" type="checkbox"><label for="cop33"><?php echo $column_total_profit; ?> [%]</label></div>
          </td>                                                                                                                        
        </tr>
		<tr><td>
		<span style="font-size:11px; color:#3C0;">* <?php echo $text_export_note; ?></span>  
		</td></tr>          
      </table>
      <table width="100%" cellspacing="0" cellpadding="3" style="background:#F0F0F0; border:1px solid #DDDDDD; margin-top:3px;">
        <tr>
          <td>
            &nbsp;<span style="font-size:11px; font-weight:bold;"><?php echo $text_ol_columns; ?></span><br />      
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop40" name="cop40" checked="checked" type="checkbox"><label for="cop40"><?php echo $column_order_order_id; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop41" name="cop41" checked="checked" type="checkbox"><label for="cop41"><?php echo $column_order_date_added; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop42" name="cop42" checked="checked" type="checkbox"><label for="cop42"><?php echo $column_order_inv_no; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop43" name="cop43" checked="checked" type="checkbox"><label for="cop43"><?php echo $column_order_customer; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop44" name="cop44" checked="checked" type="checkbox"><label for="cop44"><?php echo $column_order_email; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop45" name="cop45" checked="checked" type="checkbox"><label for="cop45"><?php echo $column_order_customer_group; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop46" name="cop46" checked="checked" type="checkbox"><label for="cop46"><?php echo $column_order_shipping_method; ?></label></div>	
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop47" name="cop47" checked="checked" type="checkbox"><label for="cop47"><?php echo $column_order_payment_method; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop48" name="cop48" checked="checked" type="checkbox"><label for="cop48"><?php echo $column_order_status; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop49" name="cop49" checked="checked" type="checkbox"><label for="cop49"><?php echo $column_order_store; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop50" name="cop50" checked="checked" type="checkbox"><label for="cop50"><?php echo $column_order_currency; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop51" name="cop51" checked="checked" type="checkbox"><label for="cop51"><?php echo $column_order_quantity; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop52" name="cop52" checked="checked" type="checkbox"><label for="cop52"><?php echo $column_order_sub_total; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop54" name="cop54" checked="checked" type="checkbox"><label for="cop54"><?php echo $column_order_shipping; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop55" name="cop55" checked="checked" type="checkbox"><label for="cop55"><?php echo $column_order_tax; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop56" name="cop56" checked="checked" type="checkbox"><label for="cop56"><?php echo $column_order_value; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop53" name="cop53" checked="checked" type="checkbox"><label for="cop53"><?php echo $column_order_sales; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop57" name="cop57" checked="checked" type="checkbox"><label for="cop57"><?php echo $column_order_costs; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop58" name="cop58" checked="checked" type="checkbox"><label for="cop58"><?php echo $column_order_profit; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop59" name="cop59" checked="checked" type="checkbox"><label for="cop59"><?php echo $column_order_profit; ?> [%]</label></div>
          </td>                                                                                                                        
        </tr>
		<tr><td>
		<span style="font-size:11px; color:#3C0;">* <?php echo $text_export_note; ?> - <strong><?php echo strip_tags($text_export_order_list); ?></strong></span>  
		</td></tr>          
      </table>
      <table width="100%" cellspacing="0" cellpadding="3" style="background:#F0F0F0; border:1px solid #DDDDDD; margin-top:3px;">
        <tr>
          <td>
            &nbsp;<span style="font-size:11px; font-weight:bold;"><?php echo $text_pl_columns; ?></span><br />     
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop60" name="cop60" checked="checked" type="checkbox"><label for="cop60"><?php echo $column_prod_order_id; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop61" name="cop61" checked="checked" type="checkbox"><label for="cop61"><?php echo $column_prod_date_added; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop62" name="cop62" checked="checked" type="checkbox"><label for="cop62"><?php echo $column_prod_inv_no; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop63" name="cop63" checked="checked" type="checkbox"><label for="cop63"><?php echo $column_prod_id; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop64" name="cop64" checked="checked" type="checkbox"><label for="cop64"><?php echo $column_prod_sku; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop65" name="cop65" checked="checked" type="checkbox"><label for="cop65"><?php echo $column_prod_model; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop66" name="cop66" checked="checked" type="checkbox"><label for="cop66"><?php echo $column_prod_name; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop67" name="cop67" checked="checked" type="checkbox"><label for="cop67"><?php echo $column_prod_option; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop77" name="cop77" checked="checked" type="checkbox"><label for="cop77"><?php echo $column_prod_attributes; ?></label></div>            
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop68" name="cop68" checked="checked" type="checkbox"><label for="cop68"><?php echo $column_prod_manu; ?></label></div> 
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop79" name="cop79" checked="checked" type="checkbox"><label for="cop79"><?php echo $column_prod_category; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop69" name="cop69" checked="checked" type="checkbox"><label for="cop69"><?php echo $column_prod_currency; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop70" name="cop70" checked="checked" type="checkbox"><label for="cop70"><?php echo $column_prod_price; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop71" name="cop71" checked="checked" type="checkbox"><label for="cop71"><?php echo $column_prod_quantity; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop73" name="cop73" checked="checked" type="checkbox"><label for="cop73"><?php echo $column_prod_tax; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop72" name="cop72" checked="checked" type="checkbox"><label for="cop72"><?php echo $column_prod_total; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop74" name="cop74" checked="checked" type="checkbox"><label for="cop74"><?php echo $column_prod_costs; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop75" name="cop75" checked="checked" type="checkbox"><label for="cop75"><?php echo $column_prod_profit; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop76" name="cop76" checked="checked" type="checkbox"><label for="cop76"><?php echo $column_prod_profit; ?> [%]</label></div>
          </td>                                                                                                                        
        </tr>
		<tr><td>
		<span style="font-size:11px; color:#3C0;">* <?php echo $text_export_note; ?> - <strong><?php echo strip_tags($text_export_product_list); ?></strong></span>  
		</td></tr>          
      </table>
      <table width="100%" cellspacing="0" cellpadding="3" style="background:#F0F0F0; border:1px solid #DDDDDD; margin-top:3px;">
        <tr>
          <td>
            &nbsp;<span style="font-size:11px; font-weight:bold;"><?php echo $text_al_columns; ?></span><br />       
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop84" name="cop84" checked="checked" type="checkbox"><label for="cop84"><?php echo strip_tags($column_billing_name); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop85" name="cop85" checked="checked" type="checkbox"><label for="cop85"><?php echo strip_tags($column_billing_company); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop86" name="cop86" checked="checked" type="checkbox"><label for="cop86"><?php echo strip_tags($column_billing_address_1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop87" name="cop87" checked="checked" type="checkbox"><label for="cop87"><?php echo strip_tags($column_billing_address_2); ?></label></div>			
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop88" name="cop88" checked="checked" type="checkbox"><label for="cop88"><?php echo strip_tags($column_billing_city); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop89" name="cop89" checked="checked" type="checkbox"><label for="cop89"><?php echo strip_tags($column_billing_zone); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop90" name="cop90" checked="checked" type="checkbox"><label for="cop90"><?php echo strip_tags($column_billing_postcode); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop91" name="cop91" checked="checked" type="checkbox"><label for="cop91"><?php echo strip_tags($column_billing_country); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop93" name="cop93" checked="checked" type="checkbox"><label for="cop93"><?php echo strip_tags($column_shipping_name); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop94" name="cop94" checked="checked" type="checkbox"><label for="cop94"><?php echo strip_tags($column_shipping_company); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop95" name="cop95" checked="checked" type="checkbox"><label for="cop95"><?php echo strip_tags($column_shipping_address_1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop96" name="cop96" checked="checked" type="checkbox"><label for="cop96"><?php echo strip_tags($column_shipping_address_2); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop97" name="cop97" checked="checked" type="checkbox"><label for="cop97"><?php echo strip_tags($column_shipping_city); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop98" name="cop98" checked="checked" type="checkbox"><label for="cop98"><?php echo strip_tags($column_shipping_zone); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop99" name="cop99" checked="checked" type="checkbox"><label for="cop99"><?php echo strip_tags($column_shipping_postcode); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop100" name="cop100" checked="checked" type="checkbox"><label for="cop100"><?php echo strip_tags($column_shipping_country); ?></label></div>
          </td>                                                                                                                        
        </tr>
		<tr><td>
		<span style="font-size:11px; color:#3C0;">* <?php echo $text_export_note; ?> - <strong><?php echo strip_tags($text_export_address_list); ?></strong></span>  
		</td></tr>         
      </table>
      <table width="100%" cellspacing="0" cellpadding="3" style="background:#F0F0F0; border:1px solid #DDDDDD; margin-top:3px;">
        <tr>
          <td>
            &nbsp;<span style="font-size:11px; font-weight:bold;"><?php echo $text_all_columns; ?></span><br />
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1000" name="cop1000" checked="checked" type="checkbox"><label for="cop1000"><?php echo $column_order_inv_no; ?></label></div>            
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1001" name="cop1001" checked="checked" type="checkbox"><label for="cop1001"><?php echo $column_order_customer; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1002" name="cop1002" checked="checked" type="checkbox"><label for="cop1002"><?php echo $column_order_email; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1003" name="cop1003" checked="checked" type="checkbox"><label for="cop1003"><?php echo $column_order_customer_group; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1004" name="cop1004" checked="checked" type="checkbox"><label for="cop1004"><?php echo $column_prod_id; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1005" name="cop1005" checked="checked" type="checkbox"><label for="cop1005"><?php echo $column_prod_sku; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1006" name="cop1006" checked="checked" type="checkbox"><label for="cop1006"><?php echo $column_prod_model; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1007" name="cop1007" checked="checked" type="checkbox"><label for="cop1007"><?php echo $column_prod_name; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1008" name="cop1008" checked="checked" type="checkbox"><label for="cop1008"><?php echo $column_prod_option; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1009" name="cop1009" checked="checked" type="checkbox"><label for="cop1009"><?php echo $column_prod_attributes; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1010" name="cop1010" checked="checked" type="checkbox"><label for="cop1010"><?php echo $column_prod_manu; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1011" name="cop1011" checked="checked" type="checkbox"><label for="cop1011"><?php echo $column_prod_category; ?></label></div>            
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1012" name="cop1012" checked="checked" type="checkbox"><label for="cop1012"><?php echo $column_prod_currency; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1062" name="cop1062" checked="checked" type="checkbox"><label for="cop1062"><?php echo $column_order_quantity; ?></label></div>            
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1013" name="cop1013" checked="checked" type="checkbox"><label for="cop1013"><?php echo $column_prod_price; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1014" name="cop1014" checked="checked" type="checkbox"><label for="cop1014"><?php echo $column_prod_quantity; ?></label></div>            
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1015" name="cop1015" checked="checked" type="checkbox"><label for="cop1015"><?php echo $column_prod_tax; ?></label></div>            
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1016" name="cop1016" checked="checked" type="checkbox"><label for="cop1016"><?php echo $column_prod_total; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1017" name="cop1017" checked="checked" type="checkbox"><label for="cop1017"><?php echo $column_prod_costs; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1018" name="cop1018" checked="checked" type="checkbox"><label for="cop1018"><?php echo $column_prod_profit; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1019" name="cop1019" checked="checked" type="checkbox"><label for="cop1019"><?php echo $column_prod_profit; ?> [%]</label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1020" name="cop1020" checked="checked" type="checkbox"><label for="cop1020"><?php echo $column_order_sub_total; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1023" name="cop1023" checked="checked" type="checkbox"><label for="cop1023"><?php echo $column_order_shipping; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1027" name="cop1027" checked="checked" type="checkbox"><label for="cop1027"><?php echo $column_order_tax; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1031" name="cop1031" checked="checked" type="checkbox"><label for="cop1031"><?php echo $column_order_value; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1032" name="cop1032" checked="checked" type="checkbox"><label for="cop1032"><?php echo $column_order_sales; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1037" name="cop1037" checked="checked" type="checkbox"><label for="cop1037"><?php echo $column_order_costs; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1038" name="cop1038" checked="checked" type="checkbox"><label for="cop1038"><?php echo $column_order_profit; ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1039" name="cop1039" checked="checked" type="checkbox"><label for="cop1039"><?php echo $column_order_profit; ?> [%]</label></div>            
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1040" name="cop1040" checked="checked" type="checkbox"><label for="cop1040"><?php echo $column_order_shipping_method; ?></label></div>            
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1041" name="cop1041" checked="checked" type="checkbox"><label for="cop1041"><?php echo $column_order_payment_method; ?></label></div>            
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1042" name="cop1042" checked="checked" type="checkbox"><label for="cop1042"><?php echo $column_order_status; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1043" name="cop1043" checked="checked" type="checkbox"><label for="cop1043"><?php echo $column_order_store; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1044" name="cop1044" checked="checked" type="checkbox"><label for="cop1044"><?php echo $column_customer_cust_id; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1045" name="cop1045" checked="checked" type="checkbox"><label for="cop1045"><?php echo strip_tags($column_billing_name); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1046" name="cop1046" checked="checked" type="checkbox"><label for="cop1046"><?php echo strip_tags($column_billing_company); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1047" name="cop1047" checked="checked" type="checkbox"><label for="cop1047"><?php echo strip_tags($column_billing_address_1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1048" name="cop1048" checked="checked" type="checkbox"><label for="cop1048"><?php echo strip_tags($column_billing_address_2); ?></label></div>			
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1049" name="cop1049" checked="checked" type="checkbox"><label for="cop1049"><?php echo strip_tags($column_billing_city); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1050" name="cop1050" checked="checked" type="checkbox"><label for="cop1050"><?php echo strip_tags($column_billing_zone); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1051" name="cop1051" checked="checked" type="checkbox"><label for="cop1051"><?php echo strip_tags($column_billing_postcode); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1052" name="cop1052" checked="checked" type="checkbox"><label for="cop1052"><?php echo strip_tags($column_billing_country); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1053" name="cop1053" checked="checked" type="checkbox"><label for="cop1053"><?php echo $column_customer_telephone; ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1054" name="cop1054" checked="checked" type="checkbox"><label for="cop1054"><?php echo strip_tags($column_shipping_name); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1055" name="cop1055" checked="checked" type="checkbox"><label for="cop1055"><?php echo strip_tags($column_shipping_company); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1056" name="cop1056" checked="checked" type="checkbox"><label for="cop1056"><?php echo strip_tags($column_shipping_address_1); ?></label></div>
			<div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1057" name="cop1057" checked="checked" type="checkbox"><label for="cop1057"><?php echo strip_tags($column_shipping_address_2); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1058" name="cop1058" checked="checked" type="checkbox"><label for="cop1058"><?php echo strip_tags($column_shipping_city); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1059" name="cop1059" checked="checked" type="checkbox"><label for="cop1059"><?php echo strip_tags($column_shipping_zone); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1060" name="cop1060" checked="checked" type="checkbox"><label for="cop1060"><?php echo strip_tags($column_shipping_postcode); ?></label></div>
            <div style="float:left; padding-right:5px; margin:1px; border:thin dotted #666;"><input id="cop1061" name="cop1061" checked="checked" type="checkbox"><label for="cop1061"><?php echo strip_tags($column_shipping_country); ?></label></div>          
          </td>                                                                                                                        
        </tr>
		<tr><td>
		<span style="font-size:11px; color:#3C0;">* <?php echo $text_export_note; ?> - <strong><?php echo strip_tags($text_export_all_details); ?></strong></span>  
		</td></tr>         
      </table>     
	</td></tr>              
</table>     
</div>
</div> 
<script type="text/javascript">
jQuery("#settings").click(function() {					  
    var dlg = jQuery("#settings_window").dialog({
            title: '<?php echo $button_settings; ?>',
            width: 900,
            height: 600,
            modal: true,			
    });
	dlg.parent().appendTo(jQuery("#report"));
});
</script> 
<script type="text/javascript">
jQuery(document).ready(function() {
var $filter_range = jQuery('#filter_range'), $date_start = jQuery('#date-start'), $date_end = jQuery('#date-end');
$filter_range.change(function () {
    if ($filter_range.val() == 'custom') {
        $date_start.removeAttr('disabled');
        $date_end.removeAttr('disabled');
    } else {	
        $date_start.attr('disabled', 'disabled').val('');
        $date_end.attr('disabled', 'disabled').val('');
    }
}).trigger('change');
});
</script>    
<div style="background: #E7EFEF; border: 1px solid #C6D7D7; margin-bottom: 15px;">
	<table width="100%" cellspacing="0" cellpadding="3">
	<tr>
	<td>
	 <table cellspacing="0" cellpadding="0">
  	 <tr>
     <td align="right" style="background:#C6D7D7;">
	 <table border="0" cellspacing="0" cellpadding="0" style="background:#C6D7D7; border:2px solid #E7EFEF; padding:5px; margin-top:3px; margin-bottom:3px;">
	 <tr><td colspan="3" align="center"><span style="font-weight:bold; color:#333;"><?php echo $entry_order_created; ?></span></td></tr>
  	 <tr><td>
       <table cellpadding="0" cellspacing="0" style="padding-top:3px;">
       <tr><td><?php echo $entry_range; ?><br />    
            <select name="filter_range" id="filter_range" style="border:1px solid #999; margin-top:5px;">
              <?php foreach ($ranges as $range) { ?>
              <?php if ($range['value'] == $filter_range) { ?>
              <option value="<?php echo $range['value']; ?>" title="<?php echo $range['text']; ?>" style="<?php echo $range['style']; ?>" selected="selected"><?php echo $range['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $range['value']; ?>" title="<?php echo $range['text']; ?>" style="<?php echo $range['style']; ?>"><?php echo $range['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
       </td><td width="5"></td></tr></table>
     </td><td>      
       <table cellpadding="0" cellspacing="0" style="padding-top:3px;">
       <tr><td>&nbsp;<?php echo $entry_date_start; ?><br />
          <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" id="date-start" size="12" style="height:16px; border:solid 1px #BBB; margin-top:5px;" />
       </td><td width="5"></td></tr></table>
     </td><td>
       <table cellpadding="0" cellspacing="0" style="padding-top:3px;">
       <tr><td>&nbsp;<?php echo $entry_date_end; ?><br />
          <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" id="date-end" size="12" style="height:16px; border:solid 1px #BBB; margin-top:5px;" />
       </td><td></td></tr></table>
     </td></tr></table>  
     </td>
     
     <td align="center" style="background:#C6D7D7;">      
	 <table border="0" cellspacing="0" cellpadding="0" style="background:#C6D7D7; border:2px solid #E7EFEF; padding:5px; margin-top:3px; margin-bottom:3px;">
	 <tr><td colspan="3" align="center"><span style="font-weight:bold; color:#333;"><?php echo $entry_status_changed; ?></span></td></tr>
  	 <tr><td>
       <table cellpadding="0" cellspacing="0" style="padding-top:3px;">
       <tr><td>&nbsp;<?php echo $entry_date_start; ?><br />
          <input type="text" name="filter_status_date_start" value="<?php echo $filter_status_date_start; ?>" id="status-date-start" size="12" style="height:16px; border:solid 1px #BBB; margin-top:5px;" />
       </td><td width="5"></td></tr></table>
     </td><td> 
       <table cellpadding="0" cellspacing="0" style="padding-top:3px;">
       <tr><td>&nbsp;<?php echo $entry_date_end; ?><br />
          <input type="text" name="filter_status_date_end" value="<?php echo $filter_status_date_end; ?>" id="status-date-end" size="12" style="height:16px; border:solid 1px #BBB; margin-top:5px;" />
       </td><td width="5"></td></tr></table>
     </td><td> 
       <table cellpadding="0" cellspacing="0" style="padding-top:3px;">
       <tr><td><?php echo $entry_status; ?><br />
          <span <?php echo (!$filter_order_status_id) ? '' : 'class="vtip"' ?> title="<?php foreach ($order_statuses as $order_status) { ?><?php if (isset($filter_order_status_id[$order_status['order_status_id']])) { ?><?php echo $order_status['name']; ?><br /><?php } ?><?php } ?>">
          <select name="filter_order_status_id" id="filter_order_status_id" multiple="multiple" size="1">
            <?php foreach ($order_statuses as $order_status) { ?>
            <?php if (isset($filter_order_status_id[$order_status['order_status_id']])) { ?>
            <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span>
       </td></tr></table>
     </td></tr></table>
	 </td>
     <td align="left" style="background:#C6D7D7;">        
	 <table border="0" cellspacing="0" cellpadding="0" style="background:#C6D7D7; border:2px solid #E7EFEF; padding:5px; margin-top:3px; margin-bottom:3px;">
	 <tr><td colspan="2" align="center"><span style="font-weight:bold; color:#333;"><?php echo $entry_order_id; ?></span></td></tr>
  	 <tr><td>  
       <table cellpadding="0" cellspacing="0" style="padding-top:3px;">
       <tr><td>&nbsp;<?php echo $entry_order_id_from; ?><br />
          <input type="text" name="filter_order_id_from" value="<?php echo $filter_order_id_from; ?>" size="12" style="height:16px; border:solid 1px #BBB; margin-top:5px;" />
       </td><td width="5"></td></tr></table>
     </td><td> 
       <table cellpadding="0" cellspacing="0" style="padding-top:3px;">
       <tr><td>&nbsp;<?php echo $entry_order_id_to; ?><br />
          <input type="text" name="filter_order_id_to" value="<?php echo $filter_order_id_to; ?>" size="12" style="height:16px; border:solid 1px #BBB; margin-top:5px;" />
       </td><td></td></tr></table>
    </td></tr></table>
    </td></tr>
	<tr>
    <td colspan="3" valign="top" style="padding:5px;">  
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop2_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_store; ?></span><br />
          <span <?php echo (!$filter_store_id) ? '' : 'class="vtip"' ?> title="<?php foreach ($stores as $store) { ?><?php if (isset($filter_store_id[$store['store_id']])) { ?><?php echo $store['store_name']; ?><br /><?php } ?><?php } ?>">
          <select name="filter_store_id" id="filter_store_id" multiple="multiple" size="1">
            <?php foreach ($stores as $store) { ?>
            <?php if (isset($filter_store_id[$store['store_id']])) { ?>            
            <option value="<?php echo $store['store_id']; ?>" selected="selected"><?php echo $store['store_name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $store['store_id']; ?>"><?php echo $store['store_name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>    
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop3_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_currency; ?></span><br />
          <span <?php echo (!$filter_currency) ? '' : 'class="vtip"' ?> title="<?php foreach ($currencies as $currency) { ?><?php if (isset($filter_currency[$currency['currency_id']])) { ?><?php echo $currency['title']; ?> (<?php echo $currency['code']; ?>)<br /><?php } ?><?php } ?>">
          <select name="filter_currency" id="filter_currency" multiple="multiple" size="1">
            <?php foreach ($currencies as $currency) { ?>
            <?php if (isset($filter_currency[$currency['currency_id']])) { ?>
            <option value="<?php echo $currency['currency_id']; ?>" selected="selected"><?php echo $currency['title']; ?> (<?php echo $currency['code']; ?>)</option>
            <?php } else { ?>
            <option value="<?php echo $currency['currency_id']; ?>"><?php echo $currency['title']; ?> (<?php echo $currency['code']; ?>)</option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>          
	  </tr></table>
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop4a_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_tax; ?></span><br />
          <span <?php echo (!$filter_taxes) ? '' : 'class="vtip"' ?> title="<?php foreach ($taxes as $tax) { ?><?php if (isset($filter_taxes[$tax['tax']])) { ?><?php echo $tax['tax_title']; ?><br /><?php } ?><?php } ?>">
		  <select name="filter_taxes" id="filter_taxes" multiple="multiple" size="1">
            <?php foreach ($taxes as $tax) { ?>
            <?php if (isset($filter_taxes[$tax['tax']])) { ?>              
            <option value="<?php echo $tax['tax']; ?>" selected="selected"><?php echo $tax['tax_title']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $tax['tax']; ?>"><?php echo $tax['tax_title']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop4c_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_tax_classes; ?></span><br />
          <span <?php echo (!$filter_tax_classes) ? '' : 'class="vtip"' ?> title="<?php foreach ($tax_classes as $tax_class) { ?><?php if (isset($filter_tax_classes[$tax_class['tax_class']])) { ?><?php echo $tax_class['tax_class_title']; ?><br /><?php } ?><?php } ?>">
		  <select name="filter_tax_classes" id="filter_tax_classes" multiple="multiple" size="1">
            <?php foreach ($tax_classes as $tax_class) { ?>
            <?php if (isset($filter_tax_classes[$tax_class['tax_class']])) { ?>              
            <option value="<?php echo $tax_class['tax_class']; ?>" selected="selected"><?php echo $tax_class['tax_class_title']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $tax_class['tax_class']; ?>"><?php echo $tax_class['tax_class_title']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>      
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop4b_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_geo_zone; ?></span><br />
          <span <?php echo (!$filter_geo_zones) ? '' : 'class="vtip"' ?> title="<?php foreach ($geo_zones as $geo_zone) { ?><?php if (isset($filter_geo_zones[$geo_zone['geo_zone_country_id']])) { ?><?php echo $geo_zone['geo_zone_name']; ?><br /><?php } ?><?php } ?>">
		  <select name="filter_geo_zones" id="filter_geo_zones" multiple="multiple" size="1">
            <?php foreach ($geo_zones as $geo_zone) { ?>
            <?php if (isset($filter_geo_zones[$geo_zone['geo_zone_country_id']])) { ?>              
            <option value="<?php echo $geo_zone['geo_zone_country_id']; ?>" selected="selected"><?php echo $geo_zone['geo_zone_name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $geo_zone['geo_zone_country_id']; ?>"><?php echo $geo_zone['geo_zone_name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop5_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_customer_group; ?></span><br />
          <span <?php echo (!$filter_customer_group_id) ? '' : 'class="vtip"' ?> title="<?php foreach ($customer_groups as $customer_group) { ?><?php if (isset($filter_customer_group_id[$customer_group['customer_group_id']])) { ?><?php echo $customer_group['name']; ?><br /><?php } ?><?php } ?>">
          <select name="filter_customer_group_id" id="filter_customer_group_id" multiple="multiple" size="1">
            <?php foreach ($customer_groups as $customer_group) { ?>
            <?php if (isset($filter_customer_group_id[$customer_group['customer_group_id']])) { ?>              
            <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop6_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_customer_status; ?></span><br />
          <span <?php echo (!$filter_status) ? '' : 'class="vtip"' ?> title="<?php foreach ($statuses as $status) { ?><?php if (isset($filter_status[$status['status']]) && $status['status'] == 1) { ?><?php echo $text_enabled; ?><br /><?php } ?><?php if (isset($filter_status[$status['status']]) && $status['status'] == 0) { ?><?php echo $text_disabled; ?><br /><?php } ?><?php } ?>">         
          <select name="filter_status" id="filter_status" multiple="multiple" size="1">
            <?php foreach ($statuses as $status) { ?>
            <?php if (isset($filter_status[$status['status']]) && $status['status'] == 1) { ?>
            <option value="<?php echo $status['status']; ?>" selected="selected"><?php echo $text_enabled; ?></option>
            <?php } elseif (!isset($filter_status[$status['status']]) && $status['status'] == 1) { ?>
            <option value="<?php echo $status['status']; ?>"><?php echo $text_enabled; ?></option>
            <?php } ?>
            <?php if (isset($filter_status[$status['status']]) && $status['status'] == 0) { ?>
            <option value="<?php echo $status['status']; ?>" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } elseif (!isset($filter_status[$status['status']]) && $status['status'] == 0) { ?>
            <option value="<?php echo $status['status']; ?>"><?php echo $text_disabled; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>         
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop7_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_customer_name; ?></span><br />
        <input type="text" name="filter_customer_name" value="<?php echo $filter_customer_name; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
		</td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>  
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop8a_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_customer_email; ?></span><br />
        <input type="text" name="filter_customer_email" value="<?php echo $filter_customer_email; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>  
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop8b_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_customer_telephone; ?></span><br />
        <input type="text" name="filter_customer_telephone" value="<?php echo $filter_customer_telephone; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop8c_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_ip; ?></span><br />
        <input type="text" name="filter_ip" value="<?php echo $filter_ip; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>       
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop17a_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_payment_company; ?></span><br />
        <input type="text" name="filter_payment_company" value="<?php echo $filter_payment_company; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop17b_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_payment_address; ?></span><br />
        <input type="text" name="filter_payment_address" value="<?php echo $filter_payment_address; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop17c_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_payment_city; ?></span><br />
        <input type="text" name="filter_payment_city" value="<?php echo $filter_payment_city; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
		</td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop17d_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_payment_zone; ?></span><br />
        <input type="text" name="filter_payment_zone" value="<?php echo $filter_payment_zone; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
		</td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>  
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop17e_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_payment_postcode; ?></span><br />
        <input type="text" name="filter_payment_postcode" value="<?php echo $filter_payment_postcode; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop17f_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_payment_country; ?></span><br />
        <input type="text" name="filter_payment_country" value="<?php echo $filter_payment_country; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop13_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_payment_method; ?></span><br />
          <span <?php echo (!$filter_payment_method) ? '' : 'class="vtip"' ?> title="<?php foreach ($payment_methods as $payment_method) { ?><?php if (isset($filter_payment_method[$payment_method['payment_title']])) { ?><?php echo $payment_method['payment_name']; ?><br /><?php } ?><?php } ?>">
		  <select name="filter_payment_method" id="filter_payment_method" multiple="multiple" size="1">
            <?php foreach ($payment_methods as $payment_method) { ?>
            <?php if (isset($filter_payment_method[$payment_method['payment_title']])) { ?>              
            <option value="<?php echo $payment_method['payment_title']; ?>" selected="selected"><?php echo $payment_method['payment_name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $payment_method['payment_title']; ?>"><?php echo $payment_method['payment_name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>   
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop16a_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_shipping_company; ?></span><br />
        <input type="text" name="filter_shipping_company" value="<?php echo $filter_shipping_company; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop16b_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_shipping_address; ?></span><br />
        <input type="text" name="filter_shipping_address" value="<?php echo $filter_shipping_address; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop16c_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_shipping_city; ?></span><br />
        <input type="text" name="filter_shipping_city" value="<?php echo $filter_shipping_city; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop16d_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_shipping_zone; ?></span><br />
        <input type="text" name="filter_shipping_zone" value="<?php echo $filter_shipping_zone; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>                     
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop16e_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_shipping_postcode; ?></span><br />
        <input type="text" name="filter_shipping_postcode" value="<?php echo $filter_shipping_postcode; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop16f_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_shipping_country; ?></span><br />
        <input type="text" name="filter_shipping_country" value="<?php echo $filter_shipping_country; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>           
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop14_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_shipping_method; ?></span><br />
          <span <?php echo (!$filter_shipping_method) ? '' : 'class="vtip"' ?> title="<?php foreach ($shipping_methods as $shipping_method) { ?><?php if (isset($filter_shipping_method[$shipping_method['shipping_title']])) { ?><?php echo $shipping_method['shipping_name']; ?><br /><?php } ?><?php } ?>">
		  <select name="filter_shipping_method" id="filter_shipping_method" multiple="multiple" size="1">
            <?php foreach ($shipping_methods as $shipping_method) { ?>
            <?php if (isset($filter_shipping_method[$shipping_method['shipping_title']])) { ?>              
            <option value="<?php echo $shipping_method['shipping_title']; ?>" selected="selected"><?php echo $shipping_method['shipping_name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $shipping_method['shipping_title']; ?>"><?php echo $shipping_method['shipping_name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop9d_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_category; ?></span><br />
          <span <?php echo (!$filter_category) ? '' : 'class="vtip"' ?> title="<?php foreach ($categories as $category) { ?><?php if (isset($filter_category[$category['category_id']])) { ?><?php echo $category['name']; ?><br /><?php } ?><?php } ?>">
          <select name="filter_category" id="filter_category" multiple="multiple" size="1">
            <?php foreach ($categories as $category) { ?>
            <?php if (isset($filter_category[$category['category_id']])) { ?>               
            <option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option> 
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>                               
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop9e_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_manufacturer; ?></span><br />
          <span <?php echo (!$filter_manufacturer) ? '' : 'class="vtip"' ?> title="<?php foreach ($manufacturers as $manufacturer) { ?><?php if (isset($filter_manufacturer[$manufacturer['manufacturer_id']])) { ?> <?php echo $manufacturer['name']; ?><br /><?php } ?><?php } ?>">
          <select name="filter_manufacturer" id="filter_manufacturer" multiple="multiple" size="1">
            <?php foreach ($manufacturers as $manufacturer) { ?>
            <?php if (isset($filter_manufacturer[$manufacturer['manufacturer_id']])) { ?>               
            <option value="<?php echo $manufacturer['manufacturer_id']; ?>" selected="selected"><?php echo $manufacturer['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option> 
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>            
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop9a_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_sku; ?></span><br />
        <input type="text" name="filter_sku" value="<?php echo $filter_sku; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop9b_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_product; ?></span><br />
        <input type="text" name="filter_product_id" value="<?php echo $filter_product_id; ?>" size="40" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop9c_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_model; ?></span><br />
        <input type="text" name="filter_model" value="<?php echo $filter_model; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>  
	  <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop10_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_option; ?></span><br />
          <span <?php echo (!$filter_option) ? '' : 'class="vtip"' ?> title="<?php foreach ($product_options as $product_option) { ?><?php if (isset($filter_option[$product_option['options']])) { ?><?php echo $product_option['option_name']; ?>: <?php echo $product_option['option_value']; ?><br /><?php } ?><?php } ?>">        
          <select name="filter_option" id="filter_option" multiple="multiple" size="1">
            <?php foreach ($product_options as $product_option) { ?>
            <?php if (isset($filter_option[$product_option['options']])) { ?>              
            <option value="<?php echo $product_option['options']; ?>" selected="selected"><?php echo $product_option['option_name']; ?>: <?php echo $product_option['option_value']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $product_option['options']; ?>"><?php echo $product_option['option_name']; ?>: <?php echo $product_option['option_value']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>  
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop18_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_attributes; ?></span><br />
          <span <?php echo (!$filter_attribute) ? '' : 'class="vtip"' ?> title="<?php foreach ($attributes as $attribute) { ?><?php if (isset($filter_attribute[$attribute['attribute_title']])) { ?><?php echo $attribute['attribute_name']; ?><br /><?php } ?><?php } ?>">
		  <select name="filter_attribute" id="filter_attribute" multiple="multiple" size="1">
            <?php foreach ($attributes as $attribute) { ?>
            <?php if (isset($filter_attribute[$attribute['attribute_title']])) { ?>              
            <option value="<?php echo $attribute['attribute_title']; ?>" selected="selected"><?php echo $attribute['attribute_name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $attribute['attribute_title']; ?>"><?php echo $attribute['attribute_name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>                    
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop11_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_location; ?></span><br />
          <span <?php echo (!$filter_location) ? '' : 'class="vtip"' ?> title="<?php foreach ($locations as $location) { ?><?php if (isset($filter_location[$location['location_title']])) { ?><?php echo $location['location_name']; ?><br /><?php } ?><?php } ?>">
		  <select name="filter_location" id="filter_location" multiple="multiple" size="1">
            <?php foreach ($locations as $location) { ?>
            <?php if (isset($filter_location[$location['location_title']])) { ?>              
            <option value="<?php echo $location['location_title']; ?>" selected="selected"><?php echo $location['location_name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $location['location_title']; ?>"><?php echo $location['location_name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>
	  <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop12a_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_affiliate_name; ?></span><br />
          <span <?php echo (!$filter_affiliate_name) ? '' : 'class="vtip"' ?> title="<?php foreach ($affiliate_names as $affiliate_name) { ?><?php if (isset($filter_affiliate_name[$affiliate_name['affiliate_id']])) { ?><?php echo $affiliate_name['affiliate_name']; ?><br /><?php } ?><?php } ?>">        
          <select name="filter_affiliate_name" id="filter_affiliate_name" multiple="multiple" size="1">
            <?php foreach ($affiliate_names as $affiliate_name) { ?>
            <?php if (isset($filter_affiliate_name[$affiliate_name['affiliate_id']])) { ?>              
            <option value="<?php echo $affiliate_name['affiliate_id']; ?>" selected="selected"><?php echo $affiliate_name['affiliate_name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $affiliate_name['affiliate_id']; ?>"><?php echo $affiliate_name['affiliate_name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>
	  <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop12b_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_affiliate_email; ?></span><br />
          <span <?php echo (!$filter_affiliate_email) ? '' : 'class="vtip"' ?> title="<?php foreach ($affiliate_emails as $affiliate_email) { ?><?php if (isset($filter_affiliate_email[$affiliate_email['affiliate_id']])) { ?><?php echo $affiliate_email['affiliate_email']; ?><br /><?php } ?><?php } ?>">
          <select name="filter_affiliate_email" id="filter_affiliate_email" multiple="multiple" size="1">
            <?php foreach ($affiliate_emails as $affiliate_email) { ?>
            <?php if (isset($filter_affiliate_email[$affiliate_email['affiliate_id']])) { ?>              
            <option value="<?php echo $affiliate_email['affiliate_id']; ?>" selected="selected"><?php echo $affiliate_email['affiliate_email']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $affiliate_email['affiliate_id']; ?>"><?php echo $affiliate_email['affiliate_email']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>
	  <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop15a_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_coupon_name; ?></span><br />
          <span <?php echo (!$filter_coupon_name) ? '' : 'class="vtip"' ?> title="<?php foreach ($coupon_names as $coupon_name) { ?><?php if (isset($filter_coupon_name[$coupon_name['coupon_id']])) { ?><?php echo $coupon_name['coupon_name']; ?><br /><?php } ?><?php } ?>">        
          <select name="filter_coupon_name" id="filter_coupon_name" multiple="multiple" size="1">
            <?php foreach ($coupon_names as $coupon_name) { ?>
            <?php if (isset($filter_coupon_name[$coupon_name['coupon_id']])) { ?>              
            <option value="<?php echo $coupon_name['coupon_id']; ?>" selected="selected"><?php echo $coupon_name['coupon_name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $coupon_name['coupon_id']; ?>"><?php echo $coupon_name['coupon_name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop15b_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_coupon_code; ?></span><br />
        <input type="text" name="filter_coupon_code" value="<?php echo $filter_coupon_code; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>  
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="cop19_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_voucher_code; ?></span><br />
        <input type="text" name="filter_voucher_code" value="<?php echo $filter_voucher_code; ?>" size="20" style="margin-top:4px; height:16px; border:solid 1px #BBB; color:#F90;" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>  
	   </td>
	  </tr>
	 </table>
	</td>
	</tr>
	</table>      
</div>
<script type="text/javascript">jQuery(function(){ 
jQuery('#show_tab_export').click(function() {
		jQuery('#tab_export').slideToggle('fast');
	});
});
</script>    
  <div id="tab_export" style="background:#E7EFEF; border:1px solid #C6D7D7; padding:3px; margin-bottom:15px; display:none">
      <table width="100%" cellspacing="0" cellpadding="3">
        <tr>
          <td width="10%">&nbsp;</td>
          <td width="16%" align="center" nowrap="nowrap"><span id="export_xls" class="export_item"><img src="view/image/adv_reports/XLS.png" width="48" height="48" border="0" title="XLS" /></span><span id="export_html" class="export_item"><img src="view/image/adv_reports/HTML.png" width="48" height="48" border="0" title="HTML" /></span><span id="export_pdf" class="export_item"><img src="view/image/adv_reports/PDF.png" width="48" height="48" border="0" title="PDF" /></span></td>
          <td width="16%" align="center" nowrap="nowrap"><span id="export_xls_order_list" class="export_item"><img src="view/image/adv_reports/XLS.png" width="48" height="48" border="0" title="XLS" /></span><span id="export_html_order_list" class="export_item"><img src="view/image/adv_reports/HTML.png" width="48" height="48" border="0" title="HTML" /></span><span id="export_pdf_order_list" class="export_item"><img src="view/image/adv_reports/PDF.png" width="48" height="48" border="0" title="PDF" /></span></td>
          <td width="16%" align="center" nowrap="nowrap"><span id="export_xls_product_list" class="export_item"><img src="view/image/adv_reports/XLS.png" width="48" height="48" border="0" title="XLS" /></span><span id="export_html_product_list" class="export_item"><img src="view/image/adv_reports/HTML.png" width="48" height="48" border="0" title="HTML" /></span><span id="export_pdf_product_list" class="export_item"><img src="view/image/adv_reports/PDF.png" width="48" height="48" border="0" title="PDF" /></span></td>
          <td width="16%" align="center" nowrap="nowrap"><span id="export_xls_address_list" class="export_item"><img src="view/image/adv_reports/XLS.png" width="48" height="48" border="0" title="XLS" /></span><span id="export_html_address_list" class="export_item"><img src="view/image/adv_reports/HTML.png" width="48" height="48" border="0" title="HTML" /></span><span id="export_pdf_address_list" class="export_item"><img src="view/image/adv_reports/PDF.png" width="48" height="48" border="0" title="PDF" /></span></td>
          <td width="16%" align="center" nowrap="nowrap"><span id="export_xls_all_details" class="export_item"><img src="view/image/adv_reports/XLS.png" width="48" height="48" border="0" title="XLS" /></span><span id="export_html_all_details" class="export_item"><img src="view/image/adv_reports/HTML.png" width="48" height="48" border="0" title="HTML" /></span><span id="export_pdf_all_details" class="export_item"><img src="view/image/adv_reports/PDF.png" width="48" height="48" border="0" title="PDF" /></span></td>
          <td width="10%">&nbsp;</td>
        </tr>
        <tr>
          <td width="10%">&nbsp;</td>
          <td width="16%" align="center" nowrap="nowrap"><?php echo $text_export_no_details; ?></td>
          <td width="16%" align="center" nowrap="nowrap"><?php echo $text_export_order_list; ?></td>
          <td width="16%" align="center" nowrap="nowrap"><?php echo $text_export_product_list; ?></td>
          <td width="16%" align="center" nowrap="nowrap"><?php echo $text_export_address_list; ?></td>
          <td width="16%" align="center" nowrap="nowrap"><?php echo $text_export_all_details; ?></td>
          <td width="10%">&nbsp;</td>                                                                                                                       
        </tr>
        <tr>
          <td colspan="6">*<span style="font-size:10px"><?php echo $text_export_notice1; ?> 
          <?php if (defined('_JEXEC')) { ?>
          <a href="/opencart/admin/view/template/module/adv_reports/adv_requirements_limitations.htm" id="adv_export_limit">
          <?php } else { ?>
          <a href="view/template/module/adv_reports/adv_requirements_limitations.htm" id="adv_export_limit">
          <?php } ?> 
          <strong><?php echo $text_export_limit; ?></strong></a> <?php echo $text_export_notice2; ?></span></td>
        </tr>        
      </table>
  <input type="hidden" id="export" name="export" value="" />
<div id="adv_export_limit_text" style="display:none"></div>
<script type="text/javascript">
jQuery("#adv_export_limit").click(function(e) {
    e.preventDefault();
    jQuery("#adv_export_limit_text").load(this.href, function() {
        jQuery(this).dialog({
            title: '<?php echo $text_export_limit; ?>',
            width:  800,
            height:  600,
            minWidth:  500,
            minHeight:  400,
            modal: true,
        });
    });
    return false;
});
</script>   
  </div> 
<?php if ($customers) { ?>
<?php if (($filter_range != 'all_time' && $filter_details != '4' && ($filter_group == 'year' or $filter_group == 'quarter' or $filter_group == 'month')) or ($filter_range == 'all_time' && $filter_group == 'year')) { ?>      
<script type="text/javascript">jQuery(function(){ 
jQuery('#show_tab_chart').click(function() {
		jQuery('#tab_chart').slideToggle('slow');
	});
});
</script>  
    <div id="tab_chart">
      <table align="center" cellspacing="0" cellpadding="3">
        <tr>
          <td><div style="float:left;" id="chart1_div"></div><div style="float:left;" id="chart2_div"></div></td>
        </tr>
      </table>
    </div>
<?php } ?> 
<?php } ?>     
	<?php if (strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE') !== false) { ?>
    <div id="pagination_content" style="overflow:scroll; padding:1px;"> 
    <?php } else { ?>
    <div id="pagination_content" style="overflow:auto; padding:1px;">     
    <?php } ?>
<?php if ($filter_details == 4) { ?>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">    
	<tr>
    <td> 
	<?php if ($customers) { ?>
	<?php foreach ($customers as $customer) { ?>
    <?php if ($customer['product_pidc']) { ?>    
		<table class="list_detail" id="element" style="border-bottom:2px solid #999; border-top:2px solid #999;">
		<thead>
		<tr>
          <td class="left" nowrap="nowrap"><?php echo $column_order_order_id; ?></td>        
          <td class="left" nowrap="nowrap"><?php echo $column_order_date_added; ?></td>
          <td id="cop1000_<?php echo $order['order_id']; ?>_title" class="left"><?php echo $column_order_inv_no; ?></td>               
          <td id="cop1001_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_order_customer; ?></td>
          <td id="cop1002_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_order_email; ?></td>
          <td id="cop1003_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_order_customer_group; ?></td>
          <td id="cop1040_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_order_shipping_method; ?></td>
          <td id="cop1041_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_order_payment_method; ?></td>          
          <td id="cop1042_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_order_status; ?></td>
          <td id="cop1043_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_order_store; ?></td>
          <td id="cop1012_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_order_currency; ?></td>
          <td id="cop1062_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_order_quantity; ?></td>  
          <td id="cop1020_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_order_sub_total; ?></td>                               
          <td id="cop1023_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_order_shipping; ?></td>         
          <td id="cop1027_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_order_tax; ?></td>
          <td id="cop1031_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_order_value; ?></td>  
          <td id="cop1032_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_order_sales; ?></td>                    
          <td id="cop1037_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_order_costs; ?></td> 
          <td id="cop1038_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_order_profit; ?></td>
          <td id="cop1039_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_profit_margin; ?></td>        
		</tr>
		</thead>
        <tbody>
		<tr bgcolor="#FFFFFF">
          <td class="left" nowrap="nowrap"><a><?php echo $customer['order_ord_id']; ?></a></td>        
          <td class="left" nowrap="nowrap"><?php echo $customer['order_order_date']; ?></td>
          <td id="cop1000_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_inv_no']; ?></td>
          <td id="cop1001_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_name']; ?></td>
          <td id="cop1002_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_email']; ?></td>
          <td id="cop1003_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_group']; ?></td>
          <td id="cop1040_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_shipping_method']; ?></td>
          <td id="cop1041_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_payment_method']; ?></td>          
          <td id="cop1042_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_status']; ?></td>
          <td id="cop1043_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_store']; ?></td> 
          <td id="cop1012_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_currency']; ?></td>          
          <td id="cop1062_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_products']; ?></td> 
          <td id="cop1020_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_sub_total']; ?></td>                    
          <td id="cop1023_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_shipping']; ?></td>           
          <td id="cop1027_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_tax']; ?></td>                              
          <td id="cop1031_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_value']; ?></td>
          <td id="cop1032_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#DCFFB9;"><?php echo $customer['order_sales']; ?></td>           
          <td id="cop1037_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#ffd7d7;">-<?php echo $customer['order_costs']; ?></td>
          <td id="cop1038_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#c4d9ee; font-weight:bold;"><?php echo $customer['order_profit']; ?></td> 
          <td id="cop1039_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#c4d9ee; font-weight:bold;"><?php echo $customer['order_profit_margin_percent']; ?>%</td>      
		</tr>  
		<tr>
		<td colspan="2"></td> 
		<td colspan="18">
		  <table class="list_detail">
          <thead>
          <tr>
          <td id="cop1004_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_prod_id; ?></td>                                          
		  <td id="cop1005_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_prod_sku; ?></td>
		  <td id="cop1006_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_prod_model; ?></td>            
          <td id="cop1007_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_prod_name; ?></td> 
          <td id="cop1008_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_prod_option; ?></td>           
          <td id="cop1009_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_prod_attributes; ?></td>                      
          <td id="cop1010_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_prod_manu; ?></td> 
          <td id="cop1011_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_prod_category; ?></td>           
          <td id="cop1013_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_prod_price; ?></td>                     
          <td id="cop1014_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_prod_quantity; ?></td>
          <td id="cop1015_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_prod_tax; ?></td>           
          <td id="cop1016_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_prod_total; ?></td>        
          <td id="cop1017_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_prod_costs; ?></td>           
          <td id="cop1018_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_prod_profit; ?></td>
          <td id="cop1019_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_profit_margin; ?></td>  
          </tr>
          </thead>
          <tr bgcolor="#FFFFFF">
          <td id="cop1004_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_pid']; ?></td>  
          <td id="cop1005_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_sku']; ?></td>
          <td id="cop1006_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_model']; ?></td>                 
          <td id="cop1007_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_name']; ?></td> 
          <td id="cop1008_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_option']; ?></td>            
          <td id="cop1009_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_attributes']; ?></td>                    
          <td id="cop1010_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_manu']; ?></td> 
          <td id="cop1011_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_category']; ?></td> 
          <td id="cop1013_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['product_price']; ?></td> 
          <td id="cop1014_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['product_quantity']; ?></td>
          <td id="cop1015_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['product_tax']; ?></td>            
          <td id="cop1016_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#DCFFB9;"><?php echo $customer['product_total']; ?></td>        
          <td id="cop1017_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#ffd7d7;">-<?php echo $customer['product_costs']; ?></td>         
          <td id="cop1018_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#c4d9ee; font-weight:bold;"><?php echo $customer['product_profit']; ?></td>
          <td id="cop1019_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#c4d9ee; font-weight:bold;"><?php echo $customer['product_profit_margin_percent']; ?>%</td>  
          </tr>                  
	      </table>
          <table class="list_detail">
          <thead>
          <tr>
          <td id="cop1044_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_customer_cust_id; ?></td>           
          <td id="cop1045_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_billing_name; ?></td> 
          <td id="cop1046_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_billing_company; ?></td> 
          <td id="cop1047_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_billing_address_1; ?></td> 
          <td id="cop1048_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_billing_address_2; ?></td> 
          <td id="cop1049_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_billing_city; ?></td>
          <td id="cop1050_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_billing_zone; ?></td> 
          <td id="cop1051_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_billing_postcode; ?></td>
          <td id="cop1052_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_billing_country; ?></td>
          <td id="cop1053_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_customer_telephone; ?></td>
          <td id="cop1054_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_shipping_name; ?></td> 
          <td id="cop1055_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_shipping_company; ?></td> 
          <td id="cop1056_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_shipping_address_1; ?></td> 
          <td id="cop1057_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_shipping_address_2; ?></td> 
          <td id="cop1058_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_shipping_city; ?></td>
          <td id="cop1059_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_shipping_zone; ?></td> 
          <td id="cop1060_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_shipping_postcode; ?></td>
          <td id="cop1061_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_shipping_country; ?></td>    
          </tr>
          </thead>
          <tr bgcolor="#FFFFFF">
          <td id="cop1044_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['customer_cust_id']; ?></td>             
          <td id="cop1045_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_name']; ?></td>         
          <td id="cop1046_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_company']; ?></td> 
          <td id="cop1047_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_address_1']; ?></td> 
          <td id="cop1048_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_address_2']; ?></td> 
          <td id="cop1049_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_city']; ?></td> 
          <td id="cop1050_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_zone']; ?></td> 
          <td id="cop1051_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_postcode']; ?></td>                    
          <td id="cop1052_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_country']; ?></td>
          <td id="cop1053_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['customer_telephone']; ?></td> 
          <td id="cop1054_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_name']; ?></td>         
          <td id="cop1055_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_company']; ?></td> 
          <td id="cop1056_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_address_1']; ?></td> 
          <td id="cop1057_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_address_2']; ?></td> 
          <td id="cop1058_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_city']; ?></td> 
          <td id="cop1059_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_zone']; ?></td> 
          <td id="cop1060_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_postcode']; ?></td>                    
          <td id="cop1061_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_country']; ?></td>  
          </tr>                  
	      </table>            
		</td>               
		</tr> 
        </tbody>
		</table>                
	<?php } ?>
	<?php } ?>
	<?php } else { ?>
		<table width="100%">    
		<tr>
		<td align="center"><?php echo $text_no_results; ?></td>
		</tr>
        </table>          
	<?php } ?>     
    </td></tr>
    </table>
<br />     
<?php } ?>
<?php if ($filter_details != '4') { ?>
      <table class="list_main">
        <thead>
          <tr>
		  <?php if ($filter_group == 'year') { ?>           
          <td class="left" colspan="2" nowrap="nowrap"><?php echo $column_year; ?></td>
		  <?php } elseif ($filter_group == 'quarter') { ?> 
          <td class="left" nowrap="nowrap"><?php echo $column_year; ?></td>
          <td class="left" nowrap="nowrap"><?php echo $column_quarter; ?></td>       
		  <?php } elseif ($filter_group == 'month') { ?> 
          <td class="left" nowrap="nowrap"><?php echo $column_year; ?></td>
          <td class="left" nowrap="nowrap"><?php echo $column_month; ?></td>
		  <?php } elseif ($filter_group == 'day') { ?> 
          <td class="left" colspan="2" nowrap="nowrap"><?php echo $column_date; ?></td>  
		  <?php } elseif ($filter_group == 'order') { ?> 
          <td class="left" nowrap="nowrap"><?php echo $column_order_order_id; ?></td>
          <td class="left" nowrap="nowrap"><?php echo $column_order_date_added; ?></td>                     
		  <?php } else { ?>    
          <td class="left" width="70" nowrap="nowrap"><?php echo $column_date_start; ?></td>
          <td class="left" width="70" nowrap="nowrap"><?php echo $column_date_end; ?></td>           
		  <?php } ?> 
          <td id="cop20_title" class="right"><?php echo $column_id; ?></td>
          <td id="cop21_title" class="left"><?php echo $column_customer; ?> / <?php echo $column_company; ?></td>         
          <td id="cop22_title" class="left"><?php echo $column_email; ?></td>
          <td id="cop35_title" class="left"><?php echo $column_telephone; ?></td>          
          <td id="cop34_title" class="left"><?php echo $column_country; ?></td>           
          <td id="cop23_title" class="left"><?php echo $column_customer_group; ?></td> 
          <td id="cop24_title" class="left"><?php echo $column_status; ?></td>  
          <td id="cop25_title" class="left"><?php echo $column_ip; ?></td>           
          <td id="cop26_title" class="left"><?php echo $column_mostrecent; ?></td>          
          <td id="cop27_title" class="right"><?php echo $column_orders; ?></td> 
          <td id="cop28_title" class="right"><?php echo $column_products; ?></td>                          
          <td id="cop30_title" class="right"><?php echo $column_value; ?></td>
          <td id="cop29_title" class="right"><?php echo $column_total_sales; ?></td>           
          <td id="cop31_title" class="right"><?php echo $column_total_costs; ?></td>            
          <td id="cop32_title" class="right"><?php echo $column_total_profit; ?></td>
          <td id="cop33_title" class="right"><?php echo $column_profit_margin; ?></td>          
          <?php if ($filter_details == 1 OR $filter_details == 2 OR $filter_details == 3) { ?><td class="right" nowrap="nowrap"><?php echo $column_action; ?></td><?php } ?>
          </tr>
      	  </thead>
          <?php if ($customers) { ?>
          <?php foreach ($customers as $customer) { ?>
      	  <tbody id="element">
          <tr <?php echo ($filter_details == 1 OR $filter_details == 2 OR $filter_details == 3) ? 'style="cursor:pointer;" title="' . $text_detail . '"' : '' ?> id="show_details_<?php echo $customer['order_id']; ?>">
		  <?php if ($filter_group == 'year') { ?>           
          <td class="left" colspan="2" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['year']; ?></td>
		  <?php } elseif ($filter_group == 'quarter') { ?> 
          <td class="left" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['year']; ?></td>
          <td class="left" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['quarter']; ?></td>  
		  <?php } elseif ($filter_group == 'month') { ?> 
          <td class="left" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['year']; ?></td>
          <td class="left" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['month']; ?></td>
		  <?php } elseif ($filter_group == 'day') { ?> 
          <td class="left" colspan="2" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['date_start']; ?></td>    
		  <?php } elseif ($filter_group == 'order') { ?> 
          <td class="left" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['order_id']; ?></td>
          <td class="left" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['date_start']; ?></td>
		  <?php } else { ?>    
          <td class="left" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['date_start']; ?></td>
          <td class="left" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['date_end']; ?></td>         
		  <?php } ?>  
	  	  <td id="cop20_<?php echo $customer['order_id']; ?>" class="right">
          <?php if ($customer['customer_id'] == 0) { ?>
          <?php echo $text_guest; ?>          
          <?php } else { ?>
          <?php echo $customer['customer_id']; ?>
          <?php } ?></td>           
	  	  <td id="cop21_<?php echo $customer['order_id']; ?>" class="left">
          <?php if ($customer['customer_id'] == 0) { ?>
          <?php echo $customer['cust_name']; ?>
          <br /><?php echo $customer['cust_company']; ?>
          <?php } else { ?>
          <a href="<?php echo $customer['href']; ?>"><?php echo $customer['cust_name']; ?></a>
          <br /><?php echo $customer['cust_company']; ?>
          <?php } ?></td>
      	  <td id="cop22_<?php echo $customer['order_id']; ?>" class="left"><?php echo $customer['cust_email']; ?></td> 
      	  <td id="cop35_<?php echo $customer['order_id']; ?>" class="left"><?php echo $customer['cust_telephone']; ?></td>           
      	  <td id="cop34_<?php echo $customer['order_id']; ?>" class="left"><?php echo $customer['cust_country']; ?></td>           
	  	  <td id="cop23_<?php echo $customer['order_id']; ?>" class="left">
          <?php if ($customer['customer_id'] == 0) { ?>
          <?php echo $customer['cust_group_guest']; ?>         
          <?php } else { ?>
          <?php echo $customer['cust_group_reg']; ?>
          <?php } ?></td>                                
          <td id="cop24_<?php echo $customer['order_id']; ?>" class="left"><?php if (!$customer['customer_id'] == 0) { ?><?php echo $customer['cust_status']; ?><?php } ?></td>
      	  <td id="cop25_<?php echo $customer['order_id']; ?>" class="left"><?php echo $customer['cust_ip']; ?></td>            
          <td id="cop26_<?php echo $customer['order_id']; ?>" class="left"><?php echo $customer['mostrecent']; ?></td>          
          <td id="cop27_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['orders']; ?></td>
          <td id="cop28_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['products']; ?></td>                 
          <td id="cop30_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['value']; ?></td>
          <td id="cop29_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#DCFFB9;"><?php echo $customer['total_sales']; ?></td>             
          <td id="cop31_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#ffd7d7;"><?php echo $customer['total_costs']; ?></td>          
          <td id="cop32_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#c4d9ee; font-weight:bold;"><?php echo $customer['total_profit']; ?></td>
          <td id="cop33_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#c4d9ee; font-weight:bold;"><?php echo $customer['profit_margin_percent']; ?></td>          
          <?php if ($filter_details == 1 OR $filter_details == 2 OR $filter_details == 3) { ?><td class="right" nowrap="nowrap">[ <a><?php echo $text_detail; ?></a> ]</td><?php } ?>
          </tr>
<tr class="detail">         
<td colspan="19" class="center">
<?php if ($filter_details == 1) { ?> 
<script type="text/javascript">jQuery(function(){ 
jQuery('#show_details_<?php echo $customer["order_id"]; ?>').click(function() {
		jQuery('#tab_details_<?php echo $customer["order_id"]; ?>').slideToggle('slow');
	});
});
</script>
<div id="tab_details_<?php echo $customer['order_id']; ?>" style="display:none">
    <table class="list_detail">
      <thead>
        <tr>
          <td id="cop40_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_order_id; ?></td>        
          <td id="cop41_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_date_added; ?></td>
          <td id="cop42_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_inv_no; ?></td>                  
          <td id="cop43_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_customer; ?></td>
          <td id="cop44_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_email; ?></td>
          <td id="cop45_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_customer_group; ?></td>
          <td id="cop46_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_shipping_method; ?></td>
          <td id="cop47_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_payment_method; ?></td>          
          <td id="cop48_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_status; ?></td>
          <td id="cop49_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_store; ?></td>
          <td id="cop50_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_order_currency; ?></td>
          <td id="cop51_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_order_quantity; ?></td>  
          <td id="cop52_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_order_sub_total; ?></td>                               
          <td id="cop54_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_order_shipping; ?></td>         
          <td id="cop55_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_order_tax; ?></td>
          <td id="cop56_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_order_value; ?></td>  
          <td id="cop53_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_order_sales; ?></td>                    
          <td id="cop57_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_order_costs; ?></td> 
          <td id="cop58_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_order_profit; ?></td>
          <td id="cop59_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_profit_margin; ?></td>         
        </tr>
      </thead>
        <tr bgcolor="#FFFFFF">
          <td id="cop40_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><a><?php echo $customer['order_ord_id']; ?></a></td>        
          <td id="cop41_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_order_date']; ?></td>
          <td id="cop42_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_inv_no']; ?></td>
          <td id="cop43_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_name']; ?></td>
          <td id="cop44_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_email']; ?></td>
          <td id="cop45_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_group']; ?></td>
          <td id="cop46_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_shipping_method']; ?></td>
          <td id="cop47_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_payment_method']; ?></td>          
          <td id="cop48_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_status']; ?></td>
          <td id="cop49_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_store']; ?></td> 
          <td id="cop50_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_currency']; ?></td>          
          <td id="cop51_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_products']; ?></td> 
          <td id="cop52_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_sub_total']; ?></td>                    
          <td id="cop54_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_shipping']; ?></td>           
          <td id="cop55_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_tax']; ?></td>                              
          <td id="cop56_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_value']; ?></td>
          <td id="cop53_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#DCFFB9;"><?php echo $customer['order_sales']; ?></td>           
          <td id="cop57_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#ffd7d7;">-<?php echo $customer['order_costs']; ?></td>
          <td id="cop58_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#c4d9ee; font-weight:bold;"><?php echo $customer['order_profit']; ?></td> 
          <td id="cop59_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#c4d9ee; font-weight:bold;"><?php echo $customer['order_profit_margin_percent']; ?>%</td>      
         </tr>
    </table>
</div>  
<?php } ?> 
<?php if ($filter_details == 2) { ?>
<script type="text/javascript">jQuery(function(){ 
jQuery('#show_details_<?php echo $customer["order_id"]; ?>').click(function() {
		jQuery('#tab_details_<?php echo $customer["order_id"]; ?>').slideToggle('slow');
	});
});
</script>
<div id="tab_details_<?php echo $customer['order_id']; ?>" style="display:none">
    <table class="list_detail">
      <thead>
        <tr>
          <td id="cop60_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_order_id; ?></td>  
          <td id="cop61_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_date_added; ?></td>
          <td id="cop62_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_inv_no; ?></td> 
          <td id="cop63_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_id; ?></td>                                          
          <td id="cop64_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_sku; ?></td>
          <td id="cop65_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_model; ?></td>            
          <td id="cop66_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_name; ?></td> 
          <td id="cop67_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_option; ?></td>           
          <td id="cop77_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_attributes; ?></td>                      
          <td id="cop68_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_manu; ?></td> 
          <td id="cop79_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_category; ?></td>           
          <td id="cop69_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_prod_currency; ?></td>   
          <td id="cop70_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_prod_price; ?></td>                     
          <td id="cop71_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_prod_quantity; ?></td>           
          <td id="cop73_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_prod_tax; ?></td>                   
          <td id="cop72_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_prod_total; ?></td>                     
          <td id="cop74_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_prod_costs; ?></td>           
          <td id="cop75_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_prod_profit; ?></td>
          <td id="cop76_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_profit_margin; ?></td>  
        </tr>
      </thead>
        <tr bgcolor="#FFFFFF">
          <td id="cop60_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><a><?php echo $customer['product_ord_id']; ?></a></td>  
          <td id="cop61_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_order_date']; ?></td>
          <td id="cop62_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_inv_no']; ?></td>
          <td id="cop63_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_pid']; ?></td>  
          <td id="cop64_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_sku']; ?></td>
          <td id="cop65_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_model']; ?></td>                 
          <td id="cop66_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_name']; ?></td> 
          <td id="cop67_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_option']; ?></td>            
          <td id="cop77_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_attributes']; ?></td>                    
          <td id="cop68_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_manu']; ?></td> 
          <td id="cop79_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_category']; ?></td>           
          <td id="cop69_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['product_currency']; ?></td> 
          <td id="cop70_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['product_price']; ?></td> 
          <td id="cop71_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['product_quantity']; ?></td> 
          <td id="cop73_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['product_tax']; ?></td>            
          <td id="cop72_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#DCFFB9;"><?php echo $customer['product_total']; ?></td>                      
          <td id="cop74_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#ffd7d7;">-<?php echo $customer['product_costs']; ?></td>         
          <td id="cop75_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#c4d9ee; font-weight:bold;"><?php echo $customer['product_profit']; ?></td>
          <td id="cop76_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap" style="background-color:#c4d9ee; font-weight:bold;"><?php echo $customer['product_profit_margin_percent']; ?>%</td>   
         </tr>       
    </table>
</div> 
<?php } ?>  
<?php if ($filter_details == 3) { ?>
<script type="text/javascript">jQuery(function(){ 
jQuery('#show_details_<?php echo $customer["order_id"]; ?>').click(function() {
		jQuery('#tab_details_<?php echo $customer["order_id"]; ?>').slideToggle('slow');
	});
});
</script>
<div id="tab_details_<?php echo $customer['order_id']; ?>" style="display:none">
    <table class="list_detail">
      <thead>
        <tr>       
          <td id="cop84_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_billing_name; ?></td> 
          <td id="cop85_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_billing_company; ?></td> 
          <td id="cop86_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_billing_address_1; ?></td> 
          <td id="cop87_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_billing_address_2; ?></td> 
          <td id="cop88_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_billing_city; ?></td>
          <td id="cop89_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_billing_zone; ?></td> 
          <td id="cop90_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_billing_postcode; ?></td>
          <td id="cop91_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_billing_country; ?></td>
          <td id="cop93_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_shipping_name; ?></td> 
          <td id="cop94_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_shipping_company; ?></td> 
          <td id="cop95_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_shipping_address_1; ?></td> 
          <td id="cop96_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_shipping_address_2; ?></td> 
          <td id="cop97_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_shipping_city; ?></td>
          <td id="cop98_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_shipping_zone; ?></td> 
          <td id="cop99_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_shipping_postcode; ?></td>
          <td id="cop100_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_shipping_country; ?></td>          
        </tr>
      </thead>
        <tr bgcolor="#FFFFFF">           
          <td id="cop84_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_name']; ?></td>         
          <td id="cop85_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_company']; ?></td> 
          <td id="cop86_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_address_1']; ?></td> 
          <td id="cop87_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_address_2']; ?></td> 
          <td id="cop88_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_city']; ?></td> 
          <td id="cop89_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_zone']; ?></td> 
          <td id="cop90_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_postcode']; ?></td>                    
          <td id="cop91_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_country']; ?></td>
          <td id="cop93_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_name']; ?></td>         
          <td id="cop94_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_company']; ?></td> 
          <td id="cop95_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_address_1']; ?></td> 
          <td id="cop96_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_address_2']; ?></td> 
          <td id="cop97_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_city']; ?></td> 
          <td id="cop98_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_zone']; ?></td> 
          <td id="cop99_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_postcode']; ?></td>                    
          <td id="cop100_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_country']; ?></td>          
         </tr>
    </table>
</div> 
<?php } ?> 
</td>
</tr>           
        <?php } ?>
        <tr>
        <td colspan="19"></td>
        </tr>        
        <tr>
          <td colspan="2" class="right" style="background-color:#E7EFEF;"><strong><?php echo $text_filter_total; ?></strong></td>        
          <td id="cop20_total" style="background-color:#DDDDDD;"></td>
          <td id="cop21_total" style="background-color:#DDDDDD;"></td>
          <td id="cop22_total" style="background-color:#DDDDDD;"></td>
          <td id="cop35_total" style="background-color:#DDDDDD;"></td>          
          <td id="cop34_total" style="background-color:#DDDDDD;"></td>
          <td id="cop23_total" style="background-color:#DDDDDD;"></td>
          <td id="cop24_total" style="background-color:#DDDDDD;"></td>
          <td id="cop25_total" style="background-color:#DDDDDD;"></td>
          <td id="cop26_total" style="background-color:#DDDDDD;"></td>            
          <td id="cop27_total" class="right" nowrap="nowrap" style="background-color:#E7EFEF; color:#003A88;"><strong><?php echo $customer['orders_total']; ?></strong></td>  
          <td id="cop28_total" class="right" nowrap="nowrap" style="background-color:#E7EFEF; color:#003A88;"><strong><?php echo $customer['products_total']; ?></strong></td> 
          <td id="cop30_total" class="right" nowrap="nowrap" style="background-color:#E7EFEF; color:#003A88;"><strong><?php echo $customer['value_total']; ?></strong></td>           
          <td id="cop29_total" class="right" nowrap="nowrap" style="background-color:#DCFFB9; color:#003A88;"><strong><?php echo $customer['sales_total']; ?></strong></td>           
          <td id="cop31_total" class="right" nowrap="nowrap" style="background-color:#ffd7d7; color:#003A88;"><strong><?php echo $customer['costs_total']; ?></strong></td>           
          <td id="cop32_total" class="right" nowrap="nowrap" style="background-color:#c4d9ee; color:#003A88;"><strong><?php echo $customer['profit_total']; ?></strong></td>
          <td id="cop33_total" class="right" nowrap="nowrap" style="background-color:#c4d9ee; color:#003A88;"><strong><?php echo $customer['profit_margin_total_percent']; ?></strong></td>          
          <?php if ($filter_details == 1 OR $filter_details == 2 OR $filter_details == 3) { ?><td></td><?php } ?>                  
          </tr>        
          <?php } else { ?>
          <tr>
          <td class="noresult" colspan="19"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
<?php } ?>      
    </div>
      <?php if ($customers) { ?>    
      <div class="pagination_report"></div>
      <?php } ?>        
    </div>
    </div>    
  </div>
</div>  
</form>  
<script type="text/javascript">
// jQuery multiSelect 1.2.2 beta
jQuery(document).ready(function() {
	// render the html for a single option
	function renderOption(id, option)
	{
		var html = '<label><input type="checkbox" name="' + id + '[]" value="' + option.value + '"';
		if( option.selected ){
			html += ' checked="checked"';
		}
		html += ' />' + option.text + '</label>';
		
		return html;
	}
	
	// render the html for the options/optgroups
	function renderOptions(id, options, o)
	{
		var html = "";
		
		for(var i = 0; i < options.length; i++) {
			if(options[i].optgroup) {
				html += '<label class="optGroup">';
				
				if(o.optGroupSelectable) {
					html += '<input type="checkbox" class="optGroup" />' + options[i].optgroup;
				}
				else {
					html += options[i].optgroup;
				}
				
				html += '</label><div class="optGroupContainer">';
				
				html += renderOptions(id, options[i].options, o);
				
				html += '</div>';
			}
			else {
				html += renderOption(id, options[i]);
			}
		}
		
		return html;
	}
	
	// Building the actual options
	function buildOptions(options)
	{
		var multiSelect = jQuery(this);
		var multiSelectOptions = multiSelect.next('.multiSelectOptions');
		var o = multiSelect.data("config");
		var callback = multiSelect.data("callback");

		// clear the existing options
		multiSelectOptions.html("");
		var html = "";

		// if we should have a select all option then add it
		if( o.selectAll ) {
			html += '<label class="selectAll"><input type="checkbox" class="selectAll" />' + o.selectAllText + '</label>';
		}

		// generate the html for the new options
		html += renderOptions(multiSelect.attr('id'), options, o);
		
		multiSelectOptions.html(html);
		
		// variables needed to account for width changes due to a scrollbar
		var initialWidth = multiSelectOptions.width();
		var hasScrollbar = false;
		
		// set the height of the dropdown options
		if(multiSelectOptions.height() > o.listHeight) {
			multiSelectOptions.css("height", o.listHeight + 'px');
			hasScrollbar = true;
		} else {
			multiSelectOptions.css("height", '');
		}
		
		// if the there is a scrollbar and the browser did not already handle adjusting the width (i.e. Firefox) then we will need to manaually add the scrollbar width
		var scrollbarWidth = hasScrollbar && (initialWidth == multiSelectOptions.width()) ? 17 : 0;

		// set the width of the dropdown options
		if((multiSelectOptions.width() + scrollbarWidth) < multiSelect.outerWidth()) {
			multiSelectOptions.css("width", multiSelect.outerWidth() - 2/*border*/ + 'px');
		} else {
			multiSelectOptions.css("width", (multiSelectOptions.width() + scrollbarWidth) + 'px');
		}
		
		// Apply bgiframe if available on IE6
		if( jQuery.fn.bgiframe ) multiSelect.next('.multiSelectOptions').bgiframe( { width: multiSelectOptions.width(), height: multiSelectOptions.height() });

		// Handle selectAll oncheck
		if(o.selectAll) {
			multiSelectOptions.find('INPUT.selectAll').click( function() {
				// update all the child checkboxes
				multiSelectOptions.find('INPUT:checkbox').attr('checked', jQuery(this).attr('checked')).parent("LABEL").toggleClass('checked', jQuery(this).attr('checked'));
			});
		}
		
		// Handle OptGroup oncheck
		if(o.optGroupSelectable) {
			multiSelectOptions.addClass('optGroupHasCheckboxes');
		
			multiSelectOptions.find('INPUT.optGroup').click( function() {
				// update all the child checkboxes
				jQuery(this).parent().next().find('INPUT:checkbox').attr('checked', jQuery(this).attr('checked')).parent("LABEL").toggleClass('checked', jQuery(this).attr('checked'));
			});
		}
		
		// Handle all checkboxes
		multiSelectOptions.find('INPUT:checkbox').click( function() {
			// set the label checked class
			jQuery(this).parent("LABEL").removeClass('checked', jQuery(this).attr('checked'));
			
			updateSelected.call(multiSelect);
			multiSelect.focus();
			if(jQuery(this).parent().parent().hasClass('optGroupContainer')) {
				updateOptGroup.call(multiSelect, jQuery(this).parent().parent().prev());
			}
			if( callback ) {
				callback(jQuery(this));
			}
		});
		
		// Initial display
		multiSelectOptions.each( function() {
			jQuery(this).find('INPUT:checked').parent().toggleClass('checked');
		});
		
		// Initialize selected and select all 
		updateSelected.call(multiSelect);
		
		// Initialize optgroups
		if(o.optGroupSelectable) {
			multiSelectOptions.find('LABEL.optGroup').each( function() {
				updateOptGroup.call(multiSelect, jQuery(this));
			});
		}
		
		// Handle hovers
		multiSelectOptions.find('LABEL:has(INPUT)').hover( function() {
			jQuery(this).parent().find('LABEL').removeClass('hover');
			jQuery(this).addClass('hover');
		}, function() {
			jQuery(this).parent().find('LABEL').removeClass('hover');
		});
		
		// Keyboard
		multiSelect.keydown( function(e) {
		
			var multiSelectOptions = jQuery(this).next('.multiSelectOptions');

			// Is dropdown visible?
			if( multiSelectOptions.css('visibility') != 'hidden' ) {
				// Dropdown is visible
				// Tab
				if( e.keyCode == 9 ) {
					jQuery(this).addClass('focus').trigger('click'); // esc, left, right - hide
					jQuery(this).focus().next(':input').focus();
					return true;
				}
				
				// ESC, Left, Right
				if( e.keyCode == 27 || e.keyCode == 37 || e.keyCode == 39 ) {
					// Hide dropdown
					jQuery(this).addClass('focus').trigger('click');
				}
				// Down || Up
				if( e.keyCode == 40 || e.keyCode == 38) {
					var allOptions = multiSelectOptions.find('LABEL');
					var oldHoverIndex = allOptions.index(allOptions.filter('.hover'));
					var newHoverIndex = -1;
					
					// if there is no current highlighted item then highlight the first item
					if(oldHoverIndex < 0) {
						// Default to first item
						multiSelectOptions.find('LABEL:first').addClass('hover');
					}
					// else if we are moving down and there is a next item then move
					else if(e.keyCode == 40 && oldHoverIndex < allOptions.length - 1)
					{
						newHoverIndex = oldHoverIndex + 1;
					}
					// else if we are moving up and there is a prev item then move
					else if(e.keyCode == 38 && oldHoverIndex > 0)
					{
						newHoverIndex = oldHoverIndex - 1;
					}

					if(newHoverIndex >= 0) {
						jQuery(allOptions.get(oldHoverIndex)).removeClass('hover'); // remove the current highlight
						jQuery(allOptions.get(newHoverIndex)).addClass('hover'); // add the new highlight
						
						// Adjust the viewport if necessary
						adjustViewPort(multiSelectOptions);
					}
					
					return false;
				}

				// Enter, Space
				if( e.keyCode == 13 || e.keyCode == 32 ) {
					var selectedCheckbox = multiSelectOptions.find('LABEL.hover INPUT:checkbox');
					
					// Set the checkbox (and label class)
					selectedCheckbox.attr('checked', !selectedCheckbox.attr('checked')).parent("LABEL").toggleClass('checked', selectedCheckbox.attr('checked'));
					
					// if the checkbox was the select all then set all the checkboxes
					if(selectedCheckbox.hasClass("selectAll")) {
						multiSelectOptions.find('INPUT:checkbox').attr('checked', selectedCheckbox.attr('checked')).parent("LABEL").addClass('checked').toggleClass('checked', selectedCheckbox.attr('checked')); 
					}

					updateSelected.call(multiSelect);
					
					if( callback ) callback(jQuery(this));
					return false;
				}

				// Any other standard keyboard character (try and match the first character of an option)
				if( e.keyCode >= 33 && e.keyCode <= 126 ) {
					// find the next matching item after the current hovered item
					var match = multiSelectOptions.find('LABEL:startsWith(' + String.fromCharCode(e.keyCode) + ')');
					
					var currentHoverIndex = match.index(match.filter('LABEL.hover'));
					
					// filter the set to any items after the current hovered item
					var afterHoverMatch = match.filter(function (index) {
						return index > currentHoverIndex;
					});

					// if there were no item after the current hovered item then try using the full search results (filtered to the first one)
					match = (afterHoverMatch.length >= 1 ? afterHoverMatch : match).filter("LABEL:first");

					if(match.length == 1) {
						// if we found a match then move the hover
						multiSelectOptions.find('LABEL.hover').removeClass('hover');								
						match.addClass('hover');
						
						adjustViewPort(multiSelectOptions);
					}
				}
			} else {
				// Dropdown is not visible
				if( e.keyCode == 38 || e.keyCode == 40 || e.keyCode == 13 || e.keyCode == 32 ) { //up, down, enter, space - show
					// Show dropdown
					jQuery(this).removeClass('focus').trigger('click');
					multiSelectOptions.find('LABEL:first').addClass('hover');
					return false;
				}
				//  Tab key
				if( e.keyCode == 9 ) {
					// Shift focus to next INPUT element on page
					multiSelectOptions.next(':input').focus();
					return true;
				}
			}
			// Prevent enter key from submitting form
			if( e.keyCode == 13 ) return false;
		});
	}
	
	// Adjust the viewport if necessary
	function adjustViewPort(multiSelectOptions)
	{
		// check for and move down
		var selectionBottom = multiSelectOptions.find('LABEL.hover').position().top + multiSelectOptions.find('LABEL.hover').outerHeight();
		
		if(selectionBottom > multiSelectOptions.innerHeight()){		
			multiSelectOptions.scrollTop(multiSelectOptions.scrollTop() + selectionBottom - multiSelectOptions.innerHeight());
		}
		
		// check for and move up						
		if(multiSelectOptions.find('LABEL.hover').position().top < 0){		
			multiSelectOptions.scrollTop(multiSelectOptions.scrollTop() + multiSelectOptions.find('LABEL.hover').position().top);
		}
	}
	
	// Update the optgroup checked status
	function updateOptGroup(optGroup)
	{
		var multiSelect = jQuery(this);
		var o = multiSelect.data("config");
		
		// Determine if the optgroup should be checked
		if(o.optGroupSelectable) {
			var optGroupSelected = true;
			jQuery(optGroup).next().find('INPUT:checkbox').each( function() {
				if( !jQuery(this).attr('checked') ) {
					optGroupSelected = false;
					return false;
				}
			});
			
			jQuery(optGroup).find('INPUT.optGroup').attr('checked', optGroupSelected).parent("LABEL").toggleClass('checked', optGroupSelected);
		}
	}
	
	// Update the textbox with the total number of selected items, and determine select all
	function updateSelected() {
		var multiSelect = jQuery(this);
		var multiSelectOptions = multiSelect.next('.multiSelectOptions');
		var o = multiSelect.data("config");
		
		var i = 0;
		var selectAll = true;
		var display = '';
		multiSelectOptions.find('INPUT:checkbox').not('.selectAll, .optGroup').each( function() {
			if( jQuery(this).attr('checked') ) {
				i++;
				display = display + jQuery(this).parent().text() + ', ';
			}
			else selectAll = false;
		});
		
		// trim any end comma and surounding whitespace
		display = display.replace(/\s*\,\s*$/,'');
		
		if( i == 0 ) {
			multiSelect.find("span").html( o.noneSelected );
		} else {
			if( o.oneOrMoreSelected == '*' ) {
				multiSelect.find("span").html( display );
				multiSelect.attr( "title", display );
			} else {
				multiSelect.find("span").html( o.oneOrMoreSelected.replace('%', i) );
			}
		}

		// Determine if Select All should be checked
		if(o.selectAll) {
			multiSelectOptions.find('INPUT.selectAll').attr('checked', selectAll).parent("LABEL").toggleClass('checked', selectAll);
		}
	}
	
	jQuery.extend(jQuery.fn, {
		multiSelect: function(o, callback) {
			// Default options
			if( !o ) o = {};
			if( o.selectAll == undefined ) o.selectAll = false;
			if( o.selectAllText == undefined ) o.selectAllText = "Select All";
			if( o.noneSelected == undefined ) o.noneSelected = 'Select Options';
			if( o.oneOrMoreSelected == undefined ) o.oneOrMoreSelected = '% Selected';
			if( o.optGroupSelectable == undefined ) o.optGroupSelectable = false;
			if( o.listHeight == undefined ) o.listHeight = 150;

			// Initialize each multiSelect
			jQuery(this).each( function() {
				var select = jQuery(this);
				var html = '<a href="javascript:;" class="multiSelect"><span></span></a>';
				html += '<div class="multiSelectOptions" style="position: absolute; z-index: 99; visibility: hidden;"></div>';
				jQuery(select).after(html);
				
				var multiSelect = jQuery(select).next('.multiSelect');
				var multiSelectOptions = multiSelect.next('.multiSelectOptions');
				
				// if the select object had a width defined then match the new multilsect to it
				multiSelect.find("span").css("width", jQuery(select).width() + 'px');
				
				// Attach the config options to the multiselect
				multiSelect.data("config", o);
				
				// Attach the callback to the multiselect
				multiSelect.data("callback", callback);
				
				// Serialize the select options into json options
				var options = [];
				jQuery(select).children().each( function() {
					if(this.tagName.toUpperCase() == 'OPTGROUP')
					{
						var suboptions = [];
						options.push({ optgroup: jQuery(this).attr('label'), options: suboptions });
						
						jQuery(this).children('OPTION').each( function() {
							if( jQuery(this).val() != '' ) {
								suboptions.push({ text: jQuery(this).html(), value: jQuery(this).val(), selected: jQuery(this).attr('selected') });
							}
						});
					}
					else if(this.tagName.toUpperCase() == 'OPTION')
					{
						if( jQuery(this).val() != '' ) {
							options.push({ text: jQuery(this).html(), value: jQuery(this).val(), selected: jQuery(this).attr('selected') });
						}
					}
				});
				
				// Eliminate the original form element
				jQuery(select).remove();
				
				// Add the id that was on the original select element to the new input
				multiSelect.attr("id", jQuery(select).attr("id"));
				
				// Build the dropdown options
				buildOptions.call(multiSelect, options);

				// Events
				multiSelect.hover( function() {
					jQuery(this).addClass('hover');
				}, function() {
					jQuery(this).removeClass('hover');
				}).click( function() {
					// Show/hide on click
					if( jQuery(this).hasClass('active') ) {
						jQuery(this).multiSelectOptionsHide();
					} else {
						jQuery(this).multiSelectOptionsShow();
					}
					return false;
				}).focus( function() {
					// So it can be styled with CSS
					jQuery(this).addClass('focus');
				}).blur( function() {
					// So it can be styled with CSS
					jQuery(this).removeClass('focus');
				});
				
				// Add an event listener to the window to close the multiselect if the user clicks off
				jQuery(document).click( function(event) {
					// If somewhere outside of the multiselect was clicked then hide the multiselect
					if(!(jQuery(event.target).parents().andSelf().is('.multiSelectOptions'))){
						multiSelect.multiSelectOptionsHide();
					}
				});
			});
		},
		
		// Update the dropdown options
		multiSelectOptionsUpdate: function(options) {
			buildOptions.call(jQuery(this), options);
		},
		
		// Hide the dropdown
		multiSelectOptionsHide: function() {
			jQuery(this).removeClass('active').removeClass('hover').next('.multiSelectOptions').css('visibility', 'hidden');
		},
		
		// Show the dropdown
		multiSelectOptionsShow: function() {
			var multiSelect = jQuery(this);
			var multiSelectOptions = multiSelect.next('.multiSelectOptions');
			var o = multiSelect.data("config");
		
			// Hide any open option boxes
			jQuery('.multiSelect').multiSelectOptionsHide();
			multiSelectOptions.find('LABEL').removeClass('hover');
			multiSelect.addClass('active').next('.multiSelectOptions').css('visibility', 'visible');
			multiSelect.focus();
			
			// reset the scroll to the top
			multiSelect.next('.multiSelectOptions').scrollTop(0);

			// Position it
			var offset = multiSelect.position();
			multiSelect.next('.multiSelectOptions').css({ top:  offset.top + jQuery(this).outerHeight() + 'px' });
			multiSelect.next('.multiSelectOptions').css({ left: offset.left + 'px' });
		},
		
		// get a coma-delimited list of selected values
		selectedValuesString: function() {
			var selectedValues = "";
			jQuery(this).next('.multiSelectOptions').find('INPUT:checkbox:checked').not('.optGroup, .selectAll').each(function() {
				selectedValues += jQuery(this).attr('value') + ",";
			});
			// trim any end comma and surounding whitespace
			return selectedValues.replace(/\s*\,\s*$/,'');
		}		
	});
	
	// add a new ":startsWith" search filter
	jQuery.expr[":"].startsWith = function(el, i, m) {
		var search = m[3];        
		if (!search) return false;
		return eval("/^[/s]*" + search + "/i").test(jQuery(el).text());
	};	
});
</script>
<script type="text/javascript">
// jQuery paging plugin v1.1.0
(function(k,p,n){k.fn.paging=function(v,w){var t=this,s={setOptions:function(b){this.a=k.extend(this.a||{lapping:0,perpage:10,page:1,refresh:{interval:10,url:null},format:"",onFormat:function(){},onSelect:function(){return!0},onRefresh:function(){}},b||{});this.a.lapping|=0;this.a.perpage|=0;this.a.page|=0;1>this.a.perpage&&(this.a.perpage=10);this.k&&p.clearInterval(this.k);this.a.refresh.url&&(this.k=p.setInterval(function(b){k.ajax({url:b.a.refresh.url,success:function(g){if("string"===typeof g)try{g=
k.parseJSON(g)}catch(f){return}b.a.onRefresh(g)}})},1E3*this.a.refresh.interval,this));this.l=function(b){for(var g=0,f=0,h=1,d={e:[],h:0,g:0,b:5,d:3,j:0,m:0},a,l=/[*<>pq\[\]().-]|[nc]+!?/g,k={"[":"first","]":"last","<":"prev",">":"next",q:"left",p:"right","-":"fill",".":"leap"},e={};a=l.exec(b);){a=""+a;if(n===k[a])if("("===a)f=++g;else if(")"===a)f=0;else{if(h){if("*"===a){d.h=1;d.g=0}else{d.h=0;d.g="!"===a.charAt(a.length-1);d.b=a.length-d.g;if(!(d.d=1+a.indexOf("c")))d.d=1+d.b>>1}d.e[d.e.length]=
{f:"block",i:0,c:0};h=0}}else{d.e[d.e.length]={f:k[a],i:f,c:n===e[a]?e[a]=1:++e[a]};"q"===a?++d.m:"p"===a&&++d.j}}return d}(this.a.format);return this},setNumber:function(b){this.o=n===b||0>b?-1:b;return this},setPage:function(b){function q(b,a,c){c=""+b.onFormat.call(a,c);l=a.value?l+c.replace("<a",'<a data-page="'+a.value+'"'):l+c}if(n===b){if(b=this.a.page,null===b)return this}else if(this.a.page==b)return this;this.a.page=b|=0;var g=this.o,f=this.a,h,d,a,l,r=1,e=this.l,c,i,j,m,u=e.e.length,o=
u;f.perpage<=f.lapping&&(f.lapping=f.perpage-1);m=g<=f.lapping?0:f.lapping|0;0>g?(a=g=-1,h=Math.max(1,b-e.d+1-m),d=h+e.b):(a=1+Math.ceil((g-f.perpage)/(f.perpage-m)),b=Math.max(1,Math.min(0>b?1+a+b:b,a)),e.h?(h=1,d=1+a,e.d=b,e.b=a):(h=Math.max(1,Math.min(b-e.d,a-e.b)+1),d=e.g?h+e.b:Math.min(h+e.b,1+a)));for(;o--;){i=0;j=e.e[o];switch(j.f){case "left":i=j.c<h;break;case "right":i=d<=a-e.j+j.c;break;case "first":i=e.d<b;break;case "last":i=e.b<e.d+a-b;break;case "prev":i=1<b;break;case "next":i=b<a}r|=
i<<j.i}c={number:g,lapping:m,pages:a,perpage:f.perpage,page:b,slice:[(i=b*(f.perpage-m)+m)-f.perpage,Math.min(i,g)]};for(l="";++o<u;){j=e.e[o];i=r>>j.i&1;switch(j.f){case "block":for(;h<d;++h)c.value=h,c.pos=1+e.b-d+h,c.active=h<=a||0>g,c.first=1===h,c.last=h==a&&0<g,q(f,c,j.f);continue;case "left":c.value=j.c;c.active=j.c<h;break;case "right":c.value=a-e.j+j.c;c.active=d<=c.value;break;case "first":c.value=1;c.active=i&&1<b;break;case "prev":c.value=Math.max(1,b-1);c.active=i&&1<b;break;case "last":(c.active=
0>g)?c.value=1+b:(c.value=a,c.active=i&&b<a);break;case "next":(c.active=0>g)?c.value=1+b:(c.value=Math.min(1+b,a),c.active=i&&b<a);break;case "leap":case "fill":c.pos=j.c;c.active=i;q(f,c,j.f);continue}c.pos=j.c;c.last=c.first=n;q(f,c,j.f)}t.length&&(k("a",t.html(l)).click(function(a){a.preventDefault();a=this;do if("a"===a.nodeName.toLowerCase())break;while(a=a.parentNode);s.setPage(k(a).data("page"));if(s.n)p.location=a.href}),this.n=f.onSelect.call({number:g,lapping:m,pages:a,slice:c.slice},b));
return this}};return s.setNumber(v).setOptions(w).setPage()}})(jQuery,this);
</script>
<script type="text/javascript">
// jQuery Vertigo Tip
this.vtip = function() {    
    this.xOffset = -10; // x distance from mouse
    this.yOffset = 10; // y distance from mouse       
    	
    jQuery(".vtip").unbind().hover(    
        function(e) {
            this.t = this.title;
            this.title = ''; 
            this.top = (e.pageY + yOffset); this.left = (e.pageX + xOffset);
            
            jQuery('body').append( '<p id="vtip">' + this.t + '</p>' );
            
			jQuery('p#vtip').css("display", "none");
			jQuery('p#vtip').css("position", "absolute");
			jQuery('p#vtip').css("padding", "10px");
			jQuery('p#vtip').css("left", "5px");	
			jQuery('p#vtip').css("font-size", "11px");
			jQuery('p#vtip').css("background-color", "white");
			jQuery('p#vtip').css("border", "1px solid #DDDDDD");
			jQuery('p#vtip').css("background-color", "white");
			jQuery('p#vtip').css("-moz-border-radius", "5px");
			jQuery('p#vtip').css("-webkit-border-radius", "5px");
			jQuery('p#vtip').css("z-index", "9999");
			
            jQuery('p#vtip').css("top", this.top+"px").css("left", this.left+"px").fadeIn("fast");
			
        },
        function() {
            this.title = this.t;
            jQuery("p#vtip").fadeOut("fast").remove();
        }
    ).mousemove(
        function(e) {
            this.top = (e.pageY + yOffset);
            this.left = (e.pageX + xOffset);
                         
            jQuery("p#vtip").css("top", this.top+"px").css("left", this.left+"px");
        }
    );            
};
jQuery(document).ready(function($){vtip();}) 
</script>
<script type="text/javascript">
jQuery(document).ready(function() {
	jQuery('#date-start').datepicker({changeMonth: true, changeYear: true, dateFormat: 'yy-mm-dd'});
	jQuery('#date-end').datepicker({changeMonth: true, changeYear: true, dateFormat: 'yy-mm-dd'});

	jQuery('#status-date-start').datepicker({changeMonth: true, changeYear: true, dateFormat: 'yy-mm-dd'});
	jQuery('#status-date-end').datepicker({changeMonth: true, changeYear: true, dateFormat: 'yy-mm-dd'});
	
    jQuery('#filter_order_status_id').multiSelect({
      selectAllText:'<?php echo $text_all_status; ?>', noneSelected:'<?php echo $text_all_status; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });
	
    jQuery('#filter_store_id').multiSelect({
      selectAllText:'<?php echo $text_all_stores; ?>', noneSelected:'<?php echo $text_all_stores; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });
	
    jQuery('#filter_currency').multiSelect({
      selectAllText:'<?php echo $text_all_currencies; ?>', noneSelected:'<?php echo $text_all_currencies; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });

    jQuery('#filter_taxes').multiSelect({
      selectAllText:'<?php echo $text_all_taxes; ?>', noneSelected:'<?php echo $text_all_taxes; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });

    jQuery('#filter_tax_classes').multiSelect({
      selectAllText:'<?php echo $text_all_tax_classes; ?>', noneSelected:'<?php echo $text_all_tax_classes; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });
	
    jQuery('#filter_geo_zones').multiSelect({
      selectAllText:'<?php echo $text_all_zones; ?>', noneSelected:'<?php echo $text_all_zones; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });
	
    jQuery('#filter_customer_group_id').multiSelect({
      selectAllText:'<?php echo $text_all_groups; ?>', noneSelected:'<?php echo $text_all_groups; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });

    jQuery('#filter_status').multiSelect({
      selectAllText:'<?php echo $text_all_status; ?>', noneSelected:'<?php echo $text_all_status; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });	
	
    jQuery('#filter_payment_method').multiSelect({
      selectAllText:'<?php echo $text_all_payment_methods; ?>', noneSelected:'<?php echo $text_all_payment_methods; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });

    jQuery('#filter_shipping_method').multiSelect({
      selectAllText:'<?php echo $text_all_shipping_methods; ?>', noneSelected:'<?php echo $text_all_shipping_methods; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });

    jQuery('#filter_category').multiSelect({
      selectAllText:'<?php echo $text_all_categories; ?>', noneSelected:'<?php echo $text_all_categories; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });

    jQuery('#filter_manufacturer').multiSelect({
      selectAllText:'<?php echo $text_all_manufacturers; ?>', noneSelected:'<?php echo $text_all_manufacturers; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });
	
    jQuery('#filter_option').multiSelect({
      selectAllText:'<?php echo $text_all_options; ?>', noneSelected:'<?php echo $text_all_options; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });

    jQuery('#filter_attribute').multiSelect({
      selectAllText:'<?php echo $text_all_attributes; ?>', noneSelected:'<?php echo $text_all_attributes; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });
	
    jQuery('#filter_location').multiSelect({
      selectAllText:'<?php echo $text_all_locations; ?>', noneSelected:'<?php echo $text_all_locations; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });

    jQuery('#filter_affiliate_name').multiSelect({
      selectAllText:'<?php echo $text_all_affiliate_names; ?>', noneSelected:'<?php echo $text_all_affiliate_names; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });

    jQuery('#filter_affiliate_email').multiSelect({
      selectAllText:'<?php echo $text_all_affiliate_emails; ?>', noneSelected:'<?php echo $text_all_affiliate_emails; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });
	
    jQuery('#filter_coupon_name').multiSelect({
      selectAllText:'<?php echo $text_all_coupon_names; ?>', noneSelected:'<?php echo $text_all_coupon_names; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });
	
    jQuery('#export_xls').click(function() {
      jQuery('#export').val('1') ; // export_xls: #1
      jQuery('#report').attr('target', '_blank'); // opening file in a new window
      jQuery('#report').submit() ;
      jQuery('#report').attr('target', '_self'); // preserve current form      
      jQuery('#export').val('') ; 
      return(false)
    });	
	
    jQuery('#export_xls_order_list').click(function() {
      jQuery('#export').val('2') ; // export_xls_order_list: #2
      jQuery('#report').attr('target', '_blank'); // opening file in a new window
      jQuery('#report').submit() ;
      jQuery('#report').attr('target', '_self'); // preserve current form      
      jQuery('#export').val('') ; 
      return(false)
    });	

    jQuery('#export_xls_product_list').click(function() {
      jQuery('#export').val('3') ; // export_xls_product_list: #3
      jQuery('#report').attr('target', '_blank'); // opening file in a new window
      jQuery('#report').submit() ;
      jQuery('#report').attr('target', '_self'); // preserve current form      
      jQuery('#export').val('') ; 
      return(false)
    });	

    jQuery('#export_xls_address_list').click(function() {
      jQuery('#export').val('4') ; // export_xls_address_list: #4
      jQuery('#report').attr('target', '_blank'); // opening file in a new window
      jQuery('#report').submit() ;
      jQuery('#report').attr('target', '_self'); // preserve current form      
      jQuery('#export').val('') ; 
      return(false)
    });	
	
    jQuery('#export_xls_all_details').click(function() {
      jQuery('#export').val('5') ; // export_xls_all_details: #5
      jQuery('#report').attr('target', '_blank'); // opening file in a new window
      jQuery('#report').submit() ;
      jQuery('#report').attr('target', '_self'); // preserve current form      
      jQuery('#export').val('') ; 
      return(false)
    });	
	
    jQuery('#export_html').click(function() {
      jQuery('#export').val('6') ; // export_html: #6
      jQuery('#report').attr('target', '_blank'); // opening file in a new window
      jQuery('#report').submit() ;
      jQuery('#report').attr('target', '_self'); // preserve current form      
      jQuery('#export').val('') ; 
      return(false)
    });	
	
    jQuery('#export_html_order_list').click(function() {
      jQuery('#export').val('7') ; // export_html_order_list: #7
      jQuery('#report').attr('target', '_blank'); // opening file in a new window
      jQuery('#report').submit() ;
      jQuery('#report').attr('target', '_self'); // preserve current form      
      jQuery('#export').val('') ; 
      return(false)
    });	
	
    jQuery('#export_html_product_list').click(function() {
      jQuery('#export').val('8') ; // export_html_product_list: #8
      jQuery('#report').attr('target', '_blank'); // opening file in a new window
      jQuery('#report').submit() ;
      jQuery('#report').attr('target', '_self'); // preserve current form      
      jQuery('#export').val('') ; 
      return(false)
    });		

    jQuery('#export_html_address_list').click(function() {
      jQuery('#export').val('9') ; // export_html_address_list: #9
      jQuery('#report').attr('target', '_blank'); // opening file in a new window
      jQuery('#report').submit() ;
      jQuery('#report').attr('target', '_self'); // preserve current form      
      jQuery('#export').val('') ; 
      return(false)
    });	
	
    jQuery('#export_html_all_details').click(function() {
      jQuery('#export').val('10') ; // export_html_all_details: #10
      jQuery('#report').attr('target', '_blank'); // opening file in a new window
      jQuery('#report').submit() ;
      jQuery('#report').attr('target', '_self'); // preserve current form      
      jQuery('#export').val('') ; 
      return(false)
    });	
	
    jQuery('#export_pdf').click(function() {
      jQuery('#export').val('11') ; // export_pdf: #11
      jQuery('#report').attr('target', '_blank'); // opening file in a new window
      jQuery('#report').submit() ;
      jQuery('#report').attr('target', '_self'); // preserve current form      
      jQuery('#export').val('') ; 
      return(false)
    });	
	
    jQuery('#export_pdf_order_list').click(function() {
      jQuery('#export').val('12') ; // export_pdf_order_list: #12
      jQuery('#report').attr('target', '_blank'); // opening file in a new window
      jQuery('#report').submit() ;
      jQuery('#report').attr('target', '_self'); // preserve current form      
      jQuery('#export').val('') ; 
      return(false)
    });	
	
    jQuery('#export_pdf_product_list').click(function() {
      jQuery('#export').val('13') ; // export_pdf_product_list: #13
      jQuery('#report').attr('target', '_blank'); // opening file in a new window
      jQuery('#report').submit() ;
      jQuery('#report').attr('target', '_self'); // preserve current form      
      jQuery('#export').val('') ; 
      return(false)
    });		

    jQuery('#export_pdf_address_list').click(function() {
      jQuery('#export').val('14') ; // export_pdf_address_list: #14
      jQuery('#report').attr('target', '_blank'); // opening file in a new window
      jQuery('#report').submit() ;
      jQuery('#report').attr('target', '_self'); // preserve current form      
      jQuery('#export').val('') ; 
      return(false)
    });	
	
    jQuery('#export_pdf_all_details').click(function() {
      jQuery('#export').val('15') ; // export_pdf_all_details: #15
      jQuery('#report').attr('target', '_blank'); // opening file in a new window
      jQuery('#report').submit() ;
      jQuery('#report').attr('target', '_self'); // preserve current form      
      jQuery('#export').val('') ; 
      return(false)
    });	
});
</script>  
<script type="text/javascript"><!--
jQuery('input[name=\'filter_customer_name\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/customer_autocomplete&token=<?php echo $token; ?>&filter_customer_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.cust_name,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_customer_name\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_customer_email\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/customer_autocomplete&token=<?php echo $token; ?>&filter_customer_email=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.cust_email,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_customer_email\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_customer_telephone\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/customer_autocomplete&token=<?php echo $token; ?>&filter_customer_telephone=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.cust_telephone,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_customer_telephone\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_ip\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/customer_autocomplete&token=<?php echo $token; ?>&filter_ip=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.cust_ip,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_ip\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_payment_company\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/customer_autocomplete&token=<?php echo $token; ?>&filter_payment_company=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.payment_company,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_payment_company\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_payment_address\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/customer_autocomplete&token=<?php echo $token; ?>&filter_payment_address=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.payment_address,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_payment_address\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_payment_city\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/customer_autocomplete&token=<?php echo $token; ?>&filter_payment_city=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.payment_city,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_payment_city\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_payment_zone\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/customer_autocomplete&token=<?php echo $token; ?>&filter_payment_zone=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.payment_zone,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_payment_zone\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_payment_postcode\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/customer_autocomplete&token=<?php echo $token; ?>&filter_payment_postcode=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.payment_postcode,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_payment_postcode\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_payment_country\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/customer_autocomplete&token=<?php echo $token; ?>&filter_payment_country=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.payment_country,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_payment_country\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_shipping_company\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/customer_autocomplete&token=<?php echo $token; ?>&filter_shipping_company=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.shipping_company,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_shipping_company\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_shipping_address\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/customer_autocomplete&token=<?php echo $token; ?>&filter_shipping_address=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.shipping_address,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_shipping_address\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_shipping_city\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/customer_autocomplete&token=<?php echo $token; ?>&filter_shipping_city=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.shipping_city,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_shipping_city\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_shipping_zone\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/customer_autocomplete&token=<?php echo $token; ?>&filter_shipping_zone=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.shipping_zone,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_shipping_zone\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_shipping_postcode\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/customer_autocomplete&token=<?php echo $token; ?>&filter_shipping_postcode=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.shipping_postcode,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_shipping_postcode\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_shipping_country\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/customer_autocomplete&token=<?php echo $token; ?>&filter_shipping_country=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.shipping_country,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_shipping_country\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_sku\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/product_autocomplete&token=<?php echo $token; ?>&filter_sku=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.prod_sku,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_sku\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_product_id\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/product_autocomplete&token=<?php echo $token; ?>&filter_product_id=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.prod_name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_product_id\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_model\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/product_autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.prod_model,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_model\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_coupon_code\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/coupon_autocomplete&token=<?php echo $token; ?>&filter_coupon_code=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.coupon_code,
						value: item.coupon_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_coupon_code\']').val(ui.item.label);
						
		return false;
	}
});

jQuery('input[name=\'filter_voucher_code\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		jQuery.ajax({
			url: 'index.php?route=report/adv_customer_profit/voucher_autocomplete&token=<?php echo $token; ?>&filter_voucher_code=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response(jQuery.map(json, function(item) {
					return {
						label: item.voucher_code,
						value: item.voucher_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		jQuery('input[name=\'filter_voucher_code\']').val(ui.item.label);
						
		return false;
	}
});
//--></script> 
<?php if ($filter_details != '4') { ?> 
<?php if ($customers) { ?>    
<?php if (($filter_range != 'all_time' && $filter_details != '4' && ($filter_group == 'year' or $filter_group == 'quarter' or $filter_group == 'month')) or ($filter_range == 'all_time' && $filter_group == 'year')) { ?>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"><!--
	google.load('visualization', '1', {packages: ['corechart']});
      google.setOnLoadCallback(drawChart);      
	  function drawChart() {        
	  	var data = google.visualization.arrayToDataTable([
			<?php if ($sales && $filter_group == 'month') {
				echo "['" . $column_month . "','". $column_orders . "','" . $column_customers . "','" . $column_products . "'],";
					foreach ($sales as $key => $sale) {
						if (count($sales)==($key+1)) {
							echo "['" . $sale['gyear_month'] . "',". $sale['gorders'] . ",". $sale['gcustomers'] . ",". $sale['gproducts'] . "]";
						} else {
							echo "['" . $sale['gyear_month'] . "',". $sale['gorders'] . ",". $sale['gcustomers'] . ",". $sale['gproducts'] . "],";
						}
					}	
			} elseif ($sales && $filter_group == 'quarter') {
				echo "['" . $column_quarter . "','". $column_orders . "','" . $column_customers . "','" . $column_products . "'],";
					foreach ($sales as $key => $sale) {
						if (count($sales)==($key+1)) {
							echo "['" . $sale['gyear_quarter'] . "',". $sale['gorders'] . ",". $sale['gcustomers'] . ",". $sale['gproducts'] . "]";
						} else {
							echo "['" . $sale['gyear_quarter'] . "',". $sale['gorders'] . ",". $sale['gcustomers'] . ",". $sale['gproducts'] . "],";
						}
					}	
			} elseif ($sales && $filter_group == 'year') {
				echo "['" . $column_year . "','". $column_orders . "','" . $column_customers . "','" . $column_products . "'],";
					foreach ($sales as $key => $sale) {
						if (count($sales)==($key+1)) {
							echo "['" . $sale['gyear'] . "',". $sale['gorders'] . ",". $sale['gcustomers'] . ",". $sale['gproducts'] . "]";
						} else {
							echo "['" . $sale['gyear'] . "',". $sale['gorders'] . ",". $sale['gcustomers'] . ",". $sale['gproducts'] . "],";
						}
					}	
			} 
			;?>
		]);

        var options = {
			width: 630,	
			height: 266,  
			colors: ['#edc240', '#9dc7e8', '#CCCCCC'],
			chartArea: {left: 30, top: 30, width: "75%", height: "70%"},
			pointSize: '4',
			legend: {position: 'right', alignment: 'start', textStyle: {color: '#666666', fontSize: 12}}
		};

			var chart = new google.visualization.LineChart(document.getElementById('chart1_div'));
			chart.draw(data, options);
	}
//--></script>
<script type="text/javascript"><!--
	google.load('visualization', '1', {packages: ['corechart']});
	function drawVisualization() {
   		var data = google.visualization.arrayToDataTable([
			<?php if ($sales && $filter_group == 'month') {
				echo "['" . $column_month . "','". $column_total_sales . "','" . $column_total_costs . "','" . $column_total_profit . "'],";
					foreach ($sales as $key => $sale) {
						if (count($sales)==($key+1)) {
							echo "['" . $sale['gyear_month'] . "',". $sale['gsales'] . ",". $sale['gcosts'] . ",". $sale['gnetprofit'] . "]";
						} else {
							echo "['" . $sale['gyear_month'] . "',". $sale['gsales'] . ",". $sale['gcosts'] . ",". $sale['gnetprofit'] . "],";
						}
					}	
			} elseif ($sales && $filter_group == 'quarter') {
				echo "['" . $column_quarter . "','". $column_total_sales . "','" . $column_total_costs . "','" . $column_total_profit . "'],";
					foreach ($sales as $key => $sale) {
						if (count($sales)==($key+1)) {
							echo "['" . $sale['gyear_quarter'] . "',". $sale['gsales'] . ",". $sale['gcosts'] . ",". $sale['gnetprofit'] . "]";
						} else {
							echo "['" . $sale['gyear_quarter'] . "',". $sale['gsales'] . ",". $sale['gcosts'] . ",". $sale['gnetprofit'] . "],";
						}
					}	
			} elseif ($sales && $filter_group == 'year') {
				echo "['" . $column_year . "','". $column_total_sales . "','" . $column_total_costs . "','" . $column_total_profit . "'],";
					foreach ($sales as $key => $sale) {
						if (count($sales)==($key+1)) {
							echo "['" . $sale['gyear'] . "',". $sale['gsales'] . ",". $sale['gcosts'] . ",". $sale['gnetprofit'] . "]";
						} else {
							echo "['" . $sale['gyear'] . "',". $sale['gsales'] . ",". $sale['gcosts'] . ",". $sale['gnetprofit'] . "],";
						}
					}	
			} 
			;?>
		]);

        var options = {
			width: 630,	
			height: 266,  
			colors: ['#b5e08b', '#ed9999', '#739cc3'],
			chartArea: {left: 45, top: 30, width: "75%", height: "70%"},
			legend: {position: 'right', alignment: 'start', textStyle: {color: '#666666', fontSize: 12}},				
			seriesType: "bars",
			series: {2: {type: "line", lineWidth: '3', pointSize: '5'}}
		};

			var chart = new google.visualization.ComboChart(document.getElementById('chart2_div'));
			chart.draw(data, options);
	}
	
	google.setOnLoadCallback(drawVisualization);
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<?php echo $footer; ?>