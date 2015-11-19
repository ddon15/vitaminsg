<?php 
	if ( date("Y-m-d") <= "2015-07-12") {
		header("location: http://www.vitamin.sg/index.php?route=premium_member/complimentary");		
	}
	else {
		header("location: http://www.vitamin.sg/c/offer-ended");
	}