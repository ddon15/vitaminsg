<?php
require 'email.php';

class ControllerCampaignReferral extends Controller {
	public function index() {
		$this->language->load('campaign/referral');
		$title = "Referral";

    	$this->document->setTitle($title);

    	if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
    		$request = $this->request->post;
    		$emails = [$request["email1"], $request["email2"], $request["email3"]];
    		$name_emails = [
    			$request["name1"] => $request["email1"], 
    			$request["name2"] => $request["email2"], 
    			$request["name3"] => $request["email3"]
    		];
    		$is_unique = $this->is_unique($emails);

    		if (!$is_unique) {
    			$this->redirect($this->url->link('campaign/referral', 'uniq=true&email='.$request["referrer"].'&cpn='.$_GET['cpn']));
    		} else if ($request["name1"] && $request["email1"] && $request["name2"] && $request["email2"] && $request["name3"] && $request["email3"]) {
    			$query = 'INSERT INTO refers values("", "'.$request["referrer"].'", "'.$request["campaign"].'", "'.$request["name1"].'", "'.$request["email1"].'", "'.$request["name2"].'", "'.$request["email2"].'", "'.$request["name3"].'", "'.$request["email3"].'")';
				$this->db->query($query);

				$query = 'SELECT firstname FROM oc_customer WHERE email = "'.$request["referrer"].'"';
				$referrer_name = $this->db->query($query);
				$referrer_name = ucfirst($referrer_name->row['firstname']);
				if (!$referrer_name)
					$referrer_name = $request["referrer"];
				
				// send to referrals
				// foreach ($name_emails as $name => $e) {
				// 	$email = new Email($e);
				// 	$name = ucfirst($name);

				// 	$subject = "Hey, $name! $referrer_name Sends You A Gift To Claim!";
				// 	$email->send($subject, $this->get_email_content(2, $e, $request["referrer"]));
				// }

				// send to referrer
				// $email = new Email($request["referrer"]);
				// $email->send('Share More FREE Bottles Of Sundown Naturals!', $this->get_email_content(3, $request["referrer"]));

				// notify admin with the new referral
				// $email = new Email('ruth.penafiel@vitamin.sg');
				// $email->send("Shipping Request", "<p>Good day!</p><p>$referrer_name ( ".$request["referrer"]." ) has successfully referred three persons. </p>");
				
				$this->redirect($this->url->link('campaign/thank_you', 'email='.$request["referrer"].'&referrer=true&success=true&cpn='.$_GET['cpn']));
    		} else {
    			$this->redirect($this->url->link('campaign/referral', 'show=true&email='.$request["referrer"].'&cpn='.$_GET['cpn']));
    		}
    	}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/campaign/referral.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/campaign/referral.tpl';
		} else {
			$this->template = 'default/template/campaign/referral.tpl';
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

	protected function is_unique($array) {
	   return count($array) === count(array_unique($array));
	}

	protected function get_email_content($template_number, $email, $referral) {
		$cpn = $_GET['cpn'];
		$curlSession = curl_init();
	    curl_setopt($curlSession, CURLOPT_URL, 'http://vit.sg/catalog/view/theme/oxy/template/campaign/campaigns_emails/campaign_'.$cpn.'/email_'.$template_number.'.html.php?email='.$email.'&ref='.$referral);
	    curl_setopt($curlSession, CURLOPT_BINARYTRANSFER, true);
	    curl_setopt($curlSession, CURLOPT_RETURNTRANSFER, true);

	    $data = curl_exec($curlSession);
	    curl_close($curlSession);

	    return $data;
	}
}