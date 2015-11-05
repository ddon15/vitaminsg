<?php 
class ControllerCheckoutConfirm extends Controller { 
	public function index() {
		$redirect = '';

		if ($this->cart->hasShipping()) {
			// Validate if shipping address has been set.		
			$this->load->model('account/address');

			if ($this->customer->isLogged() && isset($this->session->data['shipping_address_id'])) {					
				$shipping_address = $this->model_account_address->getAddress($this->session->data['shipping_address_id']);		
			} elseif (isset($this->session->data['guest'])) {
				$shipping_address = $this->session->data['guest']['shipping'];
			}

			if (empty($shipping_address)) {								
				$redirect = $this->url->link('checkout/checkout', '', 'SSL');
			}

			// Validate if shipping method has been set.	
			if (!isset($this->session->data['shipping_method'])) {
				$redirect = $this->url->link('checkout/checkout', '', 'SSL');
			}
		} else {
			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
		}

		// Validate if payment address has been set.
		$this->load->model('account/address');

		if ($this->customer->isLogged() && isset($this->session->data['payment_address_id'])) {
			$payment_address = $this->model_account_address->getAddress($this->session->data['payment_address_id']);		
		} elseif (isset($this->session->data['guest'])) {
			$payment_address = $this->session->data['guest']['payment'];
		}	

		if (empty($payment_address)) {
			$redirect = $this->url->link('checkout/checkout', '', 'SSL');
		}			

		// Validate if payment method has been set.	
		if (!isset($this->session->data['payment_method'])) {
			$redirect = $this->url->link('checkout/checkout', '', 'SSL');
		}

		// Validate cart has products and has stock.	
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$redirect = $this->url->link('checkout/cart');				
		}	

		// Validate minimum quantity requirments.			
		$products = $this->cart->getProducts();

		foreach ($products as $product) {
			$product_total = 0;

			foreach ($products as $product_2) {
				if ($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}		

			if ($product['minimum'] > $product_total) {
				$redirect = $this->url->link('checkout/cart');

				break;
			}				
		}

		if (!$redirect) {
			$total_data = array();
			$total = 0;
			$taxes = $this->cart->getTaxes();

			$this->load->model('setting/extension');

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
			}

			$sort_order = array(); 

			foreach ($total_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $total_data);

			$this->language->load('checkout/checkout');

			$data = array();

			// payment cost
			if ($this->config->get('adv_payment_cost_status') && $this->config->get('adv_payment_cost_type') && isset($this->session->data['payment_method']['code']) && $this->cart->hasProducts()) {
				$getPaymentTypes = unserialize($this->config->get('adv_payment_cost_type'));
			  if ($getPaymentTypes) {
				  foreach ($getPaymentTypes as $payment_type) {
					if ($this->session->data['payment_method']['code'] == $payment_type['pc_paymentkey']) {	
						
						if ($total > $payment_type['pc_order_total']) {
							$address = array();
							if (isset($this->session->data['payment_address_id']) && $this->session->data['payment_address_id']) { 
								$this->load->model('account/address');
								$address = $this->model_account_address->getAddress($this->session->data['payment_address_id']);
								
								$country_id	= (isset($address['country_id'])) ? $address['country_id'] : 0;
								$zone_id 	= (isset($address['zone_id'])) ? $address['zone_id'] : 0;
								
							} else { 
								$country_id	= (isset($this->session->data['guest']['payment']['country_id'])) ? $this->session->data['guest']['payment']['country_id'] : 0;
								$zone_id 	= (isset($this->session->data['guest']['payment']['zone_id'])) ? $this->session->data['guest']['payment']['zone_id'] : 0;
							}

							$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$payment_type['pc_geozone'] . "' AND country_id = '" . (int)$country_id . "' AND (zone_id = '" . (int)$zone_id . "' OR zone_id = '0')");
						
							if (!$payment_type['pc_geozone']) {
								$pc_status = true;
							} elseif ($query->num_rows) {
								$pc_status = true;
							} else {
								$pc_status = false;
							}		
			
							if (($total > $payment_type['pc_order_total']) && ($pc_status) && ($this->cart->getSubTotal() > 0)) {
								$data['payment_cost'] = ($payment_type['pc_percentage']*$total)/100 + $payment_type['pc_fixed'];
							} else {
								$data['payment_cost'] = 0;
							}
							
						} else {
							$data['payment_cost'] = 0;
						}
						
					}
					
				  }
				  
				} else {
					$data['payment_cost'] = 0;
				}
				
			} else {
				$data['payment_cost'] = 0;
			}

