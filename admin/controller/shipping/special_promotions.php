<?php
class ControllerShippingSpecialPromotions extends Controller {

    public function install() {
        $this->redirect(HTTPS_SERVER . 'index.php?route=extension/total/install&token=' . $this->session->data['token'] . '&extension=special_promotions');
    }

    public function uninstall() {
        $this->redirect(HTTPS_SERVER . 'index.php?route=extension/total/uninstall&token=' . $this->session->data['token'] . '&extension=special_promotions');
    }

    public function index() {
        $this->redirect(HTTPS_SERVER . 'index.php?route=total/special_promotions&token=' . $this->session->data['token']);
    }
}