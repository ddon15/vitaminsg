<?php 
class ControllerPremiumMemberRegister extends Controller
{
	private $error = array();
	
	public function index()
	{
		if ($this->customer->isLogged()) {
			$this->redirect($this->url->link('premium_member/extend', '', 'SSL'));
		}

		$this->language->load('premium_member/register');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
		$this->data['action'] = $this->url->link('premium_member/register', '', 'SSL');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate())
		{
			$this->load->model('premium_member/db');
			
			// Add unapproved account of customer group "Premium Member"
			if($this->model_premium_member_db->addPremiumMember($this->request->post))
			{
				// Go to PayPal
				$this->express($this->request->post['email']);
			}
			else
			{
				$this->error['warning'] = $this->language->get('error_account_exists');
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
			'text'      => $this->language->get('text_register'),
			'href'      => $this->url->link('premium_member/register', '', 'SSL'),      	
			'separator' => $this->language->get('text_separator')
		);
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_account_already'] = sprintf($this->language->get('text_account_already'), $this->url->link('account/login', '', 'SSL'));
		
		$this->data['text_title'] = $this->language->get('text_title');
		$this->data['text_subscribe_price'] = $this->language->get('text_subscribe_price');
		$this->data['text_freegift'] = $this->language->get('text_freegift');
		$this->data['img_perks_member_freegift'] = "image/data/premium_member/perks-member-freegift.png";
		$this->data['text_intro'] = $this->language->get('text_intro');
		
		$this->data['text_perks_member_special'] = $this->language->get('text_perks_member_special');
		$this->data['text_perks_product_offer'] = $this->language->get('text_perks_product_offer');
		$this->data['text_perks_health_newsletter'] = $this->language->get('text_perks_health_newsletter');
		$this->data['text_perks_seminar_invitation'] = $this->language->get('text_perks_seminar_invitation');
		
		$this->data['img_perks_member_special'] = "image/data/premium_member/perks-member-special.png";
		$this->data['img_perks_product_offer'] = "image/data/premium_member/perks-product-offer.png";
		$this->data['img_perks_health_newsletter'] = "image/data/premium_member/perks-health-newsletter.png";
		$this->data['img_perks_seminar_invitation'] = "image/data/premium_member/perks-seminar-invitation.png";
		$this->data['img_perks_coming_soon'] = "image/data/premium_member/perks-coming-soon.png";
		
		$this->data['text_your_details'] = $this->language->get('text_your_details');
		$this->data['text_your_address'] = $this->language->get('text_your_address');
		$this->data['text_address_instructions'] = $this->language->get('text_address_instructions');
		$this->data['text_address2_instructions'] = $this->language->get('text_address2_instructions');
		$this->data['text_password_instructions'] = $this->language->get('text_password_instructions');
		$this->data['text_your_password'] = $this->language->get('text_your_password');
		$this->data['text_notifications'] = $this->language->get('text_notifications');
		$this->data['text_signup'] = $this->language->get('text_signup');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_male'] = $this->language->get('text_male');
		$this->data['text_female'] = $this->language->get('text_female');
		
                
                //[MY]
                $this->data['text_id_number_help'] = $this->language->get('text_id_number_help');
                
		$this->data['entry_firstname'] = $this->language->get('entry_firstname');
		$this->data['entry_lastname'] = $this->language->get('entry_lastname');
		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_id_number'] = $this->language->get('entry_id_number');
		$this->data['entry_telephone'] = $this->language->get('entry_telephone');
		$this->data['entry_address_1'] = $this->language->get('entry_address_1');
		$this->data['entry_address_2'] = $this->language->get('entry_address_2');
		$this->data['entry_postcode'] = $this->language->get('entry_postcode');
		$this->data['entry_city'] = $this->language->get('entry_city');
		$this->data['entry_country'] = $this->language->get('entry_country');
		$this->data['entry_zone'] = $this->language->get('entry_zone');
		$this->data['entry_newsletter'] = $this->language->get('entry_newsletter');
		$this->data['entry_sms'] = $this->language->get('entry_sms');
		$this->data['entry_password'] = $this->language->get('entry_password');
		$this->data['entry_confirm'] = $this->language->get('entry_confirm');
		$this->data['entry_dob'] = $this->language->get('entry_dob');
		$this->data['entry_gender'] = $this->language->get('entry_gender');
		$this->data['entry_health_interest'] = $this->language->get('entry_health_interest');

		$this->data['button_continue'] = $this->language->get('button_continue');
		
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if (isset($this->error['firstname'])) {
			$this->data['error_firstname'] = $this->error['firstname'];
		} else {
			$this->data['error_firstname'] = '';
		}	

		if (isset($this->error['lastname'])) {
			$this->data['error_lastname'] = $this->error['lastname'];
		} else {
			$this->data['error_lastname'] = '';
		}		

		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}
		
		if (isset($this->error['id_number'])) {
			$this->data['error_id_number'] = $this->error['id_number'];
		} else {
			$this->data['error_id_number'] = '';
		}

