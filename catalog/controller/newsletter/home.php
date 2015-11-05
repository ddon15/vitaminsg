<?php 
class ControllerNewsletterHome extends Controller
{
	private $error = array();
	
	public function index()
	{

		$this->language->load('newsletter/home');
		$this->document->setTitle($this->language->get('heading_title'));
		
		/* breadcrumbs */
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),        	
			'separator' => false
		);
		
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('bc_newsletter'),
			'href'      => $this->url->link('newsletter/home', '', 'SSL'),      	
			'separator' => $this->language->get('text_separator')
		);		

		/* Page Contents */
		$this->data['heading_title'] = $this->language->get('heading_title');		

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/newsletter/all.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/newsletter/all.tpl';
		} else {
			$this->template = 'default/template/newsletter/all.tpl';
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

	
}
?>