<?php
ini_set("memory_limit","256M");

	$export_html_customer_list ="<html><head>";
	$export_html_customer_list .="<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>";
	$export_html_customer_list .="</head>";
	$export_html_customer_list .="<body>";
	$export_html_customer_list .="<style type='text/css'>
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
	$export_html_customer_list .="<table class='list_main'>";
	foreach ($results as $result) {
	$total_sales = $result['sub_total']+$result['handling']+$result['low_order_fee']+$result['reward']+$result['coupon']+$result['credit']+$result['voucher']+($this->data['adv_profit_reports_formula_sop1'] ? $result['shipping'] : 0);
	$total_costs = $result['prod_costs']+$result['commission']+($this->data['adv_profit_reports_formula_sop3'] ? $result['payment_cost'] : 0)+($this->data['adv_profit_reports_formula_sop2'] ? $result['shipping_cost'] : 0);
	$total_sales_total = $result['sub_total_total']+$result['handling_total']+$result['low_order_fee_total']+$result['reward_total']+$result['coupon_total']+$result['credit_total']+$result['voucher_total']+($this->data['adv_profit_reports_formula_sop1'] ? $result['shipping_total'] : 0);
	$total_costs_total = $result['prod_costs_total']+$result['commission_total']+($this->data['adv_profit_reports_formula_sop3'] ? $result['pay_costs_total'] : 0)+($this->data['adv_profit_reports_formula_sop2'] ? $result['ship_costs_total'] : 0);		
	$export_html_customer_list .="<thead>";
	$export_html_customer_list .="<tr>";
	if ($filter_group == 'year') {				
	$export_html_customer_list .= "<td colspan='2' align='left' nowrap='nowrap'>".$this->language->get('column_year')."</td>";
	} elseif ($filter_group == 'quarter') {
	$export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_year')."</td>";
	$export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_quarter')."</td>";				
	} elseif ($filter_group == 'month') {
	$export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_year')."</td>";
	$export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_month')."</td>";
	} elseif ($filter_group == 'day') {
	$export_html_customer_list .= "<td colspan='2' align='left' nowrap='nowrap'>".$this->language->get('column_date')."</td>";
	} elseif ($filter_group == 'order') {
	$export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_order_order_id')."</td>";
	$export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_order_date_added')."</td>";
	} else {
	$export_html_customer_list .= "<td align='left' width='80' nowrap='nowrap'>".$this->language->get('column_date_start')."</td>";
	$export_html_customer_list .= "<td align='left' width='80' nowrap='nowrap'>".$this->language->get('column_date_end')."</td>";	
	}
	isset($_POST['sop20']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_orders')."</td>" : '';
	isset($_POST['sop21']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_customers')."</td>" : '';
	isset($_POST['sop22']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_products')."</td>" : '';
	isset($_POST['sop23']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_sub_total')."</td>" : '';
	isset($_POST['sop24']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_handling')."</td>" : '';
	isset($_POST['sop25']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_loworder')."</td>" : '';
	isset($_POST['sop27']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_shipping')."</td>" : '';	
	isset($_POST['sop26']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_reward')."</td>" : '';
	isset($_POST['sop28']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_coupon')."</td>" : '';
	isset($_POST['sop29']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_tax')."</td>" : '';
	isset($_POST['sop30']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_credit')."</td>" : '';
	isset($_POST['sop31']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_voucher')."</td>" : '';
	isset($_POST['sop33']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_total')."</td>" : '';
	isset($_POST['sop37']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_sales')."</td>" : '';
	isset($_POST['sop34']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_prod_costs')."</td>" : '';
	isset($_POST['sop32']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_commission')."</td>" : '';
	isset($_POST['sop391']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_payment_cost')."</td>" : '';
	isset($_POST['sop392']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_shipping_cost')."</td>" : '';
	isset($_POST['sop393']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_shipping_balance')."</td>" : '';
	isset($_POST['sop38']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_total_costs')."</td>" : '';
	isset($_POST['sop35']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_net_profit')."</td>" : '';
	isset($_POST['sop36']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_profit_margin')."</td>" : '';
	$export_html_customer_list .="</tr>";
	$export_html_customer_list .="</thead><tbody>";	
	$export_html_customer_list .="<tr>";
	if ($filter_group == 'year') {				
	$export_html_customer_list .= "<td colspan='2' align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".$result['year']."</td>";
	} elseif ($filter_group == 'quarter') {
	$export_html_customer_list .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".$result['year']."</td>";	
	$export_html_customer_list .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".'Q' . $result['quarter']."</td>";						
	} elseif ($filter_group == 'month') {
	$export_html_customer_list .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".$result['year']."</td>";	
	$export_html_customer_list .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".$result['month']."</td>";	
	} elseif ($filter_group == 'day') {
	$export_html_customer_list .= "<td colspan='2' align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".date($this->language->get('date_format_short'), strtotime($result['date_start']))."</td>";
	} elseif ($filter_group == 'order') {
	$export_html_customer_list .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".$result['order_id']."</td>";	
	$export_html_customer_list .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".date($this->language->get('date_format_short'), strtotime($result['date_start']))."</td>";
	} else {
	$export_html_customer_list .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".date($this->language->get('date_format_short'), strtotime($result['date_start']))."</td>";
	$export_html_customer_list .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".date($this->language->get('date_format_short'), strtotime($result['date_end']))."</td>";
	}
	isset($_POST['sop20']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap'>".$result['orders']."</td>" : '';
	isset($_POST['sop21']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap'>".$result['customers']."</td>" : '';
	isset($_POST['sop22']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap'>".$result['products']."</td>" : '';
	isset($_POST['sop23']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='color:#090;'>".$this->currency->format($result['sub_total'], $this->config->get('config_currency'))."</td>" : '';
	isset($_POST['sop24']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='color:#090;'>".$this->currency->format($result['handling'], $this->config->get('config_currency'))."</td>" : '';
	isset($_POST['sop25']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='color:#090;'>".$this->currency->format($result['low_order_fee'], $this->config->get('config_currency'))."</td>" : '';
	if ($this->config->get('adv_profit_reports_formula_sop1')) {
	isset($_POST['sop27']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='color:#090;'>".$this->currency->format($result['shipping'], $this->config->get('config_currency'))."</td>" : '';	
	} else {
	isset($_POST['sop27']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap'>".$this->currency->format($result['shipping'], $this->config->get('config_currency'))."</td>" : '';
	}
	isset($_POST['sop26']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='color:#090;'>".$this->currency->format($result['reward'], $this->config->get('config_currency'))."</td>" : '';
	isset($_POST['sop28']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='color:#090;'>".$this->currency->format($result['coupon'], $this->config->get('config_currency'))."</td>" : '';
	isset($_POST['sop29']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap'>".$this->currency->format($result['tax'], $this->config->get('config_currency'))."</td>" : '';
	isset($_POST['sop30']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='color:#090;'>".$this->currency->format($result['credit'], $this->config->get('config_currency'))."</td>" : '';
	isset($_POST['sop31']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='color:#090;'>".$this->currency->format($result['voucher'], $this->config->get('config_currency'))."</td>" : '';
	isset($_POST['sop33']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap'>".$this->currency->format($result['total'], $this->config->get('config_currency'))."</td>" : '';
	isset($_POST['sop37']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#DCFFB9;'>".$this->currency->format($total_sales, $this->config->get('config_currency'))."</td>" : '';	
	isset($_POST['sop34']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='color:#F00;'>".$this->currency->format('-' . ($result['prod_costs']), $this->config->get('config_currency'))."</td>" : '';	
	isset($_POST['sop32']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='color:#F00;'>".$this->currency->format('-' . ($result['commission']), $this->config->get('config_currency'))."</td>" : '';
	if ($this->config->get('adv_profit_reports_formula_sop3')) {
	isset($_POST['sop391']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='color:#F00;'>".$this->currency->format('-' . ($result['payment_cost']), $this->config->get('config_currency'))."</td>" : '';
	} else {
	isset($_POST['sop391']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap'>".$this->currency->format('-' . ($result['payment_cost']), $this->config->get('config_currency'))."</td>" : '';
	}	
	if ($this->config->get('adv_profit_reports_formula_sop2')) {
	isset($_POST['sop392']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='color:#F00;'>".$this->currency->format('-' . ($result['shipping_cost']), $this->config->get('config_currency'))."</td>" : '';
	} else {
	isset($_POST['sop392']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap'>".$this->currency->format('-' . ($result['shipping_cost']), $this->config->get('config_currency'))."</td>" : '';
	}		
	isset($_POST['sop393']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap'>".$this->currency->format($result['shipping']-$result['shipping_cost'], $this->config->get('config_currency'))."</td>" : '';
	isset($_POST['sop38']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#ffd7d7;'>".$this->currency->format('-' . ($total_costs), $this->config->get('config_currency'))."</td>" : '';	
	isset($_POST['sop35']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#c4d9ee; font-weight:bold;'>".$this->currency->format(($total_sales-$total_costs), $this->config->get('config_currency'))."</td>" : '';
	if (($total_costs) > 0) {
	isset($_POST['sop36']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#c4d9ee; font-weight:bold;'>".round(100 * (($total_sales-$total_costs) / $total_sales), 2) . '%'."</td>" : '';
	} else {
	isset($_POST['sop36']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#c4d9ee; font-weight:bold;'>".'100%'."</td>" : '';
	}						
	$export_html_customer_list .="</tr>";
	$export_html_customer_list .="<tr>";
	$count = isset($_POST['sop20'])+isset($_POST['sop21'])+isset($_POST['sop22'])+isset($_POST['sop23'])+isset($_POST['sop24'])+isset($_POST['sop25'])+isset($_POST['sop27'])+isset($_POST['sop26'])+isset($_POST['sop28'])+isset($_POST['sop29'])+isset($_POST['sop30'])+isset($_POST['sop31'])+isset($_POST['sop33'])+isset($_POST['sop37'])+isset($_POST['sop34'])+isset($_POST['sop32'])+isset($_POST['sop391'])+isset($_POST['sop392'])+isset($_POST['sop393'])+isset($_POST['sop38'])+isset($_POST['sop35'])+isset($_POST['sop36'])+2;
	$export_html_customer_list .= "<td colspan='";
	$export_html_customer_list .= $count;
	$export_html_customer_list .="' align='center'>";
		$export_html_customer_list .="<table class='list_detail'>";
		$export_html_customer_list .="<thead>";
		$export_html_customer_list .="<tr>";
		isset($_POST['sop80']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_customer_order_id')."</td>" : '';
		isset($_POST['sop81']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_customer_date_added')."</td>" : '';
		isset($_POST['sop82']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_customer_inv_no')."</td>" : '';
		isset($_POST['sop83']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_customer_cust_id')."</td>" : '';
		isset($_POST['sop84']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_billing_name')."</td>" : '';
		isset($_POST['sop85']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_billing_company')."</td>" : '';
		isset($_POST['sop86']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_billing_address_1')."</td>" : '';
		isset($_POST['sop87']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_billing_address_2')."</td>" : '';
		isset($_POST['sop88']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_billing_city')."</td>" : '';
		isset($_POST['sop89']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_billing_zone')."</td>" : '';
		isset($_POST['sop90']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_billing_postcode')."</td>" : '';
		isset($_POST['sop91']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_billing_country')."</td>" : '';
		isset($_POST['sop92']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_customer_telephone')."</td>" : '';
		isset($_POST['sop93']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_shipping_name')."</td>" : '';
		isset($_POST['sop94']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_shipping_company')."</td>" : '';
		isset($_POST['sop95']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_shipping_address_1')."</td>" : '';
		isset($_POST['sop96']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_shipping_address_2')."</td>" : '';
		isset($_POST['sop97']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_shipping_city')."</td>" : '';
		isset($_POST['sop98']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_shipping_zone')."</td>" : '';
		isset($_POST['sop99']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_shipping_postcode')."</td>" : '';
		isset($_POST['sop100']) ? $export_html_customer_list .= "<td align='left'>".$this->language->get('column_shipping_country')."</td>" : '';
		$export_html_customer_list .="</tr>";
		$export_html_customer_list .="</thead><tbody>";
		$export_html_customer_list .="<tr>";
		isset($_POST['sop80']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['customer_ord_idc']."</td>" : '';
		isset($_POST['sop81']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['customer_order_date']."</td>" : '';
		isset($_POST['sop82']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['customer_inv_no']."</td>" : '';
		isset($_POST['sop83']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['customer_cust_idc']."</td>" : '';
		isset($_POST['sop84']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['billing_name']."</td>" : '';
		isset($_POST['sop85']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['billing_company']."</td>" : '';
		isset($_POST['sop86']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['billing_address_1']."</td>" : '';
		isset($_POST['sop87']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['billing_address_2']."</td>" : '';
		isset($_POST['sop88']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['billing_city']."</td>" : '';
		isset($_POST['sop89']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['billing_zone']."</td>" : '';
		isset($_POST['sop90']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['billing_postcode']."</td>" : '';
		isset($_POST['sop91']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['billing_country']."</td>" : '';
		isset($_POST['sop92']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['customer_telephone']."</td>" : '';
		isset($_POST['sop93']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['shipping_name']."</td>" : '';
		isset($_POST['sop94']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['shipping_company']."</td>" : '';
		isset($_POST['sop95']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['shipping_address_1']."</td>" : '';
		isset($_POST['sop96']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['shipping_address_2']."</td>" : '';
		isset($_POST['sop97']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['shipping_city']."</td>" : '';
		isset($_POST['sop98']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['shipping_zone']."</td>" : '';
		isset($_POST['sop99']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['shipping_postcode']."</td>" : '';
		isset($_POST['sop100']) ? $export_html_customer_list .= "<td align='left' nowrap='nowrap'>".$result['shipping_country']."</td>" : '';
		$export_html_customer_list .="</tr>";					
		$export_html_customer_list .="</tbody></table>";
	$export_html_customer_list .="</td>";
	$export_html_customer_list .="</tr>";
	}	
	$export_html_customer_list .="</tbody>";
	$export_html_customer_list .="<thead><tr>";	
	$export_html_customer_list .= "<td colspan='2'></td>";
	isset($_POST['sop20']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_orders')."</td>" : '';
	isset($_POST['sop21']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_customers')."</td>" : '';
	isset($_POST['sop22']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_products')."</td>" : '';
	isset($_POST['sop23']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_sub_total')."</td>" : '';
	isset($_POST['sop24']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_handling')."</td>" : '';
	isset($_POST['sop25']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_loworder')."</td>" : '';
	isset($_POST['sop27']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_shipping')."</td>" : '';	
	isset($_POST['sop26']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_reward')."</td>" : '';
	isset($_POST['sop28']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_coupon')."</td>" : '';
	isset($_POST['sop29']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_tax')."</td>" : '';
	isset($_POST['sop30']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_credit')."</td>" : '';
	isset($_POST['sop31']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_voucher')."</td>" : '';
	isset($_POST['sop33']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_total')."</td>" : '';
	isset($_POST['sop37']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_sales')."</td>" : '';
	isset($_POST['sop34']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_prod_costs')."</td>" : '';
	isset($_POST['sop32']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_commission')."</td>" : '';
	isset($_POST['sop391']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_payment_cost')."</td>" : '';
	isset($_POST['sop392']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_shipping_cost')."</td>" : '';
	isset($_POST['sop393']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_shipping_balance')."</td>" : '';
	isset($_POST['sop38']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_total_costs')."</td>" : '';
	isset($_POST['sop35']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_net_profit')."</td>" : '';
	isset($_POST['sop36']) ? $export_html_customer_list .= "<td align='right'>".$this->language->get('column_profit_margin')."</td>" : '';
	$export_html_customer_list .="</tr></thead>";
	$export_html_customer_list .="<tbody><tr>";	
	$export_html_customer_list .= "<td colspan='2' align='right' style='background-color:#E7EFEF;'><strong>".$this->language->get('text_filter_total')."</strong></td>";
	isset($_POST['sop20']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$result['orders_total']."</strong></td>" : '';
	isset($_POST['sop21']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$result['customers_total']."</strong></td>" : '';
	isset($_POST['sop22']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$result['products_total']."</strong></td>" : '';
	isset($_POST['sop23']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$this->currency->format($result['sub_total_total'], $this->config->get('config_currency'))."</strong></td>" : '';
	isset($_POST['sop24']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$this->currency->format($result['handling_total'], $this->config->get('config_currency'))."</strong></td>" : '';
	isset($_POST['sop25']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$this->currency->format($result['low_order_fee_total'], $this->config->get('config_currency'))."</strong></td>" : '';
	isset($_POST['sop27']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$this->currency->format($result['shipping_total'], $this->config->get('config_currency'))."</strong></td>" : '';
	isset($_POST['sop26']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$this->currency->format($result['reward_total'], $this->config->get('config_currency'))."</strong></td>" : '';
	isset($_POST['sop28']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$this->currency->format($result['coupon_total'], $this->config->get('config_currency'))."</strong></td>" : '';
	isset($_POST['sop29']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$this->currency->format($result['tax_total'], $this->config->get('config_currency'))."</strong></td>" : '';
	isset($_POST['sop30']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$this->currency->format($result['credit_total'], $this->config->get('config_currency'))."</strong></td>" : '';
	isset($_POST['sop31']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$this->currency->format($result['voucher_total'], $this->config->get('config_currency'))."</strong></td>" : '';
	isset($_POST['sop33']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$this->currency->format($result['total_total'], $this->config->get('config_currency'))."</strong></td>" : '';
	isset($_POST['sop37']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#DCFFB9; color:#003A88;'><strong>".$this->currency->format($total_sales_total, $this->config->get('config_currency'))."</strong></td>" : '';
	isset($_POST['sop34']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$this->currency->format('-' . ($result['prod_costs_total']), $this->config->get('config_currency'))."</strong></td>" : '';
	isset($_POST['sop32']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$this->currency->format('-' . ($result['commission_total']), $this->config->get('config_currency'))."</strong></td>" : '';
	isset($_POST['sop391']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$this->currency->format('-' . ($result['pay_costs_total']), $this->config->get('config_currency'))."</strong></td>" : '';
	isset($_POST['sop392']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$this->currency->format('-' . ($result['ship_costs_total']), $this->config->get('config_currency'))."</strong></td>" : '';
	isset($_POST['sop393']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#E7EFEF; color:#003A88;'><strong>".$this->currency->format($result['shipping_total']-$result['ship_costs_total'], $this->config->get('config_currency'))."</strong></td>" : '';
	isset($_POST['sop38']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#ffd7d7; color:#003A88;'><strong>".$this->currency->format('-' . ($total_costs_total), $this->config->get('config_currency'))."</strong></td>" : '';
	isset($_POST['sop35']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#c4d9ee; color:#003A88;'><strong>".$this->currency->format(($total_sales_total-$total_costs_total), $this->config->get('config_currency'))."</strong></td>" : '';
	if (($total_costs_total) > 0) {
	isset($_POST['sop36']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#c4d9ee; color:#003A88;'><strong>".round(100 * (($total_sales_total-$total_costs_total) / $total_sales_total), 2) . '%'."</strong></td>" : '';
	} else {
	isset($_POST['sop36']) ? $export_html_customer_list .= "<td align='right' nowrap='nowrap' style='background-color:#c4d9ee; color:#003A88;'><strong>".'100%'."</strong></td>" : '';	
	}
	$export_html_customer_list .="</tr></tbody></table>";
	$export_html_customer_list .="</body></html>";

$filename = "sale_profit_report_customer_list_".date("Y-m-d",time());
header('Expires: 0');
header('Cache-control: private');
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
header('Content-Description: File Transfer');			
header('Content-Disposition: attachment; filename='.$filename.".html");
print $export_html_customer_list;			
exit;				
?>