<?php 
	include('functions.php');

	$rhash = $_POST['custom']; 
	$txn_id = $_POST['txn_id'];
	
	file_put_contents("paypal_logs/" . date('Ymdhis') . "__" . $rhash . ".txt", print_r($_POST, true));	
	
	if ($_POST['mc_gross'] > 0) {
		$referral = get_referral_by_rhash($rhash);
		
		$referral['paypaltxnid'] = $txn_id;		
		add_referral_paypal($referral);
	}
