<?php
class ModelTotalReward extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {
		if (isset($this->session->data['reward'])) {
			$this->language->load('total/reward');

			$points = $this->customer->getRewardPoints();

			if ($this->session->data['reward'] <= $points) {
				$discount_total = 0;

				$points_total = 0;
				$points_total_exc_redeem = 0;

				foreach ($this->cart->getProducts() as $product) {
					if ($product['points']) {
						$points_total += $product['points'];
						//[SB] Redemption, exclude redeem only product from calculation
						if(!$product['redeem_only']) {
							$points_total_exc_redeem += $product['points'];
						}
					}
				}	

				$points = min($points, $points_total);
				
				//[SB] Added Redemption
				// Do not include redeemed points in the calculation of money discounted
				$points_redeemed = $this->session->data['reward'];
				if($this->session->data['redeem_total'] > 0) {
					$points_redeemed -= $this->session->data['redeem_total'];
				}

				if($points_redeemed <= 0) { //[SB] Added Redemption: check if there are remaining Vit$ to get discount
					$discount_total = 0;
				}
				else {
					foreach ($this->cart->getProducts() as $product) {
						$discount = 0;

						if ($product['points']) {
							$discount = $product['total'] * ($points_redeemed / $points_total_exc_redeem);
	//echo '<br>discount = ' . $product['total'] . ' * (' . $this->session->data['reward'] . ' / ' . $points_total . ') = ' . $discount;
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
					}
				}

				$total_data[] = array(
					'code'       => 'reward',
					'title'      => sprintf($this->language->get('text_reward'), $this->session->data['reward']),
					'text'       => $this->currency->format(-$discount_total),
					'value'      => -$discount_total,
					'sort_order' => $this->config->get('reward_sort_order')
				);

				$total -= $discount_total;
			} 
		}
	}

	public function confirm($order_info, $order_total) {
		$this->language->load('total/reward');

		$points = 0;

		$start = strpos($order_total['title'], '(') + 1;
		$end = strrpos($order_total['title'], ')');

		if ($start && $end) {  
			$points = substr($order_total['title'], $start, $end - $start);
		}	

		if ($points) {
			//[SB] Changed description to order confirmation
			/*$invoice = $order_info['invoice_prefix'] . sprintf('%04d', $order_info['invoice_no']);
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer_reward SET customer_id = '" . (int)$order_info['customer_id'] . "', description = '" . $this->db->escape(sprintf($this->language->get('text_order_confirmation'), $invoice)) . "', points = '" . (float)-$points . "', date_added = NOW()");*/
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer_reward SET customer_id = '" . (int)$order_info['customer_id'] . "', description = '" . $this->db->escape(sprintf($this->language->get('text_order_id'), (int)$order_info['order_id'])) . "', points = '" . (float)-$points . "', date_added = NOW()");
		}
	}		
}
?>