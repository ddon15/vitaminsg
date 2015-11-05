<?php 
class ControllerInformationCareers extends Controller {
	private $error = array(); 
	    
  	public function index() {
            
           
		$this->language->load('information/careers');

    	$this->document->setTitle($this->language->get('heading_title'));  
	 
		/* Breadcrumbs */
	 
      	$this->data['breadcrumbs'] = array();
      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),        	
        	'separator' => false
      	);
      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('information/careers'),
        	'separator' => $this->language->get('text_separator')
      	);	
			
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['content'] = $this->language->get('content');
		        

		/* Sidebar Content */
	
		$this->data['text_aside_title'] = $this->language->get('text_aside_title');
		$this->data['aside_links'] = array (
			array('link' => $this->url->link('information/partnership'), 'title' => 'Partnership Enquiry'),
			array('link' => $this->url->link('information/corporate_sales'), 'title' => 'Corporate Sales Enquiry'),
			array('link' => $this->url->link('information/suggest_product'), 'title' => 'Suggest a Product'),
			array('link' => $this->url->link('information/contact'), 'title' => 'Contact Us')
		);


		/* Configure the Template */

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/careers.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/information/careers.tpl';
		} else {
			$this->template = 'default/template/information/careers.tpl';
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
