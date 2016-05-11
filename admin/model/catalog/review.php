<?php
class ModelCatalogReview extends Model {
	public function addReview($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "review SET author = '" . $this->db->escape($data['author']) . "', product_id = '" . $this->db->escape($data['product_id']) . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', rating = '" . (int)$data['rating'] . "', status = '" . (int)$data['status'] . "', date_added = NOW()");

		$this->cache->delete('product');
	}

	public function editReview($review_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "review SET author = '" . $this->db->escape($data['author']) . "', product_id = '" . $this->db->escape($data['product_id']) . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', rating = '" . (int)$data['rating'] . "', status = '" . (int)$data['status'] . "', date_added = NOW() WHERE review_id = '" . (int)$review_id . "'");

		$this->cache->delete('product');
	}

	public function deleteReview($review_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "review WHERE review_id = '" . (int)$review_id . "'");

		$this->cache->delete('product');
	}

	public function getReview($review_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT pd.name FROM " . DB_PREFIX . "product_description pd WHERE pd.product_id = r.product_id AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS product FROM " . DB_PREFIX . "review r WHERE r.review_id = '" . (int)$review_id . "'");

		return $query->row;
	}
	
	//[SB] Added getTotalCustomerRewardsByReviewId
	public function getTotalCustomerRewardsByReviewId($review_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_reward WHERE review_id = '" . (int)$review_id . "'");

		return $query->row['total'];
	}

	public function getReviews($data = array()) {
		$sql = "SELECT r.review_id, pd.name, r.author, r.rating, r.status, r.date_added FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product_description pd ON (r.product_id = pd.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";																																					  

		$sort_data = array(
			'pd.name',
			'r.author',
			'r.rating',
			'r.status',
			'r.date_added'
		);	

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY r.date_added";	
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}			

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}																																							  

		$query = $this->db->query($sql);																																				

		return $query->rows;	
	}

	public function getTotalReviews() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review");

		return $query->row['total'];
	}

	public function getTotalReviewsAwaitingApproval() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review WHERE status = '0'");

		return $query->row['total'];
	}
	
	//[SB] Added addReward
	public function addReward($customer_id, $product = '', $description = '', $points = '', $review_id = 0) {
	
		$this->load->model('sale/customer');
		
		$customer_info = $this->model_sale_customer->getCustomer($customer_id);

		if ($customer_info) { 
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer_reward SET customer_id = '" . (int)$customer_id . "', order_id = '0', review_id = '" . (int)$review_id . "', points = '" . (int)$points . "', description = '" . $this->db->escape($description) . "', date_added = NOW()");

			$this->language->load('mail/reward_added_review'); //[SB] load reward_added instead

			$store_name = $this->config->get('config_name');
			$store_url = HTTP_CATALOG;//[SB] Added store url
			
			//[SB] Use html mail instead
			$template = new Template();

			$template->data['title'] = sprintf($this->language->get('text_subject'), html_entity_decode($store_name, ENT_QUOTES, 'UTF-8'));
			$template->data['logo'] = $store_url . 'image/' . $this->config->get('config_logo');		
			$template->data['store_name'] = $store_name;
			$template->data['store_url'] = $store_url;
			$template->data['text_address'] = $this->language->get('text_address');
			$template->data['dear'] = sprintf($this->language->get('text_dear'), html_entity_decode($customer_info['firstname'], ENT_QUOTES, 'UTF-8'));
			$template->data['content'] = sprintf($this->language->get('text_content'),
				html_entity_decode($product, ENT_QUOTES, 'UTF-8'),
				$points,
				date('d-M-Y'),
				$this->model_sale_customer->getRewardTotal($customer_id),
				html_entity_decode($store_name, ENT_QUOTES, 'UTF-8')
			);
			
			$html = $template->fetch('mail/reward_added.tpl');

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->hostname = $this->config->get('config_smtp_host');
			$mail->username = $this->config->get('config_smtp_username');
			$mail->password = $this->config->get('config_smtp_password');
			$mail->port = $this->config->get('config_smtp_port');
			$mail->timeout = $this->config->get('config_smtp_timeout');
			$mail->setTo($customer_info['email']);
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender($store_name);
			$mail->setSubject($template->data['title']);
			$mail->setHtml($html);
			$mail->send();
		}
	}

	//[SB] Added deleteReward
	public function deleteReward($review_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_reward WHERE review_id = '" . (int)$review_id . "'");
	}
}
?>