<?php

/**
 * @author Malcolm [MY]
 */
class ControllerSalePromotion extends Controller {

    private $error = array();

    public function index() {
        $this->install();

        $this->language->load('sale/promotion');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sale/promotion');

        $this->getList();
    }

    public function insert() {
        $this->language->load('sale/promotion');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sale/promotion');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_sale_promotion->addPromotion($this->request->post);

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

            $this->redirect($this->url->link('sale/promotion', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getForm();
    }

    public function update() {
        $this->language->load('sale/promotion');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sale/promotion');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_sale_promotion->editPromotion($this->request->get['promotion_id'], $this->request->post);

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

            $this->redirect($this->url->link('sale/promotion', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getForm();
    }

    public function delete() {
        $this->language->load('sale/promotion');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sale/promotion');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $promotion_id) {
                $this->model_sale_promotion->deletePromotion($promotion_id);
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

        $this->redirect(HTTPS_SERVER . 'index.php?route=sale/promotion&token=' . $this->session->data['token'] . $url);
    }

    protected function getList() {

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'v.date_added';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'DESC';
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
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('sale/promotion', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );


        $this->data['insert'] = $this->url->link('sale/promotion/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $this->data['delete'] = $this->url->link('sale/promotion/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $this->data['promotions'] = array();


        //retreive all data
        $data = array(
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_admin_limit'),
            'limit' => $this->config->get('config_admin_limit')
        );



        $promotion_total = $this->model_sale_promotion->getTotalPromotions();

        $results = $this->model_sale_promotion->getPromotions($data);

        foreach ($results as $result) {
            $action = array();

            $action[] = array(
                'text' => $this->language->get('text_edit'),
                'href' => $this->url->link('sale/promotion/update', 'token=' . $this->session->data['token'] . '&promotion_id=' . $result['promotion_id'] . $url, 'SSL')
            );

            $this->data['promotions'][] = array(
                'promotion_id' => $result['promotion_id'],
                'name' => $result['name'],
                'discount' => $result['discount'],
                'discount_type' => $result['discount_type'],
                'date_start' => date($this->language->get('date_format_short'), strtotime($result['date_start'])),
                'date_end' => date($this->language->get('date_format_short'), strtotime($result['date_end'])),
                'status' => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
                'selected' => isset($this->request->post['selected']) && in_array($result['promotion_id'], $this->request->post['selected']),
                'action' => $action
            );
        }

        //display options
        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_send'] = $this->language->get('text_send');
        $this->data['text_wait'] = $this->language->get('text_wait');
        $this->data['text_no_results'] = $this->language->get('text_no_results');

        //table cols
        $this->data['column_name'] = $this->language->get('column_name');
        $this->data['column_discount'] = $this->language->get('column_discount');
        $this->data['column_discount_type'] = $this->language->get('column_discount_type');
        $this->data['column_date_start'] = $this->language->get('column_date_start');
        $this->data['column_date_end'] = $this->language->get('column_date_end');
        $this->data['column_date_added'] = $this->language->get('column_date_added');
        $this->data['column_status'] = $this->language->get('column_status');
        $this->data['column_action'] = $this->language->get('column_action');

        $this->data['button_insert'] = $this->language->get('button_insert');
        $this->data['button_delete'] = $this->language->get('button_delete');
        //end display options
        //status messages
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

        //sorting
        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $this->data['sort_code'] = $this->url->link('sale/promotion', 'token=' . $this->session->data['token'] . '&sort=v.code' . $url, 'SSL');
        $this->data['sort_from'] = $this->url->link('sale/promotion', 'token=' . $this->session->data['token'] . '&sort=v.from_name' . $url, 'SSL');
        $this->data['sort_to'] = $this->url->link('sale/promotion', 'token=' . $this->session->data['token'] . '&sort=v.to_name' . $url, 'SSL');
        $this->data['sort_theme'] = $this->url->link('sale/promotion', 'token=' . $this->session->data['token'] . '&sort=theme' . $url, 'SSL');
        $this->data['sort_amount'] = $this->url->link('sale/promotion', 'token=' . $this->session->data['token'] . '&sort=v.amount' . $url, 'SSL');
        $this->data['sort_status'] = $this->url->link('sale/promotion', 'token=' . $this->session->data['token'] . '&sort=v.date_end' . $url, 'SSL');
        $this->data['sort_date_added'] = $this->url->link('sale/promotion', 'token=' . $this->session->data['token'] . '&sort=v.date_added' . $url, 'SSL');


        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }


        $pagination = new Pagination();
        $pagination->total = $promotion_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_admin_limit');
        $pagination->text = $this->language->get('text_pagination');
        $pagination->url = $this->url->link('sale/promotion', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        $this->data['pagination'] = $pagination->render();

        $this->data['sort'] = $sort;
        $this->data['order'] = $order;
        //.end sorting

        $this->template = 'sale/promotion_list.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    protected function getForm() {
        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['heading_promotion_items'] = $this->language->get('heading_promotion_items');
        $this->data['heading_promotion_details'] = $this->language->get('heading_promotion_details');

        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_yes'] = $this->language->get('text_yes');
        $this->data['text_no'] = $this->language->get('text_no');
        $this->data['text_percent'] = $this->language->get('text_percent');
        $this->data['text_amount'] = $this->language->get('text_amount');
        $this->data['text_n_products_fixed'] = $this->language->get('text_n_products_fixed');
        $this->data['text_n_products_percent'] = $this->language->get('text_n_products_percent');
        $this->data['text_buy_x_get_y_fixed'] = $this->language->get('text_buy_x_get_y_fixed');
        $this->data['text_buy_x_get_y_percent'] = $this->language->get('text_buy_x_get_y_percent');

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
        $this->data['entry_discount'] = $this->language->get('entry_discount');
        $this->data['entry_discount_type'] = $this->language->get('entry_discount_type');
        $this->data['entry_discount_qty'] = $this->language->get('entry_discount_qty');
        $this->data['entry_discount_option'] = $this->language->get('entry_discount_option');
        $this->data['entry_promo_qty'] = $this->language->get('entry_promo_qty');
        $this->data['entry_promo_discount_products'] = $this->language->get('entry_promo_discount_products');
        $this->data['entry_type'] = $this->language->get('entry_type');
        $this->data['entry_product'] = $this->language->get('entry_product');
        $this->data['entry_total'] = $this->language->get('entry_total');
        $this->data['entry_category'] = $this->language->get('entry_category');
        $this->data['entry_date_start'] = $this->language->get('entry_date_start');
        $this->data['entry_date_end'] = $this->language->get('entry_date_end');
        $this->data['entry_uses_total'] = $this->language->get('entry_uses_total');
        $this->data['entry_uses_customer'] = $this->language->get('entry_uses_customer');
        $this->data['entry_status'] = $this->language->get('entry_status');


        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');

        $this->data['tab_general'] = $this->language->get('tab_general');
        $this->data['tab_history'] = $this->language->get('tab_history');

        $this->data['token'] = $this->session->data['token'];

        if (isset($this->request->get['promotion_id'])) {
            $this->data['promotion_id'] = $this->request->get['promotion_id'];
        } else {
            $this->data['promotion_id'] = 0;
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
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('sale/promotion', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );

        if (!isset($this->request->get['promotion_id'])) {
            $this->data['action'] = $this->url->link('sale/promotion/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
        } else {
            $this->data['action'] = $this->url->link('sale/promotion/update', 'token=' . $this->session->data['token'] . '&promotion_id=' . $this->request->get['promotion_id'] . $url, 'SSL');
        }

        $this->data['cancel'] = $this->url->link('sale/promotion', 'token=' . $this->session->data['token'] . $url, 'SSL');

        if (isset($this->request->get['promotion_id']) && (!$this->request->server['REQUEST_METHOD'] != 'POST')) {
            $promotion_info = $this->model_sale_promotion->getPromotion($this->request->get['promotion_id']);
        }

        if (isset($this->request->post['name'])) {
            $this->data['name'] = $this->request->post['name'];
        } elseif (!empty($promotion_info)) {
            $this->data['name'] = $promotion_info['name'];
        } else {
            $this->data['name'] = '';
        }

        if (isset($this->request->post['discount'])) {
            $this->data['discount'] = $this->request->post['discount'];
        } elseif (!empty($promotion_info)) {
            $this->data['discount'] = $promotion_info['discount'];
        } else {
            $this->data['discount'] = '';
        }

        if (isset($this->request->post['discount_option'])) {
            $this->data['discount_option'] = $this->request->post['discount_option'];
        } elseif (!empty($promotion_info)) {
            $this->data['discount_option'] = $promotion_info['discount_option'];
        } else {
            $this->data['discount_option'] = 0;
        }

        if (isset($this->request->post['discount_type'])) {
            $this->data['discount_type'] = $this->request->post['discount_type'];
        } elseif (!empty($promotion_info)) {
            $this->data['discount_type'] = $promotion_info['discount_type'];
        } else {
            $this->data['discount_type'] = '';
        }

        if (isset($this->request->post['discount_qty'])) {
            $this->data['discount_qty'] = $this->request->post['discount_qty'];
        } elseif (!empty($promotion_info)) {
            $this->data['discount_qty'] = $promotion_info['discount_qty'];
        } else {
            $this->data['discount_qty'] = '';
        }

        if (isset($this->request->post['promo_qty'])) {
            $this->data['promo_qty'] = $this->request->post['promo_qty'];
        } elseif (!empty($promotion_info)) {
            $this->data['promo_qty'] = $promotion_info['promo_qty'];
        } else {
            $this->data['promo_qty'] = '';
        }

        /*
          if (isset($this->request->post['promo_discount_product']) && is_array($this->request->post['promo_discount_product'])) {
          $promo_discount_products = array();
          $this->load->model('catalog/product');
          foreach ($this->request->post['promo_discount_product'] as $product_id) {
          $product_info = $this->model_catalog_product->getProduct($product_id);
          if ($product_info) {
          $promo_discount_products[] = array(
          'product_id' => $product_info['product_id'],
          'name' => strip_tags(html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8'))
          );
          }
          }
          $this->data['promo_discount_products'] = $promo_discount_products;
          } elseif (!empty($promotion)) {
          $this->data['promo_discount_products'] = $this->model_sale_promotion->getDiscountProducts($this->request->get['promotion_id']);
          } else {
          $this->data['promo_discount_products'] = array();
          } */

        $this->load->model('catalog/product');
        if (isset($this->request->post['promo_discount_product'])) {
            $promo_discount_products = $this->request->post['promo_discount_product'];
        } elseif (isset($this->request->get['promotion_id'])) {
            $promo_discount_products = $this->model_sale_promotion->getDiscountProducts($this->request->get['promotion_id']);
        } else {
            $promo_discount_products = array();
        }
        $this->data['promo_discount_products'] = array();

        foreach ($promo_discount_products as $product_id) {
            $product_info = $this->model_catalog_product->getProduct($product_id);

            if ($product_info) {
                $this->data['promo_discount_products'][] = array(
                    'product_id' => $product_info['product_id'],
                    'name' => strip_tags(html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8'))
                );
            }
        }

        if (isset($this->request->post['promotion_product'])) {
            $products = $this->request->post['promotion_product'];
        } elseif (isset($this->request->get['promotion_id'])) {
            $products = $this->model_sale_promotion->getPromotionProducts($this->request->get['promotion_id']);
        } else {
            $products = array();
        }

        $this->data['promotion_product'] = array();

        foreach ($products as $product_id) {
            $product_info = $this->model_catalog_product->getProduct($product_id);

            if ($product_info) {
                $this->data['promotion_product'][] = array(
                    'product_id' => $product_info['product_id'],
                    'name' => $product_info['name']
                );
            }
        }

        if (isset($this->request->post['promotion_category'])) {
            $categories = $this->request->post['promotion_category'];
        } elseif (isset($this->request->get['promotion_id'])) {
            $categories = $this->model_sale_promotion->getPromotionCategories($this->request->get['promotion_id']);
        } else {
            $categories = array();
        }

        $this->load->model('catalog/category');

        $this->data['promotion_category'] = array();

        foreach ($categories as $category_id) {
            $category_info = $this->model_catalog_category->getCategory($category_id);

            if ($category_info) {
                $this->data['promotion_category'][] = array(
                    'category_id' => $category_info['category_id'],
                    'name' => ($category_info['path'] ? $category_info['path'] . ' &gt; ' : '') . $category_info['name']
                );
            }
        }

        if (isset($this->request->post['description'])) {
            $this->data['date_start'] = $this->request->post['description'];
        } elseif (!empty($promotion_info)) {
            $this->data['description'] = $promotion_info['description'];
        } else {
            $this->data['description'] = '';
        }

        if (isset($this->request->post['date_start'])) {
            $this->data['date_start'] = $this->request->post['date_start'];
        } elseif (!empty($promotion_info)) {
            $this->data['date_start'] = date('Y-m-d', strtotime($promotion_info['date_start']));
        } else {
            $this->data['date_start'] = date('Y-m-d', time());
        }

        if (isset($this->request->post['date_end'])) {
            $this->data['date_end'] = $this->request->post['date_end'];
        } elseif (!empty($promotion_info)) {
            $this->data['date_end'] = date('Y-m-d', strtotime($promotion_info['date_end']));
        } else {
            $this->data['date_end'] = date('Y-m-d', time());
        }

        if (isset($this->request->post['uses_total'])) {
            $this->data['uses_total'] = $this->request->post['uses_total'];
        } elseif (!empty($promotion_info)) {
            $this->data['uses_total'] = $promotion_info['uses_total'];
        } else {
            $this->data['uses_total'] = 1;
        }

        if (isset($this->request->post['uses_customer'])) {
            $this->data['uses_customer'] = $this->request->post['uses_customer'];
        } elseif (!empty($promotion_info)) {
            $this->data['uses_customer'] = $promotion_info['uses_customer'];
        } else {
            $this->data['uses_customer'] = 1;
        }

        if (isset($this->request->post['status'])) {
            $this->data['status'] = $this->request->post['status'];
        } elseif (!empty($promotion_info)) {
            $this->data['status'] = $promotion_info['status'];
        } else {
            $this->data['status'] = 1;
        }

        $this->template = 'sale/promotion_form.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    protected function validateForm() {
        if (!$this->user->hasPermission('modify', 'sale/promotion')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 255)) {
            $this->error['name'] = $this->language->get('error_name');
        }

        $promotion_info = $this->model_sale_promotion->getPromotionByName($this->request->post['name']);

        if ($promotion_info) {
            if (!isset($this->request->get['promotion_id'])) {
                $this->error['warning'] = $this->language->get('error_exists');
            } elseif ($promotion_info['promotion_id'] != $this->request->get['promotion_id']) {
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
        if (!$this->user->hasPermission('modify', 'sale/promotion')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * just in case there's no db lets create one wohoo
     */
    private function install() {
        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "promotion` (
          `promotion_id` int(11) NOT NULL AUTO_INCREMENT,
          `name` VARCHAR(255) NOT NULL,
          `description` text NOT NULL,
          `discount` decimal(15,4) NOT NULL,
          `discount_type` varchar(255) NOT NULL,
          `discount_qty` int(11) NOT NULL,
          `promo_qty` int(11) NOT NULL,
          `date_start` date NOT NULL DEFAULT '0000-00-00',
          `date_end` date NOT NULL DEFAULT '0000-00-00',
          `uses_total` int(11) NOT NULL,
          `uses_customer` varchar(11) NOT NULL,
          `status` tinyint(1) NOT NULL,
          `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
          PRIMARY KEY (`promotion_id`)
        ) ENGINE=MyISAM  DEFAULT CHARSET=utf8;");

        $this->db->query("
            CREATE TABLE IF NOT EXISTS `oc_promotion_category` (
              `promotion_id` int(11) NOT NULL,
              `category_id` int(11) NOT NULL,
              PRIMARY KEY (`promotion_id`,`category_id`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
            ");

        $this->db->query("CREATE TABLE IF NOT EXISTS `oc_promotion_product` (
            `promotion_product_id` int(11) NOT NULL AUTO_INCREMENT,
            `promotion_id` int(11) NOT NULL,
            `product_id` int(11) NOT NULL,
            PRIMARY KEY (`promotion_product_id`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;");

        $this->db->query("CREATE TABLE IF NOT EXISTS `oc_promotion_discount_product` (
            `promotion_discount_product_id` int(11) NOT NULL AUTO_INCREMENT,
            `promotion_id` int(11) NOT NULL,
            `product_id` int(11) NOT NULL,
            PRIMARY KEY (`promotion_discount_product_id`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;");

        $this->db->query("CREATE TABLE IF NOT EXISTS `oc_promotion_history` (
            `promotion_history_id` int(11) NOT NULL AUTO_INCREMENT,
            `promotion_id` int(11) NOT NULL,
            `order_id` int(11) NOT NULL,
            `customer_id` int(11) NOT NULL,
            `amount` decimal(15,4) NOT NULL,
            `date_added` datetime NOT NULL,
            PRIMARY KEY (`promotion_history_id`)
          ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
          ");
    }

}

?>