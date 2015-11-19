<?php 
class ControllerSaleSummary extends Controller
{
	public function index()
	{
		if ($_SERVER['REQUEST_METHOD'] === 'POST') {
		
			$this->load->model('sale/summary');
			$summary = $this->model_sale_summary->getDailySummary();
			
			$subject = 'Vitamin.sg Daily Sales Summary';
			
			date_default_timezone_set('Singapore');
			$content = 'Date : ' . date('d M Y H:i:s') . "\n";
			$content .= 'Sales Total : ' . $this->currency->format($summary['total']) . "\n";
			$content .= 'Number of Transactions : ' . $summary['transactions'] . "\n";
			
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->hostname = $this->config->get('config_smtp_host');
			$mail->username = $this->config->get('config_smtp_username');
			$mail->password = $this->config->get('config_smtp_password');
			$mail->port = $this->config->get('config_smtp_port');
			$mail->timeout = $this->config->get('config_smtp_timeout');
			$mail->setTo(array('kianann@vitamin.sg','yeaptc@singnet.com.sg','sam.tan@vitamin.sg', 'tc.foong@vitamin.sg', 'simin.yeap@vitamin.sg','rachel.chua@vitamin.sg','support@hashmeta.com'));
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender($this->config->get('config_name'));
			$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
			$mail->setText(html_entity_decode($content, ENT_QUOTES, 'UTF-8'));
			$mail->send();
		}
	}
}