<!DOCTYPE html>
<html>

<head>
	
	<meta charset="utf-8" />
	<title>Vitamin.sg - Valentines Day 2014</title>
	
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/ui-lightness/jquery-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
		
	<!-- JS: JQuery, JQueryUI, ChromeFrame, Modernizr, Prefix Free -->	
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/prefixfree.js"></script>
	
	<?php if (is_array($scripts) && sizeof($scripts)): ?>
		<?php foreach ($scripts as $script): ?>
			<script type="text/javascript" src="js/<?php echo $script; ?>"></script>
		<?php endforeach; ?>
	<?php endif; ?>
	
</head>

<body>

	<div id="container">