			// shipping cost
			if ($this->customer->isLogged()) {
				$this->load->model('account/address');
				$shipping_address = $this->model_account_address->getAddress($this->session->data['shipping_address_id']);	
			} elseif (isset($this->session->data['guest'])) {
				$shipping_address = $this->session->data['guest']['shipping'];
			}	
			
			$query = $this->db->query("SELECT geo_zone_id FROM " . DB_PREFIX . "zone_to_geo_zone WHERE country_id = '" . (int)$shipping_address['country_id'] . "' AND (zone_id = '" . (int)$shipping_address['zone_id'] . "' OR zone_id = '0')");

			if ($query->rows) {	
				foreach ($query->rows as $result) {
					if (($this->config->get('adv_shipping_cost_weight_status') == '1') && ($this->config->get('adv_shipping_cost_weight_' . $result['geo_zone_id'] . '_status') == '1') && ($this->config->get('adv_shipping_cost_weight_' . $result['geo_zone_id'] . '_rate') != '') && $this->cart->hasProducts()) {
				
						if ($total > $this->config->get('adv_shipping_cost_weight_' . $result['geo_zone_id'] . '_total')) {
							$sc_status = true;
						} elseif ($total < $this->config->get('adv_shipping_cost_weight_' . $result['geo_zone_id'] . '_total')) {
							$sc_status = false;						
						}
				
						if (($sc_status) && ($this->cart->getSubTotal() > 0)) {
							$weight = $this->cart->getWeight();
				
							$rates = explode(',', $this->config->get('adv_shipping_cost_weight_' . $result['geo_zone_id'] . '_rate'));
				
							foreach ($rates as $rate) {
								$adv_shipping_cost_data = explode(':', $rate);
				
								if ($adv_shipping_cost_data[0] >= $weight) {
									if (isset($adv_shipping_cost_data[1])) {
										$data['shipping_cost'] = $adv_shipping_cost_data[1];
									}
									break;
								}
							}
							
						} else {
						$data['shipping_cost'] = 0;
						}
					
					} else {
						$data['shipping_cost'] = 0;
					}				
				}
			} else {
				$data['shipping_cost'] = 0;
			}
            

			//[SB] Added member prefix
			/* Canceled. Member prefix is for member signup.
			$this->load->model('premium_member/db');
			if($this->customer->isLogged() &&
				$this->model_premium_member_db->isPremiumMember($this->customer->getEmail())) {
				$data['invoice_prefix'] = $this->config->get('config_invoice_member_prefix');
			} else {
				$data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
			}
			*/
			$data['invoice_prefix'] = $this->config->get('config_invoice_prefix');

			$data['store_id'] = $this->config->get('config_store_id');
			$data['store_name'] = $this->config->get('config_name');

			if ($data['store_id']) {
				$data['store_url'] = $this->config->get('config_url');		
			} else {
				$data['store_url'] = HTTP_SERVER;	
			}

			if ($this->customer->isLogged()) {
				$data['customer_id'] = $this->customer->getId();
				$data['customer_group_id'] = $this->customer->getCustomerGroupId();
				$data['firstname'] = $this->customer->getFirstName();
				$data['lastname'] = $this->customer->getLastName();
				$data['email'] = $this->customer->getEmail();
				$data['telephone'] = $this->customer->getTelephone();
				$data['fax'] = $this->customer->getFax();

				$this->load->model('account/address');

				$payment_address = $this->model_account_address->getAddress($this->session->data['payment_address_id']);
			} elseif (isset($this->session->data['guest'])) {
				$data['customer_id'] = 0;
				$data['customer_group_id'] = $this->session->data['guest']['customer_group_id'];
				$data['firstname'] = $this->session->data['guest']['firstname'];
				$data['lastname'] = $this->session->data['guest']['lastname'];
				$data['email'] = $this->session->data['guest']['email'];
				$data['telephone'] = $this->session->data['guest']['telephone'];
				$data['fax'] = $this->session->data['guest']['fax'];

				$payment_address = $this->session->data['guest']['payment'];
			}

			$data['payment_firstname'] = $payment_address['firstname'];
			$data['payment_lastname'] = $payment_address['lastname'];	
			$data['payment_company'] = $payment_address['company'];	
			$data['payment_company_id'] = $payment_address['company_id'];	
			$data['payment_tax_id'] = $payment_address['tax_id'];	
			$data['payment_address_1'] = $payment_address['address_1'];
			$data['payment_address_2'] = $payment_address['address_2'];
			$data['payment_city'] = $payment_address['city'];
			$data['payment_postcode'] = $payment_address['postcode'];
			$data['payment_zone'] = $payment_address['zone'];
			$data['payment_zone_id'] = $payment_address['zone_id'];
			$data['payment_country'] = $payment_address['country'];
			$data['payment_country_id'] = $payment_address['country_id'];
			$data['payment_address_format'] = $payment_address['address_format'];

