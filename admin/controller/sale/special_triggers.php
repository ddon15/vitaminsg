<?php
class ControllerSaleSpecialTriggers extends Controller {
    private $error = array();

    public function __construct($registry) {
        parent::__construct($registry);
    }

    public function index() {
        $this->language->load('sale/special_triggers');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sale/special_triggers');

        $this->getList();
    }

    public function insert() {
        $this->load->language('sale/special_triggers');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sale/special_triggers');

        if (isset($this->request->post['rule'])) {
            $this->request->post['rule'] = $this->model_sale_special_triggers->arrayRule($this->request->post['rule']);
        }

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

            $this->model_sale_special_triggers->addTrigger($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

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

            $this->redirect(HTTPS_SERVER . 'index.php?route=sale/special_triggers&token=' . $this->session->data['token'] . $url);
        }

        $this->getForm();
    }

    public function update() {
        $this->load->language('sale/special_triggers');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sale/special_triggers');

        if (isset($this->request->post['rule'])) {
            $this->request->post['rule'] = $this->model_sale_special_triggers->arrayRule($this->request->post['rule']);
        }

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

            $this->model_sale_special_triggers->editTrigger($this->request->get['trigger_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

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

            $this->redirect(HTTPS_SERVER . 'index.php?route=sale/special_triggers&token=' . $this->session->data['token'] . $url);
        }

        $this->getForm();
    }

    public function delete() {
        $this->load->language('sale/special_triggers');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sale/special_triggers');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $trigger_id) {
                $this->model_sale_special_triggers->deleteTrigger($trigger_id);
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

        $this->redirect(HTTPS_SERVER . 'index.php?route=sale/special_triggers&token=' . $this->session->data['token'] . $url);
    }

    public function status() {
        $this->load->language('sale/special_triggers');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sale/special_triggers');

        if (isset($this->request->get['trigger_id']) && $this->validateDelete()) {
            $this->model_sale_special_triggers->statusTrigger($this->request->get['trigger_id']);
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

        $this->redirect(HTTPS_SERVER . 'index.php?route=sale/special_triggers&token=' . $this->session->data['token'] . $url);
    }

    public function copy() {
        $this->load->language('sale/special_triggers');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sale/special_triggers');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $trigger_id) {
                $this->model_sale_special_triggers->copyTrigger($trigger_id);
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

        $this->redirect(HTTPS_SERVER . 'index.php?route=sale/special_triggers&token=' . $this->session->data['token'] . $url);
    }

    private function getList() {
        if (isset($this->request->get['filter_name'])) {
            $filter_name = $this->request->get['filter_name'];
        } else {
            $filter_name = null;
        }

        if (isset($this->request->get['filter_coupon_code'])) {
            $filter_coupon_code = $this->request->get['filter_coupon_code'];
        } else {
            $filter_coupon_code = null;
        }

        if (isset($this->request->get['filter_date_start'])) {
            $filter_date_start = $this->request->get['filter_date_start'];
        } else {
            $filter_date_start = null;
        }

        if (isset($this->request->get['filter_date_end'])) {
            $filter_date_end = $this->request->get['filter_date_end'];
        } else {
            $filter_date_end = null;
        }

        if (isset($this->request->get['filter_status'])) {
            $filter_status = $this->request->get['filter_status'];
        } else {
            $filter_status = null;
        }

        if (isset($this->request->get['filter_sort_order'])) {
            $filter_sort_order = $this->request->get['filter_sort_order'];
        } else {
            $filter_sort_order = null;
        }

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

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $this->data['sort_name'] = $this->url->link('sale/special_triggers', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
        $this->data['sort_coupon_code'] = $this->url->link('sale/special_triggers', 'token=' . $this->session->data['token'] . '&sort=coupon_code' . $url, 'SSL');
        $this->data['sort_date_start'] = $this->url->link('sale/special_triggers', 'token=' . $this->session->data['token'] . '&sort=date_start' . $url, 'SSL');
        $this->data['sort_date_end'] = $this->url->link('sale/special_triggers', 'token=' . $this->session->data['token'] . '&sort=date_end' . $url, 'SSL');
        $this->data['sort_status'] = $this->url->link('sale/special_triggers', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
        $this->data['sort_sort_order'] = $this->url->link('sale/special_triggers', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, 'SSL');

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'href'      => HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token'],
            'text'      => $this->language->get('text_home'),
            'separator' => FALSE
        );

        $this->data['breadcrumbs'][] = array(
            'href'      => HTTPS_SERVER . 'index.php?route=sale/special_triggers&token=' . $this->session->data['token'],
            'text'      => $this->language->get('heading_title'),
            'separator' => ' :: '
        );

        $data = array(
            'filter_name' => $filter_name,
            'filter_coupon_code' => $filter_coupon_code,
            'filter_date_start' => $filter_date_start,
            'filter_date_end' => $filter_date_end,
            'filter_status' => $filter_status,
            'filter_sort_order' => $filter_sort_order,
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_admin_limit'),
            'limit' => $this->config->get('config_admin_limit')
        );

        $triggers_total = $this->model_sale_special_triggers->getTotalTriggers($data);

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_no_results'] = $this->language->get('text_no_results');

        $this->data['column_name'] = $this->language->get('column_name');
        $this->data['column_coupon_code'] = $this->language->get('column_coupon_code');
        $this->data['column_date_start'] = $this->language->get('column_date_start');
        $this->data['column_date_end'] = $this->language->get('column_date_end');
        $this->data['column_status'] = $this->language->get('column_status');
        $this->data['column_sort_order'] = $this->language->get('column_sort_order');
        $this->data['column_action'] = $this->language->get('column_action');

        $this->data['button_insert'] = $this->language->get('button_insert');
        $this->data['button_delete'] = $this->language->get('button_delete');
        $this->data['button_copy'] = $this->language->get('button_copy');
        $this->data['button_filter'] = $this->language->get('button_filter');

        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');

        $this->data['version'] = $this->config->get('special_promotions_version');

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

        $pagination = new Pagination();
        $pagination->total = $triggers_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_admin_limit');
        $pagination->text = $this->language->get('text_pagination');
        $pagination->url = $this->url->link('sale/special_triggers', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $results = $this->model_sale_special_triggers->getTriggers($data);
        $this->data['triggers'] = array();

        foreach ($results as $result) {
            $action = array();

            $action[] = array(
                'text' => $this->language->get('text_edit'),
                'href' => $this->url->link('sale/special_triggers/update', 'token=' . $this->session->data['token'] . '&trigger_id=' . $result['trigger_id'] . $url, 'SSL')
            );

            $action_status = $this->url->link('sale/special_triggers/status', 'token=' . $this->session->data['token'] . '&trigger_id=' . $result['trigger_id'] . $url, 'SSL');

            $this->data['triggers'][] = array(
                'trigger_id'     => $result['trigger_id'],
                'name'          => $result['name'],
                'coupon_code'   => $result['coupon_code'],
                'sort_order'    => $result['sort_order'],
                'date_start'    => $result['date_start'],
                'date_end'      => $result['date_end'],
                'status'        => $result['status'],
                'selected'      => isset($this->request->post['selected']) && in_array($result['trigger_id'], $this->request->post['selected']),
                'action'        => $action,
                'action_status' => $action_status
            );
        }

        $this->data['insert'] = $this->url->link('sale/special_triggers/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $this->data['delete'] = $this->url->link('sale/special_triggers/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $this->data['copy'] = $this->url->link('sale/special_triggers/copy', 'token=' . $this->session->data['token'] . $url, 'SSL');

        $this->data['pagination'] = $pagination->render();

        $this->data['filter_name'] = $filter_name;
        $this->data['filter_coupon_code'] = $filter_coupon_code;
        $this->data['filter_date_start'] = $filter_date_start;
        $this->data['filter_date_end'] = $filter_date_end;
        $this->data['filter_status'] = $filter_status;
        $this->data['filter_sort_order'] = $filter_sort_order;

        $this->data['sort'] = $sort;
        $this->data['order'] = $order;

        $this->data['token'] = $this->session->data['token'];

        $this->template = 'sale/special_triggers_list.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    private function getForm() {
        $this->document->addScript('view/javascript/jquery/editable/jquery.editable.js');
        $this->document->addStyle('view/javascript/jquery/editable/editable.css');

        $this->load->language('sale/special_rules');

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['tab_main'] = $this->language->get('tab_main');
        $this->data['tab_products'] = $this->language->get('tab_products');
        $this->data['tab_product'] = $this->language->get('tab_product');
        $this->data['tab_cart_conditions'] = $this->language->get('tab_cart_conditions');

        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_yes'] = $this->language->get('text_yes');
        $this->data['text_no'] = $this->language->get('text_no');
        $this->data['text_general_information'] = $this->language->get('text_general_information');
        $this->data['text_default'] = $this->language->get('text_default');
        $this->data['text_conditions'] = $this->language->get('text_conditions');
        $this->data['text_rule_to_cart_products'] = $this->language->get('text_rule_to_cart_products');
        $this->data['text_rule_to_cart_categories'] = $this->language->get('text_rule_to_cart_categories');
        $this->data['text_no_coupon'] = $this->language->get('text_no_coupon');
        $this->data['text_specific_coupon'] = $this->language->get('text_specific_coupon');
        $this->data['text_option'] = $this->language->get('text_option');
        $this->data['text_select'] = $this->language->get('text_select');

        $this->data['entry_name'] = $this->language->get('entry_name');
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_store'] = $this->language->get('entry_store');
        $this->data['entry_customer_group'] = $this->language->get('entry_customer_group');
        $this->data['entry_coupon'] = $this->language->get('entry_coupon');
        $this->data['entry_coupon_code'] = $this->language->get('entry_coupon_code');
        $this->data['entry_date_start'] = $this->language->get('entry_date_start');
        $this->data['entry_date_end'] = $this->language->get('entry_date_end');
        $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $this->data['entry_logged'] = $this->language->get('entry_logged');
        $this->data['entry_remove'] = $this->language->get('entry_remove');
        $this->data['entry_cart_products'] = $this->language->get('entry_cart_products');
        if (version_compare(VERSION, '1.5.5.1') >= 0) {
            $this->data['entry_cart_categories'] = $this->language->get('entry_cart_categories');
        } else {
            $this->data['entry_cart_categories'] = $this->language->get('entry_cart_categories_old');
        }
        $this->data['entry_product'] = $this->language->get('entry_product');
        $this->data['entry_quantity'] = $this->language->get('entry_quantity');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['button_add_product'] = $this->language->get('button_add_product');
        $this->data['button_remove'] = $this->language->get('button_remove');

        $this->data['version'] = $this->config->get('special_promotions_version');

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

        if (isset($this->error['coupon_code'])) {
            $this->data['error_coupon_code'] = $this->error['coupon_code'];
        } else {
            $this->data['error_coupon_code'] = '';
        }

        if (isset($this->error['store'])) {
            $this->data['error_store'] = $this->error['store'];
        } else {
            $this->data['error_store'] = '';
        }

        if (isset($this->error['customer_group'])) {
            $this->data['error_customer_group'] = $this->error['customer_group'];
        } else {
            $this->data['error_customer_group'] = '';
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

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('sale/special_triggers', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );

        if (!isset($this->request->get['trigger_id'])) {
            $this->data['action'] = $this->url->link('sale/special_triggers/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
        } else {
            $this->data['action'] = $this->url->link('sale/special_triggers/update', 'token=' . $this->session->data['token'] . '&trigger_id=' . $this->request->get['trigger_id'] . $url, 'SSL');
        }

        $this->data['cancel'] = $this->url->link('sale/special_triggers', 'token=' . $this->session->data['token'] . $url, 'SSL');

        if (!empty($this->request->get['trigger_id'])) {
            $trigger = $this->model_sale_special_triggers->getTrigger($this->request->get['trigger_id']);
        } else {
            $trigger = false;
        }

        if (isset($this->request->post['name'])) {
            $this->data['name'] = $this->request->post['name'];
        } elseif (!empty($trigger)) {
            $this->data['name'] = $trigger['name'];
        } else {
            $this->data['name'] = '';
        }

        if (isset($this->request->post['status'])) {
            $this->data['status'] = $this->request->post['status'];
        } elseif (!empty($trigger)) {
            $this->data['status'] = $trigger['status'];
        } else {
            $this->data['status'] = 0;
        }

        if (isset($this->request->post['store_ids'])) {
            $this->data['store_ids'] = $this->request->post['store_ids'];
        } elseif (!empty($trigger)) {
            $this->data['store_ids'] = $trigger['store_ids'];
        } else {
            $this->data['store_ids'] = array();
        }

        if (isset($this->request->post['customer_group_ids'])) {
            $this->data['customer_group_ids'] = $this->request->post['customer_group_ids'];
        } elseif (!empty($trigger)) {
            $this->data['customer_group_ids'] = $trigger['customer_group_ids'];
        } else {
            $this->data['customer_group_ids'] = array();
        }

        if (isset($this->request->post['logged'])) {
            $this->data['logged'] = $this->request->post['logged'];
        } elseif (!empty($trigger)) {
            $this->data['logged'] = $trigger['logged'];
        } else {
            $this->data['logged'] = '';
        }

        if (isset($this->request->post['coupon_type'])) {
            $this->data['coupon_type'] = $this->request->post['coupon_type'];
        } elseif (!empty($trigger)) {
            $this->data['coupon_type'] = $trigger['coupon_type'];
        } else {
            $this->data['coupon_type'] = '';
        }

        if (isset($this->request->post['coupon_code'])) {
            $this->data['coupon_code'] = $this->request->post['coupon_code'];
        } elseif (!empty($trigger)) {
            $this->data['coupon_code'] = $trigger['coupon_code'];
        } else {
            $this->data['coupon_code'] = '';
        }

        if (isset($this->request->post['date_start'])) {
            $this->data['date_start'] = $this->request->post['date_start'];
        } elseif (!empty($trigger)) {
            $this->data['date_start'] = $trigger['date_start'];
        } else {
            $this->data['date_start'] = '';
        }

        if (isset($this->request->post['date_end'])) {
            $this->data['date_end'] = $this->request->post['date_end'];
        } elseif (!empty($trigger)) {
            $this->data['date_end'] = $trigger['date_end'];
        } else {
            $this->data['date_end'] = '';
        }

        if (isset($this->request->post['sort_order'])) {
            $this->data['sort_order'] = $this->request->post['sort_order'];
        } elseif (!empty($trigger)) {
            $this->data['sort_order'] = $trigger['sort_order'];
        } else {
            $this->data['sort_order'] = '';
        }

        if (isset($this->request->post['rule'])) {
            $this->data['rule'] = $this->request->post['rule'];
        } elseif (!empty($trigger)) {
            $this->data['rule'] = $trigger['rule'];
        } else {
            $this->data['rule'] = array();
        }

        if (isset($this->request->post['product'])) {
            $this->data['products'] = $this->request->post['product'];
        } elseif (!empty($trigger)) {
            $this->load->model('tool/image');

            foreach ($trigger['product'] as $_key => $_product) {
                foreach ($_product['options'] as $o_key => $option) {
                    if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') {
                        $option_value_data = array();

                        foreach ($option['option_value'] as $option_value) {
                            if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
                                $option_value_data[] = array(
                                    'product_option_value_id' => $option_value['product_option_value_id'],
                                    'option_value_id'         => $option_value['option_value_id'],
                                    'name'                    => $option_value['name'],
                                    'image'                   => (!empty($option_value['image']) ? $this->model_tool_image->resize($option_value['image'], 50, 50) : '')
                                );
                            }
                        }

                        $_product['options'][$o_key] = array(
                            'product_option_id' => $option['product_option_id'],
                            'option_id'         => $option['option_id'],
                            'name'              => $option['name'],
                            'type'              => $option['type'],
                            'option_value'      => $option_value_data,
                            'required'          => $option['required']
                        );
                    } elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
                        $_product['options'][$o_key] = array(
                            'product_option_id' => $option['product_option_id'],
                            'option_id'         => $option['option_id'],
                            'name'              => $option['name'],
                            'type'              => $option['type'],
                            'option_value'      => $option['option_value'],
                            'required'          => $option['required']
                        );
                    }
                }
                $trigger['product'][$_key] = $_product;
            }
            $this->data['products'] = $trigger['product'];
        } else {
            $this->data['products'] = array();
        }

        $this->load->model('catalog/category');

        if (version_compare(VERSION, '1.5.5.1') >= 0) {
            $this->data['categories'] = array();

            if (isset($this->request->post['cart_category']) && is_array($this->request->post['cart_category'])) {
                $cart_categories = array();
                foreach ($this->request->post['cart_category'] as $category_id) {
                    $category_info = $this->model_catalog_category->getCategory($category_id);
                    if ($category_info) {
                        $cart_categories[] = array(
                            'category_id' => $category_info['category_id'],
                            'name' => strip_tags(html_entity_decode(($category_info['path'] ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']), ENT_QUOTES, 'UTF-8'))
                        );
                    }
                }
                $this->data['cart_categories'] = $cart_categories;
            } elseif (!empty($trigger)) {
                $this->data['cart_categories'] = $trigger['cart_categories'];
            } else {
                $this->data['cart_categories'] = array();
            }
        } else {
            $this->data['categories'] = $this->model_catalog_category->getCategories(0);

            if (isset($this->request->post['rule_category']) && is_array($this->request->post['rule_category'])) {
                $this->data['cart_categories'] = $this->request->post['cart_category'];
            } elseif (!empty($trigger)) {
                $this->data['cart_categories'] = $trigger['cart_categories'];
            } else {
                $this->data['cart_categories'] = array();
            }
        }

        if (isset($this->request->post['cart_product']) && is_array($this->request->post['cart_product'])) {
            $cart_products = array();
            $this->load->model('catalog/product');
            foreach ($this->request->post['cart_product'] as $product_id) {
                $product_info = $this->model_catalog_product->getProduct($product_id);
                if ($product_info) {
                    $cart_products[] = array(
                        'product_id' => $product_info['product_id'],
                        'name' => strip_tags(html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8'))
                    );
                }
            }
            $this->data['cart_products'] = $cart_products;
        } elseif (!empty($trigger)) {
            $this->data['cart_products'] = $trigger['cart_products'];
        } else {
            $this->data['cart_products'] = array();
        }

        $this->load->model('setting/store');

        $this->data['stores'] = $this->model_setting_store->getStores();

        $this->load->model('sale/customer_group');

        $this->data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();

        $this->load->model('localisation/language');

        $this->data['languages'] = $this->model_localisation_language->getLanguages();

        $this->data['token'] = $this->session->data['token'];

        $this->data['rule_condition_product_found'] = $this->language->get('rule_condition_product_found');
        $this->data['rule_condition_product_subselect'] = $this->language->get('rule_condition_product_subselect');
        $this->data['rule_condition_combine'] = $this->language->get('rule_condition_combine');
        $this->data['rule_condition_cart_base_subtotal'] = $this->language->get('rule_condition_cart_base_subtotal');
        $this->data['rule_condition_cart_total_qty'] = $this->language->get('rule_condition_cart_total_qty');
        $this->data['rule_condition_cart_diff_qty'] = $this->language->get('rule_condition_cart_diff_qty');
        $this->data['rule_condition_cart_weight'] = $this->language->get('rule_condition_cart_weight');
        $this->data['rule_condition_cart_payment_method'] = $this->language->get('rule_condition_cart_payment_method');
        $this->data['rule_condition_cart_shipping_method'] = $this->language->get('rule_condition_cart_shipping_method');
        $this->data['rule_condition_cart_shipping_postcode'] = $this->language->get('rule_condition_cart_shipping_postcode');
        $this->data['rule_condition_cart_shipping_zone_id'] = $this->language->get('rule_condition_cart_shipping_zone_id');
        $this->data['rule_condition_cart_shipping_country_id'] = $this->language->get('rule_condition_cart_shipping_country_id');
        $this->data['rule_condition_customer_store_id'] = $this->language->get('rule_condition_customer_store_id');
        $this->data['rule_condition_customer_group_id'] = $this->language->get('rule_condition_customer_group_id');
        $this->data['rule_condition_customer_registration_date'] = $this->language->get('rule_condition_customer_registration_date');
        $this->data['rule_condition_customer_email'] = $this->language->get('rule_condition_customer_email');
        $this->data['rule_condition_customer_firstname'] = $this->language->get('rule_condition_customer_firstname');
        $this->data['rule_condition_customer_lastname'] = $this->language->get('rule_condition_customer_lastname');
        $this->data['rule_condition_orders_order_num'] = $this->language->get('rule_condition_orders_order_num');
        $this->data['rule_condition_orders_sales_amount'] = $this->language->get('rule_condition_orders_sales_amount');
        $this->data['rule_condition_cart_product_price'] = $this->language->get('rule_condition_cart_product_price');
        $this->data['rule_condition_cart_product_qty'] = $this->language->get('rule_condition_cart_product_qty');
        $this->data['rule_condition_cart_product_total'] = $this->language->get('rule_condition_cart_product_total');
        $this->data['rule_condition_manufacturer_id'] = $this->language->get('rule_condition_manufacturer_id');
        $this->data['rule_condition_category_id'] = $this->language->get('rule_condition_category_id');
        $this->data['rule_condition_model'] = $this->language->get('rule_condition_model');

        $this->data['values_conditions'] = array(
            '' => $this->language->get('condition_choose'),
            'rule/condition_product_found' => $this->language->get('condition_product_found'),
            'rule/condition_product_subselect' => $this->language->get('condition_product_subselect'),
            'rule/condition_combine' => $this->language->get('condition_combine'),

            $this->language->get('text_cart_attributes') => 'optgroup_open',

            'rule/condition_cart|base_subtotal' => $this->language->get('condition_cart_base_subtotal'),
            'rule/condition_cart|total_qty' => $this->language->get('condition_cart_total_qty'),
            'rule/condition_cart|diff_qty' => $this->language->get('condition_cart_diff_qty'),
            'rule/condition_cart|weight' => $this->language->get('condition_cart_weight'),
            'rule/condition_cart|payment_method' => $this->language->get('condition_cart_payment_method'),
            'rule/condition_cart|shipping_method' => $this->language->get('condition_cart_shipping_method'),
            'rule/condition_cart|shipping_postcode' => $this->language->get('condition_cart_shipping_postcode'),
            'rule/condition_cart|shipping_zone_id' => $this->language->get('condition_cart_shipping_zone'),
            'rule/condition_cart|shipping_country_id' => $this->language->get('condition_cart_shipping_country'),

            $this->language->get('text_cart_attributes') . 'optgroup_close' => 'optgroup_close',

            $this->language->get('text_customer_attributes') => 'optgroup_open',

            'rule/condition_customer|store_id' => $this->language->get('condition_customer_store'),
            'rule/condition_customer|customer_group_id' => $this->language->get('condition_customer_group'),
            'rule/condition_customer|registration_date' => $this->language->get('condition_customer_registration_date'),
            'rule/condition_customer|email' => $this->language->get('condition_customer_email'),
            'rule/condition_customer|firstname' => $this->language->get('condition_customer_firstname'),
            'rule/condition_customer|lastname' => $this->language->get('condition_customer_lastname'),

            $this->language->get('text_customer_attributes') . 'optgroup_close' => 'optgroup_close',

            $this->language->get('text_purchases_history') => 'optgroup_open',

            'rule/condition_orders|order_num' => $this->language->get('condition_orders_order_num'),
            'rule/condition_orders|sales_amount' => $this->language->get('condition_orders_sales_amount'),

            $this->language->get('text_purchases_history') . 'optgroup_close' => 'optgroup_close'
        );

        $this->data['values_product_conditions'] = array(
            '' => $this->language->get('condition_choose'),
            'rule/condition_combine' => $this->language->get('condition_combine'),

            $this->language->get('text_cart_item_attributes') => 'optgroup_open',

            'rule/condition_cart_product|price' => $this->language->get('condition_cart_product_price'),
            'rule/condition_cart_product|qty' => $this->language->get('condition_cart_product_qty'),
            'rule/condition_cart_product|total' => $this->language->get('condition_cart_product_total'),

            $this->language->get('text_cart_item_attributes') . 'optgroup_close' => 'optgroup_close'
        );

        $this->data['values_options_values'] = array();

        // Product Options
        $this->load->model('catalog/option');

        $results = $this->cache->get('sp_admin.product_options');
        if (!$results) {
            $results = $this->model_catalog_option->getOptions();
            $this->cache->set('sp_admin.product_options', $results);
        }

        if ($results) {
            $this->data['values_product_conditions'][$this->language->get('text_product_options')] = 'optgroup_open';

            foreach ($results as $option) {
                if ($option['type'] == 'file') {
                    continue;
                }
                $this->data['values_product_conditions']['rule/condition_cart_product|option_' . $option['option_id'] . '|' . $option['type']] = $option['name'];

                $option_results = $this->model_catalog_option->getOptionValues($option['option_id']);
                if ($option_results) {
                    $this->data['values_options_values'][$option['option_id']] = array();
                    foreach ($option_results as $option_value) {
                        $this->data['values_options_values'][$option['option_id']][$option_value['option_value_id']] = $option_value['name'];
                    }
                }
            }

            $this->data['values_product_conditions'][$this->language->get('text_product_options') . 'optgroup_close'] = 'optgroup_close';
        }

        // Product Attributes
        $this->load->model('catalog/attribute');

        $results = $this->cache->get('sp_admin.product_attributes');
        if (!$results) {
            $results = $this->model_catalog_attribute->getAttributes();
            $this->cache->set('sp_admin.product_attributes', $results);
        }

        $this->data['values_product_conditions'][$this->language->get('text_product_attributes')] = 'optgroup_open';

        $this->data['values_product_conditions']['rule/condition_cart_product|manufacturer_id'] = $this->language->get('condition_manufacturer');
        $this->data['values_product_conditions']['rule/condition_cart_product|category_id'] = $this->language->get('condition_category');

        $this->data['values_product_conditions']['rule/condition_cart_product|model'] = $this->language->get('condition_model');

        if ($results) {
            foreach ($results as $attribute) {
                $this->data['values_product_conditions']['rule/condition_cart_product|attribute_' . $attribute['attribute_id']] = $attribute['name'];
            }
        }

        $this->data['values_product_conditions'][$this->language->get('text_product_attributes') . 'optgroup_close'] = 'optgroup_close';

        $this->data['values_all_any'] = array(
            'all' => $this->language->get('value_all'),
            'any' => $this->language->get('value_any')
        );

        $this->data['values_true_false'] = array(
            '1' => $this->language->get('value_true'),
            '0' => $this->language->get('value_false')
        );

        $this->data['values_found_not_found'] = array(
            '1' => $this->language->get('value_found'),
            '0' => $this->language->get('value_not_found')
        );

        $this->data['values_total_qty_amount'] = array(
            'qty' => $this->language->get('value_total_qty'),
            'base_row_total' => $this->language->get('value_total_amount')
        );

        $this->data['values_operator'] = array(
            '==' => $this->language->get('value_is'),
            '!=' => $this->language->get('value_is_not'),
            '>=' => $this->language->get('value_equals_or_greater'),
            '<=' => $this->language->get('value_equals_or_less'),
            '>' => $this->language->get('value_greater'),
            '<' => $this->language->get('value_less'),
            '()' => $this->language->get('value_is_one_of'),
            '!()' => $this->language->get('value_is_not_one_of')
        );

        $this->data['values_is_is_not'] = array(
            '==' => $this->language->get('value_is'),
            '!=' => $this->language->get('value_is_not')
        );

        $this->load->model('catalog/manufacturer');
        $this->load->model('setting/extension');

        // Manufacturers
        $manufacturer_data = array();

        $results = $this->cache->get('sp_admin.manufacturers');
        if (!$results) {
            $results = $this->model_catalog_manufacturer->getManufacturers();
            $this->cache->set('sp_admin.manufacturers', $results);
        }

        foreach ($results as $result) {
            $manufacturer_data[$result['manufacturer_id']] = $result['name'];
        }

        $this->data['values_manufacturers'] = $manufacturer_data;

        $this->data['values_categories'] = $this->cache->get('sp_admin.categories');
        if (!$this->data['values_categories']) {
            $this->data['values_categories'] = array();

            $categories_1 = $this->model_catalog_category->getCategories(0);
            foreach ($categories_1 as $category_1) {
                $this->data['values_categories'] += array(
                    $category_1['category_id'] => $category_1['name']
                );

                $categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);
                foreach ($categories_2 as $category_2) {
                    $this->data['values_categories'] += array(
                        $category_2['category_id'] => '      ' . $category_2['name']
                    );

                    $categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);
                    foreach ($categories_3 as $category_3) {
                        $this->data['values_categories'] += array(
                            $category_3['category_id'] => '            ' . $category_3['name']
                        );
                    }
                }
            }

            $this->cache->set('sp_admin.categories', $this->data['values_categories']);
        }

        // Payment Methods
        $this->data['values_payment_methods'] = $this->cache->get('sp_admin.payment');
        if (!$this->data['values_payment_methods']) {
            $this->data['values_payment_methods'] = array();

            $results = $this->model_setting_extension->getInstalled('payment');
            foreach ($results as $code) {
                $this->language->load('payment/' . $code);
                $this->data['values_payment_methods'][$code] = $this->language->get('heading_title');
            }

            $sort_order = array();
            foreach ($this->data['values_payment_methods'] as $key => $value) {
                $sort_order[$key] = $value;
            }

            array_multisort($sort_order, SORT_ASC, $this->data['values_payment_methods']);

            $this->cache->set('sp_admin.payment', $this->data['values_payment_methods']);
        }

        // Shipping Methods
        $this->data['values_shipping_methods'] = $this->cache->get('sp_admin.shipping');
        if (!$this->data['values_shipping_methods']) {
            $this->data['values_shipping_methods'] = array();

            $results = $this->model_setting_extension->getInstalled('shipping');
            foreach ($results as $code) {
                $this->language->load('shipping/' . $code);
                $this->data['values_shipping_methods'][$code] = $this->language->get('heading_title');
            }

            $sort_order = array();
            foreach ($this->data['values_shipping_methods'] as $key => $value) {
                $sort_order[$key] = $value;
            }

            array_multisort($sort_order, SORT_ASC, $this->data['values_shipping_methods']);

            $this->cache->set('sp_admin.shipping', $this->data['values_shipping_methods']);
        }

        $this->load->model('localisation/country');

        $this->data['values_countries'] = $this->cache->get('sp_admin.countries');
        $this->data['values_zones'] = $this->cache->get('sp_admin.zones');

        if (!$this->data['values_countries'] && !$this->data['values_zones']) {

            $results = $this->model_localisation_country->getCountries();

            $this->data['values_countries'] = array(
                '' => $this->language->get('text_select_country')
            );

            $this->data['values_zones'] = array(
                '' => $this->language->get('text_select_zone')
            );

            $this->load->model('localisation/zone');

            foreach ($results as $country) {
                $this->data['values_countries'][$country['country_id']] = $country['name'];

                $zone_results = $this->model_localisation_zone->getZonesByCountryId($country['country_id']);

                if ($zone_results) {
                    $this->data['values_zones'][$country['name']] = 'optgroup_open';

                    foreach ($zone_results as $zone) {
                        $this->data['values_zones'][$zone['zone_id']] = $zone['name'];
                    }

                    $this->data['values_zones'][$country['name'] . 'optgroup_close'] = 'optgroup_close';
                }
            }

            $this->cache->set('sp_admin.countries', $this->data['values_countries']);
            $this->cache->set('sp_admin.zones', $this->data['values_zones']);
        }

        $this->load->model('setting/store');

        $this->data['values_stores'] = $this->cache->get('sp_admin.stores');

        if (!$this->data['values_stores']) {

            $this->data['values_stores'] = array(
                '0' => $this->language->get('text_default')
            );

            $results = $this->model_setting_store->getStores();

            foreach ($results as $store) {
                $this->data['values_stores'][$store['store_id']] = $store['name'];
            }

            $this->cache->set('sp_admin.stores', $this->data['values_stores']);
        }

        $this->load->model('sale/customer_group');

        $this->data['values_customer_groups'] = $this->cache->get('sp_admin.customer_groups');

        if (!$this->data['values_customer_groups']) {

            $this->data['values_customer_groups'] = array();

            $results = $this->model_sale_customer_group->getCustomerGroups();

            foreach ($results as $customer_group) {
                $this->data['values_customer_groups'][$customer_group['customer_group_id']] = $customer_group['name'];
            }

            $this->cache->set('sp_admin.customer_groups', $this->data['values_customer_groups']);
        }

        $this->template = 'sale/special_triggers_form.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    protected function validateForm() {
        if (!$this->user->hasPermission('modify', 'sale/special_triggers')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if ((utf8_strlen($this->request->post['name']) < 1) || (utf8_strlen($this->request->post['name']) > 255)) {
            $this->error['name'] = $this->language->get('error_name');
        }

        if (!empty($this->request->post['coupon_type']) && ((utf8_strlen($this->request->post['coupon_code']) < 1) || (utf8_strlen($this->request->post['coupon_code']) > 255))) {
            $this->error['coupon_code'] = $this->language->get('error_coupon_code');
        }

        if (empty($this->request->post['store_ids'])) {
            $this->error['store'] = $this->language->get('error_store');
        }

        if (empty($this->request->post['customer_group_ids'])) {
            $this->error['customer_group'] = $this->language->get('error_customer_group');
        }

        if (!empty($this->error) && empty($this->error['warning'])) {
            $this->error['warning'] = $this->language->get('error_notice');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'sale/special_triggers')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    public function product() {
        if (empty($this->request->server['HTTP_X_REQUESTED_WITH']) || strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) != 'xmlhttprequest') {
            $this->redirect($this->url->link('common/home'));
        }

        $this->load->language('sale/special_triggers');

        $this->load->model('catalog/product');
        $this->load->model('sale/special_triggers');

        $product_info = $this->model_catalog_product->getProduct($this->request->get['product_id']);
        if ($product_info) {
            $this->data['text_option'] = $this->language->get('text_option');
            $this->data['text_select'] = $this->language->get('text_select');

            $this->data['product_row'] = (int)$this->request->get['product_row'];

            $this->data['name'] = $product_info['name'];
            $this->data['model'] = $product_info['model'];

            $this->load->model('tool/image');

            if ($product_info['image']) {
                $this->data['image'] = $this->model_tool_image->resize($product_info['image'], 300, 300);
            } else {
                $this->data['image'] = $this->model_tool_image->resize('no_image.jpg', 300, 300);
            }

            $this->data['options'] = array();

            foreach ($this->model_sale_special_triggers->getProductOptions($this->request->get['product_id']) as $option) {
                if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') {
                    $option_value_data = array();

                    foreach ($option['option_value'] as $option_value) {
                        if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
                            $option_value_data[] = array(
                                'product_option_value_id' => $option_value['product_option_value_id'],
                                'option_value_id'         => $option_value['option_value_id'],
                                'name'                    => $option_value['name'],
                                'image'                   => (!empty($option_value['image']) ? $this->model_tool_image->resize($option_value['image'], 50, 50) : '')
                            );
                        }
                    }

                    $this->data['options'][] = array(
                        'product_option_id' => $option['product_option_id'],
                        'option_id'         => $option['option_id'],
                        'name'              => $option['name'],
                        'type'              => $option['type'],
                        'option_value'      => $option_value_data,
                        'required'          => $option['required']
                    );
                } elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
                    $this->data['options'][] = array(
                        'product_option_id' => $option['product_option_id'],
                        'option_id'         => $option['option_id'],
                        'name'              => $option['name'],
                        'type'              => $option['type'],
                        'option_value'      => $option['option_value'],
                        'required'          => $option['required']
                    );
                }
            }

            $this->template = 'sale/special_triggers_info.tpl';

            $this->response->setOutput($this->render());
        }
    }

}