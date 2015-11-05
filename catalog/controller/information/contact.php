<?php 
class ControllerInformationContact extends Controller {
	private $error = array(); 
	    
  	public function index() {
		$this->language->load('information/contact');

    	$this->document->setTitle($this->language->get('heading_title'));

    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$text = $this->language->get('entry_name') . ' ' . $this->request->post['name'] . "\n";
			$text .= $this->language->get('entry_email') . ' ' . $this->request->post['email'] . "\n";
			$text .= $this->language->get('entry_how') . ' ' . $this->request->post['how'] . "\n\n";
			$text .= $this->language->get('entry_enquiry') . "\n" . $this->request->post['enquiry'] . "\n";
			$text .= "\n--\n";
			$text .= html_entity_decode(sprintf($this->language->get('email_sent_from'), $this->url->link($this->request->get['route'])));
			
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->hostname = $this->config->get('config_smtp_host');
			$mail->username = $this->config->get('config_smtp_username');
			$mail->password = $this->config->get('config_smtp_password');
			$mail->port = $this->config->get('config_smtp_port');
			$mail->timeout = $this->config->get('config_smtp_timeout');				
			$mail->setTo($this->config->get('config_email'));
	  		$mail->setFrom($this->request->post['email']);
	  		$mail->setSender($this->request->post['name']);
	  		$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->config->get('config_name')), ENT_QUOTES, 'UTF-8'));
	  		$mail->setText(strip_tags(html_entity_decode($text, ENT_QUOTES, 'UTF-8')));
      		$mail->send();

	  		$this->redirect($this->url->link('information/contact/success'));
    	}

      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),        	
        	'separator' => false
      	);

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('information/contact'),
        	'separator' => $this->language->get('text_separator')
      	);	
			
    	$this->data['heading_title'] = $this->language->get('heading_title');

		//[SB] Added for aside box
		$this->data['text_aside_title'] = $this->language->get('text_aside_title');
		
    	$this->data['text_location'] = $this->language->get('text_location');
		$this->data['text_contact'] = $this->language->get('text_contact');
		$this->data['text_address'] = $this->language->get('text_address');
    	$this->data['text_telephone'] = $this->language->get('text_telephone');
    	$this->data['text_fax'] = $this->language->get('text_fax');

    	$this->data['entry_name'] = $this->language->get('entry_name');
    	$this->data['entry_email'] = $this->language->get('entry_email');
    	$this->data['entry_enquiry'] = $this->language->get('entry_enquiry');
		$this->data['entry_captcha'] = $this->language->get('entry_captcha');
                
		
		$this->data['oxy_contact_map_ll'] = $this->config->get('oxy_contact_map_ll');
		$this->data['oxy_contact_map_type'] = $this->config->get('oxy_contact_map_type');
		$this->data['oxy_contact_mphone1'] = $this->config->get('oxy_contact_mphone1' . $this->config->get('config_language_id'));
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
		$this->data['oxy_contact_custom_content'] = $this->config->get('oxy_contact_custom_content' . $this->config->get('config_language_id'));

		if (isset($this->error['name'])) {
    		$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = '';
		}
		
		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}		
		
		if (isset($this->error['enquiry'])) {
			$this->data['error_enquiry'] = $this->error['enquiry'];
		} else {
			$this->data['error_enquiry'] = '';
		}		
		
 		if (isset($this->error['captcha'])) {
			$this->data['error_captcha'] = $this->error['captcha'];
		} else {
			$this->data['error_captcha'] = '';
		}	

    	$this->data['button_continue'] = $this->language->get('button_continue');
    
		$this->data['action'] = $this->url->link('information/contact');
		$this->data['store'] = $this->config->get('config_name');
    	$this->data['address'] = nl2br($this->config->get('config_address'));
    	$this->data['telephone'] = $this->config->get('config_telephone');
    	$this->data['fax'] = $this->config->get('config_fax');
    	
		if (isset($this->request->post['name'])) {
			$this->data['name'] = $this->request->post['name'];
		} else {
			$this->data['name'] = $this->customer->getFirstName();
		}

		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} else {
			$this->data['email'] = $this->customer->getEmail();
		}
		
		if (isset($this->request->post['enquiry'])) {
			$this->data['enquiry'] = $this->request->post['enquiry'];
		} else {
			$this->data['enquiry'] = '';
		}
		
		if (isset($this->request->post['captcha'])) {
			$this->data['captcha'] = $this->request->post['captcha'];
		} else {
			$this->data['captcha'] = '';
		}

		//[SB] Added for aside
		$this->data['aside_links'] = array (
			array('link' => $this->url->link('information/partnership'), 'title' => 'Partnership Enquiry'),
			array('link' => $this->url->link('information/corporate_sales'), 'title' => 'Corporate Sales Enquiry'),
			array('link' => $this->url->link('information/suggest_product'), 'title' => 'Suggest a Product'),
			array('link' => '', 'title' => 'Contact Us')
		);
		
		//[MY] additional content
		//$this->data['text_partner_link'] = sprintf($this->language->get('text_partner_link'),$this->url->link('information/partnership'));
		//$this->data['text_corporate_link'] = sprintf($this->language->get('text_corporate_link'),$this->url->link('information/corporate_sales'));
		
		//[MY] Added how
		if (isset($this->request->post['how'])) {
			$this->data['how'] = $this->request->post['how'];
		} else {	
			$this->data['how'] = $this->language->get('text_select');
		}
		if (isset($this->error['how'])) {
    		$this->data['error_how'] = $this->error['how'];
		} else {
			$this->data['error_how'] = '';
		}
		
		$this->data['entry_how'] = $this->language->get('entry_how');
		$this->data['text_select'] = $this->language->get('text_select');
		
		$this->data['select_how'] = array(
			"Referral",
			"Newspaper",
			"Flyer",
			"Facebook",
			"Google",
			"Member",
			"Existing Customer",
			"Event"
		);
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/contact.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/information/contact.tpl';
		} else {
			$this->template = 'default/template/information/contact.tpl';
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

  	public function success() {
		$this->language->load('information/contact');

		$this->document->setTitle($this->language->get('heading_title')); 

      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	);

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('information/contact'),
        	'separator' => $this->language->get('text_separator')
      	);	
		
    	$this->data['heading_title'] = $this->language->get('heading_title');

    	$this->data['text_message'] = $this->language->get('text_message');

    	$this->data['button_continue'] = $this->language->get('button_continue');

    	$this->data['continue'] = $this->url->link('common/home');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/success.tpl';
		} else {
			$this->template = 'default/template/common/success.tpl';
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
	
  	protected function validate() {
    	if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
      		$this->error['name'] = $this->language->get('error_name');
    	}

    	if (!preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
      		$this->error['email'] = $this->language->get('error_email');
    	}

    	if ((utf8_strlen($this->request->post['enquiry']) < 10) || (utf8_strlen($this->request->post['enquiry']) > 3000)) {
      		$this->error['enquiry'] = $this->language->get('error_enquiry');
    	}
		
		if (utf8_strlen($this->request->post['how']) == $this->language->get('text_select')) {
      		$this->error['how'] = $this->language->get('error_how');
    	}

    	if (empty($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
      		$this->error['captcha'] = $this->language->get('error_captcha');
    	}
		
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}  	  
  	}

	public function captcha() {
		$this->load->library('captcha');
		
		$captcha = new Captcha();
		
		$this->session->data['captcha'] = $captcha->getCode();
		
		$captcha->showImage();
	}	
}
?>
