<?php
ini_set("memory_limit","256M");

	$export_html_all_details ="<html><head>";
	$export_html_all_details .="<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>";
	$export_html_all_details .="</head>";
	$export_html_all_details .="<body>";
	$export_html_all_details .="<style type='text/css'>
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
	$export_html_all_details .="<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
	$export_html_all_details .="<tr><td>";	
	foreach ($results as $result) {	
	if ($result['product_pidc']) {	
	$export_html_all_details .="<table class='list_detail' style='border-bottom:2px solid #999; border-top:2px solid #999'>";
	$export_html_all_details .="<thead>";
	$export_html_all_details .="<tr>";
	$export_html_all_details .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_order_order_id')."</td>";
	$export_html_all_details .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_order_date_added')."</td>";
	isset($_POST['cop1000']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_order_inv_no')."</td>" : '';
	isset($_POST['cop1001']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_order_customer')."</td>" : '';	
	isset($_POST['cop1002']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_order_email')."</td>" : '';
	isset($_POST['cop1003']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_order_customer_group')."</td>" : '';
	isset($_POST['cop1040']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_order_shipping_method')."</td>" : '';
	isset($_POST['cop1041']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_order_payment_method')."</td>" : '';
	isset($_POST['cop1042']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_order_status')."</td>" : '';
	isset($_POST['cop1043']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_order_store')."</td>" : '';
	isset($_POST['cop1012']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_order_currency')."</td>" : '';
	isset($_POST['cop1062']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_order_quantity')."</td>" : '';	
	isset($_POST['cop1020']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_order_sub_total')."</td>" : '';
	isset($_POST['cop1023']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_order_shipping')."</td>" : '';
	isset($_POST['cop1027']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_order_tax')."</td>" : '';
	isset($_POST['cop1031']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_order_value')."</td>" : '';
	isset($_POST['cop1032']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_order_sales')."</td>" : '';
	isset($_POST['cop1037']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_order_costs')."</td>" : '';
	isset($_POST['cop1038']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_order_profit')."</td>" : '';
	isset($_POST['cop1039']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_profit_margin')."</td>" : '';	
	$export_html_all_details .="</tr>";
	$export_html_all_details .="</thead>";
	$export_html_all_details .="<tbody><tr>";
	$export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['order_ord_idc']."</td>";
	$export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['order_order_date']."</td>";
	isset($_POST['cop1000']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['order_inv_no']."</td>" : '';
	isset($_POST['cop1001']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['order_name']."</td>" : '';	
	isset($_POST['cop1002']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['order_email']."</td>" : '';
	isset($_POST['cop1003']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['order_group']."</td>" : '';
	isset($_POST['cop1040']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".strip_tags($result['order_shipping_method'], '<br>')."</td>" : '';
	isset($_POST['cop1041']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".strip_tags($result['order_payment_method'], '<br>')."</td>" : '';
	isset($_POST['cop1042']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['order_status']."</td>" : '';
	isset($_POST['cop1043']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['order_store']."</td>" : '';
	isset($_POST['cop1012']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['order_currency']."</td>" : '';
	isset($_POST['cop1062']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['order_products']."</td>" : '';	
	isset($_POST['cop1020']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['order_sub_total']."</td>" : '';
	isset($_POST['cop1023']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['order_shipping']."</td>" : '';
	isset($_POST['cop1027']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['order_tax']."</td>" : '';
	isset($_POST['cop1031']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['order_value']."</td>" : '';
	isset($_POST['cop1032']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap' style='background-color:#DCFFB9;'>".$result['order_sales']."</td>" : '';
	isset($_POST['cop1037']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap' style='background-color:#ffd7d7;'>-".$result['order_costs']."</td>" : '';
	isset($_POST['cop1038']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap' style='background-color:#c4d9ee; font-weight:bold;'>".$result['order_profit']."</td>" : '';
	isset($_POST['cop1039']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap' style='background-color:#c4d9ee; font-weight:bold;'>".$result['order_profit_margin_percent']."</td>" : '';	
	$export_html_all_details .="</tr>";	
	$export_html_all_details .="<tr>";
	$export_html_all_details .="<td colspan='2'></td><td colspan='18'>";
	$export_html_all_details .="<table class='list_detail'>";
	$export_html_all_details .="<thead>";
	$export_html_all_details .="<tr>";
	isset($_POST['cop1004']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_prod_id')."</td>" : '';
	isset($_POST['cop1005']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_prod_sku')."</td>" : '';
	isset($_POST['cop1006']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_prod_model')."</td>" : '';	
	isset($_POST['cop1007']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_prod_name')."</td>" : '';
	isset($_POST['cop1008']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_prod_option')."</td>" : '';
	isset($_POST['cop1009']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_prod_attributes')."</td>" : '';	
	isset($_POST['cop1010']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_prod_manu')."</td>" : '';	
	isset($_POST['cop1011']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_prod_category')."</td>" : '';		
	isset($_POST['cop1013']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_prod_price')."</td>" : '';
	isset($_POST['cop1014']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_prod_quantity')."</td>" : '';
	isset($_POST['cop1015']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_prod_tax')."</td>" : '';		
	isset($_POST['cop1016']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_prod_total')."</td>" : '';
	isset($_POST['cop1017']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_prod_costs')."</td>" : '';	
	isset($_POST['cop1018']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_prod_profit')."</td>" : '';	
	isset($_POST['cop1019']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_profit_margin')."</td>" : '';
	$export_html_all_details .="</tr>";
	$export_html_all_details .="</thead>";
	$export_html_all_details .="<tr>";
	isset($_POST['cop1004']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['product_pidc']."</td>" : '';
	isset($_POST['cop1005']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['product_sku']."</td>" : '';
	isset($_POST['cop1006']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['product_model']."</td>" : '';	
	isset($_POST['cop1007']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['product_name']."</td>" : '';
	isset($_POST['cop1008']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['product_option']."</td>" : '';
	isset($_POST['cop1009']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['product_attributes']."</td>" : '';
	isset($_POST['cop1010']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['product_manu']."</td>" : '';	
	isset($_POST['cop1011']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['product_category']."</td>" : '';
	isset($_POST['cop1013']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['product_price']."</td>" : '';
	isset($_POST['cop1014']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['product_quantity']."</td>" : '';
	isset($_POST['cop1015']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['product_tax']."</td>" : '';	
	isset($_POST['cop1016']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap' style='background-color:#DCFFB9;'>".$result['product_total']."</td>" : '';
	isset($_POST['cop1017']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap' style='background-color:#ffd7d7;'>-".$result['product_costs']."</td>" : '';
	isset($_POST['cop1018']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap' style='background-color:#c4d9ee; font-weight:bold;'>".$result['product_profit']."</td>" : '';
	isset($_POST['cop1019']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap' style='background-color:#c4d9ee; font-weight:bold;'>".$result['product_profit_margin_percent']."</td>" : '';
	$export_html_all_details .="</tr>";	
	$export_html_all_details .="</table>";
	$export_html_all_details .="<table class='list_detail'>";
	$export_html_all_details .="<thead>";
	$export_html_all_details .="<tr>";
	isset($_POST['cop1044']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_customer_cust_id'))."</td>" : '';
	isset($_POST['cop1045']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_billing_name'))."</td>" : '';	
	isset($_POST['cop1046']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_billing_company'))."</td>" : '';
	isset($_POST['cop1047']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_billing_address_1'))."</td>" : '';
	isset($_POST['cop1048']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_billing_address_2'))."</td>" : '';
	isset($_POST['cop1049']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_billing_city'))."</td>" : '';
	isset($_POST['cop1050']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_billing_zone'))."</td>" : '';
	isset($_POST['cop1051']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_billing_postcode'))."</td>" : '';
	isset($_POST['cop1052']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_billing_country'))."</td>" : '';
	isset($_POST['cop1053']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_customer_telephone')."</td>" : '';
	isset($_POST['cop1054']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_shipping_name'))."</td>" : '';
	isset($_POST['cop1055']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_shipping_company'))."</td>" : '';
	isset($_POST['cop1056']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_shipping_address_1'))."</td>" : '';
	isset($_POST['cop1057']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_shipping_address_2'))."</td>" : '';
	isset($_POST['cop1058']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_shipping_city'))."</td>" : '';
	isset($_POST['cop1059']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_shipping_zone'))."</td>" : '';
	isset($_POST['cop1060']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_shipping_postcode'))."</td>" : '';
	isset($_POST['cop1061']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_shipping_country'))."</td>" : '';	
	$export_html_all_details .="</tr>";
	$export_html_all_details .="</thead>";
	$export_html_all_details .="<tr>";
	isset($_POST['cop1044']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['customer_cust_idc']."</td>" : '';
	isset($_POST['cop1045']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['billing_name']."</td>" : '';
	isset($_POST['cop1046']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['billing_company']."</td>" : '';
	isset($_POST['cop1047']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['billing_address_1']."</td>" : '';
	isset($_POST['cop1048']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['billing_address_2']."</td>" : '';
	isset($_POST['cop1049']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['billing_city']."</td>" : '';
	isset($_POST['cop1050']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['billing_zone']."</td>" : '';
	isset($_POST['cop1051']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['billing_postcode']."</td>" : '';
	isset($_POST['cop1052']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['billing_country']."</td>" : '';
	isset($_POST['cop1053']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['customer_telephone']."</td>" : '';
	isset($_POST['cop1054']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['shipping_name']."</td>" : '';
	isset($_POST['cop1055']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['shipping_company']."</td>" : '';
	isset($_POST['cop1056']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['shipping_address_1']."</td>" : '';
	isset($_POST['cop1057']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['shipping_address_2']."</td>" : '';
	isset($_POST['cop1058']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['shipping_city']."</td>" : '';
	isset($_POST['cop1059']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['shipping_zone']."</td>" : '';
	isset($_POST['cop1060']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['shipping_postcode']."</td>" : '';
	isset($_POST['cop1061']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['shipping_country']."</td>" : '';	
	$export_html_all_details .="</tr>";	
	$export_html_all_details .="</table>";
	$export_html_all_details .="</td></tr>";	
	$export_html_all_details .="</tbody></table>";	
	}
	}
	$export_html_all_details .="</td></tr>";	
	$export_html_all_details .="</table>";	
	$export_html_all_details .="</body></html>";

$filename = "customer_profit_report_all_details_".date("Y-m-d",time());
header('Expires: 0');
header('Cache-control: private');
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
header('Content-Description: File Transfer');			
header('Content-Disposition: attachment; filename='.$filename.".html");
print $export_html_all_details;			
exit;		
?>