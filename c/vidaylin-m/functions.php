<?php 

function getPDODB() {
	$db_name = "vitamin1_campg";
	$db_user = "vitamin1_campg";
	$db_pass = "du4N!VcuSV^l";

	$db = new PDO('mysql:host=localhost;dbname=' . $db_name . ';charset=utf8', $db_user, $db_pass);	
	return $db;
}
	
function add_member_referral($member, $referrals) {
	
	$db = getPDODB();
	
	$stmt = $db->prepare(
		"INSERT INTO vidaylin_members(name, email, mobile, address, dateadded) " .
		"VALUES (:name, :email, :mobile, :address, :dateadded)");
	$params = array();
	$params[':name'] = $member['mname'];
	$params[':email'] = $member['memail'];
	$params[':mobile'] = $member['mmobile'];
	$params[':address'] = $member['maddress'];
	$params[':dateadded'] = date("Y-m-d H:i:s");
	$stmt->execute($params);
	$member_id = $db->lastInsertId();
	
	foreach ($referrals as $referral) {
		
		$stmt = $db->prepare(
			"INSERT INTO vidaylin_member_referrals (hash, name, email, dateadded, memberid) " .
			"VALUES (:hash, :name, :email, :dateadded, :memberid)");

		$referral['hash'] = sha1($referral['name'] . $referral['email'] . date("Y-m-d H:i:s"));

		$params = array();
		$params[':hash'] = $referral['hash'];
		$params[':name'] = $referral['name'];
		$params[':email'] = $referral['email'];
		$params[':dateadded'] = date("Y-m-d H:i:s");
		$params[':memberid'] = $member_id;
		
		$stmt->execute($params);
		
		//send referral an email
		$message = file_get_contents("referral_edm.html");
		$message = str_replace("{{HASH}}", $referral["hash"], $message);
		$message = str_replace("{{MEMBER_NAME}}", $member['mname'], $message);
		$to = $referral["email"];
		$edm_subject = "Help " . $member['mname'] . " get Abbott's Vidaylin Minibear Gummies for free";
		$from = "Vitamin.sg <info@vitamin.sg>";
		$headers = "MIME-Version: 1.0" . "\r\n";
		$headers .= "Content-type: text/html; charset=iso-8859-1" . "\r\n";
		$headers .= "From: " . $from . "\r\n";	
		mail($to, $edm_subject, $message, $headers);
		
	}//foreach	
}

function add_referral_claim($referral) {
	
	$db = getPDODB();
	
	$stmt = $db->prepare("UPDATE vidaylin_member_referrals SET name = :name, email = :email, mobile = :mobile, address = :address WHERE hash = :hash");
	$params = array();
	$params[':hash'] = $referral['hash'];
	$params[':name'] = $referral['name'];
	$params[':email'] = $referral['email'];
	$params[':mobile'] = $referral['mobile'];
	$params[':address'] = $referral['address'];
	$stmt->execute($params);
	
	return ($stmt->rowCount() > 0);
}

function add_referral_paypal($referral) {
	
	$db = getPDODB();
	
	//update the referral
	$stmt = $db->prepare("UPDATE vidaylin_member_referrals SET paypaltxnid = :paypaltxnid, dateclaimed = :dateclaimed WHERE hash = :hash");
	$params = array();
	$params[':hash'] = $referral['hash'];
	$params[':paypaltxnid'] = $referral['paypaltxnid'];
	$params[':dateclaimed'] = date("Y-m-d H:i:s");
	$stmt->execute($params);
	
	//update the member	
	$member = get_member_by_id($referral['memberid']);
	if (!$member['referrerhash']) {
		$stmt = $db->prepare("UPDATE vidaylin_members SET dateclaimed = :dateclaimed, referrerhash = :referrerhash WHERE id = :id");
		$params = array();
		$params[':id'] = $member['id'];
		$params[':referrerhash'] = $referral['hash'];
		$params[':dateclaimed'] = date("Y-m-d H:i:s");
		$stmt->execute($params);		
	}
}


function get_referral_by_rhash($hash) {
	
	$db = getPDODB();
	
	$stmt = $db->prepare("SELECT * FROM vidaylin_member_referrals WHERE hash = :hash");
	$params = array();
	$params[':hash'] = $hash;
	$stmt->execute($params);
	$row = $stmt->fetchAll(PDO::FETCH_ASSOC);
	
	if ($stmt->rowCount()) {
		return $row[0];	
	}
	else {
		return false;
	}
}

function get_member_by_id($id) {
	
	$db = getPDODB();
	
	$stmt = $db->prepare("SELECT * FROM vidaylin_members WHERE id = :id");
	$params = array();
	$params[':id'] = $id;
	$stmt->execute($params);
	$row = $stmt->fetchAll(PDO::FETCH_ASSOC);
	
	if ($stmt->rowCount()) {
		return $row[0];	
	}
	else {
		return false;
	}
}

function get_member_by_email($email) {
	
	$db = getPDODB();
	
	$stmt = $db->prepare("SELECT * FROM vidaylin_members WHERE email = :email");
	$params = array();
	$params[':email'] = $email;
	$stmt->execute($params);
	$row = $stmt->fetchAll(PDO::FETCH_ASSOC);
	
	if ($stmt->rowCount()) {
		return $row[0];	
	}
	else {
		return false;
	}
}

 
