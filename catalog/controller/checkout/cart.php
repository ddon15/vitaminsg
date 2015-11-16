<?php 
class ControllerCheckoutCart extends Controller {
	private $error = array();

	public function index() {
	     //[MY] special promotions
	     if ($this->config->get('special_promotions_key') &&
	        $this->config->get('special_promotions_status')) {
	            $this->language->load('checkout/special_promotions');

	            $this->data['text_special_promotions_select'] = $this->language->get('text_special_promotions_select');
	            $this->data['text_special_promotions_select_choice'] = $this->language->get('text_special_promotions_select_choice');
	            $this->data['text_special_promotions_none'] = $this->language->get('text_special_promotions_none');

	            if (isset($this->request->post['special_promotions_selected'])) {
	                $this->data['special_promotions_selected'] = (int)$this->request->post['special_promotions_selected'];
	                $this->session->data['special_promotions_selected'] = $this->data['special_promotions_selected'];

	                unset($this->session->data['shipping_method']);
	                unset($this->session->data['shipping_methods']);
	            } elseif (!empty($this->session->data['special_promotions_selected'])) {
	                $this->data['special_promotions_selected'] = $this->session->data['special_promotions_selected'];
	            } else {
	                $this->data['special_promotions_selected'] = 0;
	            }

	            if (isset($this->session->data['special_promotions_select']) && is_array($this->session->data['special_promotions_select'])) {
	                $this->data['special_promotions_select'] = $this->session->data['special_promotions_select'];
	            } else {
	                $this->data['special_promotions_select'] = false;
	            }
	    }//.[MY]
            
		$this->language->load('checkout/cart');

		if (!isset($this->session->data['vouchers'])) {
			$this->session->data['vouchers'] = array();
		}

		// Update
		if (!empty($this->request->post['quantity'])) {
			foreach ($this->request->post['quantity'] as $key => $value) {
				$this->cart->update($key, $value);
			}

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']); 
			unset($this->session->data['reward']);

			$this->redirect($this->url->link('checkout/cart'));  			
		}

		// Remove
		if (isset($this->request->get['remove'])) {
			$this->cart->remove($this->request->get['remove']);

			unset($this->session->data['vouchers'][$this->request->get['remove']]);

			$this->session->data['success'] = $this->language->get('text_remove');

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']); 
			unset($this->session->data['reward']);  

			$this->redirect($this->url->link('checkout/cart'));
		}

		// Coupon    
		if (isset($this->request->post['coupon']) && $this->validateCoupon()) { 
			$this->session->data['coupon'] = $this->request->post['coupon'];

			$this->session->data['success'] = $this->language->get('text_coupon');

			$this->redirect($this->url->link('checkout/cart'));
		}

		// Voucher
		if (isset($this->request->post['voucher']) && $this->validateVoucher()) { 
			$this->session->data['voucher'] = $this->request->post['voucher'];

			$this->session->data['success'] = $this->language->get('text_voucher');

			$this->redirect($this->url->link('checkout/cart'));
		}

		// Reward
		if (isset($this->request->post['reward']) && $this->validateReward()) {
			if('0' != $this->request->post['reward']) {
				$this->session->data['reward'] = abs($this->request->post['reward']);
			}
			else {
				unset($this->session->data['reward']);
			}

			$this->session->data['success'] = $this->language->get('text_reward');

			$this->redirect($this->url->link('checkout/cart'));
		}

		// Shipping
		if (isset($this->request->post['shipping_method']) && $this->validateShipping()) {
			$shipping = explode('.', $this->request->post['shipping_method']);

			$this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];

			$this->session->data['success'] = $this->language->get('text_shipping');

			$this->redirect($this->url->link('checkout/cart'));
		}
		
		//[SB] Added Referral
		if (isset($this->request->post['referral'])) {
			if($this->validateReferral()) {
				$this->session->data['referral'] = $this->request->post['referral'];
				$this->session->data['success'] = $this->language->get('text_referral');
				$this->redirect($this->url->link('checkout/cart'));
			} else {
				unset($this->session->data['referral']);
			}
		}

