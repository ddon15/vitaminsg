<?php
class ModelTotalCoupon extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {
        //[MY] Special Promotions
        if ($this->config->get('special_promotions_key') &&
            $this->config->get('special_promotions_status') &&
            $this->config->get('special_promotions_disable_oc_coupons') &&
            isset($this->session->data['coupon']) &&
            !empty($this->session->data['special_promotions'])) {
                unset($this->session->data['coupon']);
        }//.[MY]
        
		if (isset($this->session->data['coupon'])) {
			$this->language->load('total/coupon');

			$this->load->model('checkout/coupon');

			$coupon_info = $this->model_checkout_coupon->getCoupon($this->session->data['coupon']);

			if ($coupon_info) {

				$discount_total = 0;
				$applied_to = null;

				if (!$coupon_info['product']) {
					$sub_total = $this->cart->getSubTotal();
				} else {
					$sub_total = 0;

					foreach ($this->cart->getProducts() as $product) {
						if (in_array($product['product_id'], $coupon_info['product'])) {
							$sub_total += $product['total'];
						}
					}					
				}

				if ($coupon_info['type'] == 'F') {
					$coupon_info['discount'] = min($coupon_info['discount'], $sub_total);	
				}

				$this->load->model('premium_member/db'); //[SB] load premium member db
				$is_member = ($this->customer->isLogged() &&
								$this->model_premium_member_db->isPremiumMember($this->customer->getEmail()));
				
				foreach ($this->cart->getProducts() as $product) {
					$this->load->model('promotion/special_promotions');
                    $sale_promo_product = $this->model_promotion_special_promotions->checkProductOnPromotion($product['product_id']);
                                        
                    $sales_promo_status = false;
                    if(!empty($sale_promo_product)){
                    	$sales_promo_status = true;
                    }
				
					$discount = 0;
					
					//[SB] Added Exclude
					if(in_array($product['product_id'], $coupon_info['product_exclude'])) {
						$status = false;
					}
					else {
						if (!$coupon_info['product']) {
							$status = true;
						} else {
							if (in_array($product['product_id'], $coupon_info['product'])) {
								$status = true;
							} else {
								$status = false;
							}
						}
					}

					if ($status) {
						if ($coupon_info['type'] == 'F') {
							$discount = $coupon_info['discount'] * ($product['total'] / $sub_total);
						} elseif ($coupon_info['type'] == 'P') { // && $product['is_on_sale'] == false) { //[SB] Skip product if it is already on sale

							//$discount = $product['total'] / 100 * $coupon_info['discount'];
							/*
							$coupon_discount = $coupon_info['discount'];
							if($is_member) {
								$coupon_discount = $coupon_info['discount'] - 10; // take away members discount
								if($coupon_discount < 0) {
									$coupon_discount = 0; // no more discount if member discount is bigger
								}
							} else {
								$coupon_discount = $coupon_info['discount'];
							}
							*/
							
							//[SB] account for promo discount and member discount
							$percentage_discount = (1 - ($product['total'] / $product['usual_total'])) * 100;
							if($coupon_info['discount'] > $percentage_discount) {
								$coupon_discount = $coupon_info['discount'] - $percentage_discount;
							}
							else {
								$coupon_discount = 0; //already discounted
							}

							//$discount = $product['usual_total'] / 100 * $coupon_info['discount']; //[SB] Use usual total instead of member total
							$discount = $product['usual_total'] / 100 * $coupon_discount; //[SB] Use discount that has already accounted for member discount
						}
						if ($product['tax_class_id']) {
							$tax_rates = $this->tax->getRates($product['total'] - ($product['total'] - $discount), $product['tax_class_id']);

							foreach ($tax_rates as $tax_rate) {
								if ($tax_rate['type'] == 'P') {
									$taxes[$tax_rate['tax_rate_id']] -= $tax_rate['amount'];
								}
							}
						}
					}

					$discount_total += $discount;

					//[SB] Added Member Price coupon
					if ($coupon_info['type'] == 'M') {
						$this->load->model('catalog/product');
						$premium_member_price_data = $this->model_catalog_product->getPremiumMemberPrice($product['product_id']);
						$discount_total += ($product['price'] - $premium_member_price_data['price']) * $product['quantity'];
					}
				}

				if ($coupon_info['shipping'] && isset($this->session->data['shipping_method'])) {
					if (!empty($this->session->data['shipping_method']['tax_class_id'])) {
						$tax_rates = $this->tax->getRates($this->session->data['shipping_method']['cost'], $this->session->data['shipping_method']['tax_class_id']);

						foreach ($tax_rates as $tax_rate) {
							if ($tax_rate['type'] == 'P') {
								$taxes[$tax_rate['tax_rate_id']] -= $tax_rate['amount'];
							}
						}
					}

					$discount_total += $this->session->data['shipping_method']['cost'];
				}

				$total_data[] = array(
					'code'       => 'coupon',
					'title'      => sprintf($this->language->get('text_coupon'), $this->session->data['coupon']),
					'text'       => $this->currency->format(-$discount_total),
					'value'      => -$discount_total,
					'sort_order' => $this->config->get('coupon_sort_order')
				);

				$total -= $discount_total;

			} 
		}
	}

	public function confirm($order_info, $order_total) {
		$code = '';

		$start = strpos($order_total['title'], '(') + 1;
		$end = strrpos($order_total['title'], ')');

		if ($start && $end) {  
			$code = substr($order_total['title'], $start, $end - $start);
		}	

		$this->load->model('checkout/coupon');

		$coupon_info = $this->model_checkout_coupon->getCoupon($code);

		if ($coupon_info) {
			$this->model_checkout_coupon->redeem($coupon_info['coupon_id'], $order_info['order_id'], $order_info['customer_id'], $order_total['value']);	
		}						
	}
}
?>