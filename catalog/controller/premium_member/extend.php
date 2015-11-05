<?php 
class ControllerPremiumMemberExtend extends Controller
{
	private $error = array();
	
	public function index()
	{
		if (!$this->customer->isLogged()) {
			$this->redirect($this->url->link('premium_member/register', '', 'SSL'));
		}
		
		$this->language->load('premium_member/extend');
		$this->load->model('premium_member/db');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->data['action'] = $this->url->link('premium_member/extend', '', 'SSL');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate())
		{
			// Add unapproved account of customer group "Premium Member"
			$this->model_premium_member_db->addPremiumMember($this->request->post);
			
			if($this->request->post['use_reward'] == 'use_reward') {
			
				$this->load->model('premium_member/db');
				$premium_member_id =
					$this->model_premium_member_db->getPremiumMemberId($this->request->post['email']);
					
				if($premium_member_id > 0) {
				
					$this->upgradeCustomer($premium_member_id, $this->request->post['email'], (float)$this->config->get('premium_member_price') * 100);
					$this->model_premium_member_db->useRewardForPremiumMember($premium_member_id, $this->language->get('text_reward_description'));
					$this->redirect($this->url->link('premium_member/success', '', 'SSL'));				
				}
			}
			else {
				// Go to PayPal
				$this->express($this->request->post['email']);
			}
		}
		
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),        	
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', 'SSL'),      	
			'separator' => $this->language->get('text_separator')
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_extend'),
			'href'      => $this->url->link('premium_member/register', '', 'SSL'),      	
			'separator' => $this->language->get('text_separator')
		);
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_your_account'] = $this->language->get('text_your_account');
		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['email'] = $this->customer->getEmail();

		$cust_points = $this->customer->getRewardPoints();
		$member_price_points = (float)$this->config->get('premium_member_price') * 100;
		$this->data['can_use_reward'] = ($this->config->get('vit_membership_reward_renew') == 'vit_membership_reward_renew' &&
			$cust_points >= $member_price_points);
		$this->data['entry_use_reward'] = sprintf($this->language->get('entry_use_reward'), $member_price_points, $cust_points);

		$this->data['button_continue'] = $this->language->get('button_continue');
		
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if ($this->config->get('config_account_id')) {
			$this->load->model('catalog/information');

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

			if ($information_info) {
				$this->data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/info', 'information_id=' . $this->config->get('config_account_id'), 'SSL'), $information_info['title'], $information_info['title']);
			} else {
				$this->data['text_agree'] = '';
			}
		} else {
			$this->data['text_agree'] = '';
		}
		
		if (isset($this->request->post['use_reward'])) {
			$this->data['use_reward'] = $this->request->post['use_reward'];
		} else {
			$this->data['use_reward'] = false;
		}

		if (isset($this->request->post['agree'])) {
			$this->data['agree'] = $this->request->post['agree'];
		} else {
			$this->data['agree'] = false;
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . 
			'/template/premium_member/extend.tpl')) {
			$this->template = $this->config->get('config_template') . 
				'/template/premium_member/extend.tpl';
		} else {
			$this->template = 'default/template/premium_member/extend.tpl';
		}
		
		$expiry = $this->model_premium_member_db->getCurrentExpiryWithEmail($this->customer->getEmail());
		if(strtotime($expiry) > strtotime("now +6 months"))
		{
			$this->data['error_expiry'] = sprintf($this->language->get('error_expiry'),
				date('Y-m-d', strtotime($expiry)));
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
	
	private function validate()
	{
		if ($this->config->get('config_account_id')) {
			$this->load->model('catalog/information');

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

			if ($information_info && !isset($this->request->post['agree'])) {
				$this->error['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
			}
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	
	private function express($premium_member_email)
	{
		$this->load->model('tool/image');
	
		$data = array(
			'METHOD' => 'SetExpressCheckout',
			'RETURNURL' => $this->url->link('premium_member/register/expressReturn', '', 'SSL'),
			'CANCELURL' => $this->url->link('premium_member/register'),
			'REQCONFIRMSHIPPING' => 0,
			'NOSHIPPING' => 1,
			'ALLOWNOTE' => 0,
			'LOCALECODE' => 'EN',
			'LANDINGPAGE' => 'Login',
			'HDRIMG' => $this->model_tool_image->resize($this->config->get('pp_express_logo'), 262, 90),
			'HDRBORDERCOLOR' => $this->config->get('pp_express_border_colour'),
			'HDRBACKCOLOR' => $this->config->get('pp_express_header_colour'),
			'PAYFLOWCOLOR' => $this->config->get('pp_express_page_colour'),
			'CHANNELTYPE' => 'Merchant',
		);
		
		$this->session->data['paypal']['premium_member_email'] = $premium_member_email;
		$data = array_merge($data, $this->paymentRequestInfo());
		
		$this->load->model('payment/pp_express');
		$result = $this->model_payment_pp_express->call($data);
		
		/**
		 * If a failed PayPal setup happens, handle it.
		 */
		if(!isset($result['TOKEN'])) {
			$this->session->data['error'] = $result['L_LONGMESSAGE0'];
			/**
			 * Unable to add error message to user as the session errors/success are not
			 * used on the cart or checkout pages - need to be added?
			 * If PayPal debug log is off then still log error to normal error log.
			 */
			if($this->config->get('pp_express_debug')) {
				$this->log->write(serialize($result));
			}

			$this->redirect($this->url->link('premium_member/register', '', 'SSL'));
		}
		
		$this->session->data['paypal']['token'] = $result['TOKEN'];

		if ($this->config->get('pp_express_test') == 1) {
			header('Location: https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=' . $result['TOKEN']);
		} else {
			header('Location: https://www.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=' . $result['TOKEN']);
		}
	}
	
	public function expressReturn()
	{
		$this->load->model('payment/pp_express');
		$data = array(
			'METHOD' => 'GetExpressCheckoutDetails',
			'TOKEN' => $this->session->data['paypal']['token'],
		);

		$result = $this->model_payment_pp_express->call($data);
		
		$this->session->data['paypal']['payerid'] = $result['PAYERID'];
		$premium_member_email = $result['L_PAYMENTREQUEST_0_NUMBER0'];
		
		$paypal_data = array(
			'TOKEN' => $this->session->data['paypal']['token'],
			'PAYERID' => $this->session->data['paypal']['payerid'],
			'METHOD' => 'DoExpressCheckoutPayment',
			//'PAYMENTREQUEST_0_NOTIFYURL' => $this->url->link('payment/pp_express/ipn', '', 'SSL'),
			'RETURNFMFDETAILS' => 1 // return Fraud Management Filters results
		);

		$paypal_data = array_merge($paypal_data, $this->paymentRequestInfo());
		$paypal_result = $this->model_payment_pp_express->call($paypal_data);

		$this->load->model('premium_member/db');
		$premium_member_id =
			$this->model_premium_member_db->getPremiumMemberId($premium_member_email);
		
		$paypal_transact_data = array(
			'premium_member_id' => $premium_member_id,
			'capture_status' => ($this->config->get('pp_express_method') == 'Sale' ? 'Complete' : 'NotComplete'),
			'currency_code' => $paypal_result['PAYMENTINFO_0_CURRENCYCODE'],
			'transaction_id' => $paypal_result['PAYMENTINFO_0_TRANSACTIONID'],
			'receipt_id' => (isset($paypal_result['PAYMENTINFO_0_RECEIPTID']) ? $paypal_result['PAYMENTINFO_0_RECEIPTID'] : ''),
			'payment_type' => $paypal_result['PAYMENTINFO_0_PAYMENTTYPE'],
			'payment_status' => $paypal_result['PAYMENTINFO_0_PAYMENTSTATUS'],
			'pending_reason' => $paypal_result['PAYMENTINFO_0_PENDINGREASON'],
			'transaction_entity' => ($this->config->get('pp_express_method') == 'Sale' ? 'payment' : 'auth'),
			'amount' => $paypal_result['PAYMENTINFO_0_AMT'],
			'debug_data' => json_encode($paypal_result)
		);
		
		$this->model_premium_member_db->addPremiumMemberPayPal($paypal_transact_data);
		$this->upgradeCustomer($premium_member_id, $premium_member_email);
		$this->redirect($this->url->link('premium_member/success', '', 'SSL'));
	}
	
	private function upgradeCustomer($premium_member_id, $premium_member_email, $reward_used = 0) {
		$currentExpiry = strtotime($this->model_premium_member_db->getCurrentExpiry($premium_member_id));

		// adds 12 months to current expiry
		$newExpiry = strtotime("+" . $this->config->get('premium_member_length') . " months", $currentExpiry);
		if($currentExpiry < time()) // if current expiry is already in the past
		{
			// expiry starts from today onwards instead
			$newExpiry = strtotime("+" . $this->config->get('premium_member_length') . " months", time());
		}
		
		$this->model_premium_member_db->upgradeCustomer($premium_member_email, date("Y-m-d", $newExpiry), $reward_used);
	}
	
	private function paymentRequestInfo()
	{
		$price = $this->config->get('premium_member_price');
		
		return array(
			'PAYMENTREQUEST_0_SHIPPINGAMT' => '',
			'PAYMENTREQUEST_0_CURRENCYCODE' => $this->currency->getCode(),
			'PAYMENTREQUEST_0_PAYMENTACTION' => $this->config->get('pp_express_method'),
			'PAYMENTREQUEST_0_INVNUM' => $this->session->data['paypal']['premium_member_email'] . '_renew_' . date('yymmdd'), //[SB] Added member purchase email to call. Concat with date to avoid duplicate invoice number
			'L_PAYMENTREQUEST_0_NAME0' => $this->config->get('premium_member_name'),
			'L_PAYMENTREQUEST_0_AMT0' => $price,
			'L_PAYMENTREQUEST_0_QTY0' => 1,
			'L_PAYMENTREQUEST_0_NUMBER0' => $this->session->data['paypal']['premium_member_email'],
			'PAYMENTREQUEST_0_ITEMAMT' => $price,
			'PAYMENTREQUEST_0_AMT' => $price
		);
	}
}
?>