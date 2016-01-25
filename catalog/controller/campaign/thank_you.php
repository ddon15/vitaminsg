<?php
require 'email.php';

class ControllerCampaignThankYou extends Controller {
	protected $paypal_email = 'paypal@sainhall.com';
	public function index() {
		$this->language->load('campaign/thank_you');
		$title = "Referral";

    	$this->document->setTitle($title);

    	if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
    		$request = $this->request->post;
    		
    		if ($request['street'] && $request['city'] && $request['state'] && $request['zip']) {
    			$query = 'INSERT INTO referral_shipping_addresses values("", "'.$request['street'].'", "'.$request['city'].'", "'.$request['state'].'", "Singapore", "'.$request['zip'].'", "'.$request['email'].'", "'.$request['birthday'].'", "'.$request['referrer'].'")';
				$this->db->query($query);
				// notify admin with the new referral
				if ($_GET['referrer']) {
					$email = new Email('ruth.penafiel@vitamin.sg');
					$referred = $request['email'];
					$email->send("Shipping Request", "<p>Good day!</p><p>$referred has filled in his/her shipping address.</p>");
				}

				$this->redirect_sucess_urls();
    		} else {
    			$this->redirect_failed_urls();
    		}
    	}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/campaign/thank_you.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/campaign/thank_you.tpl';
		} else {
			$this->template = 'default/template/campaign/thank_you.tpl';
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

	protected function redirect_sucess_urls() {
		if ($_GET['referrer']) {
			$this->redirect($this->url->link('campaign/thank_you', 'show=true&referrer=true'));
			//send email to the referrer
		} else {
			if ($_GET['cpn'] == 2 || $_GET['cpn'] == 3)
				$this->redirect('https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business='.$this->paypal_email.'&item_name=Sundown Naturals&amount=1%2e00&currency_code=USD&return=http://vitamin.sg');
			$this->redirect($this->url->link('campaign/thank_you', 'show=true'));
		}
	}

	protected function redirect_failed_urls() {
		if ($_GET['referrer']) {
			$this->redirect($this->url->link('campaign/thank_you', 'err=true&referrer=true'));
		} else
			$this->redirect($this->url->link('campaign/thank_you', 'err=true'));
	}

	protected function get_email_content($template_number) {
		$cpn = $_GET['cpn'];
		$curlSession = curl_init();
	    curl_setopt($curlSession, CURLOPT_URL, 'http://vit.local/catalog/view/theme/oxy/template/campaign/campaigns_emails/campaign_'.$cpn.'/email_'.$template_number.'.html');
	    curl_setopt($curlSession, CURLOPT_BINARYTRANSFER, true);
	    curl_setopt($curlSession, CURLOPT_RETURNTRANSFER, true);

	    $data = curl_exec($curlSession);
	    curl_close($curlSession);

	    return $data;
	}
}