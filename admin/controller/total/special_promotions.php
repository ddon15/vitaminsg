<?php
/**
 * [MY]
 */
class ControllerTotalSpecialPromotions extends Controller {

    private $error = array();

    public function install() {
        $this->load->model('sale/special_promotions');
        $this->model_sale_special_promotions->install();

        $this->load->model('setting/extension');

        $extensions = $this->model_setting_extension->getInstalled('module');

        if (!in_array('special_promotions', $extensions)) {
            $this->model_setting_extension->install('module', 'special_promotions');
        }

        $extensions = $this->model_setting_extension->getInstalled('shipping');

        if (!in_array('special_promotions', $extensions)) {
            $this->model_setting_extension->install('shipping', 'special_promotions');
        }

        $this->load->model('setting/setting');
        $this->load->model('setting/store');

        $stores = array(0);

        $results = $this->model_setting_store->getStores();
        foreach ($results as $store) {
            $stores[] = $store['store_id'];
        }

        foreach ($stores as $store_id) {
            $this->model_setting_setting->editSetting('special_promotions', array(
                'special_promotions_version' => '1.2.9',
                'special_promotions_key' => '9ldxb5m26pbf9244d5iaqbh5w0dzrmcs'
            ), $store_id);
        }
    }

    public function uninstall() {
        $this->load->model('sale/special_promotions');
        $this->model_sale_special_promotions->uninstall();

        $this->load->model('setting/extension');
        $this->model_setting_extension->uninstall('module', 'special_promotions');
    }

