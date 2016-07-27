<html>
	<head>
		<title>Claim Entries</title>
		<style>
			* { font-family: Arial; }
			body { padding: 20px; }
			table { border-collapse: collapse; }
			td { vertical-align: top; border: 1px solid #999; padding: 10px; }
		</style>		
	</head>
	<body>
		<h1>Successful Claim Entries</h1>
		<table>
		<?php 
			$fp = fopen("entries.txt", 'r');
			while (!feof($fp)):
				$line = trim(fgets($fp));
				if ($line):
					$member = json_decode($line);
		?>
		<tr>
			<td><?php echo ++$i; ?></td>
			<td><?php echo $member->mname; ?></td>
			<td><?php echo $member->memail; ?></td>
			<td><?php echo $member->mmobile; ?></td>
			<td><?php echo nl2br($member->maddress); ?></td>
			<td><?php //echo $member->mcode; ?></td>
		</tr>
		<?php 
				endif;
			endwhile;
			fclose($fp);
		?>
		</table>
	</body>
</html>