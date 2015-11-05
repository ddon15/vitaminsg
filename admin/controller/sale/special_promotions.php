<?php

class ControllerSaleSpecialPromotions extends Controller {

    private $error = array();



    public function __construct($registry) {

        parent::__construct($registry);



    }



    public function index() {

        $this->language->load('sale/special_promotions');



        $this->document->setTitle($this->language->get('heading_title'));



        $this->load->model('sale/special_promotions');



        $this->getList();

    }



    public function insert() {

        $this->load->language('sale/special_promotions');



        $this->document->setTitle($this->language->get('heading_title'));



        $this->load->model('sale/special_promotions');



        if (isset($this->request->post['rule'])) {

            if (isset($this->request->post['discount_type'])

                && ($this->request->post['discount_type'] == 'pack_by_percent'

                    || $this->request->post['discount_type'] == 'pack_by_fixed')) {

                if (isset($this->request->post['rule']['actions'])) {

                    unset($this->request->post['rule']['actions']);

                }

                if (isset($this->request->post['rule_category'])) {

                    unset($this->request->post['rule_category']);

                }

            }

            $this->request->post['rule'] = $this->model_sale_special_promotions->arrayRule($this->request->post['rule']);

        }



        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {



            $this->model_sale_special_promotions->addPromotion($this->request->post);



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



            $this->redirect(HTTPS_SERVER . 'index.php?route=sale/special_promotions&token=' . $this->session->data['token'] . $url);

        }



        $this->getForm();

    }



    public function update() {

        $this->load->language('sale/special_promotions');



        $this->document->setTitle($this->language->get('heading_title'));



        $this->load->model('sale/special_promotions');



        if (isset($this->request->post['rule'])) {

            if (isset($this->request->post['discount_type'])

                && ($this->request->post['discount_type'] == 'pack_by_percent'

                    || $this->request->post['discount_type'] == 'pack_by_fixed')) {

                if (isset($this->request->post['rule']['actions'])) {

                    unset($this->request->post['rule']['actions']);

                }

                if (isset($this->request->post['rule_category'])) {

                    unset($this->request->post['rule_category']);

                }

            }

            $this->request->post['rule'] = $this->model_sale_special_promotions->arrayRule($this->request->post['rule']);

        }



        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {



            $this->model_sale_special_promotions->editPromotion($this->request->get['promotion_id'], $this->request->post);



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



            $this->redirect(HTTPS_SERVER . 'index.php?route=sale/special_promotions&token=' . $this->session->data['token'] . $url);

        }



        $this->getForm();

    }



