<?php
class ModelTotalGiftPromotion extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {
	
			$this->load->language('total/gift_promotion');
			$this->load->model('checkout/gift_promotion');
			$this->load->model('catalog/product');
			
			//print "<pre>"; print_r($this->session->data['cart']); print "</pre>";
			
			if(isset($this->session->data['gift_promotion_product'])){
				unset($this->session->data['gift_promotion_product']);
			}
			
						 
			$gift_promotion_info = $this->model_checkout_gift_promotion->getGiftPromotion();
                        
			if ($gift_promotion_info) {
		
				foreach ($gift_promotion_info as $result) { 
				
				$discount_total = 0;
				$quantity_gift = $result['quantity_gift'];
				$products_gift = $result['product_gift'];
				
				foreach($products_gift as $product_gift) {
					$product_gift_info = $this->model_catalog_product->getProduct($product_gift);
                                        
					$product_price = $this->tax->calculate($product_gift_info['price'], $product_gift_info['tax_class_id'], $this->config->get('config_tax'));
					if($product_gift_info['special']) {
					$product_price =  $this->tax->calculate($product_gift_info['special'], $product_gift_info['tax_class_id'], $this->config->get('config_tax'));
					}
					$discount_total += ($product_price*$quantity_gift);
					$products_price[$product_gift] = $product_price*$quantity_gift;
					}

				$total_promotion_gift_data[$result['gift_promotion_id']] = array(
					'code'       			   => 'gift_promotion',
					'gift_promotion_id'       => $result['gift_promotion_id'],
        			'title'                    => sprintf($this->language->get('text_gift_promotion'), $result['name']),
	    			'name'                     => $result['name'],
					'products_gift'             => $products_gift,
					'products_price'             => $products_price,
					'quantity_gift'             => $quantity_gift,
					'value'                    => $discount_total,
					'sort_order'               => $this->config->get('gift_promotion_sort_order')
					);
			}

	foreach ($total_promotion_gift_data as $key => $row) {
		$value[$key]  = $row['value'];
		}
	array_multisort($value, SORT_DESC, $total_promotion_gift_data);		
	
	//print "<pre>"; print_r($total_promotion_gift_data); print "</pre>";
	
	$cartproducts = $this->cart->getProducts();
	
	if($this->config->get('gift_promotion_multiple') == 1) {
				
	// Multiple Promotions
		foreach ($total_promotion_gift_data as $key => $row) {
			$row_value = $row['value'];
			if($row_value >= 0) {	
				foreach($row['products_gift'] as $product_gift) {
					$this->cart->add($product_gift, $row['quantity_gift'], array(), 0);
					$gift_product_price = $this->currency->format(-$row['products_price'][$product_gift]);
					$this->session->data['gift_promotion_product'][$product_gift][] = array("product_id"=>$product_gift,"product_quantity"=>$row['quantity_gift'],"product_price"=>$gift_product_price,"name"=>$row['title']);
				}
				$this->session->data['gift_promotion'][] = $row['gift_promotion_id'];	
				if($row_value > 0 & ($total >= $row_value)) {		
					$total_data[] = array(
						'code'       => $row['code'],
						'title'      => $row['title'],
						'text'       => $this->currency->format(-$row_value),
						'value'      => $row_value,
						'sort_order' => $row['sort_order']
						);
						
					$total -= $row_value;
					}
				}
			}
	}
	else {
		// Single Promotion
		$row_value = $total_promotion_gift_data[0]['value'];
                
			if($row_value >= 0) {	
				foreach($total_promotion_gift_data[0]['products_gift'] as $product_gift) {
					$option = 0;
					$prodfile_id = 0;
                                        
					//$this->cart->add($product_gift, $total_promotion_gift_data[0]['quantity_gift'], $option, $prodfile_id);
					//if((!($this->request->get['route'] == 'checkout/cart')) && (!($this->request->get['route'] == 'module/cart')) && (!($this->request->get['route'] == 'checkout/checkout')) && (!($this->request->get['route'] == 'checkout/payment_method')) && (!($this->request->get['route'] == 'checkout/guest')) && (!($this->request->get['route'] == 'checkout/guest_shipping')) && (!($this->request->get['route'] == 'checkout/login')) && (!($this->request->get['route'] == 'checkout/payment_address')) && (!($this->request->get['route'] == 'checkout/register')) && (!($this->request->get['route'] == 'checkout/shipping_address')) && (!($this->request->get['route'] == 'checkout/shipping_method')) && (!($this->request->get['route'] == 'checkout/manual')) && (!($this->request->get['route'] == 'checkout/confirm')) && (!($this->request->get['route'] == 'checkout/success'))) {
						$this->cart->add($product_gift, $total_promotion_gift_data[0]['quantity_gift'], array(), 0);
						$gift_product_price = $this->currency->format(-$total_promotion_gift_data[0]['products_price'][$product_gift]);
						$this->session->data['gift_promotion_product'][$product_gift] = array("product_id"=>$product_gift,"product_quantity"=>$total_promotion_gift_data[0]['quantity_gift'],"product_price"=>$gift_product_price,"name"=>$total_promotion_gift_data[0]['title']);
					//}
				}
				$this->session->data['gift_promotion'][] = $total_promotion_gift_data[0]['gift_promotion_id'];
				if($row_value > 0 & ($total >= $row_value)) {		
					$total_data[] = array(
							'code'       => $total_promotion_gift_data[0]['code'],
							'title'      => $total_promotion_gift_data[0]['title'],
							'text'       => $this->currency->format(-$row_value),
							'value'      => $row_value,
							'sort_order' => $total_promotion_gift_data[0]['sort_order']
						);
						
						$total -= $row_value;
						$this->session->data['total_discount'] = 1;
						
					}
				} 
			}
		}

		if(isset($this->session->data['total_discount'])) {
			//$total -= $this->session->data['total_discount'];
		}
	} 
	
		
	public function confirm($order_info, $order_total) {
		$code = '';
		
		$start = strpos($order_total['title'], '(') + 1;
		$end = strrpos($order_total['title'], ')');
		
		if ($start && $end) {  
			$code = substr($order_total['title'], $start, $end - $start);
		}	
		
		$this->load->model('checkout/gift_promotion');
		
		$gift_promotion_id = $this->model_checkout_gift_promotion->getGiftPromotionId($code);
		
		if ($gift_promotion_id) {
			$this->model_checkout_gift_promotion->redeem($gift_promotion_id, $order_info['order_id'], $order_info['customer_id'], $order_total['value']);	
		    }						
	    }
		
}
?>
