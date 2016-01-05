<?php
class ControllerExtensionCustomSettings extends Controller {
	
	function index() {

		$this->language->load('extension/custom_settings');

		$this->load->model('setting/custom');
		$this->load->model('catalog/manufacturer');
		$this->load->model('design/banner');

		$groupCode = $this->model_setting_custom->getGroupCode();
		
		$this->data['group_code_sale_label'] = $groupCode['SALE_LABEL'];
		$this->data['group_code_brands_banner'] = $groupCode['BRANDS_BANNER'];
		$this->data['banners'] = $this->model_design_banner->getBanners();

		$dataConfig =  $this->model_setting_custom->getDataConfig();
		$manufacturers =  $this->model_catalog_manufacturer->getManufacturers();
		
		$this->data['sale_label_config'] = array();
		$this->data['brands_banner'] = array();
		$this->data['sale_label_status'] = '';
		$this->data['manufacturers'] = $manufacturers;

		$saleLabelConfig = $dataConfig[$this->data['group_code_sale_label']];

		if ($saleLabelConfig) {
			$this->data['sale_label_config'] = json_decode($saleLabelConfig['data_config']);
			if($saleLabelConfig['status']) {
				$this->data['sale_label_status'] = 'checked';	
			}
		}

		$brandsBanner = $this->model_setting_custom->getBrandsBanner();

		if ($brandsBanner) {
			$brandsBannerRow = $brandsBanner->row;
			$brandsAndTop = $this->model_setting_custom->getBrands($brandsBannerRow['banner_id']);
			$this->data['brands'] = $brandsAndTop['brands'];
			$this->data['brands_top'] = $brandsAndTop['brands_top'];
			$this->data['banner_id'] = $brandsBannerRow['banner_id'];
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

	function saveBrandsBanner() {	
		$data = $this->request->post;
		$this->load->model('setting/custom');
		$save = $this->model_setting_custom->saveBrandsBanner($data);

		$this->response->setOutput(json_encode(array('save' => $save)));
	}
}