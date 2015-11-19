<?php

/**
 * @author Malcolm [MY]
 * updates the ordertotals and settings db
 */
class ControllerTotalPromotion extends Controller {

    private $error = array();

    public function install() {
        $this->load->model('sale/promotion');
        $this->model_sale_promotion->install();

        $this->load->model('setting/extension');

        $extensions = $this->model_setting_extension->getInstalled('module');

        if (!in_array('promotion', $extensions)) {
            $this->model_setting_extension->install('module', 'promotion');
        }

        $extensions = $this->model_setting_extension->getInstalled('shipping');

        if (!in_array('promotion', $extensions)) {
            $this->model_setting_extension->install('shipping', 'promotion');
        }

        $this->load->model('setting/setting');
        $this->load->model('setting/store');

        $stores = array(0);

        $results = $this->model_setting_store->getStores();
        foreach ($results as $store) {
            $stores[] = $store['store_id'];
        }

        foreach ($stores as $store_id) {
            $this->model_setting_setting->editSetting('promotion', array(
                'promotion_version' => '1.0.0',
                'promotion_key' => ''
                    ), $store_id);
        }
    }

    public function uninstall() {
        $this->load->model('sale/promotion');
        $this->model_sale_promotion->uninstall();

        $this->load->model('setting/extension');
        $this->model_setting_extension->uninstall('module', 'promotion');
    }

    public function index() {
        $this->load->language('total/promotion');

        $this->document->setTitle($this->language->get('heading_title_page'));

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        $this->data['version'] = $this->config->get('promotion_version');

        $this->data['heading_title'] = $this->language->get('heading_title_page');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');

        $this->data['cancel'] = $this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['action'] = $this->url->link('total/promotion', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_total'),
            'href' => $this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title_page'),
            'href' => $this->url->link('total/promotion', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->load->model('setting/setting');
        $this->load->model('setting/store');


        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $stores = array(0);

            $results = $this->model_setting_store->getStores();
            foreach ($results as $store) {
                $stores[] = $store['store_id'];
            }

            foreach ($stores as $store_id) {
                $this->model_setting_setting->editSetting('promotion', array_merge($this->request->post, array(
                    'promotion_key' => $this->config->get('promotion_key'),
                    'promotion_version' => $this->config->get('promotion_version'),
                    'promotion_module' => $this->config->get('promotion_module')
                        )), $store_id);
            }

            if (version_compare(VERSION, '1.5.1') >= 0) {
                $this->session->data['success'] = $this->language->get('text_success');
            } else {
                $this->session->data['success'] = $this->language->get('text_success_old');
            }

            $this->redirect($this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');

        $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
        if (isset($this->request->post['promotion_sort_order'])) {
            $this->data['promotion_sort_order'] = $this->request->post['promotion_sort_order'];
        } else {
            $this->data['promotion_sort_order'] = $this->config->get('promotion_sort_order');
        }

        $this->data['entry_status'] = $this->language->get('entry_status');

        if (isset($this->request->post['promotion_status'])) {
            $this->data['promotion_status'] = $this->request->post['promotion_status'];
        } else {
            $this->data['promotion_status'] = $this->config->get('promotion_status');
        }

        $this->template = 'total/promotion.tpl';
        $this->children = array(
            'common/header',
            'common/footer',
        );

        $this->response->setOutput($this->render());
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'total/promotion')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

}

?>