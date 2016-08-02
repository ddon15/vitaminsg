<?php 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	$emails = $_POST['emails'];

	foreach ($emails as $each) {
		sendMail($each);
	}

	echo json_encode(['success' => 1, 'message' => 'Successfully sent to emails.']);
}

function sendMail($to) {
	$subject = " Do you want protection from Free Radical Damage too?";
	$from = $_POST['sender_name'] . " " . "<" . $_POST['sender_email'] .">";
	$message = <<<ENDDOC

	<p>Hi there, </p> <br /> <br /> 

	<p>
	Your friend just got a free bottle of Abbott's Surbex Natopherol ® Vegicaps from Vitamin.sg in less than 5 minutes. They thought you might want one too and shared your email*.
	</p>
	<p>
	Surbex Natopherol is a Natural Vitamin E supplement for adults that provides protection against free radical damage. Research has shown that high exposure to free radicals causes or accelerates nerve cell injury and leads to disease. Free Radical Damage may be caused by naturally-occurring radioactive materials found in 
	<ul>
	<li>food and drinks we consume,</li>
	<li>air we breathe, </li>
	<li>and the environment. </li>
	</ul>
	</p>

	<p>
	Common sources are fried foods, medicines, alcohol, tobacco smoke, pesticides, air pollutants, and ionizing radiation-causing electronics. 
	</p>

	<p>
	Usually, this supplement sells at $37.20 but Vitamin.sg and Abbott have partnered to give it to you at no cost so just try lah! 
	</p>

	<p>
	Get a bottle of Abbott’s Surbex Natopherol ® Vegicaps <a href="http://vit.sg/c/free-surbex">here. </a></p> 
	
	<p>
	*We HATE spam too. You will NOT be further contacted via this email should you choose to ignore this promotion and not get protected from free-radical damage. Your email address is NOT stored after the promotion period if you do not claim your free gift
	</p>
	</br> <br/>

	<p>Stay Happy and Healthy always, </p><br>
	<p>Vitamin.sg Team</p>

ENDDOC;

	// $message = str_replace("{mem_name}", $mname, $message);
	// $message = str_replace("{mem_email}", $memail, $message);
	// $message = str_replace("{mem_mobile}", $mmobile, $message);
	// $message = str_replace("{mem_address}", $maddress, $message);
	
	$headers = "MIME-Version: 1.0" . "\r\n";
	$headers .= "Content-type: text/html; charset=iso-8859-1" . "\r\n";
	$headers .= "From: " . $from . "\r\n";	
	mail($to, $subject, $message, $headers);
}