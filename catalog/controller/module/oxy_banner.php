<?php  
class ControllerModuleOXYBanner extends Controller {
	protected function index($setting) {
		static $module = 0;
		
		$this->load->model('design/banner');
		$this->load->model('tool/image');
				
		$this->data['banners'] = array();
		
		$results = $this->model_design_banner->getBanner($setting['banner_id']);
		
		$this->data['pr_id'] = $setting['pr_id'];
		  
		foreach ($results as $result) {
			if (file_exists(DIR_IMAGE . $result['image'])) {
				$this->data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
				);
			}
		}
                //[MY] number of banners and cols == num of banners uploaded in system.
                $this->data['pr_id'] = 'pr' . count($this->data['banners']);
		
		$this->data['module'] = $module++;
				
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/oxy_banner.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/oxy_banner.tpl';
		} else {
			$this->template = 'default/template/module/oxy_banner.tpl';
		}
		
		$this->render();
	}
}
?>