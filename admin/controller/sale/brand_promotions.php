<?php
/*TODO: Run This sql script for table creation:
	CREATE TABLE `oc_brand_promotions` (
	  `id` int(11) NOT NULL AUTO_INCREMENT,
	  `customer_group_id` int(11) NOT NULL,
	  `brand_id` int(11) NOT NULL,
	  `priority` int(11) NOT NULL,
	  `discount_value` varchar(10) NOT NULL,
	  `product_ids` varchar(250) NOT NULL,
	  `date_start` datetime NOT NULL,
	  `date_end` datetime NOT NULL,
	  `date_created` varchar(45) DEFAULT '0000-00-00 00:00:00',
	  `status` tinyint(4) NOT NULL,
	  PRIMARY KEY (`id`)
	) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
	SELECT * FROM vitamin1.oc_brand_promotions;
*/
class ControllerSaleBrandPromotions extends Controller {
	
	public function index() {

		$this->language->load('sale/brand_promotions');

		$this->load->model('catalog/manufacturer');

		$this->document->setTitle($this->language->get('heading_title')); 

		$this->data['manufacturers'] =  $this->model_catalog_manufacturer->getManufacturers();
		
		$this->load->model('sale/brand_promotions');
		$this->data['brand_promotions'] = $this->model_sale_brand_promotions->get();
		
		$this->load->model('sale/customer_group');
		$this->data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => 'Extension',
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('sale/brand_promotions', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_bp'] = $this->language->get('button_add_bp');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$this->data['entry_brands'] = $this->language->get('entry_brands');
		$this->data['entry_discount'] = $this->language->get('entry_discount');
		$this->data['entry_priority'] = $this->language->get('entry_priority');
		$this->data['entry_discount_value'] = $this->language->get('entry_discount_value');
		$this->data['entry_date_start'] = $this->language->get('entry_date_start');
		$this->data['entry_date_end'] = $this->language->get('entry_date_end');
		$this->data['action'] = $this->url->link('sale/brand_promotions/insert', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['token'] = $this->session->data['token'];

		$this->template = 'sale/brand_promotions.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}	

	public function insert()
	{
		$this->load->model('sale/brand_promotions');
	
		$data = $this->request->post;

		$this->data['error'] = 0;

		if (!isset($data['bp']) || count($data['bp']) == 0) {
			$this->data['error'] = 1;
			$this->data['message'] = 'No data submitted.';
			return json_encode($this->data);
		}

		$save = $this->model_sale_brand_promotions->saveBrandProductPromotions($data['bp']);

		$this->data['message'] = 'Success.';
		// return json_decode($this->data);

		$this->redirect($this->url->link('sale/brand_promotions', 'token=' . $this->session->data['token'] . $url, 'SSL'));
	}
	
}