			if (isset($this->session->data['payment_method']['title'])) {
				$data['payment_method'] = $this->session->data['payment_method']['title'];
			} else {
				$data['payment_method'] = '';
			}

			if (isset($this->session->data['payment_method']['code'])) {
				$data['payment_code'] = $this->session->data['payment_method']['code'];
			} else {
				$data['payment_code'] = '';
			}

			if ($this->cart->hasShipping()) {
				if ($this->customer->isLogged()) {
					$this->load->model('account/address');

					$shipping_address = $this->model_account_address->getAddress($this->session->data['shipping_address_id']);	
				} elseif (isset($this->session->data['guest'])) {
					$shipping_address = $this->session->data['guest']['shipping'];
				}			

				$data['shipping_firstname'] = $shipping_address['firstname'];
				$data['shipping_lastname'] = $shipping_address['lastname'];	
				$data['shipping_company'] = $shipping_address['company'];	
				$data['shipping_address_1'] = $shipping_address['address_1'];
				$data['shipping_address_2'] = $shipping_address['address_2'];
				$data['shipping_city'] = $shipping_address['city'];
				$data['shipping_postcode'] = $shipping_address['postcode'];
				$data['shipping_zone'] = $shipping_address['zone'];
				$data['shipping_zone_id'] = $shipping_address['zone_id'];
				$data['shipping_country'] = $shipping_address['country'];
				$data['shipping_country_id'] = $shipping_address['country_id'];
				$data['shipping_address_format'] = $shipping_address['address_format'];

				if (isset($this->session->data['shipping_method']['title'])) {
					$data['shipping_method'] = $this->session->data['shipping_method']['title'];
				} else {
					$data['shipping_method'] = '';
				}

				if (isset($this->session->data['shipping_method']['code'])) {
					$data['shipping_code'] = $this->session->data['shipping_method']['code'];
				} else {
					$data['shipping_code'] = '';
				}				
			} else {
				$data['shipping_firstname'] = '';
				$data['shipping_lastname'] = '';	
				$data['shipping_company'] = '';	
				$data['shipping_address_1'] = '';
				$data['shipping_address_2'] = '';
				$data['shipping_city'] = '';
				$data['shipping_postcode'] = '';
				$data['shipping_zone'] = '';
				$data['shipping_zone_id'] = '';
				$data['shipping_country'] = '';
				$data['shipping_country_id'] = '';
				$data['shipping_address_format'] = '';
				$data['shipping_method'] = '';
				$data['shipping_code'] = '';
			}

			$product_data = array();

			foreach ($this->cart->getProducts() as $product) {
				$option_data = array();

				foreach ($product['option'] as $option) {
					if ($option['type'] != 'file') {
						$value = $option['option_value'];	
					} else {
						$value = $this->encryption->decrypt($option['option_value']);
					}	

					$option_data[] = array(
						'product_option_id'       => $option['product_option_id'],
						'product_option_value_id' => $option['product_option_value_id'],
						'option_id'               => $option['option_id'],
						'option_value_id'         => $option['option_value_id'],								   
						'name'                    => $option['name'],
						'value'                   => $value,
						'type'                    => $option['type']
					);					
				}

				$product_data[] = array(
					'product_id' => $product['product_id'],
					'name'       => $product['name'],
					'model'      => $product['model'],
					'option'     => $option_data,
					'download'   => $product['download'],
					'quantity'   => $product['quantity'],
					'subtract'   => $product['subtract'],
					'usual_price' => $product['usual_price'], //[SB] Added usual price
					'price'      => $product['price'],

					'cost'		 => $product['cost'],
            
					'total'      => $product['total'],
					'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
					'reward'     => $product['reward'],
					'unit_points'	 => ($product['redeem_only'] ? $product['points'] / $product['quantity'] : 0), //[SB] Added Redemption
					'total_points'	 => ($product['redeem_only'] ? $product['points'] : 0), //[SB] Added Redemption
					'redeem_only'=> $product['redeem_only'] //[SB] Added Redemption
				);
			}

