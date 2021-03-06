<?php
ini_set("memory_limit","256M");

	$export_html_address_list ="<html><head>";
	$export_html_address_list .="<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>";
	$export_html_address_list .="</head>";
	$export_html_address_list .="<body>";
	$export_html_address_list .="<style type='text/css'>
	.list_main {
		border-collapse: collapse;
		width: 100%;
		border-top: 1px solid #DDDDDD;
		border-left: 1px solid #DDDDDD;	
		font-family: Arial, Helvetica, sans-serif;
		font-size: 12px;
	}
	.list_main td {
		border-right: 1px solid #DDDDDD;
		border-bottom: 1px solid #DDDDDD;	
	}
	.list_main thead td {
		background-color: #E5E5E5;
		padding: 3px;
		font-weight: bold;
	}
	.list_main tbody a {
		text-decoration: none;
	}
	.list_main tbody td {
		vertical-align: middle;
		padding: 3px;
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
	
	.list_detail {
		border-collapse: collapse;
		width: 100%;
		border-top: 1px solid #DDDDDD;
		border-left: 1px solid #DDDDDD;
		font-family: Arial, Helvetica, sans-serif;	
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
	</style>";
	$export_html_address_list .="<table class='list_main'>";
	foreach ($results as $result) {
	$total_sales = $result['sub_total']+$result['handling']+$result['low_order_fee']+$result['reward']+$result['coupon']+$result['credit']+$result['voucher']+($this->data['adv_profit_reports_formula_cop1'] ? $result['shipping'] : 0);
	$total_costs = $result['prod_costs']+$result['commission']+($this->data['adv_profit_reports_formula_cop3'] ? $result['payment_cost'] : 0)+($this->data['adv_profit_reports_formula_cop2'] ? $result['shipping_cost'] : 0);
	$total_sales_total = $result['sub_total_total']+$result['handling_total']+$result['low_order_fee_total']+$result['reward_total']+$result['coupon_total']+$result['credit_total']+$result['voucher_total']+($this->data['adv_profit_reports_formula_cop1'] ? $result['shipping_total'] : 0);
	$total_costs_total = $result['prod_costs_total']+$result['commission_total']+($this->data['adv_profit_reports_formula_cop3'] ? $result['pay_costs_total'] : 0)+($this->data['adv_profit_reports_formula_cop2'] ? $result['ship_costs_total'] : 0);
	$export_html_address_list .="<thead>";
	$export_html_address_list .="<tr>";
	if ($filter_group == 'year') {				
	$export_html_address_list .= "<td colspan='2' align='left' nowrap='nowrap'>".$this->language->get('column_year')."</td>";
	} elseif ($filter_group == 'quarter') {
	$export_html_address_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_year')."</td>";
	$export_html_address_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_quarter')."</td>";				
	} elseif ($filter_group == 'month') {
	$export_html_address_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_year')."</td>";
	$export_html_address_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_month')."</td>";
	} elseif ($filter_group == 'day') {
	$export_html_address_list .= "<td colspan='2' align='left' nowrap='nowrap'>".$this->language->get('column_date')."</td>";
	} elseif ($filter_group == 'order') {
	$export_html_address_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_order_order_id')."</td>";
	$export_html_address_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_order_date_added')."</td>";	
	} else {
	$export_html_address_list .= "<td align='left' width='80' nowrap='nowrap'>".$this->language->get('column_date_start')."</td>";
	$export_html_address_list .= "<td align='left' width='80' nowrap='nowrap'>".$this->language->get('column_date_end')."</td>";	
	}
	isset($_POST['cop20']) ? $export_html_address_list .= "<td align='right'>".$this->language->get('column_id')."</td>" : '';
	isset($_POST['cop21']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_customer')." / ".$this->language->get('column_company')."</td>" : '';
	isset($_POST['cop22']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_email')."</td>" : '';
	isset($_POST['cop35']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_telephone')."</td>" : '';	
	isset($_POST['cop34']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_country')."</td>" : '';
	isset($_POST['cop23']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_customer_group')."</td>" : '';
	isset($_POST['cop24']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_status')."</td>" : '';
	isset($_POST['cop25']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_ip')."</td>" : '';
	isset($_POST['cop26']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_mostrecent')."</td>" : '';
	isset($_POST['cop27']) ? $export_html_address_list .= "<td align='right'>".$this->language->get('column_orders')."</td>" : '';
	isset($_POST['cop28']) ? $export_html_address_list .= "<td align='right'>".$this->language->get('column_products')."</td>" : '';
	isset($_POST['cop30']) ? $export_html_address_list .= "<td align='right'>".$this->language->get('column_value')."</td>" : '';	
	isset($_POST['cop29']) ? $export_html_address_list .= "<td align='right'>".$this->language->get('column_total_sales')."</td>" : '';	
	isset($_POST['cop31']) ? $export_html_address_list .= "<td align='right'>".$this->language->get('column_total_costs')."</td>" : '';
	isset($_POST['cop32']) ? $export_html_address_list .= "<td align='right'>".$this->language->get('column_total_profit')."</td>" : '';
	isset($_POST['cop33']) ? $export_html_address_list .= "<td align='right'>".$this->language->get('column_profit_margin')."</td>" : '';
	$export_html_address_list .="</tr>";
	$export_html_address_list .="</thead><tbody>";
	$export_html_address_list .="<tr>";
	if ($filter_group == 'year') {				
	$export_html_address_list .= "<td colspan='2' align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".$result['year']."</td>";
	} elseif ($filter_group == 'quarter') {
	$export_html_address_list .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".$result['year']."</td>";	
	$export_html_address_list .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".'Q' . $result['quarter']."</td>";						
	} elseif ($filter_group == 'month') {
	$export_html_address_list .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".$result['year']."</td>";	
	$export_html_address_list .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".$result['month']."</td>";	
	} elseif ($filter_group == 'day') {
	$export_html_address_list .= "<td colspan='2' align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".date($this->language->get('date_format_short'), strtotime($result['date_start']))."</td>";
	} elseif ($filter_group == 'order') {
	$export_html_address_list .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".$result['order_id']."</td>";	
	$export_html_address_list .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".date($this->language->get('date_format_short'), strtotime($result['date_start']))."</td>";	
	} else {
	$export_html_address_list .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".date($this->language->get('date_format_short'), strtotime($result['date_start']))."</td>";
	$export_html_address_list .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".date($this->language->get('date_format_short'), strtotime($result['date_end']))."</td>";
	}
	isset($_POST['cop20']) ? $export_html_address_list .= "<td align='right'>".$result['customer_id']."</td>" : '';
	isset($_POST['cop21']) ? $export_html_address_list .= "<td align='left' style='color:#03C;'><strong>".$result['cust_name']."</strong><br>".$result['cust_company']."</td>" : '';
	isset($_POST['cop22']) ? $export_html_address_list .= "<td align='left'>".$result['cust_email']."</td>" : '';
	isset($_POST['cop35']) ? $export_html_address_list .= "<td align='left'>".$result['cust_telephone']."</td>" : '';	
	isset($_POST['cop34']) ? $export_html_address_list .= "<td align='left'>".$result['cust_country']."</td>" : '';
	isset($_POST['cop23']) ? $export_html_address_list .= "<td align='left'>" : '';
		if ($result['customer_id'] == 0) {
		isset($_POST['cop23']) ? $export_html_address_list .= "".$result['cust_group_guest']."" : '';
		} else {
		isset($_POST['cop23']) ? $export_html_address_list .= "".$result['cust_group_reg']."" : '';
		}
	isset($_POST['cop23']) ? $export_html_address_list .= "</td>" : '';
	isset($_POST['cop24']) ? $export_html_address_list .= "<td align='left'>" : '';
		if (!$result['customer_id'] == 0) {
		isset($_POST['cop23']) ? $export_html_address_list .= "".($result['cust_status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled'))."" : '';
		}
	isset($_POST['cop23']) ? $export_html_address_list .= "</td>" : '';
	isset($_POST['cop25']) ? $export_html_address_list .= "<td align='left'>".$result['cust_ip']."</td>" : '';
	isset($_POST['cop26']) ? $export_html_address_list .= "<td align='left'>".date($this->language->get('date_format_short'), strtotime($result['mostrecent']))."</td>" : '';
	isset($_POST['cop27']) ? $export_html_address_list .= "<td align='right' nowrap='nowrap'>".$result['orders']."</td>" : '';
	isset($_POST['cop28']) ? $export_html_address_list .= "<td align='right' nowrap='nowrap'>".$result['products']."</td>" : '';
	isset($_POST['cop30']) ? $export_html_address_list .= "<td align='right' nowrap='nowrap'>".$this->currency->format($result['total'], $this->config->get('config_currency'))."</td>" : '';
	isset($_POST['cop29']) ? $export_html_address_list .= "<td align='right' nowrap='nowrap' style='background-color:#DCFFB9;'>".$this->currency->format($total_sales, $this->config->get('config_currency'))."</td>" : '';
	isset($_POST['cop31']) ? $export_html_address_list .= "<td align='right' nowrap='nowrap' style='background-color:#ffd7d7;'>".$this->currency->format('-' . ($total_costs), $this->config->get('config_currency'))."</td>" : '';	
	isset($_POST['cop32']) ? $export_html_address_list .= "<td align='right' nowrap='nowrap' style='background-color:#c4d9ee; font-weight:bold;'>".$this->currency->format(($total_sales-$total_costs), $this->config->get('config_currency'))."</td>" : '';
	if (($total_costs) > 0) {
	isset($_POST['cop33']) ? $export_html_address_list .= "<td align='right' nowrap='nowrap' style='background-color:#c4d9ee; font-weight:bold;'>".round(100 * (($total_sales-$total_costs) / $total_sales), 2) . '%'."</td>" : '';
	} else {
	isset($_POST['cop33']) ? $export_html_address_list .= "<td align='right' nowrap='nowrap' style='background-color:#c4d9ee; font-weight:bold;'>".'100%'."</td>" : '';
	}							
	$export_html_address_list .="</tr>";
	$export_html_address_list .="<tr>";
	$count = isset($_POST['cop20'])+isset($_POST['cop21'])+isset($_POST['cop22'])+isset($_POST['cop35'])+isset($_POST['cop34'])+isset($_POST['cop23'])+isset($_POST['cop24'])+isset($_POST['cop25'])+isset($_POST['cop26'])+isset($_POST['cop27'])+isset($_POST['cop28'])+isset($_POST['cop30'])+isset($_POST['cop29'])+isset($_POST['cop31'])+isset($_POST['cop32'])+isset($_POST['cop33'])+2;
	$export_html_address_list .= "<td colspan='";
	$export_html_address_list .= $count;
	$export_html_address_list .="' align='center'>";
		$export_html_address_list .="<table class='list_detail'>";
		$export_html_address_list .="<thead>";
		$export_html_address_list .="<tr>";
		isset($_POST['cop84']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_billing_name')."</td>" : '';
		isset($_POST['cop85']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_billing_company')."</td>" : '';
		isset($_POST['cop86']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_billing_address_1')."</td>" : '';
		isset($_POST['cop87']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_billing_address_2')."</td>" : '';
		isset($_POST['cop88']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_billing_city')."</td>" : '';
		isset($_POST['cop89']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_billing_zone')."</td>" : '';
		isset($_POST['cop90']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_billing_postcode')."</td>" : '';
		isset($_POST['cop91']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_billing_country')."</td>" : '';
		isset($_POST['cop93']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_shipping_name')."</td>" : '';
		isset($_POST['cop94']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_shipping_company')."</td>" : '';
		isset($_POST['cop95']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_shipping_address_1')."</td>" : '';
		isset($_POST['cop96']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_shipping_address_2')."</td>" : '';
		isset($_POST['cop97']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_shipping_city')."</td>" : '';
		isset($_POST['cop98']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_shipping_zone')."</td>" : '';
		isset($_POST['cop99']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_shipping_postcode')."</td>" : '';
		isset($_POST['cop100']) ? $export_html_address_list .= "<td align='left'>".$this->language->get('column_shipping_country')."</td>" : '';
		$export_html_address_list .="</tr>";
		$export_html_address_list .="</thead><tbody>";
		$export_html_address_list .="<tr>";
		isset($_POST['cop84']) ? $export_html_address_list .= "<td align='left' nowrap='nowrap'>".$result['billing_name']."</td>" : '';
		isset($_POST['cop85']) ? $export_html_address_list .= "<td align='left' nowrap='nowrap'>".$result['billing_company']."</td>" : '';
		isset($_POST['cop86']) ? $export_html_address_list .= "<td align='left' nowrap='nowrap'>".$result['billing_address_1']."</td>" : '';
		isset($_POST['cop87']) ? $export_html_address_list .= "<td align='left' nowrap='nowrap'>".$result['billing_address_2']."</td>" : '';
		isset($_POST['cop88']) ? $export_html_address_list .= "<td align='left' nowrap='nowrap'>".$result['billing_city']."</td>" : '';
		isset($_POST['cop89']) ? $export_html_address_list .= "<td align='left' nowrap='nowrap'>".$result['billing_zone']."</td>" : '';
		isset($_POST['cop90']) ? $export_html_address_list .= "<td align='left' nowrap='nowrap'>".$result['billing_postcode']."</td>" : '';
		isset($_POST['cop91']) ? $export_html_address_list .= "<td align='left' nowrap='nowrap'>".$result['billing_country']."</td>" : '';
		isset($_POST['cop93']) ? $export_html_address_list .= "<td align='left' nowrap='nowrap'>".$result['shipping_name']."</td>" : '';
		isset($_POST['cop94']) ? $export_html_address_list .= "<td align='left' nowrap='nowrap'>".$result['shipping_company']."</td>" : '';
		isset($_POST['cop95']) ? $export_html_address_list .= "<td align='left' nowrap='nowrap'>".$result['shipping_address_1']."</td>" : '';
		isset($_POST['cop96']) ? $export_html_address_list .= "<td align='left' nowrap='nowrap'>".$result['shipping_address_2']."</td>" : '';
		isset($_POST['cop97']) ? $export_html_address_list .= "<td align='left' nowrap='nowrap'>".$result['shipping_city']."</td>" : '';
		isset($_POST['cop98']) ? $export_html_address_list .= "<td align='left' nowrap='nowrap'>".$result['shipping_zone']."</td>" : '';
		isset($_POST['cop99']) ? $export_html_address_list .= "<td align='left' nowrap='nowrap'>".$result['shipping_postcode']."</td>" : '';
		isset($_POST['cop100']) ? $export_html_address_list .= "<td align='left' nowrap='nowrap'>".$result['shipping_country']."</td>" : '';
		$export_html_address_list .="</tr>";					
		$export_html_address_list .="</tbody></table>";
	$export_html_address_list .="</td>";
	$export_html_address_list .="</tr>";
	}
	$export_html_address_list .="</tbody>";
	$export_html_address_list .="<thead><tr>";	
	$export_html_address_list .= "<td colspan='2'></td>";
	isset($_POST['cop20']) ? $export_html_address_list .= "<td style='background-color:#DDDDDD;'></td>" : '';
	isset($_POST['cop21']) ? $export_html_address_list .= "<td style='background-color:#DDDDDD;'></td>" : '';
	isset($_POST['cop22']) ? $export_html_address_list .= "<td style='background-color:#DDDDDD;'></td>" : '';
	isset($_POST['cop35']) ? $export_html_address_list .= "<td style='background-color:#DDDDDD;'></td>" : '';	
	isset($_POST['cop34']) ? $export_html_address_list .= "<td style='background-color:#DDDDDD;'></td>" : '';
	isset($_POST['cop23']) ? $export_html_address_list .= "<td style='background-color:#DDDDDD;'></td>" : '';
	isset($_POST['cop24']) ? $export_html_address_list .= "<td style='background-color:#DDDDDD;'></td>" : '';
	isset($_POST['cop25']) ? $export_html_address_list .= "<td style='background-color:#DDDDDD;'></td>" : '';
	isset($_POST['cop26']) ? $export_html_address_list .= "<td style='background-color:#DDDDDD;'></td>" : '';
	isset($_POST['cop27']) ? $export_html_address_list .= "<td align='right'>".$this->language->get('column_orders')."</td>" : '';
	isset($_POST['cop28']) ? $export_html_address_list .= "<td align='right'>".$this->language->get('column_products')."</td>" : '';
	isset($_POST['cop30']) ? $export_html_address_list .= "<td align='right'>".$this->language->get('column_value')."</td>" : '';	
	isset($_POST['cop29']) ? $export_html_address_list .= "<td align='right'>".$this->language->get('column_total_sales')."</td>" : '';	
	isset($_POST['cop31']) ? $export_html_address_list .= "<td align='right'>".$this->language->get('column_total_costs')."</td>" : '';
	isset($_POST['cop32']) ? $export_html_address_list .= "<td align='right'>".$this->language->get('column_total_profit')."</td>" : '';
	isset($_POST['cop33']) ? $export_html_address_list .= "<td align='right'>".$this->language->get('column_profit_margin')."</td>" : '';
	$export_html_address_list .="</tr></thead>";
	$export_html_address_list .="<tbody><tr>";	
	$export_html_address_list .= "<td colspan='2' align='right' style='background-color:#E7EFEF;'><strong>".$this->language->get('text_filter_total')."</strong></td>";
	isset($_POST['cop20']) ? $export_html_address_list .= "<td style='background-color:#DDDDDD;'></td>" : '';
	isset($_POST['cop21']) ? $export_html_address_list .= "<td style='background-color:#DDDDDD;'></td>" : '';
	isset($_POST['cop22']) ? $export_html_address_list .= "<td style='background-color:#DDDDDD;'></td>" : '';
	isset($_POST['cop35']) ? $export_html_address_list .= "<td style='background-color:#DDDDDD;'></td>" : '';	
	isset($_POST['cop34']) ? $export_html_address_list .= "<td style='background-color:#DDDDDD;'></td>" : '';
	isset($_POST['cop23']) ? $export_html_address_list .= "<td style='background-color:#DDDDDD;'></td>" : '';
	isset($_POST['cop24']) ? $export_html_address_list .= "<td style='background-color:#DDDDDD;'></td>" : '';
	isset($_POST['cop25']) ? $export_html_address_list .= "<td style='background-color:#DDDDDD;'></td>" : '';
	isset($_POST['cop26']) ? $export_html_address_list .= "<td style='background-color:#DDDDDD;'></td>" : '';	
	isset($_POST['cop27']) ? $export_html_address_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$result['orders_total']."</strong></td>" : '';
	isset($_POST['cop28']) ? $export_html_address_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$result['products_total']."</strong></td>" : '';
	isset($_POST['cop30']) ? $export_html_address_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$this->currency->format($result['value_total'], $this->config->get('config_currency'))."</strong></td>" : '';	
	isset($_POST['cop29']) ? $export_html_address_list .= "<td align='right' nowrap='nowrap' style='background-color:#DCFFB9; color:#003A88;'><strong>".$this->currency->format($total_sales_total, $this->config->get('config_currency'))."</strong></td>" : '';
	isset($_POST['cop31']) ? $export_html_address_list .= "<td align='right' nowrap='nowrap' style='background-color:#ffd7d7; color:#003A88;'><strong>".$this->currency->format('-' . ($total_costs_total), $this->config->get('config_currency'))."</strong></td>" : '';
	isset($_POST['cop32']) ? $export_html_address_list .= "<td align='right' nowrap='nowrap' style='background-color:#c4d9ee; color:#003A88;'><strong>".$this->currency->format(($total_sales_total-$total_costs_total), $this->config->get('config_currency'))."</strong></td>" : '';
	if (($total_costs_total) > 0) {
	isset($_POST['cop33']) ? $export_html_address_list .= "<td align='right' nowrap='nowrap' style='background-color:#c4d9ee; color:#003A88;'><strong>".round(100 * (($total_sales_total-$total_costs_total) / $total_sales_total), 2) . '%'."</strong></td>" : '';
	} else {
	isset($_POST['cop33']) ? $export_html_address_list .= "<td align='right' nowrap='nowrap' style='background-color:#c4d9ee; color:#003A88;'><strong>".'100%'."</strong></td>" : '';	
	}
	$export_html_address_list .="</tr></tbody></table>";
	$export_html_address_list .="</body></html>";

$filename = "customer_profit_report_address_list_".date("Y-m-d",time());
header('Expires: 0');
header('Cache-control: private');
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
header('Content-Description: File Transfer');			
header('Content-Disposition: attachment; filename='.$filename.".html");
print $export_html_address_list;			
exit;			
?>