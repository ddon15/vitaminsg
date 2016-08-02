<?php 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	$emails = $_POST['emails'];

	foreach ($emails as $each) {
		sendMail($each);
	}

	echo json_encode(['success' => 1, 'message' => 'Successfully sent to emails.']);
}

function sendMail($to) {
	$senderName = $_POST['sender_name'];
	$subject = " Do you want protection from Free Radical Damage too?";
	$from =  $senderName . " " . "<" . $_POST['sender_email'] .">";
	
	$message = <<<ENDDOC

	<p>Hi friend, </p> <br /> <br /> 

	<p>
		I just got a free bottle of Abbott's Surbex Natopherol Â® Vegicaps from <a href="https://www.vitamin.sg">Vitamin.sg</a> and thought you might want one too. Takes less than 5 minutes to claim a completely free bottle!
	</p> <br />
	<p>
		Surbex Natopherol is a Natural Vitamin E supplement for adults that provides protection against free radical damage. Research has shown that high exposure to free radicals causes or accelerates nerve cell injury and leads to disease. Free Radical Damage may be caused by naturally-occurring radioactive materials found in<br/>
		<ul>
			<li>food and drinks we consume,</li>
			<li>air we breathe, </li>
			<li>and the environment. </li>
		</ul>
	</p>
	</br>
	<p>
		Common sources are fried foods, medicines, alcohol, tobacco smoke, pesticides, air pollutants, and ionizing radiation-causing electronics. 
	</p>
	<br />
	<p>
		Usually, this supplement sells at $37.20 but Vitamin.sg and Abbott have partnered to give it to you at no cost so just try lah! 
	</p>
	<br />
	<p>
		Get a bottle of Abbott’s Surbex Natopherol ® Vegicaps <a href="https://www.vitamin.sg/c/free-surbex">here.</a>
	</p> 
	</br> <br/>

	<p>Stay Happy and Healthy always, </p><br>
	<p>$senderName</p>

ENDDOC;
	
	$headers = "MIME-Version: 1.0" . "\r\n";
	$headers .= "Content-type: text/html; charset=iso-8859-1" . "\r\n";
	$headers .= "From: " . $from . "\r\n";	
	mail($to, $subject, $message, $headers);
}