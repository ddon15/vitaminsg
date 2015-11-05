<?php  
class ControllerModuleOXYCustomContentManager extends Controller {
	protected function index($setting) {
		$this->language->load('module/oxy_custom_content_manager');
		
    	$this->data['heading_title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));
		
		$this->data['occm_title'] = $setting['occm_title'][$this->config->get('config_language_id')];
    	
		$this->data['message'] = html_entity_decode($setting['description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/oxy_custom_content_manager.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/oxy_custom_content_manager.tpl';
		} else {
			$this->template = 'default/template/module/oxy_custom_content_manager.tpl';
		}
		
		$this->render();
	}
}
?>