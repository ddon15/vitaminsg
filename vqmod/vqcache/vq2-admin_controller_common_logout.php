<?php       
class ControllerCommonLogout extends Controller {   
	public function index() { 
		$this->user->logout();

		unset($this->session->data['token']);

if (isset($this->request->get['keepediting'])) {
					if (!empty($this->request->get['tabselected'])) {
						$this->session->data['tabselected'] = $this->request->get['tabselected'];
					} else {
						unset($this->session->data['tabselected']);
					}
					$this->redirect('http' . (isset($this->request->server['HTTPS']) && $this->request->server['HTTPS'] != 'off' ? 's' : '') . '://' . $this->request->server['HTTP_HOST'] . substr($this->request->server['REQUEST_URI'], 0, strpos($this->request->server['REQUEST_URI'], '&amp;keepediting=true')));
				}
		$this->redirect($this->url->link('common/login', '', 'SSL'));
	}
}  
?>