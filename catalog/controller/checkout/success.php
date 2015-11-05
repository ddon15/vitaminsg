<?php
class ControllerCheckoutSuccess extends Controller { 
	public function index() {

		$this->load->model('account/customer');

		if (!empty($_SESSION['guest']['payment'])) {
			$this->model_account_customer->addCustomer($_SESSION['guest']['payment']);

			$this->customer->login($_SESSION['guest']['payment']['email'], $_SESSION['guest']['payment']['password']);

			unset($this->session->data['guest']);

			// Default Shipping Address
			/*if ($this->config->get('config_tax_customer') == 'shipping') {
                $this->session->data['shipping_country_id'] = $this->request->post['country_id'];
                $this->session->data['shipping_zone_id'] = $this->request->post['zone_id'];
                $this->session->data['shipping_postcode'] = $this->request->post['postcode'];
            }

            // Default Payment Address
            if ($this->config->get('config_tax_customer') == 'payment') {
                $this->session->data['payment_country_id'] = $this->request->post['country_id'];
                $this->session->data['payment_zone_id'] = $this->request->post['zone_id'];
            }*/


		}
//		else {
//			if($this->customer->getCustomerGroupId() == '1') {
//				$repeated_customer = 4;
//				$this->load->model('account/customer');
//				$update_customer_group_id = $this->model_account_customer->updateCustomer($repeated_customer);
//			}
//		}

		$order_id = "";
		if (isset($this->session->data['order_id'])) {
                    $order_id = $this->session->data['order_id'];
			$this->cart->clear();

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['guest']);
			unset($this->session->data['comment']);
			unset($this->session->data['order_id']);	
			unset($this->session->data['coupon']);
			unset($this->session->data['reward']);
			unset($this->session->data['voucher']);
			unset($this->session->data['vouchers']);
			unset($this->session->data['totals']);
			
			//[SB] Added unset of Referral and Redemption
			unset($this->session->data['referral']);
			unset($this->session->data['redeem_total']);
		}	

		$this->language->load('checkout/success');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->data['breadcrumbs'] = array(); 

		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('common/home'),
			'text'      => $this->language->get('text_home'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('checkout/cart'),
			'text'      => $this->language->get('text_basket'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('checkout/checkout', '', 'SSL'),
			'text'      => $this->language->get('text_checkout'),
			'separator' => $this->language->get('text_separator')
		);	

		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('checkout/success'),
			'text'      => $this->language->get('text_success'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->load->model('checkout/order');
		$invoice = $this->model_checkout_order->getInvoice($order_id);
		
		if ($this->customer->isLogged()) {
                        //MY
			//$this->data['text_message'] = sprintf($this->language->get('text_customer'), $this->url->link('account/account', '', 'SSL'), $this->url->link('account/order', '', 'SSL'), $this->url->link('account/download', '', 'SSL'), $this->url->link('information/contact'));
                        $this->data['text_message'] = sprintf($this->language->get('text_customer'), 
                                $invoice,$this->url->link('account/account', '', 'SSL'), 
                                $this->url->link('account/order', '', 'SSL'), 
                                $this->url->link('account/account', '', 'SSL'),
                                $this->url->link('account/download', '', 'SSL'),
                                $this->url->link('information/contact', '', 'SSL'));
		} else {
                        //MY
                        $this->data['text_message'] = sprintf($this->language->get('text_guest'), $invoice, 
                                $this->url->link('information/contact', '', 'SSL'));
			//$this->data['text_message'] = sprintf($this->language->get('text_guest'), $this->url->link('information/contact'));
		}

		$this->data['button_continue'] = $this->language->get('button_continue');

		$this->data['continue'] = $this->url->link('common/home');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/success.tpl';
		} else {
			$this->template = 'default/template/common/success.tpl';
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
?>