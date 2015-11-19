<?php
define('DB_NAME', 'vitamin1_campg');
define('DB_USER', 'vitamin1_campg');
define('DB_PASSWORD', 'du4N!VcuSV^l');
define('DB_HOST', 'localhost');
define('DB_TABLE', 'asta50');

function addEntry($ffname, $flname, $femail, $fmobile) {

	$retval = array();
	$dbconn = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	}
	else {

		//check if there is an existing entry
		
		/* 
		$stmt = $dbconn->prepare('SELECT id FROM ' . DB_TABLE . ' WHERE fmobile=? OR femail=?');
		$stmt->bind_param("ss", $fmobile, $femail);
	    $stmt->execute();
	    $stmt->store_result();
	    
	    if ($stmt->num_rows) {
		    //already have entry
		    return false;
	    }
	    else {
	     */
	    	$stmt = $dbconn->prepare('INSERT INTO ' . DB_TABLE . ' (fname, lname, mobile, email, dateadded) VALUES (?, ?, ?, ?, ?)');
			$stmt->bind_param("sssss", $ffname, $flname, $fmobile, $femail, date('Y-m-d h:i:s'));
			$stmt->execute();
			
			if ($stmt->affected_rows) {
				return true;
			}
			else {
				return false;
			}
		/*
	    }
	    */
	}	
}



$status = "";

if ($_POST['frm_submitted'] == "1") {


	$formdata['tnc'] = $_POST['tnc'];
	$formdata['fname'] = $_POST['fname'];
	$formdata['lname'] = $_POST['lname'];
	$formdata['email'] = $_POST['email'];
	$formdata['mobile'] = $_POST['mobile'];
	
	$errors = array();
	if (trim($formdata['tnc']) != "1") {
		$errors[] = "Please read and agree to the terms and conditions.";
	}
	if (trim($formdata['fname']) == "") {
		$errors[] = "Please enter your first name.";
	}
	if (trim($formdata['lname']) == "") {
		$errors[] = "Please enter your last name.";
	}
	if (!filter_var($formdata['email'], FILTER_VALIDATE_EMAIL)) {
		$errors[] = "Please enter a valid email address.";
	}
	if (trim($formdata['mobile']) == "") {
		$errors[] = "Please enter your mobile number";
	}
	
	
	if ($errors) {
		
		$status = "<div style='padding: 10px; margin-bottom: 15px; border: 2px solid #c00; color: #c00;'>" . implode("<br/>", $errors) . "</div>";
		
	} 
	else {
		
		$result = addEntry(
			$formdata['fname'], 
			$formdata['lname'], 
			$formdata['email'], 
			$formdata['mobile']
		);

		$status = "<div style='padding: 10px; margin-bottom: 15px; border: 2px solid #090; color: #090;'>Thank you for submitting your details.  We will be in touch shortly.</div>";

		$formdata['fname'] = "";
		$formdata['lname'] = "";
		$formdata['email'] = "";
		$formdata['mobile'] = "";
		
	}
	
	
}
else {
	$formdata['fname'] = "";
	$formdata['lname'] = "";
	$formdata['email'] = "";
	$formdata['mobile'] = "";
}
