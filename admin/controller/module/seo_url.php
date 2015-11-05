<?php
class ControllerModuleSeoUrl extends Controller
{
	private $error;
	
	public function index()
	{
		$this->language->load('module/seo_url');
		$this->load->model('module/seo_url');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->error = array();
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST'))
		{
			$this->model_module_seo_url->massCreateProduct();
			$this->model_module_seo_url->massCreateManufacturer();
		} else {
			$this->data['error'] = @$this->error;
		}
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_instructions'] = $this->language->get('text_instructions');
		
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
			'href'      => $this->url->link('module/seo_url', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);
		
		$this->data['action'] = $this->url->link('module/seo_url', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['token'] = $this->session->data['token'];
		
		$this->template = 'module/seo_url.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}
}
?>