<?php
class ControllerExtensionCustomSettings extends Controller {
	
	function index() {
		$this->language->load('extension/custom_settings');

		$this->load->model('setting/custom');

		$saleLabelConfig =  $this->model_setting_custom->getDataConfig('SALE_LABEL');
		
		$this->data['sale_label_config'] = array();
		$this->data['sale_label_status'] = '';

		if ($saleLabelConfig) {
			$this->data['sale_label_config'] = json_decode($saleLabelConfig['data_config']);
			if($saleLabelConfig['status']) {
				$this->data['sale_label_status'] = 'checked';	
			}
		}

		$this->document->setTitle($this->language->get('heading_title')); 

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => 'Extension',
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/custom_settings', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['token'] = $this->session->data['token'];

		$this->template = 'extension/custom_settings.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}	

	function save() {	
		$data = $this->request->post;
		$this->load->model('setting/custom');
		$save = $this->model_setting_custom->save($data);

		$this->response->setOutput(json_encode(array('save' => $save)));
	}
}