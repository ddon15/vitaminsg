<?php 

$database = file_get_contents("database.txt");

$database = @unserialize($database);

if (is_array($database)) {
	
	?>
	<table border="1">
		<tr>
			<td>Brand</td>
			<td>Why</td>
			<td>Name</td>
			<td>Email</td>
			<td>Mobile</td>
			<td>Referrer</td>
		</tr>
		<?php foreach($database as $record): ?>
			<tr>
				<td><?php echo $record['brand']; ?></td>
				<td><?php echo $record['why']; ?></td>
				<td><?php echo $record['name']; ?></td>
				<td><?php echo $record['email']; ?></td>
				<td><?php echo $record['mobile']; ?></td>
				<td><?php echo $record['referrer']; ?></td>
			</tr>
		
		<?php endforeach; ?>

	
	</table>	

	
	
	<?php
	
	
}
else {
	
	echo "<p>No records yet</p>";
}
