<?php
define('DB_NAME', 'vitamin1_campg');
define('DB_USER', 'vitamin1_campg');
define('DB_PASSWORD', 'du4N!VcuSV^l');
define('DB_HOST', 'localhost');
define('DB_TABLE', 'vidaylin_customers');
define('TITLE', 'Vidaylin Customer Entries - Send to only with a valid "Date Claimed"');


define('EDITABLE', 		true);
define('DELETEABLE', 	true);
define('PRIMARYKEY',	'id');

// =============================== 
// ! Don't touch below this line   
// =============================== 

function deleteEntry($id) {

	global $status_message; 
	
	$dbconn = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
	
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	}
	else {

		if ($id) {
		
			//prepare query
			$query = "DELETE FROM  " . DB_TABLE . " WHERE " . PRIMARYKEY . " = " . $id;
			
			//run query, and show status accordingly
			$dbconn->query($query);
			
			$affected_rows = $dbconn->affected_rows;
			
			if ($affected_rows) {
				
				$status_message = array("success", "Record deleted successfully.");
				
			}
			else {
			
				$status_message = array("error", "Record not deleted. ");
				
			}			
		}
		else {
			//error
			$status_message = array("error", "ID not specified.  Record not deleted.");
		}
	}	
}

function updateEntry($id, $keyvalue) {
	
	global $status_message; 
	
	$dbconn = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
	
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	}
	else {

		if ($id) {
		
			//unset the op and rec values
			$keyvalueupdate = array_merge($keyvalue);
			if (array_key_exists('op', $keyvalueupdate)) {
				unset($keyvalueupdate['op']);
			}
			if (array_key_exists('rec', $keyvalueupdate)) {
				unset($keyvalueupdate['rec']);
			}
		
			//prepare the query
			$keyvaluearr = array();
			foreach($keyvalueupdate as $key => $value) {
				$keyvaluearr[] .= $key . " = '" . mysqli_escape_string($dbconn, $value) . "'";
			}
			$query = "UPDATE " . DB_TABLE . " SET " . implode(",", $keyvaluearr) . " WHERE " . PRIMARYKEY . " = " . $id;
			
			//run query, and show status accordingly
			$dbconn->query($query);
			
			$affected_rows = $dbconn->affected_rows;
			
			if ($affected_rows) {
				
				$status_message = array("success", "Record updated successfully.");
				
			}
			else {
			
				$status_message = array("error", "Record not updated. ");
				
			}			
		}
		else {
			//error
			$status_message = array("error", "ID not specified.  Record not updated.");
		}
	}	


}

function getEntries($id = '') {

	$retval = array();
	$dbconn = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
	
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	}
	else {

		if ($id) {
			$query = "SELECT * FROM  " . DB_TABLE . " WHERE " . PRIMARYKEY . " = " . $id;
		}
		else {
			$query = "SELECT * FROM  " . DB_TABLE . " ORDER BY " . PRIMARYKEY;
		}

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




$status_message = array();
$display_op = "";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	
	//POST
	
	if ($_POST['op'] == "edit"):
		
		if ($_POST['rec']) {
			updateEntry($_POST['rec'], $_POST);
		}
		$display_op = 'showview';
		
	elseif ($_POST['op'] == 'del'): 

		if ($_POST['rec']) {
			deleteEntry($_POST['rec']);
		}
		$display_op = 'showview';
	
	else:
	
		header("location: " . $_SERVER['SCRIPT_NAME']);
	
	endif;
}
else {
	
	//GET

	if ($_GET['op'] == "edit"):
	
		$display_op = 'showedit';
	
	elseif ($_GET['op'] == 'del'): 
		
		$display_op = 'showdel';
		
	else:
	
		$display_op = 'showview';
	
	endif;
}