			// Gift Voucher
			$voucher_data = array();

			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $voucher) {
					$voucher_data[] = array(
						'description'      => $voucher['description'],
						'code'             => substr(md5(mt_rand()), 0, 10),
						'to_name'          => $voucher['to_name'],
						'to_email'         => $voucher['to_email'],
						'from_name'        => $voucher['from_name'],
						'from_email'       => $voucher['from_email'],
						'voucher_theme_id' => $voucher['voucher_theme_id'],
						'message'          => $voucher['message'],						
						'amount'           => $voucher['amount']
					);
				}
			}  

			$data['products'] = $product_data;
			$data['vouchers'] = $voucher_data;
			$data['totals'] = $total_data;
			$data['comment'] = $this->session->data['comment'];
			$data['total'] = $total;

			if (isset($this->request->cookie['tracking'])) {
				$this->load->model('affiliate/affiliate');

				$affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);
				$subtotal = $this->cart->getSubTotal();

				if ($affiliate_info) {
					$data['affiliate_id'] = $affiliate_info['affiliate_id']; 
					$data['commission'] = ($subtotal / 100) * $affiliate_info['commission']; 
				} else {
					$data['affiliate_id'] = 0;
					$data['commission'] = 0;
				}
			} else {
				$data['affiliate_id'] = 0;
				$data['commission'] = 0;
			}

			$data['language_id'] = $this->config->get('config_language_id');
			$data['currency_id'] = $this->currency->getId();
			$data['currency_code'] = $this->currency->getCode();
			$data['currency_value'] = $this->currency->getValue($this->currency->getCode());
			$data['ip'] = $this->request->server['REMOTE_ADDR'];

			if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
				$data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];	
			} elseif(!empty($this->request->server['HTTP_CLIENT_IP'])) {
				$data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];	
			} else {
				$data['forwarded_ip'] = '';
			}

			if (isset($this->request->server['HTTP_USER_AGENT'])) {
				$data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];	
			} else {
				$data['user_agent'] = '';
			}

			if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
				$data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];	
			} else {
				$data['accept_language'] = '';
			}

			$this->load->model('checkout/order');

			$this->session->data['order_id'] = $this->model_checkout_order->addOrder($data);

			$this->data['column_name'] = $this->language->get('column_name');
			$this->data['column_model'] = $this->language->get('column_model');
			$this->data['column_quantity'] = $this->language->get('column_quantity');
			$this->data['column_price'] = $this->language->get('column_price');
			$this->data['column_total'] = $this->language->get('column_total');

			$this->data['text_recurring_item'] = $this->language->get('text_recurring_item');
			$this->data['text_payment_profile'] = $this->language->get('text_payment_profile');
			
			//[SB] Added Redemption
			$this->data['text_redemption_price'] = $this->config->get('vit_display_redeem');
			$this->data['text_redemption_total'] = $this->config->get('vit_display_redeem');
			$this->data['text_redemption_redeem_l'] = $this->language->get('text_redemption_redeem_l');
			$this->data['text_redemption_redeem_r'] = $this->language->get('text_redemption_redeem_r');
			$this->data['redeem_total'] = $this->session->data['redeem_total'];
			
			//[SB] Added Referral
			if(isset($this->session->data['referral'])) {
				$this->data['referral'] = $this->session->data['referral'];
			}
			else {
				$this->data['referral'] = '';
			}
			$this->data['text_referral_total'] = $this->language->get('text_referral_total');

			$this->data['products'] = array();

			foreach ($this->cart->getProducts() as $product) {
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

				$this->data['products'][] = array(
					'key'                 => $product['key'],
					'product_id'          => $product['product_id'],
					'name'                => $product['name'],
					'model'               => $product['model'],
					'option'              => $option_data,
					'quantity'            => $product['quantity'],
					'subtract'            => $product['subtract'],
					'price'               => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'))),
					'total'               => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']),
					'href'                => $this->url->link('product/product', 'product_id=' . $product['product_id']),
					'recurring'           => $product['recurring'],
					'profile_name'        => $product['profile_name'],
					'profile_description' => $profile_description,
					'unit_points'		  	  => $product['points'] / $product['quantity'], //[SB] Added Redemption
					'total_points'		  	  => $product['points'], //[SB] Added Redemption
					'redeem_only'		  => $product['redeem_only'] //[SB] Added Redemption
				);
			}

			// Gift Voucher
			$this->data['vouchers'] = array();

			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $voucher) {
					$this->data['vouchers'][] = array(
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount'])
					);
				}
			}  

			$this->data['totals'] = $total_data;

			$this->data['payment'] = $this->getChild('payment/' . $this->session->data['payment_method']['code']);
		} else {
			$this->data['redirect'] = $redirect;
		}			

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/confirm.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/checkout/confirm.tpl';
		} else {
			$this->template = 'default/template/checkout/confirm.tpl';
		}

		$this->response->setOutput($this->render());	
	}
}
?>