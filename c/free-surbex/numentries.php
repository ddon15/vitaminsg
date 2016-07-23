<?php 
	
	$numbotleft = 285 + 38;
	$fp = fopen("entries.txt", 'r');
	while (!feof($fp)):
		$line = trim(fgets($fp));
		if ($line):
			$numbotleft--;
		endif;
	endwhile;
	fclose($fp);
	echo $numbotleft;