		if (isset($this->error['telephone'])) {
			$this->data['error_telephone'] = $this->error['telephone'];
		} else {
			$this->data['error_telephone'] = '';
		}
		
		if (isset($this->error['dob'])) {
			$this->data['error_dob'] = $this->error['dob'];
		} else {
			$this->data['error_dob'] = '';
		}

		if (isset($this->error['password'])) {
			$this->data['error_password'] = $this->error['password'];
		} else {
			$this->data['error_password'] = '';
		}

		if (isset($this->error['confirm'])) {
			$this->data['error_confirm'] = $this->error['confirm'];
		} else {
			$this->data['error_confirm'] = '';
		}

		if (isset($this->error['address_1'])) {
			$this->data['error_address_1'] = $this->error['address_1'];
		} else {
			$this->data['error_address_1'] = '';
		}

		if (isset($this->error['city'])) {
			$this->data['error_city'] = $this->error['city'];
		} else {
			$this->data['error_city'] = '';
		}

		if (isset($this->error['postcode'])) {
			$this->data['error_postcode'] = $this->error['postcode'];
		} else {
			$this->data['error_postcode'] = '';
		}

		if (isset($this->error['country'])) {
			$this->data['error_country'] = $this->error['country'];
		} else {
			$this->data['error_country'] = '';
		}

		if (isset($this->error['zone'])) {
			$this->data['error_zone'] = $this->error['zone'];
		} else {
			$this->data['error_zone'] = '';
		}
		
		
		if (isset($this->request->post['firstname'])) {
			$this->data['firstname'] = $this->request->post['firstname'];
		} else {
			$this->data['firstname'] = '';
		}

		if (isset($this->request->post['lastname'])) {
			$this->data['lastname'] = $this->request->post['lastname'];
		} else {
			$this->data['lastname'] = '';
		}

		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} else {
			$this->data['email'] = '';
		}
		
		if (isset($this->request->post['id_number'])) {
			$this->data['id_number'] = $this->request->post['id_number'];
		} else {
			$this->data['id_number'] = '';
		}

		if (isset($this->request->post['telephone'])) {
			$this->data['telephone'] = $this->request->post['telephone'];
		} else {
			$this->data['telephone'] = '';
		}
		
		if (isset($this->request->post['dob'])) {
			$this->data['dob'] = $this->request->post['dob'];
		} else {
			$this->data['dob'] = '';
		}
		
		if (isset($this->request->post['gender'])) {
			$this->data['gender'] = $this->request->post['gender'];
		} else {
			$this->data['gender'] = '';
		}
		
		if (isset($this->request->post['address_1'])) {
			$this->data['address_1'] = $this->request->post['address_1'];
		} else {
			$this->data['address_1'] = '';
		}

		if (isset($this->request->post['address_2'])) {
			$this->data['address_2'] = $this->request->post['address_2'];
		} else {
			$this->data['address_2'] = '';
		}

		if (isset($this->request->post['postcode'])) {
			$this->data['postcode'] = $this->request->post['postcode'];
		} elseif (isset($this->session->data['shipping_postcode'])) {
			$this->data['postcode'] = $this->session->data['shipping_postcode'];		
		} else {
			$this->data['postcode'] = '';
		}

		if (isset($this->request->post['city'])) {
			$this->data['city'] = $this->request->post['city'];
		} else {
			$this->data['city'] = '';
		}

		if (isset($this->request->post['country_id'])) {
			$this->data['country_id'] = $this->request->post['country_id'];
		} elseif (isset($this->session->data['shipping_country_id'])) {
			$this->data['country_id'] = $this->session->data['shipping_country_id'];		
		} else {	
			$this->data['country_id'] = $this->config->get('config_country_id');
		}

		if (isset($this->request->post['zone_id'])) {
			$this->data['zone_id'] = $this->request->post['zone_id'];
		} elseif (isset($this->session->data['shipping_zone_id'])) {
			$this->data['zone_id'] = $this->session->data['shipping_zone_id'];			
		} else {
			$this->data['zone_id'] = '';
		}
		
		$this->load->model('localisation/country');

		$this->data['countries'] = $this->model_localisation_country->getCountries();

		if (isset($this->request->post['password'])) {
			$this->data['password'] = $this->request->post['password'];
		} else {
			$this->data['password'] = '';
		}

		if (isset($this->request->post['confirm'])) {
			$this->data['confirm'] = $this->request->post['confirm'];
		} else {
			$this->data['confirm'] = '';
		}

		if (isset($this->request->post['newsletter'])) {
			$this->data['newsletter'] = $this->request->post['newsletter'];
		} else {
			$this->data['newsletter'] = '1';
		}
		
		if (isset($this->request->post['sms'])) {
			$this->data['sms'] = $this->request->post['sms'];
		} else {
			$this->data['sms'] = '1';
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

		if (isset($this->request->post['agree'])) {
			$this->data['agree'] = $this->request->post['agree'];
		} else {
			$this->data['agree'] = false;
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . 
			'/template/premium_member/register.tpl')) {
			$this->template = $this->config->get('config_template') . 
				'/template/premium_member/register.tpl';
		} else {
			$this->template = 'default/template/premium_member/register.tpl';
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
		if(empty($this->request->post['firstname'])){
			$this->error['firstname'] = $this->language->get('error_firstname_empty');
		}else if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 32)) {
			$this->error['firstname'] = $this->language->get('error_firstname');
		}
                
		if(empty($this->request->post['lastname'])){
			$this->error['lastname'] = $this->language->get('error_lastname_empty');
		}else if ((utf8_strlen($this->request->post['lastname']) < 1) || (utf8_strlen($this->request->post['lastname']) > 32)) {
			$this->error['lastname'] = $this->language->get('error_lastname');
		}

		if(empty($this->request->post['email'])){
			$this->error['email'] = $this->language->get('error_email_empty');
		}else if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}
		
		if(empty($this->request->post['id_number'])){
			$this->error['id_number'] = $this->language->get('error_id_number_empty');
		}else if ((utf8_strlen($this->request->post['id_number']) < 3) || (utf8_strlen($this->request->post['id_number']) > 16)) {
			$this->error['id_number'] = $this->language->get('error_id_number');
		}

		if(empty($this->request->post['telephone'])){
			$this->error['telephone'] = $this->language->get('error_telephone_empty');
		}else if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
			$this->error['telephone'] = $this->language->get('error_telephone');
		}
		
		if(empty($this->request->post['dob'])){
			$this->error['dob'] = $this->language->get('error_dob_empty');
		}else if ((utf8_strlen($this->request->post['dob']) != 10)) {
			$this->error['dob'] = $this->language->get('error_dob');
		}
                
		if(empty($this->request->post['address_1'])){
			$this->error['address_1'] = $this->language->get('error_address_1_empty');
		}else if ((utf8_strlen($this->request->post['address_1']) < 3) || (utf8_strlen($this->request->post['address_1']) > 128)) {
			$this->error['address_1'] = $this->language->get('error_address_1');
		}
                