		$this->document->setTitle($this->language->get('heading_title'));
		$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('common/home'),
			'text'      => $this->language->get('text_home'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('checkout/cart'),
			'text'      => $this->language->get('heading_title'),
			'separator' => $this->language->get('text_separator')
		);

		if ($this->cart->hasProducts() || !empty($this->session->data['vouchers'])) {
			$points = $this->customer->getRewardPoints();

			$points_total = 0;
			$points_minimum = 0; //[SB] Added minimum for Redemption products

			foreach ($this->cart->getProducts() as $product) {
				if ($product['points']) {
					$points_total += $product['points'];
				}
				if($product['redeem_only']) {
					$points_minimum += $product['points'];
				}
			}		

			//[SB] Added minimum for Redemption products
			$this->session->data['redeem_total'] = $points_minimum;
			
			$this->data['heading_title'] = $this->language->get('heading_title');

			$this->data['text_next'] = $this->language->get('text_next');
			$this->data['text_next_choice'] = $this->language->get('text_next_choice');
			$this->data['text_use_coupon'] = $this->language->get('text_use_coupon');
			$this->data['text_use_voucher'] = $this->language->get('text_use_voucher');
			$this->data['text_use_reward'] = sprintf($this->language->get('text_use_reward'), $points);
			$this->data['text_shipping_estimate'] = $this->language->get('text_shipping_estimate');
			$this->data['text_shipping_detail'] = $this->language->get('text_shipping_detail');
			$this->data['text_shipping_method'] = $this->language->get('text_shipping_method');
			$this->data['text_select'] = $this->language->get('text_select');
			$this->data['text_none'] = $this->language->get('text_none');
			$this->data['text_until_cancelled'] = $this->language->get('text_until_cancelled');
			$this->data['text_freq_day'] = $this->language->get('text_freq_day');
			$this->data['text_freq_week'] = $this->language->get('text_freq_week');
			$this->data['text_freq_month'] = $this->language->get('text_freq_month');
			$this->data['text_freq_bi_month'] = $this->language->get('text_freq_bi_month');
			$this->data['text_freq_year'] = $this->language->get('text_freq_year');
			
			//[SB] Added Redemption
			$this->data['text_redemption_usual'] = $this->language->get('text_redemption_usual');
			//$this->data['text_redemption_unit'] = $this->config->get('vit_display_redeem');
			//$this->data['text_redemption_total'] = $this->config->get('vit_display_redeem');
			$this->data['text_redemption'] = $this->config->get('vit_display_redeem');
			$this->data['text_redemption_redeem_l'] = $this->language->get('text_redemption_redeem_l');
			$this->data['text_redemption_redeem_r'] = $this->language->get('text_redemption_redeem_r');
			$this->data['vit_redeem'] = $points_minimum;

			$this->data['column_image'] = $this->language->get('column_image');
			$this->data['column_name'] = $this->language->get('column_name');
			$this->data['column_model'] = $this->language->get('column_model');
			$this->data['column_quantity'] = $this->language->get('column_quantity');
			$this->data['column_usual_price'] = $this->language->get('column_usual_price'); //[SB] Display usual price
			$this->data['column_price'] = $this->language->get('column_price');
			$this->data['column_total'] = $this->language->get('column_total');

			$this->data['entry_coupon'] = $this->language->get('entry_coupon');
			$this->data['entry_voucher'] = $this->language->get('entry_voucher');
			$this->data['entry_reward'] = sprintf($this->language->get('entry_reward'), $points_minimum, $points_total);
			$this->data['entry_country'] = $this->language->get('entry_country');
			$this->data['entry_zone'] = $this->language->get('entry_zone');
			$this->data['entry_postcode'] = $this->language->get('entry_postcode');

			//[SB] Added Referral
			$this->data['text_set_referral'] = $this->language->get('text_set_referral');
			$this->data['entry_referral'] = $this->language->get('entry_referral');
			$this->data['button_referral'] = $this->language->get('button_referral');
			$this->data['text_referral_total'] = $this->language->get('text_referral_total');
			$this->data['referral_enabled'] = ($this->config->get('vit_referral_enable') == 'vit_referral_enable');
						
			$this->data['button_update'] = $this->language->get('button_update');
			$this->data['button_remove'] = $this->language->get('button_remove');
			$this->data['button_coupon'] = $this->language->get('button_coupon');
			$this->data['button_voucher'] = $this->language->get('button_voucher');
			$this->data['button_reward'] = $this->language->get('button_reward');
			$this->data['button_quote'] = $this->language->get('button_quote');
			$this->data['button_shipping'] = $this->language->get('button_shipping');			
			$this->data['button_shopping'] = $this->language->get('button_shopping');
			$this->data['button_checkout'] = $this->language->get('button_checkout');

			$this->data['text_trial'] = $this->language->get('text_trial');
			$this->data['text_recurring'] = $this->language->get('text_recurring');
			$this->data['text_length'] = $this->language->get('text_length');
			$this->data['text_recurring_item'] = $this->language->get('text_recurring_item');
			$this->data['text_payment_profile'] = $this->language->get('text_payment_profile');

			$redeem_total = $this->cart->getRedemptionTotal();
			
			if (isset($this->error['warning'])) {
				$this->data['error_warning'] = $this->error['warning'];
			} elseif (!$this->cart->hasStock() && (!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning'))) {
				$this->data['error_warning'] = $this->language->get('error_stock');
			}
			elseif($redeem_total > 0 && (empty($this->session->data['reward']) || $redeem_total > $this->session->data['reward'])) {
				$this->data['error_warning'] = sprintf($this->language->get('error_redeem'), $redeem_total);
			}else {
				$this->data['error_warning'] = '';
			}

			if ($this->config->get('config_customer_price') && !$this->customer->isLogged()) {
				$this->data['attention'] = sprintf($this->language->get('text_login'), $this->url->link('account/login'), $this->url->link('account/register'));
			} else {
				$this->data['attention'] = '';
			}

			if (isset($this->session->data['success'])) {
				$this->data['success'] = $this->session->data['success'];

				unset($this->session->data['success']);
			} else {
				$this->data['success'] = '';
			}

			$this->data['action'] = $this->url->link('checkout/cart');   

			if ($this->config->get('config_cart_weight')) {
				$this->data['weight'] = $this->weight->format($this->cart->getWeight(), $this->config->get('config_weight_class_id'), $this->language->get('decimal_point'), $this->language->get('thousand_point'));
			} else {
				$this->data['weight'] = '';
			}

			$this->load->model('tool/image');

			$this->data['products'] = array();
                        
            //[MY] special promotions
            if ($this->config->get('special_promotions_key') &&
                    $this->config->get('special_promotions_status')) {
                    $this->load->model('checkout/special_promotions');
                    $this->model_checkout_special_promotions->checkTriggers();
            }//.[MY]

			$products = $this->cart->getProducts();

			foreach ($products as $product) {
                            
				$product_total = 0;

				foreach ($products as $product_2) {
					if ($product_2['product_id'] == $product['product_id']) {
						$product_total += $product_2['quantity'];
					}
				}

				if ($product['minimum'] > $product_total) {
					$this->data['error_warning'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);
				}

				if ($product['image']) {
					$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
				} else {
					$image = '';
				}

				$option_data = array();

				foreach ($product['option'] as $option) {
					if ($option['type'] != 'file') {
						$value = $option['option_value'];
					} else {
						$filename = $this->encryption->decrypt($option['option_value']);

						$value = utf8_substr($filename, 0, utf8_strrpos($filename, '.'));
					}

					$option_data[] = array(
						'name'  => $option['name'],
						'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
					);
				}
				
				//[SB] Display usual prices
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$usual_price = $this->currency->format($this->tax->calculate($product['usual_price'], $product['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$usual_price = false;
				}

				// Display prices
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price') ) {
					$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				// Display prices
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$total = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']);
				} else {
					$total = false;
				}

				$profile_description = '';

				if ($product['recurring']) {
					$frequencies = array(
						'day' => $this->language->get('text_day'),
						'week' => $this->language->get('text_week'),
						'semi_month' => $this->language->get('text_semi_month'),
						'month' => $this->language->get('text_month'),
						'year' => $this->language->get('text_year'),
					);

					if ($product['recurring_trial']) {
						$recurring_price = $this->currency->format($this->tax->calculate($product['recurring_trial_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')));
						$profile_description = sprintf($this->language->get('text_trial_description'), $recurring_price, $product['recurring_trial_cycle'], $frequencies[$product['recurring_trial_frequency']], $product['recurring_trial_duration']) . ' ';
					}

					$recurring_price = $this->currency->format($this->tax->calculate($product['recurring_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')));

					if ($product['recurring_duration']) {
						$profile_description .= sprintf($this->language->get('text_payment_description'), $recurring_price, $product['recurring_cycle'], $frequencies[$product['recurring_frequency']], $product['recurring_duration']);
					} else {
						$profile_description .= sprintf($this->language->get('text_payment_until_canceled_description'), $recurring_price, $product['recurring_cycle'], $frequencies[$product['recurring_frequency']], $product['recurring_duration']);
					}
				}

				//[SB] Added percent discount display
				if($product['usual_price'] <= 0 || $product['price'] <= 0) {
					$percent_discount = 0;
				}
				else {
					$percent_discount = round((($product['usual_price'] - $product['price']) / $product['usual_price'] * 100));
				}				

				if($percent_discount > 0) {
					if($product['is_on_sale']) {
						$price .= '<br><span class="cart-price-sale">' . sprintf($this->language->get('text_percent_sale'), $percent_discount) . '</span>';
					}
					else {
						$price .= '<br><span class="cart-price-discount">' . sprintf($this->language->get('text_percent_discount'), $percent_discount) . '</span>';
					}
				}

				//overide sale price if fixed amount coupon is applied
				// $this->load->model('checkout/coupon');
				$coupon_info = $this->session->data['coupon_info'];

				if ($coupon_info) {

					$coupon_fixed_amount = $coupon_info['discount'];
					$price_with_fa  = 0;

					if($coupon_info['applied_specific'] === 'RSP' && $coupon_info['product']) {
						$in_coupon_product = $coupon_info['product'];
						
						$in_coupon = in_array($product['product_id'], $in_coupon_product);
						
						$price_with_fa = $product['usual_price'] - $coupon_fixed_amount;

						$price = $this->currency->format($this->tax->calculate($price_with_fa));
						
						$total = $price;

						$sub_total_fixed_amount = $sub_total_fixed_amount + $product['usual_price'];

						$price .= '<br><span class="cart-price-sale">Coupon Less ' . $this->currency->format($coupon_fixed_amount) . '</span>';
						
						// continue;
					}

					if($coupon_info['applied_specific'] === 'RSP' && $coupon_info['product_by_manufacturer']) {
						$in_coupon_product = $coupon_info['product_by_manufacturer'];
						
						$in_coupon = in_array($product['manufacturer_id'], $in_coupon_product);
						
						$price = $this->currency->format($this->tax->calculate($product['usual_price']));
						
						$total = $price;

						$sub_total_fixed_amount = ($sub_total_fixed_amount + $product['usual_price']) - $coupon_fixed_amount;

						$price .= '<br><span class="cart-price-sale">In Brand Specific Coupon</span>';
						
						
						// continue;
					}
				}
				

				$this->session->data['sub_total_fixed_amount'] = $sub_total_fixed_amount;
				

				$this->data['products'][] = array(
					'key'                 => $product['key'],
					'thumb'               => $image,
					'name'                => $product['name'],
					'model'               => $product['model'],
					'option'              => $option_data,
					'quantity'            => $product['quantity'],
					'stock'               => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
					//'reward'              => ($product['reward'] ? sprintf($this->language->get('text_points'), $product['reward']) : ''),
					'reward'              => ($product['reward'] ? sprintf($this->config->get('vit_display_earn'), $product['reward']) : ''), //[SB] Changed Reward
					'usual_price'         => $usual_price, //[SB] Display usual prices
					'price'               => $price,
					'total'               => $total,
					'href'                => $this->url->link('product/product', 'product_id=' . $product['product_id']),
					'remove'              => $this->url->link('checkout/cart', 'remove=' . $product['key']),
					'recurring'           => $product['recurring'],
					'profile_name'        => $product['profile_name'],
					'profile_description' => $profile_description,
					'redeem_only'		  => $product['redeem_only'],//[SB] Added Redemption
					'unit_points'		  => $product['points'] / $product['quantity'], //[SB] Added Redemption
					'total_points'		  => $product['points'] //[SB] Added Redemption
				);
			}


			$this->data['products_recurring'] = array();

			// Gift Voucher
			$this->data['vouchers'] = array();

			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $key => $voucher) {
					$this->data['vouchers'][] = array(
						'key'         => $key,
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount']),
						'remove'      => $this->url->link('checkout/cart', 'remove=' . $key)   
					);
				}
			}

			if (isset($this->request->post['next'])) {
				$this->data['next'] = $this->request->post['next'];
			} else {
				$this->data['next'] = '';
			}

			$this->data['coupon_status'] = $this->config->get('coupon_status');

			if (isset($this->request->post['coupon'])) {
				$this->data['coupon'] = $this->request->post['coupon'];			
			} elseif (isset($this->session->data['coupon'])) {
				$this->data['coupon'] = $this->session->data['coupon'];
			} else {
				$this->data['coupon'] = '';
			}

			$this->data['voucher_status'] = $this->config->get('voucher_status');

			if (isset($this->request->post['voucher'])) {
				$this->data['voucher'] = $this->request->post['voucher'];				
			} elseif (isset($this->session->data['voucher'])) {
				$this->data['voucher'] = $this->session->data['voucher'];
			} else {
				$this->data['voucher'] = '';
			}

			$this->data['reward_status'] = ($points && $points_total && $this->config->get('reward_status'));

			if (isset($this->request->post['reward'])) {
				$this->data['reward'] = $this->request->post['reward'];				
			} elseif (isset($this->session->data['reward'])) {
				$this->data['reward'] = $this->session->data['reward'];
			} else {
				$this->data['reward'] = '';
			}
			
			//[SB] Added Referral
			$this->data['referral'] = '';
			$this->data['referral_total'] = '';
			
			if (isset($this->request->post['referral'])) {
				$this->data['referral'] = $this->request->post['referral'];
			}
			if (isset($this->session->data['referral'])) {
				$this->data['referral'] = $this->session->data['referral'];
				$this->data['referral_total'] = $this->session->data['referral'];
			}

			$this->data['shipping_status'] = $this->config->get('shipping_status') && $this->config->get('shipping_estimator') && $this->cart->hasShipping();	

			if (isset($this->request->post['country_id'])) {
				$this->data['country_id'] = $this->request->post['country_id'];				
			} elseif (isset($this->session->data['shipping_country_id'])) {
				$this->data['country_id'] = $this->session->data['shipping_country_id'];			  	
			} else {
				$this->data['country_id'] = $this->config->get('config_country_id');
			}

			$this->load->model('localisation/country');

			$this->data['countries'] = $this->model_localisation_country->getCountries();

			if (isset($this->request->post['zone_id'])) {
				$this->data['zone_id'] = $this->request->post['zone_id'];				
			} elseif (isset($this->session->data['shipping_zone_id'])) {
				$this->data['zone_id'] = $this->session->data['shipping_zone_id'];			
			} else {
				$this->data['zone_id'] = '';
			}

			if (isset($this->request->post['postcode'])) {
				$this->data['postcode'] = $this->request->post['postcode'];				
			} elseif (isset($this->session->data['shipping_postcode'])) {
				$this->data['postcode'] = $this->session->data['shipping_postcode'];					
			} else {
				$this->data['postcode'] = '';
			}

			if (isset($this->request->post['shipping_method'])) {
				$this->data['shipping_method'] = $this->request->post['shipping_method'];				
			} elseif (isset($this->session->data['shipping_method'])) {
				$this->data['shipping_method'] = $this->session->data['shipping_method']['code']; 
			} else {
				$this->data['shipping_method'] = '';
			}

			// Totals
			$this->load->model('setting/extension');

			$total_data = array();					
			$total = 0;
			$taxes = $this->cart->getTaxes();

			// Display prices
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$sort_order = array(); 

				$results = $this->model_setting_extension->getExtensions('total');
			
				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}

