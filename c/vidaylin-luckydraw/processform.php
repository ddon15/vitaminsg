<?php
    
function save_entry($entry) {
	$fileentry = json_encode($entry) . "\n";
	$fp = fopen("entries.txt", 'a');
	fputs($fp, $fileentry);
	fclose($fp);    
}

function send_admin_email($entry) {

	$to = "info@vitamin.sg";
	$to = "kianann@vitamin.sg";
	$subject = "Submission: Vidaylin Lucky Draw";
	$from = "Vitamin.sg <info@vitamin.sg>";
	$message = file_get_contents('admin_email.html');
	$message = str_replace("{ name }", $entry['name'], $message);
	$message = str_replace("{ email }", $entry['email'], $message);
	$message = str_replace("{ mobile }", $entry['mobile'], $message);
	$message = str_replace("{ address }", $entry['address'], $message);
	
	$headers = "MIME-Version: 1.0" . "\r\n";
	$headers .= "Content-type: text/html; charset=iso-8859-1" . "\r\n";
	$headers .= "From: " . $from . "\r\n";	
	mail($to, $subject, $message, $headers);

}

function send_autoresponder_email($entry) {

	$to = $entry['email'];
	$subject = "Submission Received: Vidaylin Lucky Draw";
	$from = "Vitamin.sg <info@vitamin.sg>";
	$message = file_get_contents('autoresponder_email.html');
	$message = str_replace("{ name }", $entry['name'], $message);
	$message = str_replace("{ email }", $entry['email'], $message);
	$message = str_replace("{ mobile }", $entry['mobile'], $message);
	$message = str_replace("{ address }", $entry['address'], $message);

	$headers = "MIME-Version: 1.0" . "\r\n";
	$headers .= "Content-type: text/html; charset=iso-8859-1" . "\r\n";
	$headers .= "From: " . $from . "\r\n";	
	mail($to, $subject, $message, $headers);
}    
    
$status = ""; 
if ($_POST['frm_submitted'] == "1") {
			
	//retrieve
	$entry = array();
	$entry['name'] = $_POST['name'];;
	$entry['email'] = $_POST['emailaddr'];;
	$entry['mobile'] = $_POST['mobile'];;
	$entry['address'] = $_POST['address'];;	
	
	//validate
	$errors = array();
	if ($entry['name'] == "") {
		$errors[] = "Please enter your name";
	}
	if (!filter_var($entry['email'], FILTER_VALIDATE_EMAIL)) {
		$errors[] = "Please enter a valid email address";
	}
	if ($entry['mobile'] == "") {
		$errors[] = "Please enter your mobile number";
	}
	if ($entry['address'] == "") {
		$errors[] = "Please enter your address";
	}
							
	//process
	if (sizeof($errors)) {		
		$status = "<div class='alert alert-danger'><ul><li>" . implode("</li><li>", $errors). "</li></ul></div>";
	}
	else {
        save_entry($entry);
        send_admin_email($entry);
        send_autoresponder_email($entry);
        header('location: thankyou.php');
        exit;
	}//sizeof errors
	
}//frm_submitted

