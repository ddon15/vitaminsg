<?php  

class ControllerSaleCoupon extends Controller {

	private $error = array();

        //[MY] modified to suit special codes

        private $max_code_length = 40;



	public function index() {

		$this->language->load('sale/coupon');



		$this->document->setTitle($this->language->get('heading_title'));



		$this->load->model('sale/coupon');



		$this->getList();

	}



	public function insert() {

		$this->language->load('sale/coupon');



		$this->document->setTitle($this->language->get('heading_title'));



		$this->load->model('sale/coupon');



		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->model_sale_coupon->addCoupon($this->request->post);



			$this->session->data['success'] = $this->language->get('text_success');



			$url = '';



			if (isset($this->request->get['sort'])) {

				$url .= '&sort=' . $this->request->get['sort'];

			}



			if (isset($this->request->get['order'])) {

				$url .= '&order=' . $this->request->get['order'];

			}



			if (isset($this->request->get['page'])) {

				$url .= '&page=' . $this->request->get['page'];

			}



			$this->redirect($this->url->link('sale/coupon', 'token=' . $this->session->data['token'] . $url, 'SSL'));

		}



		$this->getForm();

	}



	public function update() {

		$this->language->load('sale/coupon');



		$this->document->setTitle($this->language->get('heading_title'));



		$this->load->model('sale/coupon');



		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->model_sale_coupon->editCoupon($this->request->get['coupon_id'], $this->request->post);



			$this->session->data['success'] = $this->language->get('text_success');



			$url = '';



			if (isset($this->request->get['sort'])) {

				$url .= '&sort=' . $this->request->get['sort'];

			}



			if (isset($this->request->get['order'])) {

				$url .= '&order=' . $this->request->get['order'];

			}



			if (isset($this->request->get['page'])) {

				$url .= '&page=' . $this->request->get['page'];

			}



			$this->redirect($this->url->link('sale/coupon', 'token=' . $this->session->data['token'] . $url, 'SSL'));

		}



		$this->getForm();

	}



	public function delete() {

		$this->language->load('sale/coupon');



		$this->document->setTitle($this->language->get('heading_title'));



		$this->load->model('sale/coupon');



		if (isset($this->request->post['selected']) && $this->validateDelete()) {

			foreach ($this->request->post['selected'] as $coupon_id) {

				$this->model_sale_coupon->deleteCoupon($coupon_id);

			}



			$this->session->data['success'] = $this->language->get('text_success');



			$url = '';



			if (isset($this->request->get['sort'])) {

				$url .= '&sort=' . $this->request->get['sort'];

			}



			if (isset($this->request->get['order'])) {

				$url .= '&order=' . $this->request->get['order'];

			}



			if (isset($this->request->get['page'])) {

				$url .= '&page=' . $this->request->get['page'];

			}



			$this->redirect($this->url->link('sale/coupon', 'token=' . $this->session->data['token'] . $url, 'SSL'));

		}



		$this->getList();

	}

	public function copy() {

		$this->load->language('sale/coupon');



		$this->document->setTitle($this->language->get('heading_title'));



		$this->load->model('sale/coupon');



		if (isset($this->request->post['selected']) && $this->validateDelete()) {

			foreach ($this->request->post['selected'] as $coupon_id) {

				$this->model_sale_coupon->copyCoupon($coupon_id);

			}

			$this->session->data['success'] = $this->language->get('text_success');

		}



		$url = '';



		if (isset($this->request->get['filter_name'])) {

			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));

		}



		if (isset($this->request->get['filter_coupon_code'])) {

			$url .= '&filter_coupon_code=' . urlencode(html_entity_decode($this->request->get['filter_coupon_code'], ENT_QUOTES, 'UTF-8'));

		}



		if (isset($this->request->get['filter_date_start'])) {

			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];

		}



		if (isset($this->request->get['filter_date_end'])) {

			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];

		}



		if (isset($this->request->get['filter_status'])) {

			$url .= '&filter_status=' . $this->request->get['filter_status'];

		}



		if (isset($this->request->get['filter_sort_order'])) {

			$url .= '&filter_sort_order=' . $this->request->get['filter_sort_order'];

		}



		if (isset($this->request->get['sort'])) {

			$url .= '&sort=' . $this->request->get['sort'];

		}



		if (isset($this->request->get['order'])) {

			$url .= '&order=' . $this->request->get['order'];

		}



		if (isset($this->request->get['page'])) {

			$url .= '&page=' . $this->request->get['page'];

		}



		$this->redirect(HTTPS_SERVER . 'index.php?route=sale/coupon&token=' . $this->session->data['token'] . $url);

	}



	protected function getList() {

		if (isset($this->request->get['sort'])) {

			$sort = $this->request->get['sort'];

		} else {

			$sort = 'name';

		}



		if (isset($this->request->get['order'])) {

			$order = $this->request->get['order'];

		} else {

			$order = 'ASC';

		}



		if (isset($this->request->get['page'])) {

			$page = $this->request->get['page'];

		} else {

			$page = 1;

		}



		$url = '';



		if (isset($this->request->get['sort'])) {

			$url .= '&sort=' . $this->request->get['sort'];

		}



		if (isset($this->request->get['order'])) {

			$url .= '&order=' . $this->request->get['order'];

		}



		if (isset($this->request->get['page'])) {

			$url .= '&page=' . $this->request->get['page'];

		}



		$this->data['breadcrumbs'] = array();



		$this->data['breadcrumbs'][] = array(

			'text'      => $this->language->get('text_home'),

			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),

			'separator' => false

		);



		$this->data['breadcrumbs'][] = array(

			'text'      => $this->language->get('heading_title'),

			'href'      => $this->url->link('sale/coupon', 'token=' . $this->session->data['token'] . $url, 'SSL'),

			'separator' => ' :: '

		);

		$this->data['copy'] = $this->url->link('sale/coupon/copy', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['insert'] = $this->url->link('sale/coupon/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['delete'] = $this->url->link('sale/coupon/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');



		$this->data['coupons'] = array();



		$data = array(

			'sort'  => $sort,

			'order' => $order,

			'start' => ($page - 1) * $this->config->get('config_admin_limit'),

			'limit' => $this->config->get('config_admin_limit')

		);



		$coupon_total = $this->model_sale_coupon->getTotalCoupons();



		$results = $this->model_sale_coupon->getCoupons($data);



		foreach ($results as $result) {

			$action = array();



			$action[] = array(

				'text' => $this->language->get('text_edit'),

				'href' => $this->url->link('sale/coupon/update', 'token=' . $this->session->data['token'] . '&coupon_id=' . $result['coupon_id'] . $url, 'SSL')

			);



			$this->data['coupons'][] = array(

				'coupon_id'  => $result['coupon_id'],

				'name'       => $result['name'],

				'code'       => $result['code'],

				'discount'   => $result['discount'],

				'date_start' => date($this->language->get('date_format_short'), strtotime($result['date_start'])),

				'date_end'   => date($this->language->get('date_format_short'), strtotime($result['date_end'])),

				'status'     => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),

				'selected'   => isset($this->request->post['selected']) && in_array($result['coupon_id'], $this->request->post['selected']),

				'action'     => $action

			);

		}



		$this->data['heading_title'] = $this->language->get('heading_title');



		$this->data['text_no_results'] = $this->language->get('text_no_results');



		$this->data['column_name'] = $this->language->get('column_name');

		$this->data['column_code'] = $this->language->get('column_code');

		$this->data['column_discount'] = $this->language->get('column_discount');

		$this->data['column_date_start'] = $this->language->get('column_date_start');

		$this->data['column_date_end'] = $this->language->get('column_date_end');

		$this->data['column_status'] = $this->language->get('column_status');

		$this->data['column_action'] = $this->language->get('column_action');

		$this->data['button_copy'] = $this->language->get('button_copy');

		$this->data['button_insert'] = $this->language->get('button_insert');

		$this->data['button_delete'] = $this->language->get('button_delete');



		if (isset($this->error['warning'])) {

			$this->data['error_warning'] = $this->error['warning'];

		} else {

			$this->data['error_warning'] = '';

		}



		if (isset($this->session->data['success'])) {

			$this->data['success'] = $this->session->data['success'];



			unset($this->session->data['success']);

		} else {

			$this->data['success'] = '';

		}



		$url = '';



		if ($order == 'ASC') {

			$url .= '&order=DESC';

		} else {

			$url .= '&order=ASC';

		}



		if (isset($this->request->get['page'])) {

			$url .= '&page=' . $this->request->get['page'];

		}



		$this->data['sort_name'] = HTTPS_SERVER . 'index.php?route=sale/coupon&token=' . $this->session->data['token'] . '&sort=name' . $url;

		$this->data['sort_code'] = HTTPS_SERVER . 'index.php?route=sale/coupon&token=' . $this->session->data['token'] . '&sort=code' . $url;

		$this->data['sort_discount'] = HTTPS_SERVER . 'index.php?route=sale/coupon&token=' . $this->session->data['token'] . '&sort=discount' . $url;

		$this->data['sort_date_start'] = HTTPS_SERVER . 'index.php?route=sale/coupon&token=' . $this->session->data['token'] . '&sort=date_start' . $url;

		$this->data['sort_date_end'] = HTTPS_SERVER . 'index.php?route=sale/coupon&token=' . $this->session->data['token'] . '&sort=date_end' . $url;

		$this->data['sort_status'] = HTTPS_SERVER . 'index.php?route=sale/coupon&token=' . $this->session->data['token'] . '&sort=status' . $url;



		$url = '';



		if (isset($this->request->get['sort'])) {

			$url .= '&sort=' . $this->request->get['sort'];

		}



		if (isset($this->request->get['order'])) {

			$url .= '&order=' . $this->request->get['order'];

		}



		$pagination = new Pagination();

		$pagination->total = $coupon_total;

		$pagination->page = $page;

		$pagination->limit = $this->config->get('config_admin_limit');

		$pagination->text = $this->language->get('text_pagination');

		$pagination->url = HTTPS_SERVER . 'index.php?route=sale/coupon&token=' . $this->session->data['token'] . $url . '&page={page}';



		$this->data['pagination'] = $pagination->render();



		$this->data['sort'] = $sort;

		$this->data['order'] = $order;



		$this->template = 'sale/coupon_list.tpl';

		$this->children = array(

			'common/header',	

			'common/footer'	

		);



		$this->response->setOutput($this->render());

	}



	protected function getForm() {

		$this->data['heading_title'] = $this->language->get('heading_title');



		$this->data['text_enabled'] = $this->language->get('text_enabled');

		$this->data['text_disabled'] = $this->language->get('text_disabled');

		$this->data['text_yes'] = $this->language->get('text_yes');

		$this->data['text_no'] = $this->language->get('text_no');

		$this->data['text_percent'] = $this->language->get('text_percent');

		$this->data['text_amount'] = $this->language->get('text_amount');

		$this->data['text_member'] = $this->language->get('text_member'); //[SB] Added Member Price coupon

		$this->data['text_rsp'] = $this->language->get('text_rsp'); 

		$this->data['text_tc'] = $this->language->get('text_tc');



		$this->data['entry_name'] = $this->language->get('entry_name');

		$this->data['entry_description'] = $this->language->get('entry_description');

		$this->data['entry_code'] = $this->language->get('entry_code');

		$this->data['entry_discount'] = $this->language->get('entry_discount');

		$this->data['entry_logged'] = $this->language->get('entry_logged');

		$this->data['entry_shipping'] = $this->language->get('entry_shipping');

		$this->data['entry_type'] = $this->language->get('entry_type');

		$this->data['entry_total'] = $this->language->get('entry_total');

		$this->data['entry_category'] = $this->language->get('entry_category');

		$this->data['entry_product'] = $this->language->get('entry_product');

		$this->data['entry_exclude_manufacturer'] = $this->language->get('entry_exclude_manufacturer'); //[SB] Added exclusions

		$this->data['entry_exclude_product'] = $this->language->get('entry_exclude_product'); //[SB] Added exclusions

		$this->data['entry_date_start'] = $this->language->get('entry_date_start');

		$this->data['entry_date_end'] = $this->language->get('entry_date_end');

		$this->data['entry_uses_total'] = $this->language->get('entry_uses_total');

		$this->data['entry_uses_customer'] = $this->language->get('entry_uses_customer');

		$this->data['entry_status'] = $this->language->get('entry_status');

		$this->data['entry_fixed_price_apply'] = $this->language->get('entry_fixed_price_apply');



		$this->data['button_save'] = $this->language->get('button_save');

		$this->data['button_cancel'] = $this->language->get('button_cancel');



		$this->data['tab_general'] = $this->language->get('tab_general');

		$this->data['tab_history'] = $this->language->get('tab_history');

                

		//[MY]

		$this->data['entry_manufacturer'] = $this->language->get('entry_manufacturer');

		//.[MY]

		$this->data['token'] = $this->session->data['token'];



		if (isset($this->request->get['coupon_id'])) {

			$this->data['coupon_id'] = $this->request->get['coupon_id'];

		} else {

			$this->data['coupon_id'] = 0;

		}



		if (isset($this->error['warning'])) {

			$this->data['error_warning'] = $this->error['warning'];

		} else {

			$this->data['error_warning'] = '';

		}



		if (isset($this->error['name'])) {

			$this->data['error_name'] = $this->error['name'];

		} else {

			$this->data['error_name'] = '';

		}



		if (isset($this->error['code'])) {

			$this->data['error_code'] = $this->error['code'];

		} else {

			$this->data['error_code'] = '';

		}		



		if (isset($this->error['date_start'])) {

			$this->data['error_date_start'] = $this->error['date_start'];

		} else {

			$this->data['error_date_start'] = '';

		}	



		if (isset($this->error['date_end'])) {

			$this->data['error_date_end'] = $this->error['date_end'];

		} else {

			$this->data['error_date_end'] = '';

		}	



		$url = '';



		if (isset($this->request->get['page'])) {

			$url .= '&page=' . $this->request->get['page'];

		}



		if (isset($this->request->get['sort'])) {

			$url .= '&sort=' . $this->request->get['sort'];

		}



		if (isset($this->request->get['order'])) {

			$url .= '&order=' . $this->request->get['order'];

		}



		$this->data['breadcrumbs'] = array();



		$this->data['breadcrumbs'][] = array(

			'text'      => $this->language->get('text_home'),

			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),

			'separator' => false

		);



		$this->data['breadcrumbs'][] = array(

			'text'      => $this->language->get('heading_title'),

			'href'      => $this->url->link('sale/coupon', 'token=' . $this->session->data['token'] . $url, 'SSL'),

			'separator' => ' :: '

		);



		if (!isset($this->request->get['coupon_id'])) {

			$this->data['action'] = $this->url->link('sale/coupon/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');

		} else {

			$this->data['action'] = $this->url->link('sale/coupon/update', 'token=' . $this->session->data['token'] . '&coupon_id=' . $this->request->get['coupon_id'] . $url, 'SSL');

		}



		$this->data['cancel'] = $this->url->link('sale/coupon', 'token=' . $this->session->data['token'] . $url, 'SSL');



		if (isset($this->request->get['coupon_id']) && (!$this->request->server['REQUEST_METHOD'] != 'POST')) {

			$coupon_info = $this->model_sale_coupon->getCoupon($this->request->get['coupon_id']);

		}

		//css display val apply specific fixed price coupon
		$this->data['display_fixed_coupon_apply'] = ("F" === $this->request->get['type'] || "F" === $coupon_info['type']) ? "" : "none";



		if (isset($this->request->post['name'])) {

			$this->data['name'] = $this->request->post['name'];

		} elseif (!empty($coupon_info)) {

			$this->data['name'] = $coupon_info['name'];

		} else {

			$this->data['name'] = '';

		}



		if (isset($this->request->post['code'])) {

			$this->data['code'] = $this->request->post['code'];

		} elseif (!empty($coupon_info)) {

			$this->data['code'] = $coupon_info['code'];

		} else {

			$this->data['code'] = '';

		}



		if (isset($this->request->post['type'])) {

			$this->data['type'] = $this->request->post['type'];

		} elseif (!empty($coupon_info)) {

			$this->data['type'] = $coupon_info['type'];

		} else {

			$this->data['type'] = '';

		}



		if (isset($this->request->post['discount'])) {

			$this->data['discount'] = $this->request->post['discount'];

		} elseif (!empty($coupon_info)) {

			$this->data['discount'] = $coupon_info['discount'];

		} else {

			$this->data['discount'] = '';

		}



		if (isset($this->request->post['logged'])) {

			$this->data['logged'] = $this->request->post['logged'];

		} elseif (!empty($coupon_info)) {

			$this->data['logged'] = $coupon_info['logged'];

		} else {

			$this->data['logged'] = '';

		}



		if (isset($this->request->post['shipping'])) {

			$this->data['shipping'] = $this->request->post['shipping'];

		} elseif (!empty($coupon_info)) {

			$this->data['shipping'] = $coupon_info['shipping'];

		} else {

			$this->data['shipping'] = '';

		}



		if (isset($this->request->post['total'])) {

			$this->data['total'] = $this->request->post['total'];

		} elseif (!empty($coupon_info)) {

			$this->data['total'] = $coupon_info['total'];

		} else {

			$this->data['total'] = '';

		}



		if (isset($this->request->post['coupon_product'])) {

			$products = $this->request->post['coupon_product'];

		} elseif (isset($this->request->get['coupon_id'])) {		

			$products = $this->model_sale_coupon->getCouponProducts($this->request->get['coupon_id']);

		} else {

			$products = array();

		}



		$this->load->model('catalog/product');



		$this->data['coupon_product'] = array();



		foreach ($products as $product_id) {

			$product_info = $this->model_catalog_product->getProduct($product_id);



			if ($product_info) {

				$this->data['coupon_product'][] = array(

					'product_id' => $product_info['product_id'],

					'name'       => $product_info['name']

				);

			}

		}

		

		//[SB] Added Exclude Products

		if (isset($this->request->post['coupon_exclude_product'])) {

			$exclude_products = $this->request->post['coupon_exclude_product'];

		} elseif (isset($this->request->get['coupon_id'])) {		

			$exclude_products = $this->model_sale_coupon->getCouponExcludeProducts($this->request->get['coupon_id']);

		} else {

			$exclude_products = array();

		}



		$this->data['coupon_exclude_product'] = array();



		foreach ($exclude_products as $product_id) {

			$product_info = $this->model_catalog_product->getProduct($product_id);



			if ($product_info) {

				$this->data['coupon_exclude_product'][] = array(

					'product_id' => $product_info['product_id'],

					'name'       => $product_info['name']

				);

			}

		}

		

		//[SB] Added Exclude Manufacturers

		if (isset($this->request->post['coupon_exclude_manufacturer'])) {

			$exclude_manufacturers = $this->request->post['coupon_exclude_manufacturer'];

		} elseif (isset($this->request->get['coupon_id'])) {		

			$exclude_manufacturers = $this->model_sale_coupon->getCouponExcludeManufacturers($this->request->get['coupon_id']);

		} else {

			$exclude_manufacturers = array();

		}



		$this->data['coupon_exclude_manufacturer'] = array();

		$this->load->model('catalog/manufacturer');

		foreach ($exclude_manufacturers as $manufacturer_id) {

			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($manufacturer_id);



			if ($product_info) {

				$this->data['coupon_exclude_manufacturer'][] = array(

					'manufacturer_id' => $manufacturer_info['manufacturer_id'],

					'name'       => $manufacturer_info['name']

				);

			}

		}

		

		//[SB] Added Manufacturers

		if (isset($this->request->post['coupon_manufacturer'])) {

			$manufacturer_info = $this->request->post['coupon_manufacturer'];

		} elseif (isset($this->request->get['coupon_id'])) {		

			$manufacturer_info = $this->model_sale_coupon->getCouponManufacturer($this->request->get['coupon_id']);

		} else {

			$manufacturer_info = array();

		}



		$this->data['coupon_manufacturer'] = array();

		foreach ($manufacturer_info as $manufacturer_id) {

			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($manufacturer_id);



			if ($manufacturer_info) {

				$this->data['coupon_manufacturer'][] = array(

					'manufacturer_id' => $manufacturer_info['manufacturer_id'],

					'name'       => $manufacturer_info['name']

				);

			}

		}



		if (isset($this->request->post['coupon_category'])) {

			$categories = $this->request->post['coupon_category'];

		} elseif (isset($this->request->get['coupon_id'])) {		

			$categories = $this->model_sale_coupon->getCouponCategories($this->request->get['coupon_id']);

		} else {

			$categories = array();

		}



		$this->load->model('catalog/category');



		$this->data['coupon_category'] = array();



		foreach ($categories as $category_id) {

			$category_info = $this->model_catalog_category->getCategory($category_id);



			if ($category_info) {

				$this->data['coupon_category'][] = array(

					'category_id' => $category_info['category_id'],

					'name'        => ($category_info['path'] ? $category_info['path'] . ' &gt; ' : '') . $category_info['name']

				);

			}

		}



		if (isset($this->request->post['date_start'])) {

			$this->data['date_start'] = $this->request->post['date_start'];

		} elseif (!empty($coupon_info)) {

			$this->data['date_start'] = date('Y-m-d', strtotime($coupon_info['date_start']));

		} else {

			$this->data['date_start'] = date('Y-m-d', time());

		}



		if (isset($this->request->post['date_end'])) {

			$this->data['date_end'] = $this->request->post['date_end'];

		} elseif (!empty($coupon_info)) {

			$this->data['date_end'] = date('Y-m-d', strtotime($coupon_info['date_end']));

		} else {

			$this->data['date_end'] = date('Y-m-d', time());

		}



		if (isset($this->request->post['uses_total'])) {

			$this->data['uses_total'] = $this->request->post['uses_total'];

		} elseif (!empty($coupon_info)) {

			$this->data['uses_total'] = $coupon_info['uses_total'];

		} else {

			$this->data['uses_total'] = 1;

		}



		if (isset($this->request->post['uses_customer'])) {

			$this->data['uses_customer'] = $this->request->post['uses_customer'];

		} elseif (!empty($coupon_info)) {

			$this->data['uses_customer'] = $coupon_info['uses_customer'];

		} else {

			$this->data['uses_customer'] = 1;

		}


		if (isset($this->request->post['status'])) {

			$this->data['status'] = $this->request->post['status'];

		} elseif (!empty($coupon_info)) {

			$this->data['status'] = $coupon_info['status'];

		} else {

			$this->data['status'] = 1;

		}

		/*NOTE: For now applied specific only accomodate to all fixed price coupon*/
		if (isset($this->request->post['fa_apply_specific'])) {
			$this->data['applied_specific'] = $this->request->post['fa_apply_specific'];
		} elseif (!empty($coupon_info['applied_specific'])) {
			$this->data['applied_specific'] = $coupon_info['applied_specific'];
		}else {
			$this->data['applied_specific'] = '';
		}
		// var_dump($coupon_info);
		// echo $this->data['applied_specific']; exit;

		$this->template = 'sale/coupon_form.tpl';

		$this->children = array(

			'common/header',	

			'common/footer'	

		);



		$this->response->setOutput($this->render());		

	}



	protected function validateForm() {

		if (!$this->user->hasPermission('modify', 'sale/coupon')) {

			$this->error['warning'] = $this->language->get('error_permission');

		}



		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 128)) {

			$this->error['name'] = $this->language->get('error_name');

		}



		if ((utf8_strlen($this->request->post['code']) < 3) || (utf8_strlen($this->request->post['code']) > $this->max_code_length)) {

			$this->error['code'] = $this->language->get('error_code');

		}



		$coupon_info = $this->model_sale_coupon->getCouponByCode($this->request->post['code']);



		if ($coupon_info) {

			if (!isset($this->request->get['coupon_id'])) {

				$this->error['warning'] = $this->language->get('error_exists');

			} elseif ($coupon_info['coupon_id'] != $this->request->get['coupon_id'])  {

				$this->error['warning'] = $this->language->get('error_exists');

			}

		}



		if (!$this->error) {

			return true;

		} else {

			return false;

		}

	}



	protected function validateDelete() {

		if (!$this->user->hasPermission('modify', 'sale/coupon')) {

			$this->error['warning'] = $this->language->get('error_permission');

		}



		if (!$this->error) {

			return true;

		} else {

			return false;

		}

	}



	public function history() {

		$this->language->load('sale/coupon');



		$this->load->model('sale/coupon');



		$this->data['text_no_results'] = $this->language->get('text_no_results');



		$this->data['column_order_id'] = $this->language->get('column_order_id');

		$this->data['column_customer'] = $this->language->get('column_customer');

		$this->data['column_amount'] = $this->language->get('column_amount');

		$this->data['column_date_added'] = $this->language->get('column_date_added');



		if (isset($this->request->get['page'])) {

			$page = $this->request->get['page'];

		} else {

			$page = 1;

		}  



		$this->data['histories'] = array();



		$results = $this->model_sale_coupon->getCouponHistories($this->request->get['coupon_id'], ($page - 1) * 10, 10);



		foreach ($results as $result) {

			$this->data['histories'][] = array(

				'order_id'   => $result['order_id'],

				'customer'   => $result['customer'],

				'amount'     => $result['amount'],

				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))

			);

		}



		$history_total = $this->model_sale_coupon->getTotalCouponHistories($this->request->get['coupon_id']);



		$pagination = new Pagination();

		$pagination->total = $history_total;

		$pagination->page = $page;

		$pagination->limit = 10; 

		$pagination->url = $this->url->link('sale/coupon/history', 'token=' . $this->session->data['token'] . '&coupon_id=' . $this->request->get['coupon_id'] . '&page={page}', 'SSL');



		$this->data['pagination'] = $pagination->render();



		$this->template = 'sale/coupon_history.tpl';		



		$this->response->setOutput($this->render());

	}

}

?>