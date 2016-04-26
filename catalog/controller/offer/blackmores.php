<?php

class ControllerOfferBlackmores extends Controller {
	public function index() {
		$title = "Vitamin.sg and Blackmores Partnership Offers";

    	$this->document->setTitle($title);

    	if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
    	}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/offer/blackmores.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/offer/blackmores.tpl';
		} else {
			$this->template = 'default/template/offer/blackmores.tpl';
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