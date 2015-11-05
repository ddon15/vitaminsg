<?php

class ControllerReportCustomerExpiry extends Controller {

	public function index() {     

		$this->language->load('report/customer_expiry');



		$this->document->setTitle($this->language->get('heading_title'));


		if (isset($this->request->get['filter_date_end'])) {

			$filter_date_end = $this->request->get['filter_date_end'];

		} else {

			$filter_date_end = '';

		}

		if (isset($this->request->get['filter_date_from'])) {

			$filter_date_from = $this->request->get['filter_date_from'];

			$making_days = explode("-", $this->request->get['filter_date_from']);

			if(!isset($making_days[0])&& !isset($making_days[1]) && !isset($making_days[2])) {
				$filter_date_end = '';
			}
			elseif($making_days[1] < 12) {
				$making_days[1] = $making_days[1] + 1;
				$making_days[1] = "0".$making_days[1];
				$filter_date_end = implode("-", $making_days);
			}
			elseif($making_days[1] == 12) {
				$making_days[0] = $making_days[0] + 1;
				$making_days[1] = "01";
				$filter_date_end = implode("-", $making_days);
			}

		} else {

			$filter_date_from = '';

		}


		if (isset($this->request->get['page'])) {

			$page = $this->request->get['page'];

		} else {

			$page = 1;

		}



		$url = '';



		if (isset($this->request->get['filter_date_from'])) {

			$url .= '&filter_date_from=' . $this->request->get['filter_date_from'];

		}

		if (isset($this->request->get['filter_date_end'])) {

			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];

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

			'href'      => $this->url->link('report/customer_expiry', 'token=' . $this->session->data['token'] . $url, 'SSL'),

			'separator' => ' :: '

		);



		$this->load->model('report/customer');



		$this->data['customers'] = array();



		$data = array(

			'filter_date_from'	=> $filter_date_from,

			'filter_date_end'	=> $filter_date_end,

			'start'             => ($page - 1) * $this->config->get('config_admin_limit'),

			'limit'             => $this->config->get('config_admin_limit')

		);



		$customer_total = $this->model_report_customer->getTotalPremiumCustomers($data);



		$results = $this->model_report_customer->getPremiumCustomers($data);



		foreach ($results as $result) {



			$this->data['customers'][] = array(

				'name'           => $result['name'],

				'email'          => $result['email'],

				'customer_group' => $result['customer_group'],

				'status'         => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),

				'expiry_date'    => $result['expiry']

			);

		}



		$this->data['heading_title'] = $this->language->get('heading_title');



		$this->data['text_no_results'] = $this->language->get('text_no_results');



		$this->data['column_customer'] = $this->language->get('column_customer');

		$this->data['column_status'] = $this->language->get('column_status');

		$this->data['column_email'] = $this->language->get('column_email');

		$this->data['column_customer_group'] = $this->language->get('column_customer_group');

		$this->data['column_expiry_date'] = $this->language->get('column_expiry_date');



		$this->data['entry_date_from'] = $this->language->get('entry_date_from');

		$this->data['entry_date_end'] = $this->language->get('entry_date_end');



		$this->data['button_filter'] = $this->language->get('button_filter');



		$this->data['token'] = $this->session->data['token'];



		$url = '';



		if (isset($this->request->get['filter_date_from'])) {

			$url .= '&filter_date_from=' . $this->request->get['filter_date_from'];

		}



		if (isset($this->request->get['filter_date_end'])) {

			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];

		}



		$pagination = new Pagination();

		$pagination->total = $customer_total;

		$pagination->page = $page;

		$pagination->limit = $this->config->get('config_admin_limit');

		$pagination->text = $this->language->get('text_pagination');

		$pagination->url = $this->url->link('report/customer_expiry', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');



		$this->data['pagination'] = $pagination->render();



		$this->data['filter_date_from'] = $filter_date_from;

		$this->data['filter_date_end'] = "";



		$this->template = 'report/customer_expiry.tpl';

		$this->children = array(

			'common/header',

			'common/footer'

		);



		$this->response->setOutput($this->render());

	}

}

?>