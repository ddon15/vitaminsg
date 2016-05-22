<?php 
class ControllerSaleBestsellers extends Controller
{
	public function index()
	{
		$this->language->load('module/bestseller');
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->data['breadcrumbs'] = array();
		$url = '';
		
		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
      		'separator' => false
   		);
		
		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('sale/bestsellers', $url),
      		'separator' => $this->language->get('text_separator')
   		);
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		
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

		$results = $this->model_catalog_product->getBestSellerProducts(12, $products_insert_ids); //[SB] minus count of inserted products
		
		//[SB] merge inserted products into result
		$results = array_merge($products_insert, $results);

		$this->data['text_sale'] = $this->language->get('text_sale');
		
		//[SB] Added texts
		$this->data['text_price_usual'] = $this->language->get('text_price_usual');
		$this->data['text_price_member'] = $this->language->get('text_price_member');
		$this->data['text_promo'] = $this->language->get('text_promo');
		
		$this->data['button_cart'] = $this->language->get('button_cart');
		$this->data['button_wishlist'] = $this->language->get('button_wishlist');
		$this->data['button_compare'] = $this->language->get('button_compare');
		
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			} else {
				$image = false;
			}
			
		$swapimages = $this->model_catalog_product->getProductImages($result['product_id']);
			if ($swapimages) {
				$swapimage = $this->model_tool_image->resize($swapimages[0]['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
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
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'	
		);
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/sale/bestsellers.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/sale/bestsellers.tpl';
		} else {
			$this->template = 'default/template/sale/bestsellers.tpl';
		}
		
		$this->response->setOutput($this->render());
	}
}