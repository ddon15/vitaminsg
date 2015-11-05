<?php
	if( in_array( $_SERVER['REMOTE_ADDR'], $host) ) {
			$conn = new mysqli('localhost', 'root', '', 'sundownnaturalsdb');
		} else {
			$conn = new mysqli('mysql51-005.wc1.ord1.stabletransit.com', '334660_Mark3d2F', 'Anth0Ny11', '334660_Mark3d2F');
		}
	
		if (mysqli_connect_errno()) {
			printf("Connect failed: %s\n", mysqli_connect_error());
			exit();
		}
		
	//fetch
	$sql = "SELECT * FROM informations";
	$results = $conn->query($sql);
	
	if($results->num_rows > 0) {
		//display
		echo "<table border=0 cellspacing=10>";
		echo "<tr><th>First Name</th><th>Last Name</th><th>Date of Birth</th><th>Gender</th><th>Address</th><th>Email</th><th>Mobile</th><th>Choice</th><th>Subscribe</th></tr>";
		while($row = $results->fetch_assoc()) {
?>
		<tr>
			<td><?php echo $row['firstname']; ?>
			</td>
			<td><?php echo $row['lastname']; ?>
			</td>
			<td><?php echo $row['dob']; ?>
			</td>
			<td><?php echo $row['gender']; ?>
			</td>
			<td><?php echo $row['address']; ?>
			</td>
			<td><?php echo $row['email']; ?>
			</td>
			<td><?php echo $row['mobile']; ?>
			</td>
			<td><?php echo $row['choice']; ?>
			</td>
			<td><?php echo $row['subscription']; ?>
			</td>
		</tr>
<?php
		}
		echo "</table>";
		
	} else {
		echo "<h3>Empty database</h3>";
	}
?>