<?php 
class ControllerVitNewsletterSubscribe extends Controller
{
	private $error = array();
	
	public function index()
	{
		$this->language->load('vit_newsletter/subscribe');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->data['action'] = $this->url->link('vit_newsletter/subscribe', '', 'SSL');
	
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate())
		{
			$this->load->model('vit_newsletter/db');
			
			// Add unapproved account of customer group "Premium Member"
			if($this->model_vit_newsletter_db->addSubscription($this->request->post))
			{
				$this->redirect($this->url->link('vit_newsletter/success', '', 'SSL'));
			}
			else
			{
				$this->error['warning'] = $this->language->get('error_already_subscribed');
			}
		}
		
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),        	
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_subscribe'),
			'href'      => $this->url->link('vit_newsletter/subscribe', '', 'SSL'),      	
			'separator' => $this->language->get('text_separator')
		);
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_name'] = $this->language->get('text_name');
		$this->data['text_email'] = $this->language->get('text_email');
		$this->data['text_submit'] = $this->language->get('text_submit');
		$this->data['text_consent'] = $this->language->get('text_consent');
		
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if (isset($this->error['subscribe_name'])) {
			$this->data['error_subscribe_name'] = $this->error['subscribe_name'];
		} else {
			$this->data['error_subscribe_name'] = '';
		}	

		if (isset($this->error['subscribe_email'])) {
			$this->data['error_subscribe_email'] = $this->error['subscribe_email'];
		} else {
			$this->data['error_subscribe_email'] = '';
		}
		
		if (isset($this->request->post['subscribe-name'])) {
			$this->data['subscribe_name'] = $this->request->post['subscribe-name'];
		} else {
			$this->data['subscribe_name'] = '';
		}

		if (isset($this->request->post['subscribe-email'])) {
			$this->data['subscribe_email'] = $this->request->post['subscribe-email'];
		} else {
			$this->data['subscribe_email'] = '';
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . 
			'/template/vit_newsletter/subscribe.tpl')) {
			$this->template = $this->config->get('config_template') . 
				'/template/vit_newsletter/subscribe.tpl';
		} else {
			$this->template = 'default/template/vit_newsletter/subscribe.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'	
		);
		
		$this->response->setOutput($this->render());
	}
	
	private function validate()
	{
		if(empty($this->request->post['subscribe-name'])){
			$this->error['subscribe_name'] = $this->language->get('error_subscribe_name_empty');
		}else if ((utf8_strlen($this->request->post['subscribe-name']) < 1) || (utf8_strlen($this->request->post['subscribe-name']) > 32)) {
			$this->error['subscribe_name'] = $this->language->get('error_subscribe_name');
		}

		if(empty($this->request->post['subscribe-email'])){
			$this->error['subscribe_email'] = $this->language->get('error_subscribe_email_empty');
		}else if ((utf8_strlen($this->request->post['subscribe-email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['subscribe-email'])) {
			$this->error['subscribe_email'] = $this->language->get('error_subscribe_email');
		}

		if (!isset($this->request->post['subscribe-consent'])) {
			$this->error['warning'] = $this->language->get('error_subscribe_agree');
		}
		
		if (!$this->error) {
			return true;
		} else {
			if(!isset($this->error['warning'])) {
				$this->error['warning'] = $this->language->get('error_warning');
			}
			return false;
		}
	}
}
?>