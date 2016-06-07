<?php
class ModelPremiumMemberDb extends Model
{
	public function addPremiumMember($data)
	{
		$customer_email = $this->db->escape($data['email']);
		$customer_info = $this->getCustomerInfo($customer_email);
		$customer_id = $customer_info['customer_id'];
		
		$pid = $this->getPremiumMemberId($customer_email);

		if ($customer_id && $pid) // Account already exist
		{
			return !$this->isPremiumMemberAndPaid($pid);
		}
		
		// add default customer
		$customer_group_id = $this->config->get('config_customer_group_id');
		$this->load->model('account/customer_group');

		$customer_group_info = $this->model_account_customer_group->getCustomerGroup($customer_group_id);

		// Note: see system/library/customer.php for login.
		$this->db->query("INSERT INTO " . DB_PREFIX . "customer SET store_id = '" . (int)$this->config->get('config_store_id') . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $customer_email . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '', salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = MD5(CONCAT('" . $salt . '\',\'' . $this->db->escape($data['password']) . "')), newsletter = '" . (isset($data['newsletter']) ? (int)$data['newsletter'] : 0) . "', sms = '" . (isset($data['sms']) ? (int)$data['sms'] : 0) . "', customer_group_id = '" . (int)$customer_group_id . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', status = '1', approved = '" . (int)!$customer_group_info['approval'] . "', date_added = NOW()");

		$customer_id = $this->db->getLastId();
		
		// add addresses
		$this->db->query("INSERT INTO " . DB_PREFIX . "address SET customer_id = '" . (int)$customer_id . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', company = '', company_id = '', tax_id = '', address_1 = '" . $this->db->escape($data['address_1']) . "', address_2 = '" . $this->db->escape($data['address_2']) . "', city = '" . $this->db->escape($data['city']) . "', postcode = '" . $this->db->escape($data['postcode']) . "', country_id = '" . (int)$data['country_id'] . "', zone_id = '" . (int)$data['zone_id'] . "'");

		$address_id = $this->db->getLastId();
		
		// update customer's address to this address
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$customer_id . "'");

		$premium_member_id = $this->getPremiumMemberId($customer_email);
		if($premium_member_id == 0) // Premium account does not exist. Add.
		{
			// add to premium member table
			//$this->db->query("INSERT INTO " . DB_PREFIX . "premium_member SET customer_id = '" . (int)$customer_id . "', member_num = 'P" . $this->genMemberNum((int)$customer_id) . "', email = '" . $customer_email . "', id_number = '" . $this->db->escape($data['id_number']) . "', DOB = '" . $this->db->escape($data['dob']) . "', gender = '" . $this->db->escape($data['gender']) . "', created = NOW(), modified = NOW(), expiry = SUBDATE(CURDATE(),1)");
			$this->db->query("INSERT INTO " . DB_PREFIX . "premium_member SET customer_id = '" . (int)$customer_id . "', member_num = '', email = '" . $customer_email . "', id_number = '" . $this->db->escape($data['id_number']) . "', DOB = '" . $this->db->escape($data['dob']) . "', gender = '" . $this->db->escape($data['gender']) . "', created = NOW(), modified = NOW(), expiry = SUBDATE(CURDATE(),1)");
		}

		// -- lw: GetResponseAPI 16 July 2015
		define("GR_API_KEY", "b89d10b5c935a3ac51f0d01317ab3c20");
		define("MEMBER_LIST_ID", "V3MNe");
		require_once('GetResponseAPI.class.php');
		$api = new GetResponse(GR_API_KEY);

		if((isset($data['newsletter']) ? (int)$data['newsletter'] : 0)!=0) {
			$api->addContact(MEMBER_LIST_ID, $this->db->escape($data['firstname']) . " " . $this->db->escape($data['lastname']), $customer_email);
		}

		return true;
	}

	public function getClaimCodeExpiryPeriod($claim_code) {
		$query = $this->db->query("SELECT expiry FROM " . DB_PREFIX . "claim_code WHERE claim_code = '" . $claim_code . "'");
		return $query->row['expiry'];
	}
	
	public function addComplimentaryMember($data, $expiry)
	{
		$customer_email = $this->db->escape($data['email']);
		$customer_info = $this->getCustomerInfo($customer_email);
		$customer_id = $customer_info['customer_id'];
		$customer_group_id = $this->getPremiumCustomerGroupId();

		if($customer_id == 0) // Account doesn't exist
		{
			$this->load->model('account/customer_group');

			$customer_group_info = $this->model_account_customer_group->getCustomerGroup($customer_group_id);

			$this->db->query("INSERT INTO " . DB_PREFIX . "customer SET store_id = '" . (int)$this->config->get('config_store_id') . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $customer_email . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '', salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = MD5(CONCAT('" . $salt . '\',\'' . $this->db->escape($data['password']) . "')), newsletter = '" . (isset($data['newsletter']) ? (int)$data['newsletter'] : 0) . "', sms = '" . (isset($data['sms']) ? (int)$data['sms'] : 0) . "', customer_group_id = '" . (int)$customer_group_id . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', status = '1', approved = '1', date_added = NOW()");

			$customer_id = $this->db->getLastId();
		}
		else {
			$this->db->query("UPDATE " . DB_PREFIX . "customer SET customer_group_id = '" . (int)$customer_group_id . "' WHERE customer_id = '" . $customer_id . "'");
		}
		
		$query = $this->db->query("SELECT expiry" .
			" FROM " . DB_PREFIX . "premium_member WHERE customer_id = '" . (int)$customer_id . "'");
			
		$result = $query->row;
		$member_num = 'M' . $this->genMemberNum((int)$customer_id);

		if(empty($result)) // Premium account does not exist. Add.
		{
			// add to premium member table
			$this->db->query("INSERT INTO " . DB_PREFIX . "premium_member SET customer_id = '" . (int)$customer_id . "', member_num = '" . $member_num . "', email = '" . $customer_email . "', id_number = '" . $this->db->escape($data['id_number']) . "', DOB = '" . $this->db->escape($data['dob']) . "', gender = '" . $this->db->escape($data['gender']) . "', created = NOW(), modified = NOW(), expiry = '" . $expiry . "', claim_code='".$this->db->escape($data['claim_code'])."'");

			// -- lw: GetResponseAPI 16 July 2015
			define("GR_API_KEY", "b89d10b5c935a3ac51f0d01317ab3c20");
			define("MEMBER_LIST_ID", "V3MNe");
			require_once('GetResponseAPI.class.php');
			$api = new GetResponse(GR_API_KEY);

			if((isset($data['newsletter']) ? (int)$data['newsletter'] : 0)!=0) {
				$api->addContact(MEMBER_LIST_ID, $this->db->escape($data['firstname']) . " " . $this->db->escape($data['lastname']), $customer_email);
			}
//			else {
//				$contacts = (array) $api->getContactsByEmail($customer_email);
//				if (is_array($contacts) && sizeof($contacts)) {
//					foreach ($contacts as $contactID => $contact) {
//						$api->deleteContact($contactID);
//					}
//				}
//			}

			//print_r($retval);
		}
		else if(strtotime($result['expiry']) > strtotime('today')) { //customer has unexpired membership
			
			return false; // cannot get complimentary membership
		}
		else {
			$this->db->query("UPDATE " . DB_PREFIX . "premium_member SET expiry = '" . $expiry . "',  member_num = '" . $member_num . "', claim_code='".$this->db->escape($data['claim_code'])."' WHERE customer_id = '" . (int)$customer_id . "'");
		}
		
		// set approval to false first
		//$this->db->query("UPDATE " . DB_PREFIX . "customer SET approved = '0' WHERE customer_id = '" . (int)$customer_id . "'");
		
		// add addresses
		$this->db->query("INSERT INTO " . DB_PREFIX . "address SET customer_id = '" . (int)$customer_id . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', company = '', company_id = '', tax_id = '', address_1 = '" . $this->db->escape($data['address_1']) . "', address_2 = '" . $this->db->escape($data['address_2']) . "', city = '" . $this->db->escape($data['city']) . "', postcode = '" . $this->db->escape($data['postcode']) . "', country_id = '" . (int)$data['country_id'] . "', zone_id = '" . (int)$data['zone_id'] . "'");

		$address_id = $this->db->getLastId();
		
		// update customer's address to this address
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$customer_id . "'");

		$premium_member_id = $this->getPremiumMemberId($customer_email);
		if($premium_member_id == 0) // Premium account does not exist. Add.
		{
			$member_num = 'M' . $this->genMemberNum((int)$customer_id);
			
			// add to premium member table
			$this->db->query("INSERT INTO " . DB_PREFIX . "premium_member SET customer_id = '" . (int)$customer_id . "', member_num = '" . $member_num . "', email = '" . $customer_email . "', id_number = '" . $this->db->escape($data['id_number']) . "', DOB = '" . $this->db->escape($data['dob']) . "', gender = '" . $this->db->escape($data['gender']) . "', created = NOW(), modified = NOW(), expiry = '" . $expiry . "', claim_code='".$this->db->escape($data['claim_code'])."'");
		}
		
		$this->sendMemberWelcome($data['firstname'], $customer_email, $member_num);

		
		/*
		$text_email = 'Vitamin.sg Member Approval required for ' . html_entity_decode($data['firstname']) . ' ' . html_entity_decode($data['lastname']) . '.';
		$text_email .= ' Approve ' . html_entity_decode($customer_email) . ' at ' . $this->config->get('config_url') . '/admin/index.php?route=sale/customer&filter_email=' . html_entity_decode($customer_email);
		
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->hostname = $this->config->get('config_smtp_host');
		$mail->username = $this->config->get('config_smtp_username');
		$mail->password = $this->config->get('config_smtp_password');
		$mail->port = $this->config->get('config_smtp_port');
		$mail->timeout = $this->config->get('config_smtp_timeout');							
		$mail->setTo($this->config->get('config_email'));
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender($this->config->get('config_name'));
		$mail->setSubject('Vitamin.sg Member Approval for ' . html_entity_decode($customer_email));
		$mail->setText($text_email);
		$mail->send();
		
		// Send to additional alert emails if new account email is enabled
		$emails = explode(',', $this->config->get('config_alert_emails'));

		foreach ($emails as $email) {
			if (strlen($email) > 0 && preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $email)) {
				$mail->setTo($email);
				$mail->send();
			}
		}
		*/
		return true;
	}
	
	public function addPremiumMemberOrder($customer_id, $customer_email) {
		
		$invoice_prefix = $this->config->get('config_invoice_member_prefix');
		
		$invoice_no_query = $this->db->query("SELECT MAX(invoice_no) AS invoice_no FROM `" . DB_PREFIX . "premium_member_order` WHERE invoice_prefix = '" . $this->db->escape($invoice_prefix) . "'");

		if ($invoice_no_query->row['invoice_no']) {
			$invoice_no = $invoice_no_query->row['invoice_no'] + 1;
		} else {
			$invoice_no = 1;
		}
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "premium_member_order SET invoice_no = '" . $invoice_no . "', invoice_prefix = '" . $invoice_prefix . "', customer_id = '" . (int)$customer_id . "', email = '" . $customer_email . "', total = '" . $this->config->get('premium_member_price') . "', date_added = NOW()");
		
		return $invoice_prefix . sprintf('%04d', $invoice_no);
	}
	
	public function getCurrentExpiry($premium_member_id)
	{
		$query = $this->db->query("SELECT expiry" .
			" FROM " . DB_PREFIX . "premium_member WHERE premium_member_id = " . (int)$premium_member_id);
			
		$row = $query->row;
		return $row['expiry'];
	}
	
	public function getMemberInfo($customer_id)
	{
		$query = $this->db->query("SELECT member_num, expiry" .
			" FROM " . DB_PREFIX . "premium_member WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->num_rows > 0 ?
			array(
				'member_num' => $query->row['member_num'],
				'expiry' => $query->row['expiry'])
			: '';
	}
	
	public function getCurrentExpiryWithCustId($customer_id)
	{
		$query = $this->db->query("SELECT expiry" .
			" FROM " . DB_PREFIX . "premium_member WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->num_rows > 0 ? $query->row['expiry'] : '';
	}
	
	public function getCurrentExpiryWithEmail($email)
	{
		$query = $this->db->query("SELECT expiry" .
			" FROM " . DB_PREFIX . "premium_member WHERE email = '" . $this->db->escape($email) . "'");
			
		return $query->num_rows > 0 ? $query->row['expiry'] : '';
	}
	
	public function getPremiumCustomer($customer_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "premium_member WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row;
	}
	
	public function upgradeCustomer($customer_email, $new_expiry, $reward_used = 0)
	{
		$customer_group_id = $this->getPremiumCustomerGroupId();
		
		// set customer's group to premium group
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET customer_group_id = '" . (int)$customer_group_id . "' WHERE email = '" . $customer_email . "'");
		
		// set premium member expiry
		//$this->db->query("UPDATE " . DB_PREFIX . "premium_member SET expiry = '" . $new_expiry . "', modified = NOW() WHERE email = '" . $customer_email . "'");

		$customer_info = $this->getCustomerInfo($customer_email);
		$member_num = 'P' . $this->genMemberNum((int)$customer_info["customer_id"]);
		$this->db->query("UPDATE " . DB_PREFIX . "premium_member SET expiry = '" . $new_expiry . "', member_num='" . $member_num . "', modified = NOW() WHERE email = '" . $customer_email . "'");

		$invoice = $this->addPremiumMemberOrder($customer_info['customer_id'], $customer_email);
		$this->sendOrderConfirmation($invoice, $customer_email, $member_num, $reward_used);
		$this->sendMemberWelcome($customer_info['firstname'], $customer_email, $member_num);
	}
	
	public function addPremiumMemberPayPal($transaction_data)
	{
		$this->db->query("INSERT INTO `" . DB_PREFIX . "premium_member_paypal` SET `premium_member_id` = '" . (int)$transaction_data['premium_member_id'] . "', `created` = NOW(), `capture_status` = '" . $this->db->escape($transaction_data['capture_status']) . "', `currency_code` = '" . $this->db->escape($transaction_data['currency_code']) . "', `transaction_id` = '" . $this->db->escape($transaction_data['transaction_id']) . "', `receipt_id` = '" . $this->db->escape($transaction_data['receipt_id']) . "', `payment_type` = '" . $this->db->escape($transaction_data['payment_type']) . "', `payment_status` = '" . $this->db->escape($transaction_data['payment_status']) . "', `pending_reason` = '" . $this->db->escape($transaction_data['pending_reason']) . "', `transaction_entity` = '" . $this->db->escape($transaction_data['transaction_entity']) . "', `amount` = '" . (double)$transaction_data['amount'] . "', `debug_data` = '" . $this->db->escape($transaction_data['debug_data']) . "'");
	}
	
	public function getPremiumMemberId($premium_member_email)
	{
		$result = $this->db->query("SELECT premium_member_id" .
			" FROM " . DB_PREFIX . "premium_member WHERE email = '" . $this->db->escape($premium_member_email) . "'");
		
		$row = $result->row;
		
		return empty($row) ? 0 : $row['premium_member_id'];
	}
	
	public function isPremiumMember($email) {
		$result = $this->db->query("SELECT 1" .
			" FROM " . DB_PREFIX . "premium_member WHERE email = '" . $this->db->escape($email) . "' AND expiry >= CURDATE() LIMIT 1");

		return $result->num_rows == 1;
	}
	
	public function useRewardForPremiumMember($premium_member_id, $description) {
	
		$this->db->query("INSERT INTO " . DB_PREFIX . "customer_reward
			SET customer_id = (SELECT customer_id FROM " . DB_PREFIX . "premium_member WHERE premium_member_id = '" . (int)$premium_member_id . "'), description = '" . $this->db->escape($description) . "', points = '" . ((float)$this->config->get('premium_member_price') * -100) . "', date_added = NOW()");
	}

	public function validateClaimCode($claim_code) {
		$result = $this->db->query("SELECT (SELECT COUNT(*) FROM " . DB_PREFIX
			. "premium_member WHERE claim_code=cc.claim_code) AS USED, MAX_USAGE FROM " . DB_PREFIX . "claim_code cc WHERE claim_code = '" . $claim_code
			. "' AND NOW() BETWEEN START_DATE AND END_DATE");

		return $result->rows[0];
	}
	
	private function isPremiumMemberAndPaid($pid)
	{
		$result = $this->db->query("SELECT payment_status" .
			" FROM " . DB_PREFIX . "premium_member_paypal WHERE premium_member_id = '" . $this->db->escape($pid) . "'");
		
		$row = $result->row;
		
		return $row && $row['payment_status'] == 'Completed';
	}

	private function sendOrderConfirmation($invoice, $customer_email, $member_num, $reward_used = 0) {
		// HTML Mail
		$this->language->load('mail/premium_member');
		
		$template = new Template();

		$store_name = $this->config->get('config_name');
		$store_url = $this->config->get('config_url');
		
		$subject = sprintf($this->language->get('text_subject'), html_entity_decode($store_name, ENT_QUOTES, 'UTF-8'), $invoice);
		$total = 'S' . $this->currency->format($this->config->get('premium_member_price')); //[SB] Hack added S in front of $
		
		$template->data['title'] = $subject;

		$template->data['text_greeting'] = sprintf($this->language->get('text_greeting'), html_entity_decode($store_name, ENT_QUOTES, 'UTF-8'));
		$template->data['text_address'] = $this->language->get('text_address');
		$template->data['text_link'] = $this->language->get('text_link');
		$template->data['text_order_detail'] = $this->language->get('text_order_detail');
		$template->data['text_order_id'] = $this->language->get('text_order_id');
		$template->data['text_date_added'] = $this->language->get('text_date_added');
		$template->data['text_payment_method'] = $this->language->get('text_payment_method');
		$template->data['payment_method'] = $this->language->get('payment_method');
		$template->data['text_email'] = $this->language->get('text_email');
		$template->data['text_member_num'] = $this->language->get('text_member_num');
		$template->data['text_product'] = $this->language->get('text_product');
		$template->data['text_quantity'] = $this->language->get('text_quantity');
		$template->data['text_price'] = $this->language->get('text_price');
		$template->data['text_total'] = $this->language->get('text_total');
		$template->data['text_footer'] = $this->language->get('text_footer');
		
		$template->data['logo'] = $store_url . 'image/' . $this->config->get('config_logo');		
		$template->data['store_name'] = $store_name;
		$template->data['store_url'] = $store_url;
		$template->data['link'] = $store_url . 'index.php?route=account/login';
		
		$template->data['order_id'] = $invoice;
		$template->data['date_added'] = date($this->language->get('date_format_short'), strtotime(date('Y-m-d')));    	
		$template->data['email'] = $customer_email;
		$template->data['member_num'] = $member_num;
		
		$template->data['product'] = array(
			'name'     => $this->config->get('premium_member_name'),
			'quantity' => 1,
			'price'    => $total, 
			'total'    => $total
		);
		
		if($reward_used) {
			$template->data['text_reward_used'] = sprintf($this->language->get('text_reward_used'), $reward_used);
		}
		else {
			$template->data['text_reward_used'] = false;
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/mail/premium_member.tpl')) {
			$html = $template->fetch($this->config->get('config_template') . '/template/mail/premium_member.tpl');
		} else {
			$html = $template->fetch('default/template/mail/premium_member.tpl');
		}
			
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->hostname = $this->config->get('config_smtp_host');
		$mail->username = $this->config->get('config_smtp_username');
		$mail->password = $this->config->get('config_smtp_password');
		$mail->port = $this->config->get('config_smtp_port');
		$mail->timeout = $this->config->get('config_smtp_timeout');				
		$mail->setTo($customer_email);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender($this->config->get('config_name'));
		$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
		$mail->setHtml($html);
		$mail->send();

		// Send to main admin email if new account email is enabled
		if ($this->config->get('config_account_mail')) {

			$mail->setTo($this->config->get('config_email'));
			$mail->send();

			// Send to additional alert emails if new account email is enabled
			$emails = explode(',', $this->config->get('config_alert_emails'));

			foreach ($emails as $email) {
				if (strlen($email) > 0 && preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $email)) {
					$mail->setTo($email);
					$mail->send();
				}
			}
		}
	}
	
	private function sendMemberWelcome($customer_name, $customer_email, $member_num) {
		// HTML Mail
		$this->language->load('mail/premium_member_welcome');
		
		$template = new Template();

		$store_name = $this->config->get('config_name');
		$store_url = $this->config->get('config_url');
		
		$subject = sprintf($this->language->get('text_subject'), html_entity_decode($store_name, ENT_QUOTES, 'UTF-8'));
				
		$template->data['title'] = $subject;
		$template->data['text_welcome'] = sprintf($this->language->get('text_welcome'), html_entity_decode($store_name, ENT_QUOTES, 'UTF-8'));

		//$template->data['text_greeting'] = sprintf($this->language->get('text_greeting'), html_entity_decode($customer_name, ENT_QUOTES, 'UTF-8'));
		//$template->data['text_login'] = sprintf($this->language->get('text_login'), $store_url . 'index.php?route=account/login');
		$template->data['member_name'] = html_entity_decode($customer_name, ENT_QUOTES, 'UTF-8');
		$template->data['member_num'] = html_entity_decode($member_num, ENT_QUOTES, 'UTF-8');
		$template->data['login_url'] = $store_url . 'index.php?route=account/login';
		$template->data['text_enquiries'] = $this->language->get('text_enquiries');
		$template->data['text_social_title'] = $this->language->get('text_social_title');
		$template->data['link_facebook'] = "http://www.facebook.com/vitaminsg";
		$template->data['image_facebook'] = $store_url . "catalog/view/theme/oxy/image/follow_us/icon-facebook-38.png";
		$template->data['text_social_facebook'] = $this->language->get('text_social_facebook');
		$template->data['link_twitter'] = "https://twitter.com/vitaminsg";
		$template->data['image_twitter'] = $store_url . "catalog/view/theme/oxy/image/follow_us/icon-twitter-38.png";
		$template->data['text_social_twitter'] = $this->language->get('text_social_twitter');
		$template->data['text_copyright'] = $this->language->get('text_copyright');
		
		$template->data['logo'] = $store_url . 'image/' . $this->config->get('config_logo');		
		$template->data['store_name'] = $store_name;
		$template->data['store_url'] = $store_url;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/mail/premium_member_welcome.tpl')) {
			$html = $template->fetch($this->config->get('config_template') . '/template/mail/premium_member_welcome.tpl');
		} else {
			$html = $template->fetch('default/template/mail/premium_member_welcome.tpl');
		}
			
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->hostname = $this->config->get('config_smtp_host');
		$mail->username = $this->config->get('config_smtp_username');
		$mail->password = $this->config->get('config_smtp_password');
		$mail->port = $this->config->get('config_smtp_port');
		$mail->timeout = $this->config->get('config_smtp_timeout');				
		$mail->setTo($customer_email);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender($this->config->get('config_name'));
		$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
		$mail->setHtml($html);
		$mail->send();
		
		// Send to main admin email if new account email is enabled
		if ($this->config->get('config_account_mail')) {

			$mail->setTo($this->config->get('config_email'));
			$mail->send();

			// Send to additional alert emails if new account email is enabled
			$emails = explode(',', $this->config->get('config_alert_emails'));

			foreach ($emails as $email) {
				if (strlen($email) > 0 && preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $email)) {
					$mail->setTo($email);
					$mail->send();
				}
			}
		}
	}
	
	private function getCustomerInfo($customer_email)
	{
		$result = $this->db->query("SELECT c.customer_id, c.customer_group_id, c.firstname, c.lastname, p.member_num FROM " . DB_PREFIX . "customer c, " . DB_PREFIX . "premium_member p WHERE c.email = '" . $this->db->escape($customer_email) . "' AND p.email = '" . $this->db->escape($customer_email) . "'");

		$row = $result->row;
		
		return empty($row) ?
			array('customer_id' => 0, 'firstname' => '', 'lastname' => '', 'member_num' => '', 'customer_group_id' => '') :
			array('customer_id' => $row['customer_id'], 'firstname' => $row['firstname'], 'lastname' => $row['lastname'], 'member_num' => $row['member_num'], 'customer_group_id' => $row['customer_group_id']);
	}
	
	private function getCustomerName($customer_id)
	{
		$result = $this->db->query("SELECT CONCAT(first_name, ' ', last_name) AS customer_name FROM " . DB_PREFIX . "customer WHERE customer_id = '" . $customer_id . "'");

		$row = $result->row;
		
		return empty($row) ? '' : $row['customer_name'];
	}
	
	private function getPremiumCustomerGroupId()
	{
		// get id of premium member group
		$query = $this->db->query("SELECT customer_group_id" .
			" FROM " . DB_PREFIX . "customer_group_description WHERE name = 'Premium Member'");
			
		$row = $query->row;
		return $row['customer_group_id'];
	}
	
	private function genMemberNum($customer_id) {
		return date('my') . $customer_id;
	}
}
?>