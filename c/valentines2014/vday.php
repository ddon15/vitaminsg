<?php 
include('inc-functions.php');

/*
$scripts = array('vday.js');
include('inc-header.php');
include('view-hearts.php');
include('inc-footer.php');
exit;
/* */
 if ($_POST['frmsubmitted'] == '1') {
	
	$formdata = array();
	$formdata['question'] = $_POST['question'];
	$formdata['frmname'] = $_POST['frmname'];
	$formdata['frmemail'] = $_POST['frmemail'];
	$formdata['frmmobile'] = $_POST['frmmobile'];

	//pre validation processing
	$formdata['question'] = trim($formdata['question']);
	$formdata['frmname'] = trim($formdata['frmname']);
	$formdata['frmemail'] = trim($formdata['frmemail']);
	$formdata['frmmobile'] = trim($formdata['frmmobile']);
	
	//validation
	$errors = array();
	if ($formdata['question'] == "-") {
		$errors[] = "Please select a health topic.";
	}
	if ($formdata['frmname'] == "") {
		$errors[] = "Please enter your name.";
	}
	if (!filter_var($formdata['frmemail'], FILTER_VALIDATE_EMAIL)) {
		$errors[] = "Please enter a valid email address.";
	}
	if ((substr($formdata['frmmobile'], 0, 1) != '8' && substr($formdata['frmmobile'], 0, 1) != '9')
		|| strlen($formdata['frmmobile']) != 8) {
		$errors[] = "Please enter a valid mobile number.";
	}
	
	if (sizeof($errors)) {

		include('inc-header.php');
		include('view-form.php');
		include('inc-footer.php');
		
	}
	else {
	
		$formdata['ticket'] = date('His') . substr(md5($formdata['frmmobile']), 0, 10);
		$formdata['prize'] = 0;
	
		$result = addEntry(
			$formdata['frmname'], 
			$formdata['frmemail'], 
			$formdata['frmmobile'], 
			$formdata['question'], 
			$formdata['ticket'], 
			$formdata['prize']
		);
		
		if ($result) {
			//entry added successfully
			$scripts = array('vday.js');
			include('inc-header.php');
			include('view-hearts.php');
			include('inc-footer.php');
		}
		else {
			//already have an entry
			$errors[] = "You cannot enter the draw more than once.";
			include('inc-header.php');
			include('view-form.php');
			include('inc-footer.php');
			
		}
	
		
		
	}
	
}
else {
	include('inc-header.php');
	include('view-form.php');
	include('inc-footer.php');
}