				array_multisort($sort_order, SORT_ASC, $results);

				foreach ($results as $result) {

					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('total/' . $result['code']);

						$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes, $is_fixed_amount_coupon);
					}

					$sort_order = array(); 
                                        
					foreach ($total_data as $key => $value) {
						$sort_order[$key] = $value['sort_order'];
					}

					array_multisort($sort_order, SORT_ASC, $total_data);			
				}
			}
                        
                        
			$this->data['totals'] = $total_data;
                        
			$this->data['continue'] = $this->url->link('common/home');

			$this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');

			$this->load->model('setting/extension');

			$this->data['checkout_buttons'] = array();

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/cart.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/checkout/cart.tpl';
			} else {
				$this->template = 'default/template/checkout/cart.tpl';
			}

			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_bottom',
				'common/content_top',
				'common/footer',
				'common/header'	
			);

			$this->response->setOutput($this->render());					
		} else {
			$this->data['heading_title'] = $this->language->get('heading_title');

			$this->data['text_error'] = $this->language->get('text_empty');

			$this->data['button_continue'] = $this->language->get('button_continue');

			$this->data['continue'] = $this->url->link('common/home');

			unset($this->session->data['success']);

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
			}

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

	protected function validateCoupon() {
        //[MY] Special Promotions
        if ($this->config->get('special_promotions_key') && $this->config->get('special_promotions_status')) {
            $this->load->model('checkout/special_promotions');
            $coupon_check = $this->model_checkout_special_promotions->checkCoupon($this->request->post['coupon']);
            if ($coupon_check) {
                if (!$this->config->get('special_promotions_disable_oc_coupons') || empty($this->session->data['special_promotions'])) {
                    $this->session->data['coupon'] = $this->request->post['coupon'];
                }
                if ($this->config->get('special_promotions_multiply_coupons')) {
                    if (empty($this->session->data['special_promotions_coupon']) || !is_array($this->session->data['special_promotions_coupon'])) {
                        $this->session->data['special_promotions_coupon'] = array();
                    }
                    if (!in_array($this->request->post['coupon'], $this->session->data['special_promotions_coupon'])) {
                        $this->session->data['special_promotions_coupon'][] = $this->request->post['coupon'];
                    }
                } else {
                    $this->session->data['special_promotions_coupon'] = array($this->request->post['coupon']);
                }
                return true;
            }

            if (!empty($this->session->data['special_promotions']) && $this->config->get('special_promotions_disable_oc_coupons')) {
                if (isset($this->request->post['coupon'])) {
                    $this->request->post['coupon'] = '';
                }
                if (isset($this->session->data['coupon'])) {
                    unset($this->session->data['coupon']);
                }
            }
        }//.[MY]
                
		$this->load->model('checkout/coupon');

		$coupon_info = $this->model_checkout_coupon->getCoupon($this->request->post['coupon']);			

		if (!$coupon_info) {			
			$this->error['warning'] = $this->language->get('error_coupon');
		} else {
			$this->session->data['coupon_info'] = $coupon_info; 
		}

		return !$this->error ? true : false; 
	}

	protected function validateVoucher() {
		$this->load->model('checkout/voucher');

		$voucher_info = $this->model_checkout_voucher->getVoucher($this->request->post['voucher']);			

		if (!$voucher_info) {			
			$this->error['warning'] = $this->language->get('error_voucher');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}		
	}

	protected function validateReward() {
		$points = $this->customer->getRewardPoints();

		$points_total = 0;

		foreach ($this->cart->getProducts() as $product) {
			if ($product['points']) {
				$points_total += $product['points'];
			}
		}	

		if (empty($this->request->post['reward']) && '0' != $this->request->post['reward']) { //[SB] Added check for 0
			$this->error['warning'] = $this->language->get('error_reward');
		}

		if ($this->request->post['reward'] > $points) {
			$this->error['warning'] = sprintf($this->language->get('error_points'), $this->request->post['reward']);
		}

		if ($this->request->post['reward'] > $points_total) {
			$this->error['warning'] = sprintf($this->language->get('error_maximum'), $points_total);
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}		
	}

	protected function validateShipping() {
		if (!empty($this->request->post['shipping_method'])) {
			$shipping = explode('.', $this->request->post['shipping_method']);

			if (!isset($shipping[0]) || !isset($shipping[1]) || !isset($this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]])) {			
				$this->error['warning'] = $this->language->get('error_shipping');
			}
		} else {
			$this->error['warning'] = $this->language->get('error_shipping');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}		
	}
	
	//[SB] Added Referral
	protected function validateReferral() {
		
		$referral_email = $this->request->post['referral'];
		
		if (empty($referral_email)) {
			$this->error['warning'] = $this->language->get('error_referral');
		}
		
		if($this->customer->isLogged() &&
			$this->customer->getEmail() == $referral_email) {
			$this->error['warning'] = $this->language->get('error_referral');
		}
		
		$this->load->model('premium_member/db');
		if(!$this->model_premium_member_db->isPremiumMember($referral_email)) {
			$this->error['warning'] = $this->language->get('error_referral');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	public function add() {
		$this->language->load('checkout/cart');

		$json = array();

		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {			
			if (isset($this->request->post['quantity'])) {
				$quantity = $this->request->post['quantity'];
			} else {
				$quantity = 1;
			}

			if (isset($this->request->post['option'])) {
				$option = array_filter($this->request->post['option']);
			} else {
				$option = array();	
			}

			if (isset($this->request->post['profile_id'])) {
				$profile_id = $this->request->post['profile_id'];
			} else {
				$profile_id = 0;
			}

			$product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);

			foreach ($product_options as $product_option) {
				if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
					$json['error']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
				}
			}

			$profiles = $this->model_catalog_product->getProfiles($product_info['product_id']);

			if ($profiles) {
				$profile_ids = array();

				foreach ($profiles as $profile) {
					$profile_ids[] = $profile['profile_id'];
				}

				if (!in_array($profile_id, $profile_ids)) {
					$json['error']['profile'] = $this->language->get('error_profile_required');
				}
			}

			if (!$json) {
				$this->cart->add($this->request->post['product_id'], $quantity, $option, $profile_id);

				$json['success'] = sprintf($this->language->get('text_success'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('checkout/cart'));

				unset($this->session->data['shipping_method']);
				unset($this->session->data['shipping_methods']);
				unset($this->session->data['payment_method']);
				unset($this->session->data['payment_methods']);

				// Totals
				$this->load->model('setting/extension');

				$total_data = array();					
				$total = 0;
				$taxes = $this->cart->getTaxes();

				// Display prices
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$sort_order = array(); 

					$results = $this->model_setting_extension->getExtensions('total');

					foreach ($results as $key => $value) {
						$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
					}

					array_multisort($sort_order, SORT_ASC, $results);

					foreach ($results as $result) {
						if ($this->config->get($result['code'] . '_status')) {
							$this->load->model('total/' . $result['code']);

							$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
						}

						$sort_order = array(); 

						foreach ($total_data as $key => $value) {
							$sort_order[$key] = $value['sort_order'];
						}

						array_multisort($sort_order, SORT_ASC, $total_data);			
					}
				}

				$json['total'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total));
			} else {
				$json['redirect'] = str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']));
			}
		}

		$this->response->setOutput(json_encode($json));		
	}

	public function quote() {
		$this->language->load('checkout/cart');

		$json = array();	

		if (!$this->cart->hasProducts()) {
			$json['error']['warning'] = $this->language->get('error_product');				
		}				

		if (!$this->cart->hasShipping()) {
			$json['error']['warning'] = sprintf($this->language->get('error_no_shipping'), $this->url->link('information/contact'));				
		}				

		if ($this->request->post['country_id'] == '') {
			$json['error']['country'] = $this->language->get('error_country');
		}

		if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '') {
			$json['error']['zone'] = $this->language->get('error_zone');
		}

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

		if ($country_info && $country_info['postcode_required'] && (utf8_strlen($this->request->post['postcode']) < 2) || (utf8_strlen($this->request->post['postcode']) > 10)) {
			$json['error']['postcode'] = $this->language->get('error_postcode');
		}

		if (!$json) {		
			$this->tax->setShippingAddress($this->request->post['country_id'], $this->request->post['zone_id']);

			// Default Shipping Address
			$this->session->data['shipping_country_id'] = $this->request->post['country_id'];
			$this->session->data['shipping_zone_id'] = $this->request->post['zone_id'];
			$this->session->data['shipping_postcode'] = $this->request->post['postcode'];

			if ($country_info) {
				$country = $country_info['name'];
				$iso_code_2 = $country_info['iso_code_2'];
				$iso_code_3 = $country_info['iso_code_3'];
				$address_format = $country_info['address_format'];
			} else {
				$country = '';
				$iso_code_2 = '';
				$iso_code_3 = '';	
				$address_format = '';
			}

			$this->load->model('localisation/zone');

			$zone_info = $this->model_localisation_zone->getZone($this->request->post['zone_id']);

			if ($zone_info) {
				$zone = $zone_info['name'];
				$zone_code = $zone_info['code'];
			} else {
				$zone = '';
				$zone_code = '';
			}	

			$address_data = array(
				'firstname'      => '',
				'lastname'       => '',
				'company'        => '',
				'address_1'      => '',
				'address_2'      => '',
				'postcode'       => $this->request->post['postcode'],
				'city'           => '',
				'zone_id'        => $this->request->post['zone_id'],
				'zone'           => $zone,
				'zone_code'      => $zone_code,
				'country_id'     => $this->request->post['country_id'],
				'country'        => $country,	
				'iso_code_2'     => $iso_code_2,
				'iso_code_3'     => $iso_code_3,
				'address_format' => $address_format
			);

			$quote_data = array();

			$this->load->model('setting/extension');

			$results = $this->model_setting_extension->getExtensions('shipping');

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('shipping/' . $result['code']);

					$quote = $this->{'model_shipping_' . $result['code']}->getQuote($address_data); 

					if ($quote) {
						$quote_data[$result['code']] = array( 
							'title'      => $quote['title'],
							'quote'      => $quote['quote'], 
							'sort_order' => $quote['sort_order'],
							'error'      => $quote['error']
						);
					}
				}
			}

			$sort_order = array();

			foreach ($quote_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $quote_data);

			$this->session->data['shipping_methods'] = $quote_data;

			if ($this->session->data['shipping_methods']) {
				$json['shipping_method'] = $this->session->data['shipping_methods']; 
			} else {
				$json['error']['warning'] = sprintf($this->language->get('error_no_shipping'), $this->url->link('information/contact'));
			}				
		}	

		$this->response->setOutput(json_encode($json));						
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']		
			);
		}

		$this->response->setOutput(json_encode($json));
	}
}
?>
