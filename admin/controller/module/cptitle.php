<?php
class ControllerModuleCptitle extends Controller {
	
	private $error = array(); 
                public function percent_complete($num1, $num2)
                {
                return $percent = number_format(($num1/$num2)*100, 2, '.', '');
                }
	
	public function index() {   
		$this->load->language('module/cptitle');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		
	
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('cptitle', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$text_strings = array(
				'heading_title',
				'button_save',
				'button_cancel',
				'text_percent',
				'text_out',
				'text_have_custom'
		);
		
		foreach ($text_strings as $text) {
			$this->data[$text] = $this->language->get($text);
		}	

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
			'href'      => $this->url->link('module/cptitle', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/cptitle', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->template = 'module/cptitle.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
		
		$this->load->model('module/cptitle');
		
		$this->data['cats'] = $this->model_module_cptitle->num_col_items('category_description', 'cptitle');
		//$this->data['infs'] = $this->model_module_cptitle->num_col_items('information_description', 'cptitle');
		$this->data['prods'] = $this->model_module_cptitle->num_col_items('product_description', 'cptitle');

		$total_cats = $this->model_module_cptitle->num_cols('category_description');
		//$total_infs = $this->model_module_cptitle->num_cols('information_description');
		$total_prods = $this->model_module_cptitle->num_cols('product_description');

		$this->data['total_cats'] = $total_cats;
        //$this->data['total_infs'] = $total_infs;
        $this->data['total_prods'] = $total_prods;
		
		$cats = $this->data['cats'];
        //$infs = $this->data['infs'];
        $prods = $this->data['prods'];

        $this->data['percent_cats'] = number_format(($cats/$total_cats)*100, 2, '.', '');
        //$this->data['percent_infs'] = number_format(($infs/$total_infs)*100, 2, '.', '');
        $this->data['percent_prods'] = number_format(($prods/$total_prods)*100, 2, '.', '');

		$this->response->setOutput($this->render());
	}
	
	public function install(){
		$this->load->model('module/cptitle');
		$this->model_module_cptitle->create_column_if_not_exists('category_description', 'cptitle', 'VARCHAR(255) NOT NULL');
		//$this->model_module_cptitle->create_column_if_not_exists('information_description', 'cptitle', 'VARCHAR(255) NOT NULL');
		$this->model_module_cptitle->create_column_if_not_exists('product_description', 'cptitle', 'VARCHAR(255) NOT NULL');
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/cptitle')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>