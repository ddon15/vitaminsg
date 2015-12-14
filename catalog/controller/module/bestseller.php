<?php
class ControllerModuleBestSeller extends Controller {
	protected function index($setting) {
		$this->language->load('module/bestseller');

		$this->data['heading_title'] = sprintf($this->language->get('heading_titles'), $this->url->link('sale/bestsellers', '', 'SSL'));

		// Custom CSS Settings
        $this->load->model('setting/custom');
		
		$text_sale_custom = $this->model_setting_custom->getSaleText('SALE_LABEL');
		// End of Custom CSS Settings 
		
		$this->data['text_sale'] = $text_sale_custom['enabled'] ? $text_sale_custom['text'] : $this->language->get('text_sale');
		
		//[SB] Added texts
		$this->data['text_price_usual'] = $this->language->get('text_price_usual');
		$this->data['text_price_member'] = $this->language->get('text_price_member');
		$this->data['text_promo'] = $this->language->get('text_promo');
				
		$this->data['button_cart'] = $this->language->get('button_cart');
		
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');

		//[SB] Get inserted products
		$products_insert_ids = explode(',', $this->config->get('bestseller_product'));
		
		$products_insert = $this->cache->get('product.bestseller.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.insert');
		
		if (!$products_insert) {
			$products_insert = array();
			foreach ($products_insert_ids as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);
				
				if ($product_info) {
					$products_insert[] = $product_info;
				}
			}
			
			$this->cache->set('product.bestseller.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'). '.insert', $products_insert);
		}
		
		$this->data['products'] = array();

		$results = $this->model_catalog_product->getBestSellerProducts($setting['limit'], $products_insert_ids); //[SB] minus count of inserted products
		
		//[SB] merge inserted products into result
		//TODO: Remove insert if it is already a bestseller?
		$results = array_merge($products_insert, $results);
		
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
				//'name'    	 => $result['name'],
				'name'    	 => strlen($result['name']) > 70 ? substr($result['name'],0,70)." ..." : $result['name'],
				'price'   	 => $price,
				'special' 	 => $special,
				'premium_member_price' 	 => $premium_member_price, //[SB]Add member price
				'is_on_promo' => $isOnPromo, //[SB]Add is on promo
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/bestseller.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/bestseller.tpl';
		} else {
			$this->template = 'default/template/module/bestseller.tpl';
		}

		$this->render();
	}
}
?>