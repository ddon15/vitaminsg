<?php
define('DB_NAME', 'vitamin1_vday2014');
define('DB_USER', 'vitamin1_vday201');
define('DB_PASSWORD', '.[S9[,9hV0H@');
define('DB_HOST', 'localhost');
define('DB_TABLE', 'vdayentries');


define('TITLE', 'Vday Entries');


// =============================== 
// ! Don't touch below this line   
// =============================== 

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

$all = getAllEntries();
?>
<html>
	<head>
		<title><?php echo TITLE;?></title>
		<style type="text/css">
			h1 { font-size: 20px; font-family: Arial; }
			table { border-collapse: collapse; font-size: 14px; font-family: Arial; }
			table td { border: 1px solid #ccc; padding: 3px 5px; }
			table th { border: 1px solid #ccc; padding: 3px 5px; background-color: #eee; }
		</style>
	</head>
	<body>
		<h1><?php echo TITLE; ?></h1>
		<?php if (sizeof($all)): ?>
			<?php $headerprinted = false; ?>
			<table>
				<?php foreach($all as $row): ?>
					<?php if (!$headerprinted): ?>
						<?php $headerprinted = true; ?>
						<tr>
							<?php foreach ($row as $key => $value): ?>
								<th>
									<?php echo $key; ?>
								</th>
							<?php endforeach;  ?>
						</tr>
					<?php endif; ?>
					<tr>
						<?php foreach ($row as $key => $value): ?>
							<td>
								<?php echo $value; ?>
							</td>
						<?php endforeach;  ?>
					</tr>
				<?php endforeach; ?>
			</table>
		<?php else: ?>
			<p>No records.</p>
		<?php endif; ?>
	</body>
</html>
