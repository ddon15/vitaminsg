<?php
	//insert
	$response = array();
	if(isset($_POST)) {
		$host = array( '127.0.0.1', '::1' );
		if( in_array( $_SERVER['REMOTE_ADDR'], $host) ) {
			$conn = new mysqli('localhost', 'root', '', 'sundownnaturalsdb');
		} else {
			$conn = new mysqli('mysql51-005.wc1.ord1.stabletransit.com', '334660_Mark3d2F', 'Anth0Ny11', '334660_Mark3d2F');
		}
	
		/*
		if (mysqli_connect_errno()) {
			printf("Connect failed: %s\n", mysqli_connect_error());
			exit();
		}*/
		
		
		$first = $conn->real_escape_string($_POST['first']);
		$last = $conn->real_escape_string($_POST['last']);
		$dob = $conn->real_escape_string($_POST['dob']);
		$gender = $conn->real_escape_string($_POST['gender']);
		$address = $conn->real_escape_string($_POST['address']);
		$email = $conn->real_escape_string($_POST['email']);
		$mobile = $conn->real_escape_string($_POST['mobile']);
		$choice = $conn->real_escape_string($_POST['choice']);
		$subscription = $conn->real_escape_string($_POST['subscription']);
		
		
		$sql = "INSERT INTO informations (firstname, lastname, dob, gender, address, email, mobile, choice, subscription) VALUES ('$first','$last', '$dob', '$gender', '$address', '$email', '$mobile', '$choice', '$subscription')";
		
		$add = $conn->query($sql);
		
		if($add) {
			$response['status'] = 'success';
		} else {
			$response['status'] = 'fail';
			$response['details'] = 'Error: Unable to add.';
		}
	} else {
		$response['status'] = 'fail';
		$response['details'] = 'Empty POST';
	}
	
	echo json_encode($response);
	exit;
?>