<style>
	* { font-family: Arial; }
	table { border-collapse: collapse; }
	td { vertical-align: top; border: 1px solid #999; padding: 10px; }
</style>


<h1>Entries</h1>
<table>
<?php 
	$fp = fopen("entries.txt", 'r');
	while (!feof($fp)):
		$line = trim(fgets($fp));
		if ($line):
			$member = json_decode($line);
?>
<tr>
	<td><?php echo $member->mname; ?></td>
	<td><?php echo $member->memail; ?></td>
	<td><?php echo $member->mmobile; ?></td>
	<td><?php echo nl2br($member->maddress); ?></td>
	<td><?php echo $member->mcode; ?></td>
</tr>
<?php 
		endif;
	endwhile;
	fclose($fp);
?>
</table>