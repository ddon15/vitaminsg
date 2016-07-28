<?php 

/*
 * Helper Class
 * TODOS: Improve this and make it reusable
 * author: Diovanie <van_van152005>
**/

class Helper
{
	private static $pageAccessToken = 'vitsgfreesurbex@2016';

	public static function hasPageAccess($accessToken = null)
	{
		return static::$pageAccessToken === $accessToken;
	}

	public static function isFormSubmitted()
	{
		$requestMethod = $_SERVER['REQUEST_METHOD'];

		return ('POST' === $requestMethod && isset($_POST['frm_submitted']) && $_POST['frm_submitted']);
	}

	public static function validateFormData($data)
	{
		$errors = [];
		$mname = $data['mname'];
		$memail = $data['memail'];
		$mmobile = $data['mmobile'];
		$maddress = $data['maddress'];


		if ($mname == "") {
			$errors[] = "Please enter your name";
		}

		if (!filter_var($memail, FILTER_VALIDATE_EMAIL)) {
			$errors[] = "Please enter a valid email address";
		}

		if ($mmobile == "") {
			$errors[] = "Please enter your mobile number";
		}

		if ($maddress == "") {
			$errors[] = "Please enter your address";
		}		
		
		return $errors;
	}

	public static function sendEmail($data)
	{
		//admin email
		$to = "info@vitamin.sg";
		$subject = "Submission: Free Abbott Surbex Natopherol Vegicaps";
		$from = "Vitamin.sg <info@vitamin.sg>";

		$message = <<<ENDDOC
A submission has been made for a free bottle of Surbex Natopherol Vegicaps.<br /><br />
===========================================================<br /><br />
<strong>Name:</strong> {mem_name}<br/><br />
<strong>Email:</strong> {mem_email}<br/><br />
<strong>Mobile:</strong> {mem_mobile}<br/><br />
<strong>Address:</strong> {mem_address}<br/><br />
<strong>Claim Code:</strong> {mem_code}<br/><br />
===========================================================<br />
ENDDOC;
		$message = str_replace("{mem_name}", $data['mname'], $message);
		$message = str_replace("{mem_email}", $data['memail'], $message);
		$message = str_replace("{mem_mobile}", $data['mmobile'], $message);
		$message = str_replace("{mem_address}", $data['maddress'], $message);
		
		$headers = "MIME-Version: 1.0" . "\r\n";
		$headers .= "Content-type: text/html; charset=iso-8859-1" . "\r\n";
		$headers .= "From: " . $from . "\r\n";	
		
		mail($to, $subject, $message, $headers);

		$fileentry = json_encode($data) . "\n";
		$fp = fopen("entries.txt", 'a');
		fputs($fp, $fileentry);
		fclose($fp);

		//sender email
		$to = $data['memail'];
		$subject = "Submission Received: Free Abbott Surbex Natopherol Vegicaps";
		$from = "Vitamin.sg <info@vitamin.sg>";

		$message = <<<ENDDOC
Thank you for your submission for your free bottle of Abbott Surbex Natopherol Vegicaps.<br /><br />
You will be hearing from us shortly.<br /><br />
Here is a copy of the information you sent to us:<br /><br />
===========================================================<br /><br />
<strong>Name:</strong> {mem_name}<br/><br />
<strong>Email:</strong> {mem_email}<br/><br />
<strong>Mobile:</strong> {mem_mobile}<br/><br />
<strong>Address:</strong> {mem_address}<br /><br />
===========================================================<br /><br />
Vitamin.sg
ENDDOC;
		$message = str_replace("{mem_name}", $data['mname'], $message);
		$message = str_replace("{mem_email}", $data['memail'], $message);
		$message = str_replace("{mem_mobile}", $data['mmobile'], $message);
		$message = str_replace("{mem_address}", $data['maddress'], $message);
		
		$headers = "MIME-Version: 1.0" . "\r\n";
		$headers .= "Content-type: text/html; charset=iso-8859-1" . "\r\n";
		$headers .= "From: " . $from . "\r\n";	

		mail($to, $subject, $message, $headers);

	}

	public static function getLeads()
	{
		$fp = fopen("entries.txt", 'r');
		$data = [];

		while (!feof($fp)):
			$line = trim(fgets($fp));
			if ($line):
				$data[] = json_decode($line);
			endif;
		endwhile;

		fclose($fp);

		return $data;
	}
}