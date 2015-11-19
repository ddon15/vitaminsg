<?php 
	if ($_POST['submitted'] == '1') {
		$ccode = $_POST['ccode'];
		$ccode = strtoupper(trim($ccode));
		
		$claimcodes = file_get_contents('claimcodes.txt');
		if (trim($claimcodes)) {
			$claimcodes = unserialize($claimcodes);
			if (is_array($claimcodes)) {
				$claimcodes[] = $ccode;
			}
			else {
				$claimcodes = array();
				$claimcodes[] = $ccode;
			}
		}
		else {
			$claimcodes = array();
			$claimcodes[] = $ccode;			
		}
		$claimcodes = serialize($claimcodes);
		file_put_contents('claimcodes.txt', $claimcodes);
		header('location: ' . $_SERVER['PHP_SELF']);
		exit;
	}
	
	if ($_GET['action'] == 'del') {
		$ccode = $_GET['ccode'];
		$claimcodes = file_get_contents('claimcodes.txt');
		$claimcodes = unserialize($claimcodes);
		if (($key = array_search($ccode, $claimcodes)) !== false) {
			unset($claimcodes[$key]);
		}
		$claimcodes = serialize($claimcodes);
		file_put_contents('claimcodes.txt', $claimcodes);
		header('location: ' . $_SERVER['PHP_SELF']);
		exit;
	}

	$claimcodes = file_get_contents('claimcodes.txt');
	if (trim($claimcodes)) {
		$claimcodes = unserialize($claimcodes);
	}
?>
<html>
<head>
	<title>Claim Codes</title>
	<style>
		* { font-family: Arial; }
		body { padding: 20px; }
		hr { border-top: 1px solid #888; height: 0; border-bottom: 0; border-left: 0; border-right: 0; }
	</style>
</head>
<body>
	<div class='container'>
		<h1>Valid Claim Codes</h1>
		<?php if (is_array($claimcodes)): ?>
			<ul>
			<?php foreach ($claimcodes as $ccode): ?>
				<li><?php echo $ccode; ?> [<a href="?action=del&ccode=<?php echo $ccode; ?>">Delete</a>]</li>
			<?php endforeach; ?>
			</ul>
		<?php else: ?>
			<p>No claim codes</p>	
		<?php endif; ?>
		
		<hr />
		
		<form method="post">
		<p>
			<strong>Add New Claim Code:</strong>
			<input type="text" name='ccode'><input type="hidden" name='submitted' value="1">
			<input type="submit" value="Add">
		</p>
		</form>
	</div>
</body>
</html>