?>
<html>
	<head>
		<title><?php echo TITLE;?></title>
		<style type="text/css">
			html { font-family: Arial; font-size: 14px; }
			table { border-collapse: collapse; font-size: 14px; }
			h1 { font-size: 25px; }
			table td { border: 1px solid #ccc; padding: 3px 5px; text-align: left; vertical-align: top; }
			table th { border: 1px solid #ccc; padding: 3px 5px; background-color: #eee; text-align: left; vertical-align: top; }
			.success { color: #0c0; padding: 10px; border: 1px solid #0c0; margin-bottom: 10px; }
			.error { color: #c00; padding: 10px; border: 1px solid #c00; margin-bottom: 10px;}
		</style>
	</head>
	
	<body>
		<h1><?php echo TITLE; ?></h1>
		
		<?php //SHOW STATUS MESSAGE ?>
		<?php if (sizeof($status_message)): ?>
			<div class='<?php echo $status_message[0]; ?>'><?php echo $status_message[1]; ?></div>
		<?php endif; ?>



		<?php if ($display_op == "showedit"): ?>


			<?php $toedit = getEntries($_GET['rec']); ?>
			<?php if (sizeof($toedit)): ?>
				<form method="POST" action="<?php echo $_SERVER['SCRIPT_NAME']; ?>" id="my_form">
					<table>
						<?php foreach($toedit as $row): ?>
							<?php foreach ($row as $key => $value): ?>
								<tr>
									<th><?php echo $key; ?></th>
									<td>
										<?php if ($key == PRIMARYKEY): ?>
											<?php echo $value; ?>
											<input type="hidden" id="<?php echo $key; ?>" name="<?php echo $key; ?>" value="<?php echo $value; ?>" />
										<?php else: ?>
											<textarea style="width: 500px; height: 60px;" id="<?php echo $key; ?>" name="<?php echo $key; ?>"><?php echo htmlspecialchars($value); ?></textarea>
										<?php endif; ?>
									</td>
								</tr>
							<?php endforeach;  ?>
						<?php endforeach; ?>
					</table>
					<input id="op" type="hidden" name="op" value="edit"/>
					<input id="rec" type="hidden" name="rec" value="<?php echo $_GET['rec']; ?>"/>
					<p>
						<a href="#" onclick="javscript:document.getElementById('my_form').submit(); return false;">Update</a> &nbsp;
						<a href="<?php echo $_SERVER['SCRIPT_NAME']; ?>">Cancel</a>
					</p>
				</form>
			<?php else: ?>
				<p>Record not found</p>
				<p><a href="<?php echo $_SERVER['SCRIPT_NAME']; ?>">View All</a></p>			
			<?php endif; ?>


		<?php elseif ($display_op == "showdel"):  ?>


			<?php $toedit = getEntries($_GET['rec']); ?>
			<?php if (sizeof($toedit)): ?>
				<table>
					<?php foreach($toedit as $row): ?>
						<?php foreach ($row as $key => $value): ?>
							<tr>
								<th><?php echo $key; ?></th>
								<td><?php echo nl2br(stripslashes($value)); ?></td>
							</tr>
						<?php endforeach;  ?>
					<?php endforeach; ?>
				</table>
				<form method="POST" action="<?php echo $_SERVER['SCRIPT_NAME']; ?>" id="my_form">
					<input id="op" type="hidden" name="op" value="del"/>
					<input id="rec" type="hidden" name="rec" value="<?php echo $_GET['rec']; ?>"/>
					<p>
						Are you sure you want to delete the this record? &nbsp;
						<a href="#" onclick="javscript:document.getElementById('my_form').submit(); return false;">Yes</a> &nbsp;
						<a href="<?php echo $_SERVER['SCRIPT_NAME']; ?>">No</a>
					</p>
				</form>
			<?php else: ?>
				<p>Record not found</p>
			<?php endif; ?>


		<?php elseif ($display_op == "showview"):  ?>


			<?php $all = getEntries(); ?>
			<?php if (sizeof($all)): ?>
				<?php $headerprinted = false; ?>
				<table>
					<?php foreach($all as $row): ?>
						<?php if (!$headerprinted): ?>
							<?php $headerprinted = true; ?>
							<tr>
								<?php foreach ($row as $key => $value): ?>
									<th><?php echo $key; ?></th>
								<?php endforeach;  ?>
								<?php if (EDITABLE): ?>
									<th>&nbsp;</th>
								<?php endif; ?>
								<?php if (DELETEABLE): ?>
									<th>&nbsp;</th>
								<?php endif; ?>
							</tr>
						<?php endif; ?>
						<tr>
							<?php foreach ($row as $key => $value): ?>
								<td><?php echo nl2br(htmlspecialchars($value)); ?></td>
							<?php endforeach;  ?>
							<?php if (EDITABLE): ?>
								<td><a href="?op=edit&rec=<?php echo $row[PRIMARYKEY]; ?>">Edit</a></td>
							<?php endif; ?>
							<?php if (DELETEABLE): ?>
								<td><a href="?op=del&rec=<?php echo $row[PRIMARYKEY]; ?>">Delete</a></td>
							<?php endif; ?>
						</tr>
					<?php endforeach; ?>
				</table>
			<?php else: ?>
				<p>No records.</p>
			<?php endif; ?>


		<?php endif; ?>

	</body>
</html>
