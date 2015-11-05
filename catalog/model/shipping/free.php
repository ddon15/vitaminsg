<?php
class ModelShippingFree extends Model {
	function getQuote($address) {
		$this->language->load('shipping/free');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('free_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if (!$this->config->get('free_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		if ($this->cart->getSubTotal() < $this->config->get('free_total')) {
			$status = false;
		}
		//[SB] Take coupon discount into account for free shipping
		else if ((isset($this->session->data['coupon']) && ($this->session->data['coupon'] != '')) &&
			(isset($this->session->data['coupon_discount']) && ($this->session->data['coupon_discount'] != ''))) {

			$coupon_discount = $this->session->data['coupon_discount'];
                        
			if ($this->cart->getSubTotal() < ($this->config->get('free_total') + $coupon_discount)) {
				$status = false;
			}
		}
                //[MY] Take promotions discount into account for free shipping
                if(isset($this->session->data['special_promotions_select'])){
                    
					if(!empty( $this->session->data['promotions_discount_total'])){
						$promotions_discount_total = $this->session->data['promotions_discount_total'];
                    
						if ($this->cart->getSubTotal() < ($this->config->get('free_total') + $promotions_discount_total)) {
							$status = false;
						}
					}
                    
                }

		$method_data = array();

		if ($status) {
			$quote_data = array();

			$quote_data['free'] = array(
				'code'         => 'free.free',
				'title'        => sprintf($this->language->get('text_description'),$this->config->get('free_total')),
				'cost'         => 0.00,
				'tax_class_id' => 0,
				'text'         => $this->currency->format(0.00)
			);

			$method_data = array(
				'code'       => 'free',
				'title'      => $this->language->get('text_title'),
				'quote'      => $quote_data,
				'sort_order' => $this->config->get('free_sort_order'),
				'error'      => false
			);
		}

		return $method_data;
	}
}
?>