    public function index() {
        $this->load->language('total/special_promotions');

        $this->document->setTitle($this->language->get('heading_title_page'));

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        $this->data['version'] = $this->config->get('special_promotions_version');

        $this->data['heading_title'] = $this->language->get('heading_title_page');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');

        $this->data['cancel'] = $this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['action'] = $this->url->link('total/special_promotions', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_total'),
            'href'      => $this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title_page'),
            'href'      => $this->url->link('total/special_promotions', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->load->model('setting/setting');
        $this->load->model('setting/store');
        
        /*
        $this->init();

        if (file_exists(DIR_SYSTEM . 'sp_upgrade.php')) {
            include_once(DIR_SYSTEM . 'sp_upgrade.php');
        }*/

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $stores = array(0);

            $results = $this->model_setting_store->getStores();
            foreach ($results as $store) {
                $stores[] = $store['store_id'];
            }

            foreach ($stores as $store_id) {
                $this->model_setting_setting->editSetting('special_promotions', array_merge($this->request->post, array(
                    'special_promotions_key' => $this->config->get('special_promotions_key'),
                    'special_promotions_version' => $this->config->get('special_promotions_version'),
                    'special_promotions_module' => $this->config->get('special_promotions_module')
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
        $this->data['text_yes'] = $this->language->get('text_yes');
        $this->data['text_no'] = $this->language->get('text_no');
        $this->data['text_all_zones'] = $this->language->get('text_all_zones');
        $this->data['text_banners_options'] = $this->language->get('text_banners_options');
        $this->data['text_coupons'] = $this->language->get('text_coupons');
        $this->data['text_shipping'] = $this->language->get('text_shipping');

        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $this->data['entry_skip_special'] = $this->language->get('entry_skip_special');
        $this->data['entry_show_product_names'] = $this->language->get('entry_show_product_names');
        $this->data['entry_include_tax'] = $this->language->get('entry_include_tax');
        $this->data['entry_select_promotion'] = $this->language->get('entry_select_promotion');
        $this->data['entry_multiply_coupons'] = $this->language->get('entry_multiply_coupons');
        $this->data['entry_dynamic_banners'] = $this->language->get('entry_dynamic_banners');
        $this->data['entry_ci_coupons'] = $this->language->get('entry_ci_coupons');
        $this->data['entry_disable_oc_coupons'] = $this->language->get('entry_disable_oc_coupons');
        $this->data['entry_shipping_sort_order'] = $this->language->get('entry_shipping_sort_order');
        $this->data['entry_geo_zone'] = $this->language->get('entry_geo_zone');

        if (isset($this->request->post['special_promotions_status'])) {
            $this->data['special_promotions_status'] = $this->request->post['special_promotions_status'];
        } else {
            $this->data['special_promotions_status'] = $this->config->get('special_promotions_status');
        }

        if (isset($this->request->post['special_promotions_sort_order'])) {
            $this->data['special_promotions_sort_order'] = $this->request->post['special_promotions_sort_order'];
        } else {
            $this->data['special_promotions_sort_order'] = $this->config->get('special_promotions_sort_order');
        }

        if (isset($this->request->post['special_promotions_skip_special'])) {
            $this->data['special_promotions_skip_special'] = $this->request->post['special_promotions_skip_special'];
        } else {
            $this->data['special_promotions_skip_special'] = $this->config->get('special_promotions_skip_special');
        }

        if (isset($this->request->post['special_promotions_show_product_names'])) {
            $this->data['special_promotions_show_product_names'] = $this->request->post['special_promotions_show_product_names'];
        } else {
            $this->data['special_promotions_show_product_names'] = $this->config->get('special_promotions_show_product_names');
        }

        if (isset($this->request->post['special_promotions_include_tax'])) {
            $this->data['special_promotions_include_tax'] = $this->request->post['special_promotions_include_tax'];
        } else {
            $this->data['special_promotions_include_tax'] = $this->config->get('special_promotions_include_tax');
        }

        if (isset($this->request->post['special_promotions_select_promotion'])) {
            $this->data['special_promotions_select_promotion'] = $this->request->post['special_promotions_select_promotion'];
        } else {
            $this->data['special_promotions_select_promotion'] = $this->config->get('special_promotions_select_promotion');
        }

        if (isset($this->request->post['special_promotions_dynamic_banners'])) {
            $this->data['special_promotions_dynamic_banners'] = $this->request->post['special_promotions_dynamic_banners'];
        } else {
            $this->data['special_promotions_dynamic_banners'] = $this->config->get('special_promotions_dynamic_banners');
        }

        if (isset($this->request->post['special_promotions_multiply_coupons'])) {
            $this->data['special_promotions_multiply_coupons'] = $this->request->post['special_promotions_multiply_coupons'];
        } else {
            $this->data['special_promotions_multiply_coupons'] = $this->config->get('special_promotions_multiply_coupons');
        }

        if (isset($this->request->post['special_promotions_ci_coupons'])) {
            $this->data['special_promotions_ci_coupons'] = $this->request->post['special_promotions_ci_coupons'];
        } else {
            $this->data['special_promotions_ci_coupons'] = $this->config->get('special_promotions_ci_coupons');
        }

        if (isset($this->request->post['special_promotions_disable_oc_coupons'])) {
            $this->data['special_promotions_disable_oc_coupons'] = $this->request->post['special_promotions_disable_oc_coupons'];
        } else {
            $this->data['special_promotions_disable_oc_coupons'] = $this->config->get('special_promotions_disable_oc_coupons');
        }

        $this->load->model('localisation/geo_zone');

        $this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

        if (isset($this->request->post['special_promotions_shipping_sort_order'])) {
            $this->data['special_promotions_shipping_sort_order'] = $this->request->post['special_promotions_shipping_sort_order'];
        } else {
            $this->data['special_promotions_shipping_sort_order'] = $this->config->get('special_promotions_shipping_sort_order');
        }

        if (isset($this->request->post['special_promotions_shipping_geo_zone_id'])) {
            $this->data['special_promotions_shipping_geo_zone_id'] = $this->request->post['special_promotions_shipping_geo_zone_id'];
        } else {
            $this->data['special_promotions_shipping_geo_zone_id'] = $this->config->get('special_promotions_shipping_geo_zone_id');
        }

        $this->template = 'total/special_promotions.tpl';
        $this->children = array(
            'common/header',
            'common/footer',
        );

        $this->response->setOutput($this->render());
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'total/special_promotions')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

}