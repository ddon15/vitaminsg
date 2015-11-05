<?php 
class ControllerPremiumMemberComplimentary extends Controller
{
	private $error = array();
	
	public function index()
	{
		if ($this->customer->isLogged()) {
			$this->redirect($this->url->link('account/account', '', 'SSL'));
		}
		
		$this->language->load('premium_member/complimentary');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
		$this->data['action'] = $this->url->link('premium_member/complimentary', '', 'SSL');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate())
		{
			$this->load->model('premium_member/db');
			$membership_period = $this->model_premium_member_db->getClaimCodeExpiryPeriod($this->request->post['claim_code']);
			//$expiry = strtotime("+" . ($this->request->post['years'] * 12) . " months", time());
			$expiry = strtotime("+" . $membership_period, time());

			// Add unapproved account of customer group "Premium Member"
			if($this->model_premium_member_db->addComplimentaryMember($this->request->post, date("Y-m-d", $expiry)))
			{
				$this->redirect($this->url->link('premium_member/complimentary_success', '', 'SSL'));
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
			'text'      => $this->language->get('text_complimentary'),
			'href'      => $this->url->link('premium_member/complimentary', '', 'SSL'),      	
			'separator' => $this->language->get('text_separator')
		);
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		if (isset($this->request->post['years'])) {
			$this->data['years'] = $this->request->post['years'];
		} else if(isset($this->request->get['hit']) && $this->request->get['hit'] == 2) {
			$this->data['years'] = 2;
		}
		else {
			$this->data['years'] = 1;
		}
		
		$this->data['text_title'] = $this->language->get('text_title');
		$this->data['text_subscribe_price'] = sprintf($this->language->get('text_subscribe_price'), $this->data['years']);
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
		$this->data['text_your_password'] = $this->language->get('text_your_password');
		$this->data['text_notifications'] = $this->language->get('text_notifications');
		$this->data['text_signup'] = $this->language->get('text_signup');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_male'] = $this->language->get('text_male');
		$this->data['text_female'] = $this->language->get('text_female');
		$this->data['text_id_number_help'] = $this->language->get('text_id_number_help');

		$this->data['text_claim_code'] = $this->language->get('text_claim_code');
		$this->data['text_claim_code_instruction'] = $this->language->get('text_claim_code_instruction');
		$this->data['entry_claim_code'] = $this->language->get('entry_claim_code');

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

		if (isset($this->error['claim_code'])) {
			$this->data['error_claim_code'] = $this->error['claim_code'];
		} else {
			$this->data['error_claim_code'] = '';
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

		if (isset($this->request->post['claim_code'])) {
			$this->data['claim_code'] = $this->request->post['claim_code'];
		} else {
			$this->data['claim_code'] = '';
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
			'/template/premium_member/complimentary.tpl')) {
			$this->template = $this->config->get('config_template') . 
				'/template/premium_member/complimentary.tpl';
		} else {
			$this->template = 'default/template/premium_member/complimentary.tpl';
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
                
		if(empty($this->request->post['city'])){
			$this->error['city'] = $this->language->get('error_city_empty');
		}else if ((utf8_strlen($this->request->post['city']) < 2) || (utf8_strlen($this->request->post['city']) > 128)) {
			$this->error['city'] = $this->language->get('error_city');
		}

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
		}

		if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '') {
			$this->error['zone'] = $this->language->get('error_zone');
		}

                
		if (empty($this->request->post['password']) || (utf8_strlen($this->request->post['password']) < 8) || (utf8_strlen($this->request->post['password']) > 20)) {
			$this->error['password'] = $this->language->get('error_password');
		}

		if(empty($this->request->post['confirm'])){
			$this->error['confirm'] = $this->language->get('error_confirm_empty');
		}else if ($this->request->post['confirm'] != $this->request->post['password']) {
			$this->error['confirm'] = $this->language->get('error_confirm');
		}
		if ($this->request->post['claim_code'] == '') {
			$this->error['claim_code'] = $this->language->get('error_claim_code');
		}
		else {
			$this->load->model('premium_member/db');
			$row = $this->model_premium_member_db->validateClaimCode($this->request->post['claim_code']);
			if($row==null) {
				$this->error['claim_code'] = $this->language->get('error_invalid_claim_code');
			}
			else if($row["USED"] >= $row["MAX_USAGE"]) {
				$this->error['claim_code'] = $this->language->get('error_maxed_out_claim_code');
			}
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
}
?>