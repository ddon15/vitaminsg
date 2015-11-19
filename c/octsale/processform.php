<?php

define('DB_NAME', 'vitamin1_campg');
define('DB_USER', 'vitamin1_campg');
define('DB_PASSWORD', 'du4N!VcuSV^l');
define('DB_HOST', 'localhost');
define('DB_TABLE', 'octsale');

function addEntry($ffname, $flname, $fmobile, $femail, $fdob) {

	$fdob = date('Y-m-d', strtotime($fdob));

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
	    	$stmt = $dbconn->prepare('INSERT INTO ' . DB_TABLE . ' (ffname, flname, fmobile, femail, fdob, dateadded) VALUES (?, ?, ?, ?, ?, ?)');
			$stmt->bind_param("ssssss", $ffname, $flname, $fmobile, $femail, $fdob, date('Y-m-d h:i:s'));
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





if ($_POST['frm_submitted'] == '1') {
	
	$formdata = array();
	$formdata['ffname'] = $_POST['firstname'];
	$formdata['flname'] = $_POST['lastname'];
	$formdata['fmobile'] = $_POST['mobileno'];
	$formdata['femail'] = $_POST['emailaddr'];
	$formdata['fdob'] = $_POST['dob'];


	//pre validation processing
	$formdata['ffname'] = trim($formdata['ffname']);
	$formdata['flname'] = trim($formdata['flname']);
	$formdata['fmobile'] = trim($formdata['fmobile']);
	$formdata['femail'] = trim($formdata['femail']);
	$formdata['fdob'] = trim($formdata['fdob']);	
	
	//validation
	$errors = array();
	if ($formdata['ffname'] == "") {
		$errors[] = "Please enter your first name.";
	}
	if ($formdata['flname'] == "") {
		$errors[] = "Please enter your last name.";
	}
	if (!checkdate(substr($formdata['fdob'], 3, 2), substr($formdata['fdob'], 0, 2), substr($formdata['fdob'], 6, 4)) 
		|| strlen($formdata['fdob']) != 10 
		|| intval(substr($formdata['fdob'], 6, 4)) > 1996) {
		$errors[] = "Please enter a valid date of birth.  You need to be at least 18 years old to participate.";
	}
	if (!filter_var($formdata['femail'], FILTER_VALIDATE_EMAIL)) {
		$errors[] = "Please enter a valid email address.";
	}
	if ((substr($formdata['fmobile'], 0, 1) != '8' && substr($formdata['fmobile'], 0, 1) != '9')
		|| strlen($formdata['fmobile']) != 8) {
		$errors[] = "Please enter a valid mobile number.";
	}
	
	if (sizeof($errors)) {

		$errors = implode($errors, "\n");
		
		
	}
	else {
	
		
		$result = addEntry(
			$formdata['ffname'], 
			$formdata['flname'], 
			$formdata['fmobile'], 
			$formdata['femail'], 
			$formdata['fdob']
		);

		$errors = "Thank you for your submission. The special code to redeem your freebies will be sent to your email address.";
		$formdata['ffname'] = "";
		$formdata['flname'] = ""; 
		$formdata['fmobile'] = ""; 
		$formdata['femail'] = ""; 
		$formdata['fdob'] = "";
	}
	
}
else {

	$formdata = array();
	$formdata['ffname'] = "";
	$formdata['flname'] = ""; 
	$formdata['fmobile'] = ""; 
	$formdata['femail'] = ""; 
	$formdata['fdob'] = "";

	
}



?>