//		if(empty($this->request->post['city'])){
//			$this->error['city'] = $this->language->get('error_city_empty');
//		}else if ((utf8_strlen($this->request->post['city']) < 2) || (utf8_strlen($this->request->post['city']) > 128)) {
//			$this->error['city'] = $this->language->get('error_city');
//		}

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

		if ($country_info) {
			if(empty($this->request->post['postcode'])){
				$this->error['postcode'] = $this->language->get('error_postcode_empty');
			}else if ($country_info['postcode_required'] && (utf8_strlen($this->request->post['postcode']) < 2) || (utf8_strlen($this->request->post['postcode']) > 10)) {
				$this->error['postcode'] = $this->language->get('error_postcode');
			}

			// VAT Validation
			$this->load->helper('vat');

			if ($this->config->get('config_vat') && $this->request->post['tax_id'] && (vat_validation($country_info['iso_code_2'], $this->request->post['tax_id']) == 'invalid')) {
				$this->error['tax_id'] = $this->language->get('error_vat');
			}
		}

		if ($this->request->post['country_id'] == '') {
			$this->error['country'] = $this->language->get('error_country');
		} else {
			if ($country_info['name'] !== 'Singapore' && (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '')) {
				$this->error['zone'] = $this->language->get('error_zone');
			}
		}
                
		if (empty($this->request->post['password']) || (utf8_strlen($this->request->post['password']) < 8) || (utf8_strlen($this->request->post['password']) > 20)) {
			$this->error['password'] = $this->language->get('error_password');
		}

		if(empty($this->request->post['confirm'])){
			$this->error['confirm'] = $this->language->get('error_confirm_empty');
		}else if ($this->request->post['confirm'] != $this->request->post['password']) {
			$this->error['confirm'] = $this->language->get('error_confirm');
		}

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
			$this->error['warning'] = $this->language->get('error_warning');
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
		
		$currentExpiry = strtotime($this->model_premium_member_db->getCurrentExpiry($premium_member_id));

		// adds 12 months to current expiry
		$newExpiry = strtotime("+" . $this->config->get('premium_member_length') . " months", $currentExpiry);
		if($currentExpiry < time()) // if current expiry is already in the past
		{
			// expiry starts from today onwards instead
			$newExpiry = strtotime("-1 day", strtotime("+" . $this->config->get('premium_member_length') . " months", time()));
		}
		
		$this->model_premium_member_db->upgradeCustomer($premium_member_email, date("Y-m-d", $newExpiry));
		
		$this->redirect($this->url->link('premium_member/success', '', 'SSL'));
	}
	
	private function paymentRequestInfo()
	{
		$price = $this->config->get('premium_member_price');
		
		return array(
			'PAYMENTREQUEST_0_SHIPPINGAMT' => '',
			'PAYMENTREQUEST_0_CURRENCYCODE' => $this->currency->getCode(),
			'PAYMENTREQUEST_0_PAYMENTACTION' => $this->config->get('pp_express_method'),
			'PAYMENTREQUEST_0_INVNUM' => $this->session->data['paypal']['premium_member_email'], //[SB] Added member purchase email to call
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