<?php
class ControllerModuleSpecialPromotions extends Controller {

    public function install() {
if (isset($this->request->get['keepediting'])) {
					if (!empty($this->request->get['tabselected'])) {
						$this->session->data['tabselected'] = $this->request->get['tabselected'];
					} else {
						unset($this->session->data['tabselected']);
					}
					$this->redirect('http' . (isset($this->request->server['HTTPS']) && $this->request->server['HTTPS'] != 'off' ? 's' : '') . '://' . $this->request->server['HTTP_HOST'] . substr($this->request->server['REQUEST_URI'], 0, strpos($this->request->server['REQUEST_URI'], '&amp;keepediting=true')));
				}
        $this->redirect(HTTPS_SERVER . 'index.php?route=extension/total/install&token=' . $this->session->data['token'] . '&extension=special_promotions');
    }

    public function uninstall() {
if (isset($this->request->get['keepediting'])) {
					if (!empty($this->request->get['tabselected'])) {
						$this->session->data['tabselected'] = $this->request->get['tabselected'];
					} else {
						unset($this->session->data['tabselected']);
					}
					$this->redirect('http' . (isset($this->request->server['HTTPS']) && $this->request->server['HTTPS'] != 'off' ? 's' : '') . '://' . $this->request->server['HTTP_HOST'] . substr($this->request->server['REQUEST_URI'], 0, strpos($this->request->server['REQUEST_URI'], '&amp;keepediting=true')));
				}
        $this->redirect(HTTPS_SERVER . 'index.php?route=extension/total/uninstall&token=' . $this->session->data['token'] . '&extension=special_promotions');
    }

    public function index() {
if (isset($this->request->get['keepediting'])) {
					if (!empty($this->request->get['tabselected'])) {
						$this->session->data['tabselected'] = $this->request->get['tabselected'];
					} else {
						unset($this->session->data['tabselected']);
					}
					$this->redirect('http' . (isset($this->request->server['HTTPS']) && $this->request->server['HTTPS'] != 'off' ? 's' : '') . '://' . $this->request->server['HTTP_HOST'] . substr($this->request->server['REQUEST_URI'], 0, strpos($this->request->server['REQUEST_URI'], '&amp;keepediting=true')));
				}
        $this->redirect(HTTPS_SERVER . 'index.php?route=total/special_promotions&token=' . $this->session->data['token']);
    }

}