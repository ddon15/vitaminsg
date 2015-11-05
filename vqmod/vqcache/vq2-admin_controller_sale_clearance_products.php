<?php

class ControllerSaleClearanceProducts extends Controller {

    private $error = array();

    public function __construct($registry) {
        parent::__construct($registry);
    }

    public function index() {
        $this->language->load('sale/clearance_products');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sale/clearance_products');

        $this->getList();
    }

    public function insert() {
        $this->load->language('sale/clearance_products');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sale/clearance_products');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

            $this->model_sale_clearance_products->addClearance($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
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

if (isset($this->request->get['keepediting'])) {
					if (!empty($this->request->get['tabselected'])) {
						$this->session->data['tabselected'] = $this->request->get['tabselected'];
					} else {
						unset($this->session->data['tabselected']);
					}
					$this->redirect('http' . (isset($this->request->server['HTTPS']) && $this->request->server['HTTPS'] != 'off' ? 's' : '') . '://' . $this->request->server['HTTP_HOST'] . substr($this->request->server['REQUEST_URI'], 0, strpos($this->request->server['REQUEST_URI'], '&amp;keepediting=true')));
				}
            $this->redirect(HTTPS_SERVER . 'index.php?route=sale/clearance_products&token=' . $this->session->data['token'] . $url);
        }

        $this->getForm();
    }

    public function update() {
        $this->load->language('sale/clearance_products');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sale/clearance_products');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

            $this->model_sale_clearance_products->editClearance($this->request->get['clearance_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_date_start'])) {
                $url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
            }

            if (isset($this->request->get['filter_date_end'])) {
                $url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
            }

            if (isset($this->request->get['filter_date_expiry'])) {
                $url .= '&filter_date_expiry=' . $this->request->get['filter_date_expiry'];
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

if (isset($this->request->get['keepediting'])) {
					if (!empty($this->request->get['tabselected'])) {
						$this->session->data['tabselected'] = $this->request->get['tabselected'];
					} else {
						unset($this->session->data['tabselected']);
					}
					$this->redirect('http' . (isset($this->request->server['HTTPS']) && $this->request->server['HTTPS'] != 'off' ? 's' : '') . '://' . $this->request->server['HTTP_HOST'] . substr($this->request->server['REQUEST_URI'], 0, strpos($this->request->server['REQUEST_URI'], '&amp;keepediting=true')));
				}
            $this->redirect(HTTPS_SERVER . 'index.php?route=sale/clearance_products&token=' . $this->session->data['token'] . $url);
        }

