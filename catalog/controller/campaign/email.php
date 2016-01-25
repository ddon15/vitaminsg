<?php
/**
* @author Joan Villariaza
*/
class Email 
{
	protected $recipient;
	
	function __construct($recipient)
	{
		$this->recipient = $recipient;
	}

	public function send($subject, $message) {
		$header = "From:joan.villariaza@gmail.com\r\n";
		$header .= "Content-type: text/html";
		mail($this->recipient, $subject, $message, $header);
	}
}