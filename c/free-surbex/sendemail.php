<?php 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	$emails = $_POST['emails'];

	foreach ($emails as $each) {
		sendMail($each);
	}

	echo json_encode(['success' => 1, 'message' => 'Successfully sent to emails.']);
}

function sendMail($to) {
	$subject = " Do you want a free bottle of Vitamin E from Abbott & Vitamin.sg too?";
	$from = "Vitamin.sg <info@vitamin.sg>";
	$message = <<<ENDDOC

	Hi Friend, 

	I just got a free bottle of Abbott’s Surbex Natopherol ® Vegicaps from Vitamin.sg in less than 5 minutes. Thought you 
	might want one too. Surbex is a Natural Vitamin E supplement for adults and is sold at $37.20 usually. Now you can try 
	it at no cost so just try lah! Remember to help like/share their Facebook page as a form of thanks and don't forget to 
	thank me later too!

	Get a bottle of Abbott’s Surbex Natopherol ® Vegicaps <a href="http://www.vit.sg/c/free-surbex/">here</a>

ENDDOC;

	$message = str_replace("{mem_name}", $mname, $message);
	$message = str_replace("{mem_email}", $memail, $message);
	$message = str_replace("{mem_mobile}", $mmobile, $message);
	$message = str_replace("{mem_address}", $maddress, $message);
	
	$headers = "MIME-Version: 1.0" . "\r\n";
	$headers .= "Content-type: text/html; charset=iso-8859-1" . "\r\n";
	$headers .= "From: " . $from . "\r\n";	
	mail($to, $subject, $message, $headers);
}