        $this->getForm();
    }

    public function delete() {
        $this->load->language('sale/clearance_products');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sale/clearance_products');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $clearance_id) {
                $this->model_sale_clearance_products->deleteClearance($clearance_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');
        }

        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_date_start'])) {
            $url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
        }

        if (isset($this->request->get['filter_date_end'])) {
            $url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
        }
        
        if (isset($this->request->get['filter_date_expiry'])) {
            $url .= '&filter_date_expiry=' . $this->request->get['filter_date_expiry'];
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

if (isset($this->request->get['keepediting'])) {
					if (!empty($this->request->get['tabselected'])) {
						$this->session->data['tabselected'] = $this->request->get['tabselected'];
					} else {
						unset($this->session->data['tabselected']);
					}
					$this->redirect('http' . (isset($this->request->server['HTTPS']) && $this->request->server['HTTPS'] != 'off' ? 's' : '') . '://' . $this->request->server['HTTP_HOST'] . substr($this->request->server['REQUEST_URI'], 0, strpos($this->request->server['REQUEST_URI'], '&amp;keepediting=true')));
				}
        $this->redirect(HTTPS_SERVER . 'index.php?route=sale/clearance_products&token=' . $this->session->data['token'] . $url);
    }

    public function status() {
        $this->load->language('sale/clearance_products');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sale/clearance_products');

        if (isset($this->request->get['clearance_id']) && $this->validateDelete()) {
            $this->model_sale_clearance_products->statusClearance($this->request->get['clearance_id']);
        }

        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_date_start'])) {
            $url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
        }

        if (isset($this->request->get['filter_date_end'])) {
            $url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
        }
        
        if (isset($this->request->get['filter_date_expiry'])) {
            $url .= '&filter_date_expiry=' . $this->request->get['filter_date_expiry'];
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

if (isset($this->request->get['keepediting'])) {
					if (!empty($this->request->get['tabselected'])) {
						$this->session->data['tabselected'] = $this->request->get['tabselected'];
					} else {
						unset($this->session->data['tabselected']);
					}
					$this->redirect('http' . (isset($this->request->server['HTTPS']) && $this->request->server['HTTPS'] != 'off' ? 's' : '') . '://' . $this->request->server['HTTP_HOST'] . substr($this->request->server['REQUEST_URI'], 0, strpos($this->request->server['REQUEST_URI'], '&amp;keepediting=true')));
				}
        $this->redirect(HTTPS_SERVER . 'index.php?route=sale/clearance_products&token=' . $this->session->data['token'] . $url);
    }

    public function copy() {
        $this->load->language('sale/clearance_products');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sale/clearance_products');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $clearance_id) {
                $this->model_sale_clearance_products->copyClearance($clearance_id);
            }
            $this->session->data['success'] = $this->language->get('text_success');
        }

        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_date_start'])) {
            $url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
        }

        if (isset($this->request->get['filter_date_end'])) {
            $url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
        }
        
        if (isset($this->request->get['filter_date_expiry'])) {
            $url .= '&filter_date_expiry=' . $this->request->get['filter_date_expiry'];
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

if (isset($this->request->get['keepediting'])) {
					if (!empty($this->request->get['tabselected'])) {
						$this->session->data['tabselected'] = $this->request->get['tabselected'];
					} else {
						unset($this->session->data['tabselected']);
					}
					$this->redirect('http' . (isset($this->request->server['HTTPS']) && $this->request->server['HTTPS'] != 'off' ? 's' : '') . '://' . $this->request->server['HTTP_HOST'] . substr($this->request->server['REQUEST_URI'], 0, strpos($this->request->server['REQUEST_URI'], '&amp;keepediting=true')));
				}
        $this->redirect(HTTPS_SERVER . 'index.php?route=sale/clearance_products&token=' . $this->session->data['token'] . $url);
    }

    private function getList() {

        if (isset($this->request->get['filter_name'])) {
            $filter_name = $this->request->get['filter_name'];
        } else {
            $filter_name = null;
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

        if (isset($this->request->get['filter_date_expiry'])) {
            $filter_date_expiry = $this->request->get['filter_date_expiry'];
        } else {
            $filter_date_expiry = null;
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


        if (isset($this->request->get['filter_date_start'])) {
            $url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
        }

        if (isset($this->request->get['filter_date_end'])) {
            $url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
        }

        if (isset($this->request->get['filter_date_expiry'])) {
            $url .= '&filter_date_end=' . $this->request->get['filter_date_expiry'];
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

        $this->data['sort_name'] = $this->url->link('sale/clearance_products', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
        $this->data['sort_date_start'] = $this->url->link('sale/clearance_products', 'token=' . $this->session->data['token'] . '&sort=date_start' . $url, 'SSL');
        $this->data['sort_date_end'] = $this->url->link('sale/clearance_products', 'token=' . $this->session->data['token'] . '&sort=date_end' . $url, 'SSL');
        $this->data['sort_date_expiry'] = $this->url->link('sale/clearance_products', 'token=' . $this->session->data['token'] . '&sort=date_expiry' . $url, 'SSL');
        $this->data['sort_status'] = $this->url->link('sale/clearance_products', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
        $this->data['sort_sort_order'] = $this->url->link('sale/clearance_products', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, 'SSL');

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'href' => HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token'],
            'text' => $this->language->get('text_home'),
            'separator' => FALSE
        );

        $this->data['breadcrumbs'][] = array(
            'href' => HTTPS_SERVER . 'index.php?route=sale/clearance_products&token=' . $this->session->data['token'],
            'text' => $this->language->get('heading_title'),
            'separator' => ' :: '
        );

        $data = array(
            'filter_name' => $filter_name,
            'filter_date_start' => $filter_date_start,
            'filter_date_end' => $filter_date_end,
            'filter_date_expiry' => $filter_date_expiry,
            'filter_status' => $filter_status,
            'filter_sort_order' => $filter_sort_order,
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_admin_limit'),
            'limit' => $this->config->get('config_admin_limit')
        );

        $clearance_products_total = $this->model_sale_clearance_products->getTotal($data);

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_no_results'] = $this->language->get('text_no_results');

        $this->data['column_name'] = $this->language->get('column_name');
        $this->data['column_date_start'] = $this->language->get('column_date_start');
        $this->data['column_date_end'] = $this->language->get('column_date_end');
        $this->data['column_date_expiry'] = $this->language->get('column_date_expiry');
        $this->data['column_status'] = $this->language->get('column_status');
        $this->data['column_sort_order'] = $this->language->get('column_sort_order');
        $this->data['column_action'] = $this->language->get('column_action');

        $this->data['button_insert'] = $this->language->get('button_insert');
        $this->data['button_delete'] = $this->language->get('button_delete');
        $this->data['button_copy'] = $this->language->get('button_copy');
        $this->data['button_filter'] = $this->language->get('button_filter');

        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');

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

        if (isset($this->request->get['filter_date_start'])) {
            $url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
        }

        if (isset($this->request->get['filter_date_end'])) {
            $url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
        }
        
         if (isset($this->request->get['filter_date_expiry'])) {
            $url .= '&filter_date_expiry=' . $this->request->get['filter_date_expiry'];
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
        $pagination->total = $clearance_products_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_admin_limit');
        $pagination->text = $this->language->get('text_pagination');
        $pagination->url = $this->url->link('sale/clearance_products', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $results = $this->model_sale_clearance_products->getClearanceProducts($data);
        $this->data['clearance'] = array();

        foreach ($results as $result) {
            $action = array();

            $action[] = array(
                'text' => $this->language->get('text_edit'),
                'href' => $this->url->link('sale/clearance_products/update', 'token=' . $this->session->data['token'] . '&clearance_id=' . $result['clearance_id'] . $url, 'SSL')
            );

            $action_status = $this->url->link('sale/clearance_products/status', 'token=' . $this->session->data['token'] . '&clearance_id=' . $result['clearance_id'] . $url, 'SSL');

            $this->data['clearance'][] = array(
                'clearance_id' => $result['clearance_id'],
                'name' => $result['name'],
                'sort_order' => $result['sort_order'],
                'date_start' => $result['date_start'],
                'date_end' => $result['date_end'],
                'date_expiry' => $result['date_expiry'],
                'status' => $result['status'],
                'selected' => isset($this->request->post['selected']) && in_array($result['clearance_id'], $this->request->post['selected']),
                'action' => $action,
                'action_status' => $action_status
            );
        }

        $this->data['insert'] = $this->url->link('sale/clearance_products/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $this->data['delete'] = $this->url->link('sale/clearance_products/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $this->data['copy'] = $this->url->link('sale/clearance_products/copy', 'token=' . $this->session->data['token'] . $url, 'SSL');

        $this->data['pagination'] = $pagination->render();

        $this->data['filter_name'] = $filter_name;
        $this->data['filter_date_start'] = $filter_date_start;
        $this->data['filter_date_end'] = $filter_date_end;
        $this->data['filter_date_expiry'] = $filter_date_expiry;
        $this->data['filter_status'] = $filter_status;
        $this->data['filter_sort_order'] = $filter_sort_order;

        $this->data['sort'] = $sort;
        $this->data['order'] = $order;

        $this->data['token'] = $this->session->data['token'];

        $this->template = 'sale/clearance_products_list.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    private function getForm() {
        $this->document->addScript('view/javascript/jquery/editable/jquery.editable.js');
        $this->document->addStyle('view/javascript/jquery/editable/editable.css');

        $this->load->language('sale/clearance_products');

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['tab_main'] = $this->language->get('tab_main');

        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_yes'] = $this->language->get('text_yes');
        $this->data['text_no'] = $this->language->get('text_no');
        $this->data['text_general_information'] = $this->language->get('text_general_information');

        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_date_start'] = $this->language->get('entry_date_start');
        $this->data['entry_date_end'] = $this->language->get('entry_date_end');
        $this->data['entry_date_expiry'] = $this->language->get('entry_date_expiry');
        $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $this->data['entry_description'] = $this->language->get('entry_description');
        $this->data['entry_name'] = $this->language->get('entry_name');
        $this->data['entry_clear_product'] = $this->language->get('entry_clear_product');
        $this->data['entry_promo_products'] = $this->language->get('entry_promo_products');
        $this->data['entry_promo_product_id'] = $this->language->get('entry_promo_product_id');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');


        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }


        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
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
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('sale/clearance_products', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );

        if (!isset($this->request->get['clearance_id'])) {
            $this->data['action'] = $this->url->link('sale/clearance_products/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
        } else {
            $this->data['action'] = $this->url->link('sale/clearance_products/update', 'token=' . $this->session->data['token'] . '&clearance_id=' . $this->request->get['clearance_id'] . $url, 'SSL');
        }

        $this->data['cancel'] = $this->url->link('sale/clearance_products', 'token=' . $this->session->data['token'] . $url, 'SSL');

        if (!empty($this->request->get['clearance_id'])) {
            $clearance_product = $this->model_sale_clearance_products->getClearance($this->request->get['clearance_id']);
        } else {
            $clearance_product = false;
        }
        
        if (!empty($clearance_product)) {
            $this->data['product_name'] = $clearance_product['product_name'];
        } else {
            $this->data['product_name'] = '';
        }

        if (!empty($clearance_product)) {
            $this->data['clearance_id'] = $clearance_product['clearance_id'];
        } else {
            $this->data['clearance_id'] = '';
        }

        if (isset($this->request->post['name'])) {
            $this->data['name'] = $this->request->post['name'];
        } elseif (!empty($clearance_product)) {
            $this->data['name'] = $clearance_product['name'];
        } else {
            $this->data['name'] = '';
        }

        if (isset($this->request->post['product_id'])) {
            $this->data['product_id'] = $this->request->post['product_id'];
        } elseif (!empty($clearance_product)) {
            $this->data['product_id'] = $clearance_product['product_id'];
        } else {
            $this->data['product_id'] = '';
        }
        

        if (isset($this->request->post['description'])) {
            $this->data['description'] = $this->request->post['description'];
        } elseif (!empty($clearance_product)) {
            $this->data['description'] = $clearance_product['description'];
        } else {
            $this->data['description'] = '';
        }

        if (isset($this->request->post['status'])) {
            $this->data['status'] = $this->request->post['status'];
        } elseif (!empty($clearance_product)) {
            $this->data['status'] = $clearance_product['status'];
        } else {
            $this->data['status'] = 0;
        }

        if (isset($this->request->post['date_start'])) {
            $this->data['date_start'] = $this->request->post['date_start'];
        } elseif (!empty($clearance_product)) {
            $this->data['date_start'] = $clearance_product['date_start'];
        } else {
            $this->data['date_start'] = '';
        }

        if (isset($this->request->post['date_end'])) {
            $this->data['date_end'] = $this->request->post['date_end'];
        } elseif (!empty($clearance_product)) {
            $this->data['date_end'] = $clearance_product['date_end'];
        } else {
            $this->data['date_end'] = '';
        }

        if (isset($this->request->post['date_expiry'])) {
            $this->data['date_expiry'] = $this->request->post['date_expiry'];
        } elseif (!empty($clearance_product)) {
            $this->data['date_expiry'] = $clearance_product['date_expiry'];
        } else {
            $this->data['date_expiry'] = '';
        }

        if (isset($this->request->post['sort_order'])) {
            $this->data['sort_order'] = $this->request->post['sort_order'];
        } elseif (!empty($clearance_product)) {
            $this->data['sort_order'] = $clearance_product['sort_order'];
        } else {
            $this->data['sort_order'] = '';
        }

        $this->data['token'] = $this->session->data['token'];

        $this->load->model('setting/extension');

        $this->template = 'sale/clearance_products_form.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    protected function validateForm() {
        if (!$this->user->hasPermission('modify', 'sale/clearance_products')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if ((utf8_strlen($this->request->post['name']) < 1) || (utf8_strlen($this->request->post['name']) > 255)) {
            $this->error['name'] = $this->language->get('error_name');
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
        if (!$this->user->hasPermission('modify', 'sale/clearance_products')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    

}
