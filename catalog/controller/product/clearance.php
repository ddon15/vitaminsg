<?php
class ControllerProductClearance extends Controller {
	public function index() {
		$this->language->load('product/clearance'); 

      	$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_sale'] = $this->language->get('text_sale');
		$this->data['text_empty'] = $this->language->get('text_empty');
		$this->data['text_expiry'] = $this->language->get('text_expiry');
		$this->data['button_cart'] = $this->language->get('button_cart');
		$this->data['button_wishlist'] = $this->language->get('button_wishlist');
		$this->data['button_compare'] = $this->language->get('button_compare');
		
		//[SB] Added usual and member
		$this->data['text_price_usual'] = $this->language->get('text_price_usual');
		$this->data['text_price_member'] = $this->language->get('text_price_member');
		
		
		$this->data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		$this->data['text_display'] = $this->language->get('text_display');
		$this->data['text_list'] = $this->language->get('text_list');
		$this->data['text_grid'] = $this->language->get('text_grid');
		$this->data['text_sort'] = $this->language->get('text_sort');
		$this->data['text_limit'] = $this->language->get('text_limit');
		
		$this->load->model('catalog/product');
		$this->load->model('catalog/clearance_products');
		$this->load->model('tool/image');

		$this->data['products'] = array();

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
				
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
							
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_catalog_limit');
		}
		
		$data = array(
			'sort'               => $sort,
			'order'              => $order,
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit
		);
		
		$products = $this->model_catalog_clearance_products->getClearanceProducts($data);
		
		//$products_total = count($products);
		$products_total = $this->model_catalog_clearance_products->getTotal();

		//$products = array_slice($products, ($page - 1) * $limit, $limit);
		
		$this->document->setTitle($this->language->get('heading_title'));

		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
      		'separator' => false
   		);
		
		foreach ($products as $clearance_product) {
			$product_info = $clearance_product;
	
			if ($clearance_product['product_id'] && $clearance_product) {
				if ($clearance_product['image']) {
					$image = $this->model_tool_image->resize($clearance_product['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				} else {
					$image = false;
				}
				
		    $swapimages = $this->model_catalog_product->getProductImages($clearance_product['product_id']);
			    if ($swapimages) {
			    	$swapimage = $this->model_tool_image->resize($swapimages[0]['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			    } else {
			    	$swapimage = false;
		    	}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($clearance_product['price'], $clearance_product['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$clearance_product['special']) {
					$special = $this->currency->format($this->tax->calculate($clearance_product['special'], $clearance_product['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
				//[SB]Get member price
				$premium_member_price_data = $this->model_catalog_product->getPremiumMemberPrice($clearance_product['product_id']);
				if ($premium_member_price_data && (float)$premium_member_price_data['price']) {
					$premium_member_price = $this->currency->format($this->tax->calculate($premium_member_price_data['price'], $clearance_product['tax_class_id'], $this->config->get('config_tax')));
					$this->data['premium_member_percent_savings'] = round((($clearance_product['price'] - $premium_member_price_data['price']) / $clearance_product['price'] * 100));
				} else {
					$premium_member_price = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = $clearance_product['rating'];
				} else {
					$rating = false;
				}
					
				$this->data['products'][] = array(
					'product_id' => $clearance_product['product_id'],
					'date_expiry' => date($this->language->get('date_format_short'), strtotime($clearance_product['date_expiry'])),
					'thumb'   	 => $image,
					'thumb_swap' => $swapimage,
					'name'    	 => strlen($clearance_product['name']) > 70 ? substr($clearance_product['name'],0,70)." ..." : $clearance_product['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($clearance_product['description'], ENT_QUOTES, 'UTF-8')), 0, 250) . '..',
					'price'   	 => $price,
					'is_packed'   => $result['no_bottles'] > 1 ? 1 : 0,
					'no_bottles'  => $result['no_bottles'],
					'special' 	 => $special,
					'premium_member_price' 	 => $premium_member_price, //[SB]Add member price
					'rating'     => $rating,
					'href'    	 => $this->url->link('product/product', 'product_id=' . $clearance_product['product_id'])
				);
			}
		}
		
		$url = '';
		
		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
			
		$this->data['sorts'] = array();
		
		$this->data['sorts'][] = array(
			'text'  => $this->language->get('text_default'),
			'value' => 'sort_order-ASC',
			'href'  => $this->url->link('product/clearance', $url . '&sort=sort_order&order=ASC')
		);
		
		$this->data['sorts'][] = array(
			'text'  => $this->language->get('text_name_asc'),
			'value' => 'name-ASC',
			'href'  => $this->url->link('product/clearance', $url . '&sort=name&order=ASC')
		);

		$this->data['sorts'][] = array(
			'text'  => $this->language->get('text_name_desc'),
			'value' => 'name-DESC',
			'href'  => $this->url->link('product/clearance', $url . '&sort=name&order=DESC')
		);

		$this->data['sorts'][] = array(
			'text'  => $this->language->get('text_price_asc'),
			'value' => 'price-ASC',
			'href'  => $this->url->link('product/clearance', $url . '&sort=price&order=ASC')
		); 

		$this->data['sorts'][] = array(
			'text'  => $this->language->get('text_price_desc'),
			'value' => 'price-DESC',
			'href'  => $this->url->link('product/clearance', $url . '&sort=price&order=DESC')
		);
		
		if ($this->config->get('config_review_status')) {
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_rating_desc'),
				'value' => 'rating-DESC',
				'href'  => $this->url->link('product/clearance', $url . '&sort=rating&order=DESC')
			); 
			
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_rating_asc'),
				'value' => 'rating-ASC',
				'href'  => $this->url->link('product/clearance', $url . '&sort=rating&order=ASC')
			);
		}
		
		$url = '';
			
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}	

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
			
		$this->data['limits'] = array();
		
		$limits = array_unique(array($this->config->get('config_catalog_limit'), 24, 48, 60, 120));
		sort($limits);
		foreach($limits as $value){
			$this->data['limits'][] = array(
				'text'  => $value,
				'value' => $value,
				'href'  => $this->url->link('product/clearance', $url . '&limit=' . $value)
			);
		}
		
		$url = '';
		
		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}	

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('product/clearance', $url),
      		'separator' => $this->language->get('text_separator')
   		);
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/clearance.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/clearance.tpl';
		} else {
			$this->template = 'default/template/product/clearance.tpl';
		}
		
		$pagination = new Pagination();
		$pagination->total = $products_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('product/clearance', $url . '&page={page}');
			
		$this->data['pagination'] = $pagination->render();
		
		$this->data['sort'] = $sort;
		$this->data['order'] = $order;
		$this->data['limit'] = $limit;
		$this->data['compare'] = $this->url->link('product/compare');

		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
	
		$this->response->setOutput($this->render());
	}
}
?>