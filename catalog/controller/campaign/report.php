<?php

class ControllerCampaignReport extends Controller {
	public function index() {
		$this->language->load('campaign/report');
		$this->load->model('campaign/report');
		$title = "Report";

		$referrers = $this->model_campaign_report->getAllReferrers();

		$refs = json_decode(json_encode($referrers), true);

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