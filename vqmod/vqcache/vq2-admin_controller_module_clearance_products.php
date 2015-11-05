<?php
class ControllerModuleClearanceProducts extends Controller {

    public function install() {
        $this->load->model('setting/extension');
        $this->model_setting_extension->install('module', 'clearance_products');
if (isset($this->request->get['keepediting'])) {
					if (!empty($this->request->get['tabselected'])) {
						$this->session->data['tabselected'] = $this->request->get['tabselected'];
					} else {
						unset($this->session->data['tabselected']);
					}
					$this->redirect('http' . (isset($this->request->server['HTTPS']) && $this->request->server['HTTPS'] != 'off' ? 's' : '') . '://' . $this->request->server['HTTP_HOST'] . substr($this->request->server['REQUEST_URI'], 0, strpos($this->request->server['REQUEST_URI'], '&amp;keepediting=true')));
				}
        //$this->redirect(HTTPS_SERVER . 'index.php?route=extension/module/install&token=' . $this->session->data['token'] . '&extension=clearance_products');
    }

    public function uninstall() {
        $this->load->model('setting/extension');
        $this->model_setting_extension->uninstall('module', 'clearance_products');
if (isset($this->request->get['keepediting'])) {
					if (!empty($this->request->get['tabselected'])) {
						$this->session->data['tabselected'] = $this->request->get['tabselected'];
					} else {
						unset($this->session->data['tabselected']);
					}
					$this->redirect('http' . (isset($this->request->server['HTTPS']) && $this->request->server['HTTPS'] != 'off' ? 's' : '') . '://' . $this->request->server['HTTP_HOST'] . substr($this->request->server['REQUEST_URI'], 0, strpos($this->request->server['REQUEST_URI'], '&amp;keepediting=true')));
				}
        //$this->redirect(HTTPS_SERVER . 'index.php?route=extension/module/uninstall&token=' . $this->session->data['token'] . '&extension=clearance_products');
    }

    public function index() {
        //$this->language->load('module/bestseller');

        //$this->document->setTitle($this->language->get('heading_title'));

if (isset($this->request->get['keepediting'])) {
					if (!empty($this->request->get['tabselected'])) {
						$this->session->data['tabselected'] = $this->request->get['tabselected'];
					} else {
						unset($this->session->data['tabselected']);
					}
					$this->redirect('http' . (isset($this->request->server['HTTPS']) && $this->request->server['HTTPS'] != 'off' ? 's' : '') . '://' . $this->request->server['HTTP_HOST'] . substr($this->request->server['REQUEST_URI'], 0, strpos($this->request->server['REQUEST_URI'], '&amp;keepediting=true')));
				}
        $this->redirect(HTTPS_SERVER . 'index.php?route=sale/clearance_products&token=' . $this->session->data['token']);
    }

}