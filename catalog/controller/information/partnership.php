<?php 
class ControllerInformationPartnership extends Controller {
	private $error = array(); 
	    
  	public function index() {
            
           
		$this->language->load('information/partnership');

    	$this->document->setTitle($this->language->get('heading_title'));  
	 
    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
                    
			$text = $this->language->get('entry_first_name') . ' ' . $this->request->post['first_name'] . "\n";
			$text .= $this->language->get('entry_last_name') . ' ' . $this->request->post['last_name'] . "\n";
			$text .= $this->language->get('entry_email') . ' ' . $this->request->post['email'] . "\n";
			$text .= $this->language->get('entry_contact') . ' ' . $this->request->post['contact'] . "\n";
			$text .= $this->language->get('entry_partnership_type') . ' ' . $this->request->post['partnership_type'] . "\n";
			$text .= $this->language->get('entry_company_name') . ' ' . $this->request->post['company_name'] . "\n";
			$text .= $this->language->get('entry_company_address') . ' ' . $this->request->post['company_address'] . "\n";
			$text .= $this->language->get('entry_city') . ' ' . $this->request->post['city'] . "\n";
			$text .= $this->language->get('entry_state') . ' ' . $this->request->post['state'] . "\n";
			$text .= $this->language->get('entry_postal') . ' ' . $this->request->post['postal'] . "\n";
			$text .= $this->language->get('entry_country') . ' ' . $this->request->post['country'] . "\n\n";
			$text .= $this->language->get('entry_enquiry') . "\n" . $this->request->post['enquiry'] . "\n";
			$text .= "\n--\n";
			$text .= html_entity_decode(sprintf($this->language->get('email_sent_from'), $this->url->link($this->request->get['route'])));
		
			$sender = ($this->request->post['first_name'] . ' ' . $this->request->post['last_name']);
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
	  		$mail->setSender($sender);
	  		$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->config->get('config_name') ), ENT_QUOTES, 'UTF-8'));
	  		$mail->setText(strip_tags(html_entity_decode($text, ENT_QUOTES, 'UTF-8')));
      		$mail->send();

	  		$this->redirect($this->url->link('information/partnership/success'));
    	}

      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),        	
        	'separator' => false
      	);

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('information/partnership'),
        	'separator' => $this->language->get('text_separator')
      	);	
			
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_aside_title'] = $this->language->get('text_aside_title');
		$this->data['text_heading_contact'] = $this->language->get('text_heading_contact');
		$this->data['text_heading_company'] = $this->language->get('text_heading_company');
		$this->data['text_heading_enquiry'] = $this->language->get('text_heading_enquiry');
		$this->data['text_intro'] = $this->language->get('text_intro');
		
		$this->data['text_select'] = $this->language->get('text_select');
                
        $this->data['entry_partnership_type'] = $this->language->get('entry_partnership_type');
        $this->data['entry_first_name'] = $this->language->get('entry_first_name');
		$this->data['entry_last_name'] = $this->language->get('entry_last_name');
		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_contact'] = $this->language->get('entry_contact');
		$this->data['entry_company_name'] = $this->language->get('entry_company_name');
		$this->data['entry_company_address'] = $this->language->get('entry_company_address');
		$this->data['entry_city'] = $this->language->get('entry_city');
		$this->data['entry_state'] = $this->language->get('entry_state');
		$this->data['entry_postal'] = $this->language->get('entry_postal');
		$this->data['entry_country'] = $this->language->get('entry_country');
                $this->data['entry_enquiry'] = $this->language->get('entry_enquiry');
		$this->data['entry_captcha'] = $this->language->get('entry_captcha');
                
		//[MY]
		$this->data['partnership_types'] = array(
			"Distributor",
			"Marketing",
			"Sponsorship"
			);
		//.[MY]

		if (isset($this->error['first_name'])) {
    		$this->data['error_first_name'] = $this->error['first_name'];
		} else {
			$this->data['error_first_name'] = '';
		}
		
		if (isset($this->error['last_name'])) {
    		$this->data['error_last_name'] = $this->error['last_name'];
		} else {
			$this->data['error_last_name'] = '';
		}
		
		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}

		if (isset($this->error['contact'])) {
			$this->data['error_contact'] = $this->error['contact'];
		} else {
			$this->data['error_contact'] = '';
		}
		
		if (isset($this->error['partnership_type'])) {
			$this->data['error_partnership_type'] = $this->error['partnership_type'];
		} else {
			$this->data['error_partnership_type'] = '';
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
    
		$this->data['action'] = $this->url->link('information/partnership');
		
		if (isset($this->request->post['first_name'])) {
			$this->data['first_name'] = $this->request->post['first_name'];
		} else {
			$this->data['first_name'] = $this->customer->getFirstName();
		}
		
		if (isset($this->request->post['last_name'])) {
			$this->data['last_name'] = $this->request->post['last_name'];
		} else {
			$this->data['last_name'] = $this->customer->getLastName();
		}

		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} else {
			$this->data['email'] = $this->customer->getEmail();
		}
		
		if (isset($this->request->post['contact'])) {
			$this->data['contact'] = $this->request->post['contact'];
		} else {
			$this->data['contact'] = '';
		}
		
		if (isset($this->request->post['partnership_type'])) {
			$this->data['partnership_type'] = $this->request->post['partnership_type'];
		} else {
			$this->data['partnership_type'] = $this->language->get('text_select');
		}
		
		if (isset($this->request->post['company_name'])) {
			$this->data['company_name'] = $this->request->post['company_name'];
		} else {
			$this->data['company_name'] = '';
		}
		
		if (isset($this->request->post['company_address'])) {
			$this->data['company_address'] = $this->request->post['company_address'];
		} else {
			$this->data['company_address'] = '';
		}
		
		if (isset($this->request->post['city'])) {
			$this->data['city'] = $this->request->post['city'];
		} else {
			$this->data['city'] = '';
		}
		
		if (isset($this->request->post['state'])) {
			$this->data['state'] = $this->request->post['state'];
		} else {
			$this->data['state'] = '';
		}
		
		if (isset($this->request->post['postal'])) {
			$this->data['postal'] = $this->request->post['postal'];
		} else {
			$this->data['postal'] = '';
		}
		
		if (isset($this->request->post['country'])) {
			$this->data['country'] = $this->request->post['country'];
		} else {
			$this->data['country'] = '';
		}
		/*
		if (isset($this->request->post['country_id'])) {
			$this->data['country_id'] = $this->request->post['country_id'];
		} else {	
			$this->data['country_id'] = $this->config->get('config_country_id');
		}
		*/
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
		
		//$this->load->model('localisation/country');
		//$this->data['countries'] = $this->model_localisation_country->getCountries();
		
		$this->data['aside_links'] = array (
			array('link' => '', 'title' => 'Partnership Enquiry'),
			array('link' => $this->url->link('information/corporate_sales'), 'title' => 'Corporate Sales Enquiry'),
			array('link' => $this->url->link('information/suggest_product'), 'title' => 'Suggest a Product'),
			array('link' => $this->url->link('information/contact'), 'title' => 'Contact Us')
		);

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/partnership.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/information/partnership.tpl';
		} else {
			$this->template = 'default/template/information/partnership.tpl';
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
		$this->language->load('information/partnership');

		$this->document->setTitle($this->language->get('heading_title')); 

      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	);

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('information/partnership'),
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
    	if ((utf8_strlen($this->request->post['first_name']) < 3) || (utf8_strlen($this->request->post['first_name']) > 32)) {
      		$this->error['first_name'] = $this->language->get('error_first_name');
    	}
		
		if ((utf8_strlen($this->request->post['last_name']) < 3) || (utf8_strlen($this->request->post['last_name']) > 32)) {
      		$this->error['last_name'] = $this->language->get('error_last_name');
    	}

    	if (!preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
      		$this->error['email'] = $this->language->get('error_email');
    	}
		
		if ((utf8_strlen($this->request->post['contact']) < 7) || (utf8_strlen($this->request->post['contact']) > 32)) {
      		$this->error['contact'] = $this->language->get('error_contact');
    	}
		
		if (utf8_strlen($this->request->post['partnership_type']) == $this->language->get('text_select')) {
      		$this->error['partnership_type'] = $this->language->get('error_partnership_type');
    	}

    	if ((utf8_strlen($this->request->post['enquiry']) < 10) || (utf8_strlen($this->request->post['enquiry']) > 3000)) {
      		$this->error['enquiry'] = $this->language->get('error_enquiry');
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
