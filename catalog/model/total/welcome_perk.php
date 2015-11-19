<?php
class ModelTotalWelcomePerk extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {

		if ($this->cart->isFirstOrder()) {
		
			$this->language->load('total/welcome_perk');
			
			$discount_total = 0;
			$welcome_discount = 0;//($this->config->get('welcome_perk_discount_percent') - 10) / 100
			if($welcome_discount < 0) {
				return;
			}
			
			foreach ($this->cart->getProducts() as $product) {
				
				if($product['is_on_sale'] || $product['is_on_special_promo']) {
					continue;
				}
				
				$discount_total += $product['usual_total'] * $welcome_discount;
			}

			/*$total_data[] = array(
				'code'       => 'welcome_perk',
				'title'      => sprintf($this->language->get('text_welcome_perk'), $this->config->get('welcome_perk_discount_percent')),
				'text'       => $this->currency->format(-$discount_total),
				'value'      => -$discount_total,
				'sort_order' => $this->config->get('welcome_perk_sort_order')
			);*/

			$total -= $discount_total;
		}
	}
}
?>