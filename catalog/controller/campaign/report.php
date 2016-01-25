<?php

class ControllerCampaignReport extends Controller {
	public function index() {
		$this->language->load('campaign/report');
		$title = "Report";

		// referrers
		$query = "SELECT r.referrer, r.name1 AS name, r.email1 AS ref_email, a.* FROM refers r 
			LEFT JOIN referral_shipping_addresses a ON r.email1 = a.email
			union all
			SELECT r.referrer, r.name2, r.email2 AS ref_email, a.* FROM vit.refers r 
			LEFT JOIN referral_shipping_addresses a ON r.email2 = a.email
			union all
			SELECT r.referrer, r.name3, r.email3 AS ref_email, a.* FROM vit.refers r 
			LEFT JOIN referral_shipping_addresses a ON r.email3 = a.email";
		$referrer = $this->db->query($query);

		$refs = json_decode(json_encode($referrer->rows), true);

		$this->data['refers'] = $refs;

    	$this->document->setTitle($title);
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/campaign/report.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/campaign/report.tpl';
		} else {
			$this->template = 'default/template/campaign/report.tpl';
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