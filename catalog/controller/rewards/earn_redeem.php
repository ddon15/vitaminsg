<?php 
class ControllerRewardsEarnRedeem extends Controller
{
	private $error = array();
	
	public function index()
	{

		$this->language->load('rewards/earn_redeem');
		$this->document->setTitle($this->language->get('heading_title'));
		
		/* breadcrumbs */
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),        	
			'separator' => false
		);
		
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('bc_rewards_programme'),
			'href'      => $this->url->link('rewards/home', '', 'SSL'),      	
			'separator' => $this->language->get('text_separator')
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('bc_rewards_earn_redeem'),
			'href'      => $this->url->link('rewards/earn_redeem', '', 'SSL'),      	
			'separator' => $this->language->get('text_separator')
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('bc_rewards_tnc'),
			'href'      => $this->url->link('rewards/tnc', '', 'SSL'),      	
			'separator' => $this->language->get('text_separator')
		);
		

		/* Page Contents */
		$this->data['heading_title'] = $this->language->get('heading_title');		
		$this->data['main_text'] = $this->language->get('main_text');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/rewards/all.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/rewards/all.tpl';
		} else {
			$this->template = 'default/template/rewards/all.tpl';
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