<?php

define('DB_NAME', 'vitamin1_campg');
define('DB_USER', 'vitamin1_campg');
define('DB_PASSWORD', 'du4N!VcuSV^l');
define('DB_HOST', 'localhost');
define('DB_TABLE', 'revitalens');

function addEntry($iwanttotry, $fname, $fmobile, $femail, $fdob, $faddress) {

	$fdob = date('Y-m-d', strtotime($fdob));

	$retval = array();
	$dbconn = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	}
	else {

		//check if there is an existing entry
		$stmt = $dbconn->prepare('SELECT id FROM ' . DB_TABLE . ' WHERE fmobile=? OR femail=?');
		$stmt->bind_param("ss", $fmobile, $femail);
	    $stmt->execute();
	    $stmt->store_result();
	    
	    if ($stmt->num_rows) {
		    //already have entry
		    return false;
	    }
	    else {
	    
	    	$stmt = $dbconn->prepare('INSERT INTO ' . DB_TABLE . ' (iwanttotry, fname, fmobile, femail, fdob, faddress, dateadded) VALUES (?, ?, ?, ?, ?, ?, ?)');
			$stmt->bind_param("sssssss", $iwanttotry, $fname, $fmobile, $femail, $fdob, $faddress, date('Y-m-d h:i:s'));
			$stmt->execute();
			
			if ($stmt->affected_rows) {
				return true;
			}
			else {
				return false;
			}
	    }
	}	
}





 if ($_POST['formsubmit'] == '1') {
	
	$formdata = array();
	$formdata['iwanttotry'] = $_POST['iwanttotry'];
	$formdata['fname'] = $_POST['fname'];
	$formdata['fmobile'] = $_POST['fmobile'];
	$formdata['femail'] = $_POST['femail'];
	$formdata['fdob'] = $_POST['fdob'];
	$formdata['faddress'] = $_POST['faddress'];


	//pre validation processing
	$formdata['iwanttotry'] = trim($formdata['iwanttotry']);
	$formdata['fname'] = trim($formdata['fname']);
	$formdata['fmobile'] = trim($formdata['fmobile']);
	$formdata['femail'] = trim($formdata['femail']);
	$formdata['fdob'] = trim($formdata['fdob']);
	$formdata['faddress'] = trim($formdata['faddress']);
	
	
	//validation
	$errors = array();
	if ($formdata['iwanttotry'] == "") {
		$errors[] = "Please enter a reason why you want to try RevitaLens.";
	}
	if ($formdata['fname'] == "") {
		$errors[] = "Please enter your name.";
	}
	if ($formdata['fdob'] == "") {
		$errors[] = "Please enter your date of birth.";
	}
	if (!filter_var($formdata['femail'], FILTER_VALIDATE_EMAIL)) {
		$errors[] = "Please enter a valid email address.";
	}
	if ((substr($formdata['fmobile'], 0, 1) != '8' && substr($formdata['fmobile'], 0, 1) != '9')
		|| strlen($formdata['fmobile']) != 8) {
		$errors[] = "Please enter a valid mobile number.";
	}
	if ($formdata['faddress'] == "") {
		$errors[] = "Please enter your address.";
	}
	
	if (sizeof($errors)) {

		$errors = "<div class='error'><p>Please correct the following errors:</p><ul><li>" . implode($errors, "</li><li>") . "</li></ul></div>";
		
		
	}
	else {
	
		
		$result = addEntry(
			$formdata['iwanttotry'], 
			$formdata['fname'], 
			$formdata['fmobile'], 
			$formdata['femail'], 
			$formdata['fdob'], 
			$formdata['faddress']
		);

		if ($result) {
			include('success.php');
			exit;
			
		}
		else {
			$errors[] = "You can only submit one entry.";
			$errors = "<div class='error'><ul><li>" . implode($errors, "</li><li>") . "</li></ul></div>";
			
		}



		
	}
	
}

