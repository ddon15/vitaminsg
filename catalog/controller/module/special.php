<?php
class ControllerModuleSpecial extends Controller {
	protected function index($setting) {
		$this->language->load('module/special');

		$this->data['heading_title'] = sprintf($this->language->get('heading_title'), $this->url->link('product/special', '', 'SSL'));

		$this->data['button_cart'] = $this->language->get('button_cart');
	
		$this->data['text_sale'] = $this->language->get('text_sale');
		
		//[SB] Added texts
		$this->data['text_price_usual'] = $this->language->get('text_price_usual');
		$this->data['text_price_member'] = $this->language->get('text_price_member');
		$this->data['text_promo'] = $this->language->get('text_promo');
		
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');

		$this->data['products'] = array();
		
		//[SB] Changed to sort by sort order
		$data = array(
			//'sort'  => 'pd.name',
			'sort'  => 'p.sort_order',
			'order' => 'ASC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		$results = $this->model_catalog_product->getProductSpecialsAndPromos($data);

		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = false;
			}
			
		$swapimages = $this->model_catalog_product->getProductImages($result['product_id']);
			if ($swapimages) {
				$swapimage = $this->model_tool_image->resize($swapimages[0]['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$swapimage = false;
			} 

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
					
			if ((float)$result['special']) { 
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}
			
			//[SB]Get member price
			//TODO: merge query into getProduct
			$premium_member_price_data = $this->model_catalog_product->getPremiumMemberPrice($result['product_id']);
			if ($premium_member_price_data && (float)$premium_member_price_data['price']) {
				$premium_member_price = $this->currency->format($this->tax->calculate($premium_member_price_data['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			    $this->data['premium_member_percent_savings'] = round((($result['price'] - $premium_member_price_data['price']) / $result['price'] * 100));
			} else {
				$premium_member_price = false;
			}
			
			//[SB]Get is on promo
			//TODO: merge query into getProduct
			if($this->model_catalog_product->isOnPromo($result['product_id'])) {
				$isOnPromo = true;
			}
			else {
				$isOnPromo = false;
			}
			
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
			} else {
				$rating = false;
			}
			
			$this->data['products'][] = array(
				'product_id' => $result['product_id'],
				'thumb'   	 => $image,
				'thumb_swap' => $swapimage,
				//'name'    	 => $result['name'], [SB] Truncate name if too long
				'name'    	 => strlen($result['name']) > 70 ? substr($result['name'],0,70)." ..." : $result['name'],
				'price'   	 => $price,
				'is_packed'   => $result['no_bottles'] > 1 ? 1 : 0,
				'no_bottles'  => $result['no_bottles'],
				'special' 	 => $special,
				'premium_member_price' 	 => $premium_member_price, //[SB]Add member price
				'is_on_promo' => $isOnPromo, //[SB]Add is on promo
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id'])
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/special.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/special.tpl';
		} else {
			$this->template = 'default/template/module/special.tpl';
		}

		$this->render();
	}
}
?>