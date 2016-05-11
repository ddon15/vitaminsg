<?php
class ControllerModuleVitDollarPerks extends Controller
{
	private $error; 

	public function index()
	{
		$this->language->load('module/vit_dollar_perks');
		
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('setting/setting');
		
		$this->error = array();
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate())
		{
			$this->model_setting_setting->editSetting('vit_dollar_perks', $this->request->post);
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
		$this->data['text_rowhead_display'] = $this->language->get('text_rowhead_display');
		$this->data['text_rowhead_first_time'] = $this->language->get('text_rowhead_first_time');
		$this->data['text_rowhead_birthday'] = $this->language->get('text_rowhead_birthday');
		$this->data['text_rowhead_reviews'] = $this->language->get('text_rowhead_reviews');
		$this->data['text_rowhead_timed'] = $this->language->get('text_rowhead_timed');
		$this->data['text_rowhead_membership'] = $this->language->get('text_rowhead_membership');
		$this->data['text_rowhead_referral'] = $this->language->get('text_rowhead_referral');

		$this->data['entry_vit_display_redeem'] = $this->language->get('entry_vit_display_redeem');
		$this->data['entry_vit_display_earn'] = $this->language->get('entry_vit_display_earn');
		$this->data['entry_first_total_more_than'] = $this->language->get('entry_first_total_more_than');
		$this->data['entry_first_additional_rewards'] = $this->language->get('entry_first_additional_rewards');
		$this->data['entry_bd_rewards_multiple'] = $this->language->get('entry_bd_rewards_multiple');
		$this->data['entry_review_rewards'] = $this->language->get('entry_review_rewards');
		$this->data['entry_timed_from'] = $this->language->get('entry_timed_from');
		$this->data['entry_timed_to'] = $this->language->get('entry_timed_to');
		$this->data['entry_timed_label'] = $this->language->get('entry_timed_label');
		$this->data['entry_timed_total_more_than'] = $this->language->get('entry_timed_total_more_than');
		$this->data['entry_timed_additional_rewards'] = $this->language->get('entry_timed_additional_rewards');
		$this->data['entry_membership_reward_renew'] = $this->language->get('entry_membership_reward_renew');
		$this->data['entry_referral_enable'] = $this->language->get('entry_referral_enable');
		$this->data['entry_referral_reward'] = $this->language->get('entry_referral_reward');
		$this->data['entry_referral_prefix'] = $this->language->get('entry_referral_prefix');
		$this->data['entry_referral_coupon_amount'] = $this->language->get('entry_referral_coupon_amount');
		$this->data['entry_referral_coupon_min'] = $this->language->get('entry_referral_coupon_min');
		
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
			'href'      => $this->url->link('module/vit_dollar_perks', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->data['action'] = $this->url->link('module/vit_dollar_perks', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['vit_display_redeem'])) {
			$this->data['display_redeem'] = $this->request->post['vit_display_redeem'];
		} else {
			$this->data['display_redeem'] = $this->config->get('vit_display_redeem');
		}
		
		if (isset($this->request->post['vit_display_earn'])) {
			$this->data['display_earn'] = $this->request->post['vit_display_earn'];
		} else {
			$this->data['display_earn'] = $this->config->get('vit_display_earn');
		}
		
		if (isset($this->request->post['vit_first_total_more_than'])) {
			$this->data['first_total_more_than'] = $this->request->post['vit_first_total_more_than'];
		} else {
			$this->data['first_total_more_than'] = $this->config->get('vit_first_total_more_than');
		}
		
		if (isset($this->request->post['vit_first_additional_rewards'])) {
			$this->data['first_additional_rewards'] = $this->request->post['vit_first_additional_rewards'];
		} else {
			$this->data['first_additional_rewards'] = $this->config->get('vit_first_additional_rewards');
		}
		
		if (isset($this->request->post['vit_bd_rewards_multiple'])) {
			$this->data['bd_rewards_multiple'] = $this->request->post['vit_bd_rewards_multiple'];
		} else {
			$this->data['bd_rewards_multiple'] = $this->config->get('vit_bd_rewards_multiple');
		}
		
		if (isset($this->request->post['vit_review_rewards'])) {
			$this->data['review_rewards'] = $this->request->post['vit_review_rewards'];
		} else {
			$this->data['review_rewards'] = $this->config->get('vit_review_rewards');
		}
		
		if (isset($this->request->post['vit_timed_from'])) {
			$this->data['timed_from'] = $this->request->post['vit_timed_from'];
		} else {
			$this->data['timed_from'] = $this->config->get('vit_timed_from');
		}
		
		if (isset($this->request->post['vit_timed_to'])) {
			$this->data['timed_to'] = $this->request->post['vit_timed_to'];
		} else {
			$this->data['timed_to'] = $this->config->get('vit_timed_to');
		}
		
		if (isset($this->request->post['vit_timed_label'])) {
			$this->data['timed_label'] = $this->request->post['vit_timed_label'];
		} else {
			$this->data['timed_label'] = $this->config->get('vit_timed_label');
		}
		
		if (isset($this->request->post['vit_timed_total_more_than'])) {
			$this->data['timed_total_more_than'] = $this->request->post['vit_timed_total_more_than'];
		} else {
			$this->data['timed_total_more_than'] = $this->config->get('vit_timed_total_more_than');
		}
		
		if (isset($this->request->post['vit_timed_additional_rewards'])) {
			$this->data['timed_additional_rewards'] = $this->request->post['vit_timed_additional_rewards'];
		} else {
			$this->data['timed_additional_rewards'] = $this->config->get('vit_timed_additional_rewards');
		}
		
		if (isset($this->request->post['vit_membership_reward_renew'])) {
			$this->data['membership_reward_renew'] =
				($this->request->post['vit_membership_reward_renew'] == 'vit_membership_reward_renew');
		} else {
			$this->data['membership_reward_renew'] = $this->config->get('vit_membership_reward_renew');
		}
		
		if (isset($this->request->post['vit_referral_enable'])) {
			$this->data['referral_enable'] =
				($this->request->post['vit_referral_enable'] == 'vit_referral_enable');
		} else {
			$this->data['referral_enable'] = $this->config->get('vit_referral_enable');
		}
		
		if (isset($this->request->post['vit_referral_reward'])) {
			$this->data['referral_reward'] =
				($this->request->post['vit_referral_reward'] == 'vit_referral_reward');
		} else {
			$this->data['referral_reward'] = $this->config->get('vit_referral_reward');
		}
		
		if (isset($this->request->post['vit_referral_prefix'])) {
			$this->data['referral_prefix'] =
				($this->request->post['vit_referral_prefix'] == 'vit_referral_prefix');
		} else {
			$this->data['referral_prefix'] = $this->config->get('vit_referral_prefix');
		}
		
		if (isset($this->request->post['vit_referral_coupon_amount'])) {
			$this->data['referral_coupon_amount'] =
				($this->request->post['vit_referral_coupon_amount'] == 'vit_referral_coupon_amount');
		} else {
			$this->data['referral_coupon_amount'] = $this->config->get('vit_referral_coupon_amount');
		}
		
		if (isset($this->request->post['vit_referral_coupon_min'])) {
			$this->data['referral_coupon_min'] =
				($this->request->post['vit_referral_coupon_min'] == 'vit_referral_coupon_min');
		} else {
			$this->data['referral_coupon_min'] = $this->config->get('vit_referral_coupon_min');
		}

		$this->data['token'] = $this->session->data['token'];
		
		$this->template = 'module/vit_dollar_perks.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/vit_dollar_perks')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (empty($this->request->post['vit_first_total_more_than']) &&
			$this->request->post['vit_first_total_more_than']!= 0) {
			$this->error['first_total_more_than'] = $this->language->get('error_first_total_more_than');
		}
		
		if (empty($this->request->post['vit_first_additional_rewards']) &&
			$this->request->post['vit_first_additional_rewards'] != 0) {
			$this->error['first_additional_rewards'] = $this->language->get('error_first_additional_rewards');
		}
		
		if (empty($this->request->post['vit_bd_rewards_multiple']) &&
			$this->request->post['vit_bd_rewards_multiple'] != 0) {
			$this->error['bd_rewards_multiple'] = $this->language->get('error_bd_rewards_multiple');
		}
		
		if (empty($this->request->post['vit_review_rewards']) &&
			$this->request->post['vit_review_rewards'] != 0) {
			$this->error['review_rewards'] = $this->language->get('error_review_rewards');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}

?>