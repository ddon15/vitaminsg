<?php
class ControllerReportSpecialPromotions extends Controller {

    public function __construct($registry) {
        parent::__construct($registry);
    }

    public function index() {
        $this->language->load('report/special_promotions');

        $this->document->setTitle($this->language->get('heading_title'));

        if (isset($this->request->get['filter_date_start'])) {
            $filter_date_start = $this->request->get['filter_date_start'];
        } else {
            $filter_date_start = date('Y-m-d', strtotime(date('Y') . '-' . date('m') . '-01'));
        }

        if (isset($this->request->get['filter_date_end'])) {
            $filter_date_end = $this->request->get['filter_date_end'];
        } else {
            $filter_date_end = date('Y-m-d');
        }

        if (isset($this->request->get['filter_group'])) {
            $filter_group = $this->request->get['filter_group'];
        } else {
            $filter_group = 'week';
        }

        if (isset($this->request->get['filter_promotion_id'])) {
            $filter_promotion_id = $this->request->get['filter_promotion_id'];
        } else {
            $filter_promotion_id = 0;
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['filter_date_start'])) {
            $url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
        }

        if (isset($this->request->get['filter_date_end'])) {
            $url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
        }

        if (isset($this->request->get['filter_group'])) {
            $url .= '&filter_group=' . $this->request->get['filter_group'];
        }

        if (isset($this->request->get['filter_promotion_id'])) {
            $url .= '&filter_promotion_id=' . $this->request->get['filter_promotion_id'];
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
            'href'      => $this->url->link('report/special_promotions', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );

        $this->load->model('report/special_promotions');

        $this->data['orders'] = array();

        $data = array(
            'filter_date_start'      => $filter_date_start,
            'filter_date_end'        => $filter_date_end,
            'filter_group'           => $filter_group,
            'filter_promotion_id'    => $filter_promotion_id,
            'start'                  => ($page - 1) * $this->config->get('config_admin_limit'),
            'limit'                  => $this->config->get('config_admin_limit')
        );

        $order_total = $this->model_report_special_promotions->getTotalOrders($data);

        $results = $this->model_report_special_promotions->getOrders($data);

        foreach ($results as $result) {
            $this->data['orders'][] = array(
                'date_start'    => date($this->language->get('date_format_short'), strtotime($result['date_start'])),
                'date_end'      => date($this->language->get('date_format_short'), strtotime($result['date_end'])),
                'orders'        => $result['orders'],
                'products'      => $result['products'],
                'tax'           => $this->currency->format($result['tax'], $this->config->get('config_currency')),
                'total'         => $this->currency->format($result['total'], $this->config->get('config_currency')),
                'discounted'    => $this->currency->format($result['discounted'], $this->config->get('config_currency'))
            );
        }

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_no_results'] = $this->language->get('text_no_results');
        $this->data['text_all_promotions'] = $this->language->get('text_all_promotions');

        $this->data['column_date_start'] = $this->language->get('column_date_start');
        $this->data['column_date_end'] = $this->language->get('column_date_end');
        $this->data['column_orders'] = $this->language->get('column_orders');
        $this->data['column_products'] = $this->language->get('column_products');
        $this->data['column_tax'] = $this->language->get('column_tax');
        $this->data['column_total'] = $this->language->get('column_total');
        $this->data['column_discounted'] = $this->language->get('column_discounted');

        $this->data['entry_date_start'] = $this->language->get('entry_date_start');
        $this->data['entry_date_end'] = $this->language->get('entry_date_end');
        $this->data['entry_group'] = $this->language->get('entry_group');
        $this->data['entry_promotion'] = $this->language->get('entry_promotion');

        $this->data['button_filter'] = $this->language->get('button_filter');

        $this->data['token'] = $this->session->data['token'];

        $this->data['promotions'] = $this->model_report_special_promotions->getPromotions();

        $this->data['groups'] = array();

        $this->data['groups'][] = array(
            'text'  => $this->language->get('text_year'),
            'value' => 'year',
        );

        $this->data['groups'][] = array(
            'text'  => $this->language->get('text_month'),
            'value' => 'month',
        );

        $this->data['groups'][] = array(
            'text'  => $this->language->get('text_week'),
            'value' => 'week',
        );

        $this->data['groups'][] = array(
            'text'  => $this->language->get('text_day'),
            'value' => 'day',
        );

        $url = '';

        if (isset($this->request->get['filter_date_start'])) {
            $url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
        }

        if (isset($this->request->get['filter_date_end'])) {
            $url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
        }

        if (isset($this->request->get['filter_group'])) {
            $url .= '&filter_group=' . $this->request->get['filter_group'];
        }

        if (isset($this->request->get['filter_promotion_id'])) {
            $url .= '&filter_promotion_id=' . $this->request->get['filter_promotion_id'];
        }

        $pagination = new Pagination();
        $pagination->total = $order_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_admin_limit');
        $pagination->text = $this->language->get('text_pagination');
        $pagination->url = $this->url->link('report/special_promotions', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        $this->data['pagination'] = $pagination->render();

        $this->data['filter_date_start'] = $filter_date_start;
        $this->data['filter_date_end'] = $filter_date_end;
        $this->data['filter_group'] = $filter_group;
        $this->data['filter_promotion_id'] = $filter_promotion_id;

        $this->template = 'report/special_promotions.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }
}