<?php
ini_set("memory_limit","256M");

	$export_xls_product_list ="<html><head>";
	$export_xls_product_list .="<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>";
	$export_xls_product_list .="</head>";
	$export_xls_product_list .="<body>";					
	$export_xls_product_list .="<table border='1'>";
	foreach ($results as $result) {
	$total_sales = $result['sub_total']+$result['handling']+$result['low_order_fee']+$result['reward']+$result['coupon']+$result['credit']+$result['voucher']+($this->data['adv_profit_reports_formula_sop1'] ? $result['shipping'] : 0);
	$total_costs = $result['prod_costs']+$result['commission']+($this->data['adv_profit_reports_formula_sop3'] ? $result['payment_cost'] : 0)+($this->data['adv_profit_reports_formula_sop2'] ? $result['shipping_cost'] : 0);
	$total_sales_total = $result['sub_total_total']+$result['handling_total']+$result['low_order_fee_total']+$result['reward_total']+$result['coupon_total']+$result['credit_total']+$result['voucher_total']+($this->data['adv_profit_reports_formula_sop1'] ? $result['shipping_total'] : 0);
	$total_costs_total = $result['prod_costs_total']+$result['commission_total']+($this->data['adv_profit_reports_formula_sop3'] ? $result['pay_costs_total'] : 0)+($this->data['adv_profit_reports_formula_sop2'] ? $result['ship_costs_total'] : 0);		
	$export_xls_product_list .="<tr>";
	if ($filter_group == 'year') {				
	$export_xls_product_list .= "<td colspan='2' align='left' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_year')."</td>";
	} elseif ($filter_group == 'quarter') {
	$export_xls_product_list .= "<td align='left' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_year')."</td>";					
	$export_xls_product_list .= "<td align='left' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_quarter')."</td>";				
	} elseif ($filter_group == 'month') {
	$export_xls_product_list .= "<td align='left' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_year')."</td>";					
	$export_xls_product_list .= "<td align='left' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_month')."</td>";
	} elseif ($filter_group == 'day') {
	$export_xls_product_list .= "<td colspan='2' align='left' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_date')."</td>";
	} elseif ($filter_group == 'order') {
	$export_xls_product_list .= "<td align='left' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_order_order_id')."</td>";					
	$export_xls_product_list .= "<td align='left' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_order_date_added')."</td>";	
	} else {
	$export_xls_product_list .= "<td align='left' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_date_start')."</td>";				
	$export_xls_product_list .= "<td align='left' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_date_end')."</td>";	
	}
	isset($_POST['sop20']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_orders')."</td>" : '';
	isset($_POST['sop21']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_customers')."</td>" : '';
	isset($_POST['sop22']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_products')."</td>" : '';
	isset($_POST['sop23']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_sub_total')."</td>" : '';
	isset($_POST['sop24']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_handling')."</td>" : '';
	isset($_POST['sop25']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_loworder')."</td>" : '';
	isset($_POST['sop27']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_shipping')."</td>" : '';	
	isset($_POST['sop26']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_reward')."</td>" : '';
	isset($_POST['sop28']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_coupon')."</td>" : '';
	isset($_POST['sop29']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_tax')."</td>" : '';
	isset($_POST['sop30']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_credit')."</td>" : '';
	isset($_POST['sop31']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_voucher')."</td>" : '';
	isset($_POST['sop33']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_total')."</td>" : '';
	isset($_POST['sop37']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_sales')."</td>" : '';	
	isset($_POST['sop34']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_prod_costs')."</td>" : '';
	isset($_POST['sop32']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_commission')."</td>" : '';
	isset($_POST['sop391']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_payment_cost')."</td>" : '';
	isset($_POST['sop392']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_shipping_cost')."</td>" : '';	
	isset($_POST['sop393']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_shipping_balance')."</td>" : '';
	isset($_POST['sop38']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_total_costs')."</td>" : '';
	isset($_POST['sop35']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_net_profit')."</td>" : '';
	isset($_POST['sop36']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_profit_margin')."</td>" : '';							
	$export_xls_product_list .="</tr>";
	$export_xls_product_list .="<tr>";
	if ($filter_group == 'year') {				
	$export_xls_product_list .= "<td colspan='2' align='left' style='background-color:#F0F0F0;'>".$result['year']."</td>";
	} elseif ($filter_group == 'quarter') {
	$export_xls_product_list .= "<td align='left' style='background-color:#F0F0F0;'>".$result['year']."</td>";
	$export_xls_product_list .= "<td align='left' style='background-color:#F0F0F0;'>".'Q' . $result['quarter']."</td>";						
	} elseif ($filter_group == 'month') {
	$export_xls_product_list .= "<td align='left' style='background-color:#F0F0F0;'>".$result['year']."</td>";
	$export_xls_product_list .= "<td align='left' style='background-color:#F0F0F0;'>".$result['month']."</td>";	
	} elseif ($filter_group == 'day') {
	$export_xls_product_list .= "<td colspan='2' align='left' style='background-color:#F0F0F0;'>".date($this->language->get('date_format_short'), strtotime($result['date_start']))."</td>";
	} elseif ($filter_group == 'order') {
	$export_xls_product_list .= "<td align='left' style='background-color:#F0F0F0;'>".$result['order_id']."</td>";	
	$export_xls_product_list .= "<td align='left' style='background-color:#F0F0F0;'>".date($this->language->get('date_format_short'), strtotime($result['date_start']))."</td>";	
	} else {
	$export_xls_product_list .= "<td align='left' style='background-color:#F0F0F0;'>".date($this->language->get('date_format_short'), strtotime($result['date_start']))."</td>";
	$export_xls_product_list .= "<td align='left' style='background-color:#F0F0F0;'>".date($this->language->get('date_format_short'), strtotime($result['date_end']))."</td>";	
	}
	isset($_POST['sop20']) ? $export_xls_product_list .= "<td align='right'>".$result['orders']."</td>" : '';
	isset($_POST['sop21']) ? $export_xls_product_list .= "<td align='right'>".$result['customers']."</td>" : '';
	isset($_POST['sop22']) ? $export_xls_product_list .= "<td align='right'>".$result['products']."</td>" : '';
	isset($_POST['sop23']) ? $export_xls_product_list .= "<td align='right' style='color:#090; mso-number-format:#\,\#\#0\.00'>".$result['sub_total']."</td>" : '';
	isset($_POST['sop24']) ? $export_xls_product_list .= "<td align='right' style='color:#090; mso-number-format:#\,\#\#0\.00'>".$result['handling']."</td>" : '';
	isset($_POST['sop25']) ? $export_xls_product_list .= "<td align='right' style='color:#090; mso-number-format:#\,\#\#0\.00'>".$result['low_order_fee']."</td>" : '';
	if ($this->config->get('adv_profit_reports_formula_sop1')) {
	isset($_POST['sop27']) ? $export_xls_product_list .= "<td align='right' style='color:#090; mso-number-format:#\,\#\#0\.00'>".$result['shipping']."</td>" : '';
	} else {
	isset($_POST['sop27']) ? $export_xls_product_list .= "<td align='right' style='mso-number-format:#\,\#\#0\.00'>".$result['shipping']."</td>" : '';
	}
	isset($_POST['sop26']) ? $export_xls_product_list .= "<td align='right' style='color:#090; mso-number-format:#\,\#\#0\.00'>".$result['reward']."</td>" : '';
	isset($_POST['sop28']) ? $export_xls_product_list .= "<td align='right' style='color:#090; mso-number-format:#\,\#\#0\.00'>".$result['coupon']."</td>" : '';
	isset($_POST['sop29']) ? $export_xls_product_list .= "<td align='right' style='mso-number-format:#\,\#\#0\.00'>".$result['tax']."</td>" : '';
	isset($_POST['sop30']) ? $export_xls_product_list .= "<td align='right' style='color:#090; mso-number-format:#\,\#\#0\.00'>".$result['credit']."</td>" : '';
	isset($_POST['sop31']) ? $export_xls_product_list .= "<td align='right' style='color:#090; mso-number-format:#\,\#\#0\.00'>".$result['voucher']."</td>" : '';
	isset($_POST['sop33']) ? $export_xls_product_list .= "<td align='right' style='mso-number-format:#\,\#\#0\.00'>".$result['total']."</td>" : '';
	isset($_POST['sop37']) ? $export_xls_product_list .= "<td align='right' style='background-color:#DCFFB9; mso-number-format:#\,\#\#0\.00'>".$total_sales."</td>" : '';
	isset($_POST['sop34']) ? $export_xls_product_list .= "<td align='right' style='color:#F00; mso-number-format:#\,\#\#0\.00'>".('-' . $result['prod_costs'])."</td>" : '';
	isset($_POST['sop32']) ? $export_xls_product_list .= "<td align='right' style='color:#F00; mso-number-format:#\,\#\#0\.00'>".-$result['commission']."</td>" : '';
	if ($this->config->get('adv_profit_reports_formula_sop3')) {
	isset($_POST['sop391']) ? $export_xls_product_list .= "<td align='right' style='color:#F00; mso-number-format:#\,\#\#0\.00'>".-$result['payment_cost']."</td>" : '';
	} else {
	isset($_POST['sop391']) ? $export_xls_product_list .= "<td align='right' style='mso-number-format:#\,\#\#0\.00'>".-$result['payment_cost']."</td>" : '';
	}	
	if ($this->config->get('adv_profit_reports_formula_sop2')) {
	isset($_POST['sop392']) ? $export_xls_product_list .= "<td align='right' style='color:#F00; mso-number-format:#\,\#\#0\.00'>".-$result['shipping_cost']."</td>" : '';
	} else {
	isset($_POST['sop392']) ? $export_xls_product_list .= "<td align='right' style='mso-number-format:#\,\#\#0\.00'>".-$result['shipping_cost']."</td>" : '';
	}
	isset($_POST['sop393']) ? $export_xls_product_list .= "<td align='right' style='mso-number-format:#\,\#\#0\.00'>".($result['shipping']-$result['shipping_cost'])."</td>" : '';	
	isset($_POST['sop38']) ? $export_xls_product_list .= "<td align='right' style='background-color:#ffd7d7; mso-number-format:#\,\#\#0\.00'>".('-' . $total_costs)."</td>" : '';
	isset($_POST['sop35']) ? $export_xls_product_list .= "<td align='right' style='background-color:#c4d9ee; font-weight:bold; mso-number-format:#\,\#\#0\.00'>".($total_sales-$total_costs)."</td>" : '';
	if ($total_costs > 0) {				
	isset($_POST['sop36']) ? $export_xls_product_list .= "<td align='right' style='background-color:#c4d9ee; font-weight:bold;'>".round(100 * (($total_sales-$total_costs) / $total_sales), 2) . '%'."</td>" : '';
	} else {
	isset($_POST['sop36']) ? $export_xls_product_list .= "<td align='right' style='background-color:#c4d9ee; font-weight:bold;'>".'100%'."</td>" : '';
	}							
	$export_xls_product_list .="</tr>";
	$export_xls_product_list .="<tr>";
	$export_xls_product_list .= "<td colspan='2' style='mso-ignore: colspan'></td>";
	$count = isset($_POST['sop20'])+isset($_POST['sop21'])+isset($_POST['sop22'])+isset($_POST['sop23'])+isset($_POST['sop24'])+isset($_POST['sop25'])+isset($_POST['sop27'])+isset($_POST['sop26'])+isset($_POST['sop28'])+isset($_POST['sop29'])+isset($_POST['sop30'])+isset($_POST['sop31'])+isset($_POST['sop33'])+isset($_POST['sop37'])+isset($_POST['sop34'])+isset($_POST['sop32'])+isset($_POST['sop391'])+isset($_POST['sop392'])+isset($_POST['sop393'])+isset($_POST['sop38'])+isset($_POST['sop35'])+isset($_POST['sop36']);
	$export_xls_product_list .= "<td colspan='";
	$export_xls_product_list .= $count;
	$export_xls_product_list .="' align='center'>";
		$export_xls_product_list .="<table border='1'>";
		$export_xls_product_list .="<tr>";
		isset($_POST['sop60']) ? $export_xls_product_list .= "<td align='left' style='background-color:#EFEFEF; font-weight:bold;'>".$this->language->get('column_prod_order_id')."</td>" : '';
		isset($_POST['sop61']) ? $export_xls_product_list .= "<td align='left' style='background-color:#EFEFEF; font-weight:bold;'>".$this->language->get('column_prod_date_added')."</td>" : '';
		isset($_POST['sop62']) ? $export_xls_product_list .= "<td align='left' style='background-color:#EFEFEF; font-weight:bold;'>".$this->language->get('column_prod_inv_no')."</td>" : '';
		isset($_POST['sop63']) ? $export_xls_product_list .= "<td align='left' style='background-color:#EFEFEF; font-weight:bold;'>".$this->language->get('column_prod_id')."</td>" : '';
		isset($_POST['sop64']) ? $export_xls_product_list .= "<td align='left' style='background-color:#EFEFEF; font-weight:bold;'>".$this->language->get('column_prod_sku')."</td>" : '';
		isset($_POST['sop65']) ? $export_xls_product_list .= "<td align='left' style='background-color:#EFEFEF; font-weight:bold;'>".$this->language->get('column_prod_model')."</td>" : '';		
		isset($_POST['sop66']) ? $export_xls_product_list .= "<td colspan='2' align='left' style='background-color:#EFEFEF; font-weight:bold;'>".$this->language->get('column_prod_name')."</td>" : '';
		isset($_POST['sop67']) ? $export_xls_product_list .= "<td colspan='2' align='left' style='background-color:#EFEFEF; font-weight:bold;'>".$this->language->get('column_prod_option')."</td>" : '';
		isset($_POST['sop77']) ? $export_xls_product_list .= "<td colspan='2' align='left' style='background-color:#EFEFEF; font-weight:bold;'>".$this->language->get('column_prod_attributes')."</td>" : '';		
		isset($_POST['sop68']) ? $export_xls_product_list .= "<td align='left' style='background-color:#EFEFEF; font-weight:bold;'>".$this->language->get('column_prod_manu')."</td>" : '';
		isset($_POST['sop79']) ? $export_xls_product_list .= "<td align='left' style='background-color:#EFEFEF; font-weight:bold;'>".$this->language->get('column_prod_category')."</td>" : '';
		isset($_POST['sop69']) ? $export_xls_product_list .= "<td align='right' style='background-color:#EFEFEF; font-weight:bold;'>".$this->language->get('column_prod_currency')."</td>" : '';
		isset($_POST['sop70']) ? $export_xls_product_list .= "<td align='right' style='background-color:#EFEFEF; font-weight:bold;'>".$this->language->get('column_prod_price')."</td>" : '';
		isset($_POST['sop71']) ? $export_xls_product_list .= "<td align='right' style='background-color:#EFEFEF; font-weight:bold;'>".$this->language->get('column_prod_quantity')."</td>" : '';
		isset($_POST['sop73']) ? $export_xls_product_list .= "<td align='right' style='background-color:#EFEFEF; font-weight:bold;'>".$this->language->get('column_prod_tax')."</td>" : '';
		isset($_POST['sop72']) ? $export_xls_product_list .= "<td align='right' style='background-color:#EFEFEF; font-weight:bold;'>".$this->language->get('column_prod_total')."</td>" : '';
		isset($_POST['sop74']) ? $export_xls_product_list .= "<td align='right' style='background-color:#EFEFEF; font-weight:bold;'>".$this->language->get('column_prod_costs')."</td>" : '';
		isset($_POST['sop75']) ? $export_xls_product_list .= "<td align='right' style='background-color:#EFEFEF; font-weight:bold;'>".$this->language->get('column_prod_profit')."</td>" : '';
		isset($_POST['sop76']) ? $export_xls_product_list .= "<td align='right' style='background-color:#EFEFEF; font-weight:bold;'>".$this->language->get('column_profit_margin')."</td>" : '';
		$export_xls_product_list .="</tr>";
		$export_xls_product_list .="<tr>";
		isset($_POST['sop60']) ? $export_xls_product_list .= "<td align='left' style='mso-ignore: colspan'>".$result['product_ord_idc']."</td>" : '';
		isset($_POST['sop61']) ? $export_xls_product_list .= "<td align='left' style='mso-ignore: colspan'>".$result['product_order_date']."</td>" : '';
		isset($_POST['sop62']) ? $export_xls_product_list .= "<td align='left' style='mso-ignore: colspan'>".$result['product_inv_no']."</td>" : '';
		isset($_POST['sop63']) ? $export_xls_product_list .= "<td align='left' style='mso-ignore: colspan'>".$result['product_pidc']."</td>" : '';
		isset($_POST['sop64']) ? $export_xls_product_list .= "<td align='left' style='mso-ignore: colspan'>".$result['product_sku']."</td>" : '';
		isset($_POST['sop65']) ? $export_xls_product_list .= "<td align='left' style='mso-ignore: colspan'>".$result['product_model']."</td>" : '';		
		isset($_POST['sop66']) ? $export_xls_product_list .= "<td colspan='2' align='left' style='mso-ignore: colspan'>".$result['product_name']."</td>" : '';
		isset($_POST['sop67']) ? $export_xls_product_list .= "<td colspan='2' align='left' style='mso-ignore: colspan'>".$result['product_option']."</td>" : '';
		isset($_POST['sop77']) ? $export_xls_product_list .= "<td colspan='2' align='left' style='mso-ignore: colspan'>".$result['product_attributes']."</td>" : '';		
		isset($_POST['sop68']) ? $export_xls_product_list .= "<td align='left' style='mso-ignore: colspan'>".$result['product_manu']."</td>" : '';
		isset($_POST['sop79']) ? $export_xls_product_list .= "<td align='left' style='mso-ignore: colspan'>".$result['product_category']."</td>" : '';	
		isset($_POST['sop69']) ? $export_xls_product_list .= "<td align='right' style='mso-ignore: colspan'>".$result['product_currency']."</td>" : '';
		isset($_POST['sop70']) ? $export_xls_product_list .= "<td align='right' style='mso-ignore: colspan; mso-number-format:#\,\#\#0\.00'>".$result['product_price']."</td>" : '';
		isset($_POST['sop71']) ? $export_xls_product_list .= "<td align='right' style='mso-ignore: colspan'>".$result['product_quantity']."</td>" : '';
		isset($_POST['sop73']) ? $export_xls_product_list .= "<td align='right' style='mso-ignore: colspan; mso-number-format:#\,\#\#0\.00'>".$result['product_tax']."</td>" : '';
		isset($_POST['sop72']) ? $export_xls_product_list .= "<td align='right' style='background-color:#DCFFB9; mso-ignore: colspan; mso-number-format:#\,\#\#0\.00'>".$result['product_total']."</td>" : '';
		isset($_POST['sop74']) ? $export_xls_product_list .= "<td align='right' style='background-color:#ffd7d7; mso-ignore: colspan; mso-number-format:#\,\#\#0\.00'>-".$result['product_costs']."</td>" : '';
		isset($_POST['sop75']) ? $export_xls_product_list .= "<td align='right' style='background-color:#c4d9ee; font-weight:bold; mso-ignore: colspan; mso-number-format:#\,\#\#0\.00'>".$result['product_profit']."</td>" : '';
		isset($_POST['sop76']) ? $export_xls_product_list .= "<td align='right' style='background-color:#c4d9ee; font-weight:bold; mso-ignore: colspan'>".$result['product_profit_margin_percent'] . '%'."</td>" : '';
		$export_xls_product_list .="</tr>";					
		$export_xls_product_list .="</table>";
	$export_xls_product_list .="</td>";
	$export_xls_product_list .="</tr>";					
	}
	$export_xls_product_list .="<tr>";
	$export_xls_product_list .= "<td colspan='2' style='background-color:#D8D8D8;'></td>";
	isset($_POST['sop20']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_orders')."</td>" : '';
	isset($_POST['sop21']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_customers')."</td>" : '';
	isset($_POST['sop22']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_products')."</td>" : '';
	isset($_POST['sop23']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_sub_total')."</td>" : '';
	isset($_POST['sop24']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_handling')."</td>" : '';
	isset($_POST['sop25']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_loworder')."</td>" : '';
	isset($_POST['sop27']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_shipping')."</td>" : '';	
	isset($_POST['sop26']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_reward')."</td>" : '';
	isset($_POST['sop28']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_coupon')."</td>" : '';
	isset($_POST['sop29']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_tax')."</td>" : '';
	isset($_POST['sop30']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_credit')."</td>" : '';
	isset($_POST['sop31']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_voucher')."</td>" : '';
	isset($_POST['sop33']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_total')."</td>" : '';
	isset($_POST['sop37']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_sales')."</td>" : '';	
	isset($_POST['sop34']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_prod_costs')."</td>" : '';
	isset($_POST['sop32']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_commission')."</td>" : '';
	isset($_POST['sop391']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_payment_cost')."</td>" : '';
	isset($_POST['sop392']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_shipping_cost')."</td>" : '';	
	isset($_POST['sop393']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_shipping_balance')."</td>" : '';
	isset($_POST['sop38']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_total_costs')."</td>" : '';
	isset($_POST['sop35']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_net_profit')."</td>" : '';
	isset($_POST['sop36']) ? $export_xls_product_list .= "<td align='right' style='background-color:#D8D8D8; font-weight:bold;'>".$this->language->get('column_profit_margin')."</td>" : '';					
	$export_xls_product_list .="</tr>";	
	$export_xls_product_list .="<tr>";
	$export_xls_product_list .= "<td colspan='2' align='right' style='background-color:#E7EFEF; font-weight:bold;'>".$this->language->get('text_filter_total')."</td>";
	isset($_POST['sop20']) ? $export_xls_product_list .= "<td align='right' style='background-color:#E7EFEF; color:#003A88; font-weight:bold;'>".$result['orders_total']."</td>" : '';
	isset($_POST['sop21']) ? $export_xls_product_list .= "<td align='right' style='background-color:#E7EFEF; color:#003A88; font-weight:bold;'>".$result['customers_total']."</td>" : '';
	isset($_POST['sop22']) ? $export_xls_product_list .= "<td align='right' style='background-color:#E7EFEF; color:#003A88; font-weight:bold;'>".$result['products_total']."</td>" : '';
	isset($_POST['sop23']) ? $export_xls_product_list .= "<td align='right' style='background-color:#E7EFEF; color:#003A88; font-weight:bold; mso-number-format:#\,\#\#0\.00'>".$result['sub_total_total']."</td>" : '';
	isset($_POST['sop24']) ? $export_xls_product_list .= "<td align='right' style='background-color:#E7EFEF; color:#003A88; font-weight:bold; mso-number-format:#\,\#\#0\.00'>".$result['handling_total']."</td>" : '';
	isset($_POST['sop25']) ? $export_xls_product_list .= "<td align='right' style='background-color:#E7EFEF; color:#003A88; font-weight:bold; mso-number-format:#\,\#\#0\.00'>".$result['low_order_fee_total']."</td>" : '';
	isset($_POST['sop27']) ? $export_xls_product_list .= "<td align='right' style='background-color:#E7EFEF; color:#003A88; font-weight:bold; mso-number-format:#\,\#\#0\.00'>".$result['shipping_total']."</td>" : '';
	isset($_POST['sop26']) ? $export_xls_product_list .= "<td align='right' style='background-color:#E7EFEF; color:#003A88; font-weight:bold; mso-number-format:#\,\#\#0\.00'>".$result['reward_total']."</td>" : '';
	isset($_POST['sop28']) ? $export_xls_product_list .= "<td align='right' style='background-color:#E7EFEF; color:#003A88; font-weight:bold; mso-number-format:#\,\#\#0\.00'>".$result['coupon_total']."</td>" : '';
	isset($_POST['sop29']) ? $export_xls_product_list .= "<td align='right' style='background-color:#E7EFEF; color:#003A88; font-weight:bold; mso-number-format:#\,\#\#0\.00'>".$result['tax_total']."</td>" : '';
	isset($_POST['sop30']) ? $export_xls_product_list .= "<td align='right' style='background-color:#E7EFEF; color:#003A88; font-weight:bold; mso-number-format:#\,\#\#0\.00'>".$result['credit_total']."</td>" : '';
	isset($_POST['sop31']) ? $export_xls_product_list .= "<td align='right' style='background-color:#E7EFEF; color:#003A88; font-weight:bold; mso-number-format:#\,\#\#0\.00'>".$result['voucher_total']."</td>" : '';
	isset($_POST['sop33']) ? $export_xls_product_list .= "<td align='right' style='background-color:#E7EFEF; color:#003A88; font-weight:bold; mso-number-format:#\,\#\#0\.00'>".$result['total_total']."</td>" : '';
	isset($_POST['sop37']) ? $export_xls_product_list .= "<td align='right' style='background-color:#DCFFB9; color:#003A88; font-weight:bold; mso-number-format:#\,\#\#0\.00'>".$total_sales_total."</td>" : '';
	isset($_POST['sop34']) ? $export_xls_product_list .= "<td align='right' style='background-color:#E7EFEF; color:#003A88; font-weight:bold; mso-number-format:#\,\#\#0\.00'>".('-' . $result['prod_costs_total'])."</td>" : '';
	isset($_POST['sop32']) ? $export_xls_product_list .= "<td align='right' style='background-color:#E7EFEF; color:#003A88; font-weight:bold; mso-number-format:#\,\#\#0\.00'>".-$result['commission_total']."</td>" : '';
	isset($_POST['sop391']) ? $export_xls_product_list .= "<td align='right' style='background-color:#E7EFEF; color:#003A88; font-weight:bold; mso-number-format:#\,\#\#0\.00'>".-$result['pay_costs_total']."</td>" : '';
	isset($_POST['sop392']) ? $export_xls_product_list .= "<td align='right' style='background-color:#E7EFEF; color:#003A88; font-weight:bold; mso-number-format:#\,\#\#0\.00'>".-$result['ship_costs_total']."</td>" : '';
	isset($_POST['sop393']) ? $export_xls_product_list .= "<td align='right' style='background-color:#E7EFEF; color:#003A88; font-weight:bold; mso-number-format:#\,\#\#0\.00'>".($result['shipping_total']-$result['ship_costs_total'])."</td>" : '';
	isset($_POST['sop38']) ? $export_xls_product_list .= "<td align='right' style='background-color:#ffd7d7; color:#003A88; font-weight:bold; mso-number-format:#\,\#\#0\.00'>".('-' . $total_costs_total)."</td>" : '';
	isset($_POST['sop35']) ? $export_xls_product_list .= "<td align='right' style='background-color:#c4d9ee; color:#003A88; font-weight:bold; mso-number-format:#\,\#\#0\.00'>".($total_sales_total-$total_costs_total)."</td>" : '';
	if ($total_costs_total > 0) {
	isset($_POST['sop36']) ? $export_xls_product_list .= "<td align='right' style='background-color:#c4d9ee; color:#003A88; font-weight:bold;'>".round(100 * (($total_sales_total-$total_costs_total) / $total_sales_total), 2) . '%'."</td>" : '';
	} else {
	isset($_POST['sop36']) ? $export_xls_product_list .= "<td align='right' style='background-color:#c4d9ee; color:#003A88; font-weight:bold;'>".'100%'."</td>" : '';	
	}
	$export_xls_product_list .="</tr></table>";	
	$export_xls_product_list .="</body></html>";

$filename = "sale_profit_report_product_list_".date("Y-m-d",time());
header('Expires: 0');
header('Cache-control: private');
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
header('Content-Description: File Transfer');			
header('Content-Type: application/vnd.ms-excel; charset=UTF-8; encoding=UTF-8');			
header('Content-Disposition: attachment; filename='.$filename.".xls");
header('Content-Transfer-Encoding: UTF-8');
print $export_xls_product_list;			
exit;	
?>