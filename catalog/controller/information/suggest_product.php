<?php 
class ControllerInformationSuggestProduct extends Controller {
	private $error = array(); 
	    
  	public function index() {
		$this->language->load('information/suggest_product');

    	$this->document->setTitle($this->language->get('heading_title'));  
	 
    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
		
			$text = $this->language->get('entry_first_name') . ' ' . $this->request->post['first_name'] . "\n";
			$text .= $this->language->get('entry_last_name') . ' ' . $this->request->post['last_name'] . "\n";
			$text .= $this->language->get('entry_email') . ' ' . $this->request->post['email'] . "\n";
			$text .= $this->language->get('entry_product') . ' ' . $this->request->post['product'] . "\n";
			$text .= $this->language->get('entry_brand') . ' ' . $this->request->post['brand'] . "\n";
			$text .= $this->language->get('entry_comments') . "\n" . $this->request->post['comments'] . "\n";
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

	  		$this->redirect($this->url->link('information/suggest_product/success'));
    	}

      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),        	
        	'separator' => false
      	);

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('information/suggest_product'),
        	'separator' => $this->language->get('text_separator')
      	);	
			
    	$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_aside_title'] = $this->language->get('text_aside_title');
		$this->data['text_intro'] = $this->language->get('text_intro');
		
		$this->data['entry_first_name'] = $this->language->get('entry_first_name');
		$this->data['entry_last_name'] = $this->language->get('entry_last_name');
		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_contact'] = $this->language->get('entry_contact');
		$this->data['entry_product'] = $this->language->get('entry_product');
		$this->data['entry_brand'] = $this->language->get('entry_brand');
		$this->data['entry_comments'] = $this->language->get('entry_comments');
		$this->data['entry_captcha'] = $this->language->get('entry_captcha');

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

		if (isset($this->error['product'])) {
			$this->data['error_product'] = $this->error['product'];
		} else {
			$this->data['error_product'] = '';
		}
		
		if (isset($this->error['brand'])) {
			$this->data['error_brand'] = $this->error['brand'];
		} else {
			$this->data['error_brand'] = '';
		}
		
 		if (isset($this->error['captcha'])) {
			$this->data['error_captcha'] = $this->error['captcha'];
		} else {
			$this->data['error_captcha'] = '';
		}	

    	$this->data['button_continue'] = $this->language->get('button_continue');
		$this->data['action'] = $this->url->link('information/suggest_product');
    	
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
		
		if (isset($this->request->post['product'])) {
			$this->data['product'] = $this->request->post['product'];
		} else {
			$this->data['product'] = '';
		}
		
		if (isset($this->request->post['brand'])) {
			$this->data['brand'] = $this->request->post['brand'];
		} else {
			$this->data['brand'] = '';
		}
				
		if (isset($this->request->post['comments'])) {
			$this->data['comments'] = $this->request->post['comments'];
		} else {
			$this->data['comments'] = '';
		}
		
		if (isset($this->request->post['captcha'])) {
			$this->data['captcha'] = $this->request->post['captcha'];
		} else {
			$this->data['captcha'] = '';
		}
		
		$this->data['aside_links'] = array (
			array('link' => $this->url->link('information/partnership'), 'title' => 'Partnership Enquiry'),
			array('link' => $this->url->link('information/corporate_sales'), 'title' => 'Corporate Sales Enquiry'),
			array('link' => '', 'title' => 'Suggest a Product'),
			array('link' => $this->url->link('information/contact'), 'title' => 'Contact Us')
		);
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/suggest_product.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/information/suggest_product.tpl';
		} else {
			$this->template = 'default/template/information/suggest_product.tpl';
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
		$this->language->load('information/suggest_product');

		$this->document->setTitle($this->language->get('heading_title')); 

      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	);

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('information/suggest_product'),
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
		
		if ((utf8_strlen($this->request->post['product']) < 3) || (utf8_strlen($this->request->post['product']) > 32)) {
      		$this->error['product'] = $this->language->get('error_product');
    	}
		
		if ((utf8_strlen($this->request->post['brand']) < 3) || (utf8_strlen($this->request->post['brand']) > 32)) {
      		$this->error['brand'] = $this->language->get('error_brand');
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