    public function delete() {

        $this->load->language('sale/special_promotions');



        $this->document->setTitle($this->language->get('heading_title'));



        $this->load->model('sale/special_promotions');



        if (isset($this->request->post['selected']) && $this->validateDelete()) {

            foreach ($this->request->post['selected'] as $promotion_id) {

                $this->model_sale_special_promotions->deletePromotion($promotion_id);

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



        $this->redirect(HTTPS_SERVER . 'index.php?route=sale/special_promotions&token=' . $this->session->data['token'] . $url);

    }



    public function status() {

        $this->load->language('sale/special_promotions');



        $this->document->setTitle($this->language->get('heading_title'));



        $this->load->model('sale/special_promotions');



        if (isset($this->request->get['promotion_id']) && $this->validateDelete()) {

            $this->model_sale_special_promotions->statusPromotion($this->request->get['promotion_id']);

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



        $this->redirect(HTTPS_SERVER . 'index.php?route=sale/special_promotions&token=' . $this->session->data['token'] . $url);

    }



    public function copy() {

        $this->load->language('sale/special_promotions');



        $this->document->setTitle($this->language->get('heading_title'));



        $this->load->model('sale/special_promotions');



        if (isset($this->request->post['selected']) && $this->validateDelete()) {

            foreach ($this->request->post['selected'] as $promotion_id) {

                $this->model_sale_special_promotions->copyPromotion($promotion_id);

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



        $this->redirect(HTTPS_SERVER . 'index.php?route=sale/special_promotions&token=' . $this->session->data['token'] . $url);

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



        $this->data['sort_name'] = $this->url->link('sale/special_promotions', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');

        $this->data['sort_coupon_code'] = $this->url->link('sale/special_promotions', 'token=' . $this->session->data['token'] . '&sort=coupon_code' . $url, 'SSL');

        $this->data['sort_date_start'] = $this->url->link('sale/special_promotions', 'token=' . $this->session->data['token'] . '&sort=date_start' . $url, 'SSL');

        $this->data['sort_date_end'] = $this->url->link('sale/special_promotions', 'token=' . $this->session->data['token'] . '&sort=date_end' . $url, 'SSL');

        $this->data['sort_status'] = $this->url->link('sale/special_promotions', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');

        $this->data['sort_sort_order'] = $this->url->link('sale/special_promotions', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, 'SSL');



        $this->data['breadcrumbs'] = array();



        $this->data['breadcrumbs'][] = array(

            'href'      => HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token'],

            'text'      => $this->language->get('text_home'),

            'separator' => FALSE

        );



        $this->data['breadcrumbs'][] = array(

            'href'      => HTTPS_SERVER . 'index.php?route=sale/special_promotions&token=' . $this->session->data['token'],

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



        $promotions_total = $this->model_sale_special_promotions->getTotalPromotions($data);



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

        $pagination->total = $promotions_total;

        $pagination->page = $page;

        $pagination->limit = $this->config->get('config_admin_limit');

        $pagination->text = $this->language->get('text_pagination');

        $pagination->url = $this->url->link('sale/special_promotions', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');



        if (isset($this->request->get['page'])) {

            $url .= '&page=' . $this->request->get['page'];

        }



        $results = $this->model_sale_special_promotions->getPromotions($data);

        $this->data['promotions'] = array();



        foreach ($results as $result) {

            $action = array();



            $action[] = array(

                'text' => $this->language->get('text_edit'),

                'href' => $this->url->link('sale/special_promotions/update', 'token=' . $this->session->data['token'] . '&promotion_id=' . $result['promotion_id'] . $url, 'SSL')

            );



            $action_status = $this->url->link('sale/special_promotions/status', 'token=' . $this->session->data['token'] . '&promotion_id=' . $result['promotion_id'] . $url, 'SSL');



            $this->data['promotions'][] = array(

                'promotion_id'  => $result['promotion_id'],

                'name'          => $result['name'],

                'coupon_code'   => $result['coupon_code'],

                'sort_order'    => $result['sort_order'],

                'date_start'    => $result['date_start'],

                'date_end'      => $result['date_end'],

                'status'        => $result['status'],

                'selected'      => isset($this->request->post['selected']) && in_array($result['promotion_id'], $this->request->post['selected']),

                'action'        => $action,

                'action_status' => $action_status

            );

        }



        $this->data['insert'] = $this->url->link('sale/special_promotions/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');

        $this->data['delete'] = $this->url->link('sale/special_promotions/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

        $this->data['copy'] = $this->url->link('sale/special_promotions/copy', 'token=' . $this->session->data['token'] . $url, 'SSL');



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



        $this->template = 'sale/special_promotions_list.tpl';

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

        $this->data['tab_conditions'] = $this->language->get('tab_conditions');

        $this->data['tab_actions'] = $this->language->get('tab_actions');

        $this->data['tab_labels'] = $this->language->get('tab_labels');

        $this->data['tab_stats'] = $this->language->get('tab_stats');



        $this->data['text_enabled'] = $this->language->get('text_enabled');

        $this->data['text_disabled'] = $this->language->get('text_disabled');

        $this->data['text_yes'] = $this->language->get('text_yes');

        $this->data['text_no'] = $this->language->get('text_no');

        $this->data['text_general_information'] = $this->language->get('text_general_information');

        $this->data['text_default'] = $this->language->get('text_default');

        $this->data['text_per_day'] = $this->language->get('text_per_day');

        $this->data['text_apply_rule'] = $this->language->get('text_apply_rule');

        $this->data['text_update_prices'] = $this->language->get('text_update_prices');

        $this->data['text_rule_to_products'] = $this->language->get('text_rule_to_products');

        $this->data['text_rule_to_conditions'] = $this->language->get('text_rule_to_conditions');

        $this->data['text_no_coupon'] = $this->language->get('text_no_coupon');

        $this->data['text_specific_coupon'] = $this->language->get('text_specific_coupon');

        $this->data['text_by_percent'] = $this->language->get('text_by_percent');

        $this->data['text_by_fixed'] = $this->language->get('text_by_fixed');

        $this->data['text_pack_by_percent'] = $this->language->get('text_pack_by_percent');

        $this->data['text_pack_by_fixed'] = $this->language->get('text_pack_by_fixed');

        $this->data['text_n_products_fixed'] = $this->language->get('text_n_products_fixed');

        $this->data['text_n_products_percent'] = $this->language->get('text_n_products_percent');

        $this->data['text_each_n_fixed'] = $this->language->get('text_each_n_fixed');

        $this->data['text_each_n_percent'] = $this->language->get('text_each_n_percent');

        $this->data['text_each_cart_n_fixed'] = $this->language->get('text_each_cart_n_fixed');

        $this->data['text_each_cart_n_percent'] = $this->language->get('text_each_cart_n_percent');

        $this->data['text_buy_x_get_y_percent'] = $this->language->get('text_buy_x_get_y_percent');

        $this->data['text_buy_x_get_y_fixed'] = $this->language->get('text_buy_x_get_y_fixed');

        $this->data['text_buy_x_cart_get_y_percent'] = $this->language->get('text_buy_x_cart_get_y_percent');

        $this->data['text_buy_x_cart_get_y_fixed'] = $this->language->get('text_buy_x_cart_get_y_fixed');

        $this->data['text_after_n_fixed'] = $this->language->get('text_after_n_fixed');

        $this->data['text_after_n_percent'] = $this->language->get('text_after_n_percent');

        $this->data['text_after_cart_n_fixed'] = $this->language->get('text_after_cart_n_fixed');

        $this->data['text_after_cart_n_percent'] = $this->language->get('text_after_cart_n_percent');

        $this->data['text_get_y_for_each_x_spent'] = sprintf($this->language->get('text_get_y_for_each_x_spent'), $this->currency->getSymbolLeft(), $this->currency->getSymbolRight(), $this->currency->getSymbolLeft(), $this->currency->getSymbolRight());

        $this->data['text_ignore_item_qty'] = $this->language->get('text_ignore_item_qty');



        $this->data['text_get_y_for_each_x_spent_help'] = $this->language->get('text_get_y_for_each_x_spent_help');

        $this->data['text_n_products_help'] = $this->language->get('text_n_products_help');

        $this->data['text_each_n_help'] = $this->language->get('text_each_n_help');

        $this->data['text_each_cart_n_help'] = $this->language->get('text_each_cart_n_help');

        $this->data['text_buy_x_get_y_help'] = $this->language->get('text_buy_x_get_y_help');

        $this->data['text_buy_x_cart_get_y_help'] = $this->language->get('text_buy_x_cart_get_y_help');

        $this->data['text_after_n_help'] = $this->language->get('text_after_n_help');

        $this->data['text_after_cart_n_help'] = $this->language->get('text_after_cart_n_help');

        $this->data['text_by_fixed_help'] = $this->language->get('text_by_fixed_help');

        $this->data['text_by_percent_help'] = $this->language->get('text_by_percent_help');

        $this->data['text_pack_by_fixed_help'] = $this->language->get('text_pack_by_fixed_help');

        $this->data['text_pack_by_percent_help'] = $this->language->get('text_pack_by_percent_help');



        $this->data['entry_name'] = $this->language->get('entry_name');

        $this->data['entry_description'] = $this->language->get('entry_description');

        $this->data['entry_status'] = $this->language->get('entry_status');

        $this->data['entry_store'] = $this->language->get('entry_store');

        $this->data['entry_customer_group'] = $this->language->get('entry_customer_group');

        $this->data['entry_coupon'] = $this->language->get('entry_coupon');

        $this->data['entry_coupon_code'] = $this->language->get('entry_coupon_code');

        $this->data['entry_uses_total'] = $this->language->get('entry_uses_total');

        $this->data['entry_uses_customer'] = $this->language->get('entry_uses_customer');

        $this->data['entry_date_start'] = $this->language->get('entry_date_start');

        $this->data['entry_date_end'] = $this->language->get('entry_date_end');

        $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

        $this->data['entry_discount_type'] = $this->language->get('entry_discount_type');

        $this->data['entry_discount_amount'] = $this->language->get('entry_discount_amount');

        if (version_compare(VERSION, '1.5.5.1') >= 0) {

            $this->data['entry_promo_categories'] = $this->language->get('entry_promo_categories');

        } else {

            $this->data['entry_promo_categories'] = $this->language->get('entry_promo_categories_old');

        }

        $this->data['entry_promo_products'] = $this->language->get('entry_promo_products');

        $this->data['entry_promo_qty'] = $this->language->get('entry_promo_qty');

        $this->data['entry_discount_qty'] = $this->language->get('entry_discount_qty');

        $this->data['entry_discount_option'] = $this->language->get('entry_discount_option');

        $this->data['entry_free_shipping'] = $this->language->get('entry_free_shipping');

        $this->data['entry_stop_rules_processing'] = $this->language->get('entry_stop_rules_processing');

        $this->data['entry_label'] = $this->language->get('entry_label');

        $this->data['entry_logged'] = $this->language->get('entry_logged');

        $this->data['entry_rule_products'] = $this->language->get('entry_rule_products');

        $this->data['entry_rule_manufacturer'] = $this->language->get('entry_rule_manufacturer');

        

        //exclusion

        $this->data['entry_exclusion_products'] = $this->language->get('entry_exclusion_products');

        $this->data['entry_exclusion_manufacturers'] = $this->language->get('entry_exclusion_manufacturers');

        

        if (version_compare(VERSION, '1.5.5.1') >= 0) {

            $this->data['entry_rule_categories'] = $this->language->get('entry_rule_categories');

        } else {

            $this->data['entry_rule_categories'] = $this->language->get('entry_rule_categories_old');

        }



        $this->data['button_save'] = $this->language->get('button_save');

        $this->data['button_cancel'] = $this->language->get('button_cancel');



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



        if (isset($this->error['label'])) {

            $this->data['error_label'] = $this->error['label'];

        } else {

            $this->data['error_label'] = '';

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

            'href'      => $this->url->link('sale/special_promotions', 'token=' . $this->session->data['token'] . $url, 'SSL'),

            'separator' => ' :: '

        );



        if (!isset($this->request->get['promotion_id'])) {

            $this->data['action'] = $this->url->link('sale/special_promotions/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');

        } else {

            $this->data['action'] = $this->url->link('sale/special_promotions/update', 'token=' . $this->session->data['token'] . '&promotion_id=' . $this->request->get['promotion_id'] . $url, 'SSL');

        }



        $this->data['cancel'] = $this->url->link('sale/special_promotions', 'token=' . $this->session->data['token'] . $url, 'SSL');



        if (!empty($this->request->get['promotion_id'])) {

            $special_promotion = $this->model_sale_special_promotions->getPromotion($this->request->get['promotion_id']);

        } else {

            $special_promotion = false;

        }



        if (!empty($special_promotion)) {

            $this->data['promotion_id'] = $special_promotion['promotion_id'];

        } else {

            $this->data['promotion_id'] = '';

        }



        if (isset($this->request->post['name'])) {

            $this->data['name'] = $this->request->post['name'];

        } elseif (!empty($special_promotion)) {

            $this->data['name'] = $special_promotion['name'];

        } else {

            $this->data['name'] = '';

        }



        if (isset($this->request->post['description'])) {

            $this->data['description'] = $this->request->post['description'];

        } elseif (!empty($special_promotion)) {

            $this->data['description'] = $special_promotion['description'];

        } else {

            $this->data['description'] = '';

        }



        if (isset($this->request->post['status'])) {

            $this->data['status'] = $this->request->post['status'];

        } elseif (!empty($special_promotion)) {

            $this->data['status'] = $special_promotion['status'];

        } else {

            $this->data['status'] = 0;

        }



        if (isset($this->request->post['store_ids'])) {

            $this->data['store_ids'] = $this->request->post['store_ids'];

        } elseif (!empty($special_promotion)) {

            $this->data['store_ids'] = $special_promotion['store_ids'];

        } else {

            $this->data['store_ids'] = array();

        }



        if (isset($this->request->post['customer_group_ids'])) {

            $this->data['customer_group_ids'] = $this->request->post['customer_group_ids'];

        } elseif (!empty($special_promotion)) {

            $this->data['customer_group_ids'] = $special_promotion['customer_group_ids'];

        } else {

            $this->data['customer_group_ids'] = array();

        }



        if (isset($this->request->post['logged'])) {

            $this->data['logged'] = $this->request->post['logged'];

        } elseif (!empty($special_promotion)) {

            $this->data['logged'] = $special_promotion['logged'];

        } else {

            $this->data['logged'] = '';

        }



        if (isset($this->request->post['coupon_type'])) {

            $this->data['coupon_type'] = $this->request->post['coupon_type'];

        } elseif (!empty($special_promotion)) {

            $this->data['coupon_type'] = $special_promotion['coupon_type'];

        } else {

            $this->data['coupon_type'] = '';

        }



        if (isset($this->request->post['coupon_code'])) {

            $this->data['coupon_code'] = $this->request->post['coupon_code'];

        } elseif (!empty($special_promotion)) {

            $this->data['coupon_code'] = $special_promotion['coupon_code'];

        } else {

            $this->data['coupon_code'] = '';

        }



        if (isset($this->request->post['uses_total'])) {

            $this->data['uses_total'] = $this->request->post['uses_total'];

        } elseif (!empty($special_promotion)) {

            $this->data['uses_total'] = $special_promotion['uses_total'];

        } else {

            $this->data['uses_total'] = 0;

        }



        if (isset($this->request->post['uses_total_day'])) {

            $this->data['uses_total_day'] = $this->request->post['uses_total_day'];

        } elseif (!empty($special_promotion)) {

            $this->data['uses_total_day'] = empty($special_promotion['uses_total_day']) ? 0 : 1;

        } else {

            $this->data['uses_total_day'] = 0;

        }



        if (isset($this->request->post['uses_customer'])) {

            $this->data['uses_customer'] = $this->request->post['uses_customer'];

        } elseif (!empty($special_promotion)) {

            $this->data['uses_customer'] = $special_promotion['uses_customer'];

        } else {

            $this->data['uses_customer'] = 0;

        }



        if (isset($this->request->post['uses_customer_day'])) {

            $this->data['uses_customer_day'] = $this->request->post['uses_customer_day'];

        } elseif (!empty($special_promotion)) {

            $this->data['uses_customer_day'] = empty($special_promotion['uses_customer_day']) ? 0 : 1;

        } else {

            $this->data['uses_customer_day'] = 0;

        }



        if (isset($this->request->post['date_start'])) {

            $this->data['date_start'] = $this->request->post['date_start'];

        } elseif (!empty($special_promotion)) {

            $this->data['date_start'] = $special_promotion['date_start'];

        } else {

            $this->data['date_start'] = '';

        }



        if (isset($this->request->post['date_end'])) {

            $this->data['date_end'] = $this->request->post['date_end'];

        } elseif (!empty($special_promotion)) {

            $this->data['date_end'] = $special_promotion['date_end'];

        } else {

            $this->data['date_end'] = '';

        }



        if (isset($this->request->post['sort_order'])) {

            $this->data['sort_order'] = $this->request->post['sort_order'];

        } elseif (!empty($special_promotion)) {

            $this->data['sort_order'] = $special_promotion['sort_order'];

        } else {

            $this->data['sort_order'] = '';

        }



        if (isset($this->request->post['discount_type'])) {

            $this->data['discount_type'] = $this->request->post['discount_type'];

        } elseif (!empty($special_promotion)) {

            $this->data['discount_type'] = $special_promotion['discount_type'];

        } else {

            $this->data['discount_type'] = '';

        }



        if (isset($this->request->post['ignore_item_qty'])) {

            $this->data['ignore_item_qty'] = $this->request->post['ignore_item_qty'];

        } elseif (!empty($special_promotion)) {

            $this->data['ignore_item_qty'] = $special_promotion['ignore_item_qty'];

        } else {

            $this->data['ignore_item_qty'] = '';

        }



        if (isset($this->request->post['discount_amount'])) {

            $this->data['discount_amount'] = $this->request->post['discount_amount'];

        } elseif (!empty($special_promotion)) {

            $this->data['discount_amount'] = $special_promotion['discount_amount'];

        } else {

            $this->data['discount_amount'] = 0;

        }



        $this->load->model('catalog/category');



        if (version_compare(VERSION, '1.5.5.1') >= 0) {

            if (isset($this->request->post['promo_category']) && is_array($this->request->post['promo_category'])) {

                $promo_categories = array();

                foreach ($this->request->post['promo_category'] as $category_id) {

                    $category_info = $this->model_catalog_category->getCategory($category_id);

                    if ($category_info) {

                        $promo_categories[] = array(

                            'category_id' => $category_info['category_id'],

                            'name' => strip_tags(html_entity_decode(($category_info['path'] ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']), ENT_QUOTES, 'UTF-8'))

                        );

                    }

                }

                $this->data['promo_categories'] = $promo_categories;

            } elseif (!empty($special_promotion)) {

                $this->data['promo_categories'] = $special_promotion['promo_categories'];

            } else {

                $this->data['promo_categories'] = array();

            }

        } else {

            $this->data['categories'] = $this->model_catalog_category->getCategories(0);



            if (isset($this->request->post['promo_category']) && is_array($this->request->post['promo_category'])) {

                $this->data['promo_categories'] = $this->request->post['promo_category'];

            } elseif (!empty($special_promotion)) {

                $this->data['promo_categories'] = $special_promotion['promo_categories'];

            } else {

                $this->data['promo_categories'] = array();

            }

        }



        if (isset($this->request->post['promo_product']) && is_array($this->request->post['promo_product'])) {

            $promo_products = array();

            $this->load->model('catalog/product');

            foreach ($this->request->post['promo_product'] as $product_id) {

                $product_info = $this->model_catalog_product->getProduct($product_id);

                if ($product_info) {

                    $promo_products[] = array(

                        'product_id' => $product_info['product_id'],

                        'name' => strip_tags(html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8'))

                    );

                }

            }

            $this->data['promo_products'] = $promo_products;

        } elseif (!empty($special_promotion)) {

            $this->data['promo_products'] = $special_promotion['promo_products'];

        } else {

            $this->data['promo_products'] = array();

        }



        if (version_compare(VERSION, '1.5.5.1') >= 0) {

            $this->data['categories'] = array();



            if (isset($this->request->post['rule_category']) && is_array($this->request->post['rule_category'])) {

                $rule_categories = array();

                foreach ($this->request->post['rule_category'] as $category_id) {

                    $category_info = $this->model_catalog_category->getCategory($category_id);

                    if ($category_info) {

                        $rule_categories[] = array(

                            'category_id' => $category_info['category_id'],

                            'name' => strip_tags(html_entity_decode(($category_info['path'] ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']), ENT_QUOTES, 'UTF-8'))

                        );

                    }

                }

                $this->data['rule_categories'] = $rule_categories;

            } elseif (!empty($special_promotion)) {

                $this->data['rule_categories'] = $special_promotion['rule_categories'];

            } else {

                $this->data['rule_categories'] = array();

            }

        } else {

            if (isset($this->request->post['rule_category']) && is_array($this->request->post['rule_category'])) {

                $this->data['rule_categories'] = $this->request->post['rule_category'];

            } elseif (!empty($special_promotion)) {

                $this->data['rule_categories'] = $special_promotion['rule_categories'];

            } else {

                $this->data['rule_categories'] = array();

            }

        }



        if (isset($this->request->post['rule_product']) && is_array($this->request->post['rule_product'])) {

            $rule_products = array();

            $this->load->model('catalog/product');

            foreach ($this->request->post['rule_product'] as $product_id) {

                $product_info = $this->model_catalog_product->getProduct($product_id);

                if ($product_info) {

                    $rule_products[] = array(

                        'product_id' => $product_info['product_id'],

                        'name' => strip_tags(html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8'))

                    );

                }

            }

            $this->data['rule_products'] = $rule_products;

        } elseif (!empty($special_promotion)) {

            $this->data['rule_products'] = $special_promotion['rule_products'];

        } else {

            $this->data['rule_products'] = array();

        }

        //[SB] Added Manufacturers

        if (isset($this->request->post['rule_manufacturer']) && is_array($this->request->post['rule_manufacturer'])) {

            $rule_manufacturer = array();

            $this->load->model('catalog/manufacturer');

            foreach ($this->request->post['rule_manufacturer'] as $manufacturer_id) {

                $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($manufacturer_id);


                if ($manufacturer_info) {

                    $rule_manufacturer[] = array(

                        'manufacturer_id' => $manufacturer_info['manufacturer_id'],

                        'name' => strip_tags(html_entity_decode($manufacturer_info['name'], ENT_QUOTES, 'UTF-8'))

                    );

                }

            }

            $this->data['rule_manufacturers'] = $rule_manufacturer;


        } elseif (!empty($special_promotion)) {

            $this->data['rule_manufacturers'] = $special_promotion['rule_manufacturers'];

        } else {

            $this->data['rule_manufacturers'] = array();

        }



        

        //exclusion_products

        if (isset($this->request->post['rule_exclusion_product']) && is_array($this->request->post['rule_exclusion_product'])) {

            $rule_exclusion_products = array();

            $this->load->model('catalog/product');

            foreach ($this->request->post['rule_exclusion_product'] as $product_id) {

                $product_info = $this->model_catalog_product->getProduct($product_id);

                if ($product_info) {

                    $rule_exclusion_products[] = array(

                        'product_id' => $product_info['product_id'],

                        'name' => strip_tags(html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8'))

                    );

                }

            }

            $this->data['rule_exclusion_products'] = $rule_exclusion_products;

        } elseif (!empty($special_promotion)) {

            $this->data['rule_exclusion_products'] = $special_promotion['rule_exclusion_products'];

        } else {

            $this->data['rule_exclusion_products'] = array();

        }

        

         //exclusion manufacturer

        if (isset($this->request->post['rule_exclusion_manufacturer']) && is_array($this->request->post['rule_exclusion_manufacturer'])) {

            $rule_exclusion_manufacturers = array();

            $this->load->model('catalog/manufacturer');

            foreach ($this->request->post['rule_exclusion_manufacturer'] as $manufacturer_id) {

                $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($manufacturer_id);

                if ($manufacturer_info) {

                    $rule_exclusion_manufacturers[] = array(

                        'manufacturer_id' => $manufacturer_info['manufacturer_id'],

                        'name' => strip_tags(html_entity_decode($manufacturer_info['name'], ENT_QUOTES, 'UTF-8'))

                    );

                }

            }

            $this->data['rule_exclusion_manufacturers'] = $rule_exclusion_manufacturers;

        } elseif (!empty($special_promotion)) {

            $this->data['rule_exclusion_manufacturers'] = $special_promotion['rule_exclusion_manufacturers'];

        } else {

            $this->data['rule_exclusion_manufacturers'] = array();

        }



        if (isset($this->request->post['promo_qty'])) {

            $this->data['promo_qty'] = $this->request->post['promo_qty'];

        } elseif (!empty($special_promotion)) {

            $this->data['promo_qty'] = empty($special_promotion['promo_qty']) ? 1 : (int)$special_promotion['promo_qty'];

        } else {

            $this->data['promo_qty'] = 0;

        }



        if (isset($this->request->post['discount_qty'])) {

            $this->data['discount_qty'] = $this->request->post['discount_qty'];

        } elseif (!empty($special_promotion)) {

            $this->data['discount_qty'] = $special_promotion['discount_qty'];

        } else {

            $this->data['discount_qty'] = 0;

        }



        if (isset($this->request->post['discount_option'])) {

            $this->data['discount_option'] = $this->request->post['discount_option'];

        } elseif (!empty($special_promotion)) {

            $this->data['discount_option'] = $special_promotion['discount_option'];

        } else {

            $this->data['discount_option'] = 0;

        }



        if (isset($this->request->post['free_shipping'])) {

            $this->data['free_shipping'] = $this->request->post['free_shipping'];

        } elseif (!empty($special_promotion)) {

            $this->data['free_shipping'] = $special_promotion['free_shipping'];

        } else {

            $this->data['free_shipping'] = 0;

        }



        if (isset($this->request->post['stop_rules_processing'])) {

            $this->data['stop_rules_processing'] = $this->request->post['stop_rules_processing'];

        } elseif (!empty($special_promotion)) {

            $this->data['stop_rules_processing'] = $special_promotion['stop_rules_processing'];

        } else {

            $this->data['stop_rules_processing'] = 0;

        }



        if (isset($this->request->post['rule'])) {

            $this->data['rule'] = $this->request->post['rule'];

        } elseif (!empty($special_promotion)) {

            $this->data['rule'] = $special_promotion['rule'];

        } else {

            $this->data['rule'] = array();

        }



        if (isset($this->request->post['label'])) {

            $this->data['label'] = $this->request->post['label'];

        } elseif (!empty($special_promotion)) {

            $this->data['label'] = $special_promotion['label'];

        } else {

            $this->data['label'] = array();

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



            if (version_compare(VERSION, '1.5.5.1') >= 0) {

                $categories_1 = $this->model_catalog_category->getCategories(null);

                foreach ($categories_1 as $category_1) {

                    $this->data['values_categories'] += array(

                        $category_1['category_id'] => $category_1['name']

                    );

                }

            } else {

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



        $this->template = 'sale/special_promotions_form.tpl';

        $this->children = array(

            'common/header',

            'common/footer'

        );



        $this->response->setOutput($this->render());

    }



    protected function validateForm() {

        if (!$this->user->hasPermission('modify', 'sale/special_promotions')) {

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



        foreach ($this->request->post['label'] as $language_id => $value) {

            if ((utf8_strlen($value) < 1) || (utf8_strlen($value) > 255)) {

                $this->error['label'][$language_id] = $this->language->get('error_label');

            }

        }



        if (!$this->error) {

            return true;

        } else {

            return false;

        }

    }



    protected function validateDelete() {

        if (!$this->user->hasPermission('modify', 'sale/special_promotions')) {

            $this->error['warning'] = $this->language->get('error_permission');

        }



        if (!$this->error) {

            return true;

        } else {

            return false;

        }

    }



    public function stats() {

        $this->language->load('sale/special_promotions');



        $this->load->model('sale/special_promotions');



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



        $this->data['stats'] = array();



        $results = $this->model_sale_special_promotions->getPromotionStats($this->request->get['promotion_id'], ($page - 1) * 10, 10);



        foreach ($results as $result) {

            $this->data['stats'][] = array(

                'order_id'    => $result['order_id'],

                'customer_id' => $result['customer_id'],

                'customer'    => $result['customer'],

                'amount'      => $result['amount'],

                'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added']))

            );

        }



        $stats_total = $this->model_sale_special_promotions->getTotalPromotionStats($this->request->get['promotion_id']);



        $pagination = new Pagination();

        $pagination->total = $stats_total;

        $pagination->page = $page;

        $pagination->limit = 10;

        $pagination->url = $this->url->link('sale/special_promotions/stats', 'token=' . $this->session->data['token'] . '&promotion_id=' . $this->request->get['promotion_id'] . '&page={page}', 'SSL');



        $this->data['order_url'] = $this->url->link('sale/order/info', 'token=' . $this->session->data['token'] . '&order_id=', 'SSL');

        $this->data['customer_url'] = $this->url->link('sale/customer/update', 'token=' . $this->session->data['token'] . '&customer_id=', 'SSL');



        $this->data['pagination'] = $pagination->render();



        $this->template = 'sale/special_promotions_stats.tpl';



        $this->response->setOutput($this->render());

    }



}