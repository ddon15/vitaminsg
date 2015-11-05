<?php  
class ControllerCommonFooter extends Controller {
	protected function index() {
		$this->language->load('common/footer');
		
		$this->data['text_information'] = $this->language->get('text_information');
		$this->data['text_service'] = $this->language->get('text_service');
		$this->data['text_extra'] = $this->language->get('text_extra');
		$this->data['text_contact'] = $this->language->get('text_contact');
		$this->data['text_notices'] = $this->language->get('text_notices');
		$this->data['text_return'] = $this->language->get('text_return');
    	$this->data['text_sitemap'] = $this->language->get('text_sitemap');
		$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$this->data['text_voucher'] = $this->language->get('text_voucher');
		$this->data['text_affiliate'] = $this->language->get('text_affiliate');
		$this->data['text_special'] = $this->language->get('text_special');
		$this->data['text_account'] = $this->language->get('text_account');
		$this->data['text_order'] = $this->language->get('text_order');
		$this->data['text_wishlist'] = $this->language->get('text_wishlist');
		$this->data['text_newsletter'] = $this->language->get('text_newsletter');
		
		$this->data['oxy_fp_fb1_title'] = $this->config->get('oxy_fp_fb1_title' . $this->config->get('config_language_id'));
		$this->data['oxy_fp_fb1_subtitle'] = $this->config->get('oxy_fp_fb1_subtitle' . $this->config->get('config_language_id'));
		$this->data['oxy_fp_fb1_content'] = $this->config->get('oxy_fp_fb1_content' . $this->config->get('config_language_id'));
		$this->data['oxy_fp_fb2_title'] = $this->config->get('oxy_fp_fb2_title' . $this->config->get('config_language_id'));
		$this->data['oxy_fp_fb2_subtitle'] = $this->config->get('oxy_fp_fb2_subtitle' . $this->config->get('config_language_id'));
		$this->data['oxy_fp_fb2_content'] = $this->config->get('oxy_fp_fb2_content' . $this->config->get('config_language_id'));
		$this->data['oxy_fp_fb3_title'] = $this->config->get('oxy_fp_fb3_title' . $this->config->get('config_language_id'));
		$this->data['oxy_fp_fb3_subtitle'] = $this->config->get('oxy_fp_fb3_subtitle' . $this->config->get('config_language_id'));
		$this->data['oxy_fp_fb3_content'] = $this->config->get('oxy_fp_fb3_content' . $this->config->get('config_language_id'));
		$this->data['oxy_fp_fb4_title'] = $this->config->get('oxy_fp_fb4_title' . $this->config->get('config_language_id'));
		$this->data['oxy_fp_fb4_subtitle'] = $this->config->get('oxy_fp_fb4_subtitle' . $this->config->get('config_language_id'));
		$this->data['oxy_fp_fb4_content'] = $this->config->get('oxy_fp_fb4_content' . $this->config->get('config_language_id'));
		$this->data['oxy_product_fb1_title'] = $this->config->get('oxy_product_fb1_title' . $this->config->get('config_language_id'));
		$this->data['oxy_product_fb1_subtitle'] = $this->config->get('oxy_product_fb1_subtitle' . $this->config->get('config_language_id'));
	   	$this->data['oxy_product_fb1_content'] = $this->config->get('oxy_product_fb1_content' . $this->config->get('config_language_id'));
		$this->data['oxy_product_fb2_title'] = $this->config->get('oxy_product_fb2_title' . $this->config->get('config_language_id'));
		$this->data['oxy_product_fb2_subtitle'] = $this->config->get('oxy_product_fb2_subtitle' . $this->config->get('config_language_id'));
		$this->data['oxy_product_fb2_content'] = $this->config->get('oxy_product_fb2_content' . $this->config->get('config_language_id'));
		$this->data['oxy_product_fb3_title'] = $this->config->get('oxy_product_fb3_title' . $this->config->get('config_language_id'));
		$this->data['oxy_product_fb3_subtitle'] = $this->config->get('oxy_product_fb3_subtitle' . $this->config->get('config_language_id'));
		$this->data['oxy_product_fb3_content'] = $this->config->get('oxy_product_fb3_content' . $this->config->get('config_language_id'));
		
		$this->data['oxy_custom_1_title'] = $this->config->get('oxy_custom_1_title' . $this->config->get('config_language_id'));
		$this->data['oxy_custom_1_content'] = $this->config->get('oxy_custom_1_content' . $this->config->get('config_language_id'));
		$this->data['oxy_custom_2_title'] = $this->config->get('oxy_custom_2_title' . $this->config->get('config_language_id'));
		$this->data['oxy_custom_2_content'] = $this->config->get('oxy_custom_2_content' . $this->config->get('config_language_id'));
		$this->data['oxy_custom_3_content'] = $this->config->get('oxy_custom_3_content' . $this->config->get('config_language_id'));
		
		$this->data['oxy_follow_us_title'] = $this->config->get('oxy_follow_us_title' . $this->config->get('config_language_id'));
		
		$this->data['oxy_contacts_title'] = $this->config->get('oxy_contacts_title' . $this->config->get('config_language_id'));
		$this->data['oxy_contact_mphone1'] = $this->config->get('oxy_contact_mphone1' . $this->config->get('config_language_id'));
		$this->data['oxy_contact_mphone2'] = $this->config->get('oxy_contact_mphone2' . $this->config->get('config_language_id'));
		$this->data['oxy_contact_sphone1'] = $this->config->get('oxy_contact_sphone1' . $this->config->get('config_language_id'));
		$this->data['oxy_contact_sphone2'] = $this->config->get('oxy_contact_sphone2' . $this->config->get('config_language_id'));
		$this->data['oxy_contact_fax1'] = $this->config->get('oxy_contact_fax1' . $this->config->get('config_language_id'));
		$this->data['oxy_contact_fax2'] = $this->config->get('oxy_contact_fax2' . $this->config->get('config_language_id'));
		$this->data['oxy_contact_email1'] = $this->config->get('oxy_contact_email1' . $this->config->get('config_language_id'));
		$this->data['oxy_contact_email2'] = $this->config->get('oxy_contact_email2' . $this->config->get('config_language_id'));
		$this->data['oxy_contact_skype1'] = $this->config->get('oxy_contact_skype1' . $this->config->get('config_language_id'));
		$this->data['oxy_contact_skype2'] = $this->config->get('oxy_contact_skype2' . $this->config->get('config_language_id'));
		$this->data['oxy_contact_location1'] = $this->config->get('oxy_contact_location1' . $this->config->get('config_language_id'));
		$this->data['oxy_contact_location2'] = $this->config->get('oxy_contact_location2' . $this->config->get('config_language_id'));
		$this->data['oxy_contact_hours'] = $this->config->get('oxy_contact_hours' . $this->config->get('config_language_id'));
		
		$this->data['oxy_powered_content'] = $this->config->get('oxy_powered_content' . $this->config->get('config_language_id'));
		
		$this->load->model('catalog/information');
		
		$this->data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$this->data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
    	}

