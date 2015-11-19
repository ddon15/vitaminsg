<?php
class ControllerModuleClearanceProducts extends Controller {

    public function install() {
        $this->load->model('setting/extension');
        $this->model_setting_extension->install('module', 'clearance_products');
        //$this->redirect(HTTPS_SERVER . 'index.php?route=extension/module/install&token=' . $this->session->data['token'] . '&extension=clearance_products');
    }

    public function uninstall() {
        $this->load->model('setting/extension');
        $this->model_setting_extension->uninstall('module', 'clearance_products');
        //$this->redirect(HTTPS_SERVER . 'index.php?route=extension/module/uninstall&token=' . $this->session->data['token'] . '&extension=clearance_products');
    }

    public function index() {
        //$this->language->load('module/bestseller');

        //$this->document->setTitle($this->language->get('heading_title'));

        $this->redirect(HTTPS_SERVER . 'index.php?route=sale/clearance_products&token=' . $this->session->data['token']);
    }

}