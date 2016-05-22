<?php
class ControllerModulePremiumMember extends Controller
{
	private $error; 

	public function index()
	{
		$this->language->load('module/premium_member');
		
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('setting/setting');
		
		$this->error = array();
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate())
		{
			$this->model_setting_setting->editSetting('premium_member', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		} else {
			$this->data['error'] = @$this->error;
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');

		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_display_name'] = $this->language->get('entry_display_name');
		$this->data['entry_price'] = $this->language->get('entry_price');
		$this->data['entry_length'] = $this->language->get('entry_length');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/premium_member', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->data['action'] = $this->url->link('module/premium_member', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['premium_member_name'])) {
			$this->data['premium_member_name'] = $this->request->post['premium_member_name'];
		} else {
			$this->data['premium_member_name'] = $this->config->get('premium_member_name');
		}
		
		if (isset($this->request->post['premium_member_display_name'])) {
			$this->data['premium_member_display_name'] = $this->request->post['premium_member_display_name'];
		} else {
			$this->data['premium_member_display_name'] = $this->config->get('premium_member_display_name');
		}
		
		if (isset($this->request->post['premium_member_price'])) {
			$this->data['premium_member_price'] = $this->request->post['premium_member_price'];
		} else {
			$this->data['premium_member_price'] = $this->config->get('premium_member_price');
		}
		
		if (isset($this->request->post['premium_member_length'])) {
			$this->data['premium_member_length'] = $this->request->post['premium_member_length'];
		} else {
			$this->data['premium_member_length'] = $this->config->get('premium_member_length');
		}

		$this->data['token'] = $this->session->data['token'];
		
		$this->template = 'module/premium_member.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/premium_member')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (empty($this->request->post['premium_member_display_name'])) {
			$this->error['premium_member_display_name'] = $this->language->get('error_display_name');
		}
		
		if (empty($this->request->post['premium_member_name'])) {
			$this->error['premium_member_name'] = $this->language->get('error_name');
		}
		
		if (empty($this->request->post['premium_member_price']) ||
			!is_numeric($this->request->post['premium_member_price'])) {
			$this->error['premium_member_price'] = $this->language->get('error_price');
		}
		
		if (empty($this->request->post['premium_member_length']) ||
			!is_numeric($this->request->post['premium_member_length'])) {
			$this->error['premium_member_length'] = $this->language->get('error_length');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	
	public function install()
	{
		$this->load->model('module/premium_member');
		$this->model_module_premium_member->install();
		//TODO: add 'Premium Member' customer group to database
	}
}

?>