<?php  
class ControllerModuleSlideshow extends Controller {
	protected function index($setting) {
		static $module = 0;
		
		$this->load->model('design/banner');
		$this->load->model('catalog/manufacturer');
		$this->load->model('tool/image');
		
		$this->document->addScript('catalog/view/javascript/jquery/nivo-slider/jquery.nivo.slider.pack.js');
		
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/slideshow.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/slideshow.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/slideshow.css');
		}
		
		$this->data['width'] = $setting['width'];
		$this->data['height'] = $setting['height'];
		
		$this->data['banners'] = array();
		$this->data['brands_banner'] = array();
		$this->data['brands_top_banner'] = array();
		
		if (isset($setting['banner_id'])) {
			$results = $this->model_design_banner->getBanner($setting['banner_id']);
			$brandsBanner = $this->model_design_banner->getBrandsBanner($setting['banner_id']);

			if($brandsBanner) {
				foreach ($brandsBanner['brands_top'] as $each) {
					$this->data['brands_top_banner'][$each['name']] = array(
						'image' => $each['image']
					);
				}

				foreach ($brandsBanner['brands'] as $each) {
					$this->data['brands_banner'][$each['name']] = array(
						'image' => $each['image']
					);
				}
			}

			foreach ($results as $result) {
				if (file_exists(DIR_IMAGE . $result['image'])) {
					$this->data['banners'][$result['title']] = array(
						'title' => $result['title'],
						'link'  => $result['link'],
						'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
					);
				}
			}
		}
		ksort($this->data['banners']);
		
		$this->data['module'] = $module++;
						
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/slideshow.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/slideshow.tpl';
		} else {
			$this->template = 'default/template/module/slideshow.tpl';
		}
		
		$this->render();
	}
}
?>