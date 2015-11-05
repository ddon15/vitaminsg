<html>
	<head>
		<title>Lucky Draw Entries</title>
		<style>
			* { font-family: Arial; }
			body { padding: 20px; }
			table { border-collapse: collapse; }
			td { vertical-align: top; border: 1px solid #999; padding: 10px; }
		</style>		
	</head>
	<body>
		<h1>Lucky Draw Entries</h1>
		<table>
		<?php 
			$fp = fopen("entries.txt", 'r');
			while (!feof($fp)):
				$line = trim(fgets($fp));
				if ($line):
					$entry = json_decode($line);
		?>
		<tr>
			<td><?php echo ++$i; ?></td>
			<td><?php echo $entry->name; ?></td>
			<td><?php echo $entry->email; ?></td>
			<td><?php echo $entry->mobile; ?></td>
			<td><?php echo nl2br($entry->address); ?></td>
		</tr>
		<?php 
				endif;
			endwhile;
			fclose($fp);
		?>
		</table>
	</body>
</html>