<?php
require 'getresponse.php';

class ControllerCampaignReferral extends Controller {
	public function index() {
		$this->language->load('campaign/referral');
		$title = "Referral";

    	$this->document->setTitle($title);

    	if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
    		$request = $this->request->post;
    		
    		if ($request["name1"] && $request["email1"] && $request["name2"] && $request["email2"] && $request["name3"] && $request["email3"]) {
    			$query = 'INSERT INTO refers values("", "'.$request["referrer"].'", "'.$request["campaign"].'", "'.$request["name1"].'", "'.$request["email1"].'", "'.$request["name2"].'", "'.$request["email2"].'", "'.$request["name3"].'", "'.$request["email3"].'")';
				$this->db->query($query);
				$this->redirect($this->url->link('campaign/thank_you', 'email='.$request["referrer"].'&referrer=true&success=true&cpn='.$_GET['cpn']));
    		} else {
    			$this->redirect($this->url->link('campaign/referral', 'show=true'));
    		}
    	}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/campaign/referral.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/campaign/referral.tpl';
		} else {
			$this->template = 'default/template/campaign/referral.tpl';
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