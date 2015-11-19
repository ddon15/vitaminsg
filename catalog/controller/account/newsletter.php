<?php
class ControllerAccountNewsletter extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/newsletter', '', 'SSL');

			$this->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->language->load('account/newsletter');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('account/customer'); //[SB] Moved out of ['REQUEST_METHOD'] == 'POST'
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {

			$this->model_account_customer->editNewsletter($this->request->post['newsletter']);

			// -- lw: GetResponseAPI 16 July 2015
			define("GR_API_KEY", "b89d10b5c935a3ac51f0d01317ab3c20");
			define("MEMBER_LIST_ID", "V3MNe");
			require_once('GetResponseAPI.class.php');
			$api = new GetResponse(GR_API_KEY);

			if($this->request->post['newsletter']==1) {
				$api->addContact(MEMBER_LIST_ID, $this->db->escape($this->customer->getFirstName()) . " " . $this->db->escape($this->customer->getLastName()), $this->customer->getEmail());
			}
			else {
				$contacts = (array) $api->getContactsByEmail($this->customer->getEmail());
				if (is_array($contacts) && sizeof($contacts)) {
					foreach ($contacts as $contactID => $contact) {
						$api->deleteContact($contactID);
					}
				}
			}

			$this->model_account_customer->editSms($this->request->post['sms']);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('account/account', '', 'SSL'));
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_newsletter'),
			'href'      => $this->url->link('account/newsletter', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
                $this->data['text_misc'] = $this->language->get('text_misc');

		$this->data['entry_newsletter'] = $this->language->get('entry_newsletter');
		$this->data['entry_sms'] = $this->language->get('entry_sms'); //[SB] Added

		$this->data['button_continue'] = $this->language->get('button_continue');
		$this->data['button_back'] = $this->language->get('button_back');

		$this->data['action'] = $this->url->link('account/newsletter', '', 'SSL');

		$this->data['newsletter'] = $this->customer->getNewsletter();
		//[SB] Added
		$this->data['sms'] = $this->model_account_customer->getSms();

		$this->data['back'] = $this->url->link('account/account', '', 'SSL');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/newsletter.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/newsletter.tpl';
		} else {
			$this->template = 'default/template/account/newsletter.tpl';
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