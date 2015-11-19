<?php 

$database = file_get_contents("database.txt");

if ($database == "") {
	$database = array();
}
else {
	$database = @unserialize($database);
	
	if (!is_array($database)) {
		$database = array();
	}
}



$database[] = array(
	'brand' => $_POST['prefer'],
	'why' => $_POST['whyprefer'],
	'name' => $_POST['name'],
	'email' => $_POST['email'],
	'mobile' => $_POST['mobile'],
	'referrer' => $_POST['referrer'],
);

$database = serialize($database);

file_put_contents("database.txt", $database);


?>