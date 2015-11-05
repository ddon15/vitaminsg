<?php 
	
	if (date("Y-m-d") > '2015-04-19') {
		header("Location: http://www.vitamin.sg/c/offer-ended");
	}
	else {
		header("Location: http://www.vitamin.sg/index.php?route=premium_member/complimentary");		
	}