		$this->data['contact'] = $this->url->link('information/contact');
		$this->data['return'] = $this->url->link('account/return/insert', '', 'SSL');
    	$this->data['sitemap'] = $this->url->link('information/sitemap');
		$this->data['manufacturer'] = $this->url->link('product/manufacturer');
		$this->data['voucher'] = $this->url->link('account/voucher', '', 'SSL');
		$this->data['affiliate'] = $this->url->link('affiliate/account', '', 'SSL');
		$this->data['special'] = $this->url->link('product/special');
		$this->data['account'] = $this->url->link('account/account', '', 'SSL');
		$this->data['order'] = $this->url->link('account/order', '', 'SSL');
		$this->data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');		

		$this->data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));
		
		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');
	
			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];	
			} else {
				$ip = ''; 
			}
			
			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];	
			} else {
				$url = '';
			}
			
			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];	
			} else {
				$referer = '';
			}
						
			$this->model_tool_online->whosonline($ip, $this->customer->getId(), $url, $referer);
		}
		
		//[SB] Custom Vitamin.sg footer
		$this->data['text_faq'] = $this->language->get('text_faq');
		$this->data['text_suggest_product'] = $this->language->get('text_suggest_product');
		$this->data['text_track_order'] = $this->language->get('text_track_order');
		
		$this->data['text_healthy_insider'] = $this->language->get('text_healthy_insider');
		$this->data['text_health_articles'] = $this->language->get('text_health_articles');
		$this->data['text_membership'] = $this->language->get('text_membership');
		$this->data['text_rewards_program'] = $this->language->get('text_rewards_program');
		
		$this->data['text_corporate_enquiry'] = $this->language->get('text_corporate_enquiry');
		$this->data['text_partnership'] = $this->language->get('text_partnership');
		$this->data['text_affiliate_program'] = $this->language->get('text_affiliate_program');
		$this->data['text_corporate_sales'] = $this->language->get('text_corporate_sales');
		$this->data['text_careers'] = $this->language->get('text_careers');
		
		$this->data['text_paypal_footer'] = $this->language->get('text_paypal_footer');
		
		$this->data['link_faq'] = 'faq';
		$this->data['link_suggest_product'] = $this->url->link('information/suggest_product');
		$this->data['link_track_order'] = $this->url->link('account/order');
		$this->data['link_notices'] = 'notices';
		
		$this->data['link_health_articles'] = '/blog';
		$this->data['link_membership'] = $this->url->link('premium_member/register');
		$this->data['link_rewards'] = $this->url->link('rewards/home');
		
		$this->data['link_partnership'] = $this->url->link('information/partnership');
		$this->data['link_affiliate_program'] = '#';
		$this->data['link_corporate_sales'] = $this->url->link('information/corporate_sales');
		$this->data['link_careers'] = $this->url->link('information/careers');
		
		$this->data['img_paypal'] = 'image/data/custom/paypal_footer.png';
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/footer.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/footer.tpl';
		} else {
			$this->template = 'default/template/common/footer.tpl';
		}
		
		$this->render();
	}
}
?>