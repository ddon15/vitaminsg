<?php

define("GR_API_KEY", "b89d10b5c935a3ac51f0d01317ab3c20");
define("CUSTOMER_LIST_ID", "V3Zut");
define("MEMBER_LIST_ID", "V3MNe");

require_once('GetResponseAPI.class.php');
$api = new GetResponse(GR_API_KEY);

$email = 'vitwong.vitamin+test456@gmail.com';
$contacts = (array) $api->getContactsByEmail($email);
if (is_array($contacts) && sizeof($contacts)) {
	foreach ($contacts as $contactID => $contact) {
		$api->deleteContact($contactID);
	}
}
/*
$name = "Vit Wong";
$email = "vitwong.vitamin@gmail.com";

$retval = $api->addContact(CUSTOMER_LIST_ID, $name, $email);
print_r($retval);
*/
