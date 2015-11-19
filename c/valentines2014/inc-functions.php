<?php 

define('DB_NAME', 'vitamin1_vday2014');
define('DB_USER', 'vitamin1_vday201');
define('DB_PASSWORD', '.[S9[,9hV0H@');
define('DB_HOST', 'localhost');
define('DB_TABLE', 'vdayentries');

function addEntry($frmname, $frmemail, $frmmobile, $question, $ticket, $prize) {
	
	$retval = array();
	$dbconn = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	}
	else {

		//check if there is an existing entry
		$stmt = $dbconn->prepare('SELECT id FROM ' . DB_TABLE . ' WHERE frmmobile=? OR frmemail=?');
		$stmt->bind_param("ss", $frmmobile, $frmemail);
	    $stmt->execute();
	    $stmt->store_result();
	    
	    if ($stmt->num_rows) {
		    //already have entry
		    return false;
	    }
	    else {
			$stmt = $dbconn->prepare('INSERT INTO ' . DB_TABLE . ' (entrydate, frmname, frmemail, frmmobile, question, ticket, prize) VALUES (?,?,?,?,?,?,?)');
			$stmt->bind_param("ssssssi", date('Y-m-d'), $frmname, $frmemail, $frmmobile, $question, $ticket, $prize);
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


function getPrize($frmmobile, $ticket) {
		
	$retval = array();
	$dbconn = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	}
	else {

		//check if there is an existing entry
		
		$stmt = $dbconn->prepare('SELECT id, prize FROM ' . DB_TABLE . ' WHERE frmmobile=? AND ticket=?');
		$stmt->bind_param("ss", $frmmobile, $ticket);
	    $stmt->execute();
	    $stmt->store_result();
		$stmt->bind_result($entry_id, $entry_prize);
		$stmt->fetch();
	
	    //$entry_prize = 0;
	    if ($entry_prize == 0) {
		    //got entry
		    
		    //check if anyone has hit $200 prize today
			$stmt = $dbconn->prepare('SELECT id FROM ' . DB_TABLE . ' WHERE entrydate=? AND prize=1');
			$stmt->bind_param("s", date('Y-m-d'));
		    $stmt->execute();
		    $stmt->store_result();
		    $no200 = ($stmt->num_rows > 0);
		    
		    //check if there are more than 10 entries for NZ Extracts
			$stmt = $dbconn->prepare('SELECT id FROM ' . DB_TABLE . ' WHERE entrydate=? AND (prize=13 OR prize=14)');
			$stmt->bind_param("s", date('Y-m-d'));
		    $stmt->execute();
		    $stmt->store_result();
		    $noNZ = ($stmt->num_rows >= 10);
		    
 
		    $prize = 0;
		    if ($no200) {
		    	//already got $200 entry today
		    	if ($noNZ) {
			    	$prize = rand(2,12);
		    	}
		    	else {
			    	$prize = rand(2,14);
		    	}
		    	
		    }
		    else {
		    	//not yet got $200 entry today
		    	if ($noNZ) {
			    	$prize = rand(1,12);
		    	}
		    	else {
			    	$prize = rand(1,14);
		    	}
		    }
		    
		    /* edited on 20 Feb - remove $200 voucher and $20 voucher */
		    if ($prize == 1) { $prize = 2; }
		    if ($prize == 11) { $prize = 7; }
		    if ($prize == 12) { $prize = 9; }
		    

			$stmt = $dbconn->prepare('UPDATE ' . DB_TABLE . ' SET prize=? WHERE id=?');
			$stmt->bind_param("ii", $prize, $entry_id);
			$stmt->execute();
			
			if ($stmt->affected_rows) {
				return $prize;
			}
			else {
				return 0;
			}
	    }
	    else {
			//no such entry
			return 99;

	    }
	}		
}


function translatePrize($prize) {

	$prizetext = "";
	switch ($prize) {
		
		case 1:
			$prizetext = "You Are The One And Only:<br />$200 Vitamin.sg Cash Voucher";
			break;

		case 2: 
		case 3:
			$prizetext = "All We Want Is You:<br />$70 2-year Vitamin.sg Membership";
			break;

		case 4:
		case 5:
		case 6:
			$prizetext = "Love At First Sight:<br />$10 Vitamin.sg Cash Voucher";
			break;

		case 7:
		case 8:
			$prizetext = "<img src='http://www.vitamin.sg/valentines2014/images/astaxanthin.png' style='height:110px'/><br />My Fair Lady:<br />StaZen Astaxanthin + AMERCIAN HEALTH Ester-C (U.P. $65.50)";
			break;

		case 9:
		case 10:
			$prizetext = "<img src='http://www.vitamin.sg/valentines2014/images/spirulina.png' style='height:110px'/><br />You Are My Support Forever:<br />StaZen Spirulina + AMERICAN HEALTH Ester-C (U.P. $101)";
			break;

		case 11:
		case 12:
			$prizetext = "Forever Begins Now:<br />$20 Vitamin.sg Cash Voucher";
			break;

		case 13:
		case 14:
			$prizetext = "<img src='http://www.vitamin.sg/valentines2014/images/nzextracts.png' style='height:110px'/><br />Pure Love:<br />NZ Extracts Digestive Complex + Fruit Complex (U.P. $70)";
			break;
		
		case 99:
			$prizetext = "You can only get 1 prize for each entry!";
			break;
		
		
	}
	return $prizetext;
}



function getAllEntries() {

	$retval = array();
	$dbconn = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
	
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	}
	else {

		$query = "SELECT * FROM  " . DB_TABLE ." ORDER BY id";
		if ($result = $dbconn->query($query)) {

			//retrieve the fields		
			$fields = array();
			$finfos = $result->fetch_fields();
			foreach ($finfos as $finfo) {
				$fields[] = $finfo->name;
			}

			//retrieve the result		
		    while ($row = $result->fetch_assoc()) {
		    	$currow = array();
		    	foreach ($fields as $field) {
		    		$currow[$field] = $row[$field];
		    	}
		    	$retval[] = $currow;
		    }			
		
			$result->close();
		}
	}
	
	return $retval;
}

