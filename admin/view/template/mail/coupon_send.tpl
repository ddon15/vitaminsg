<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><?php echo $title; ?></title>
</head>
<body style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #000000;">
<div style="width: 680px;"><a href="<?php echo $store_url; ?>" title="<?php echo $store_name; ?>"><img src="<?php echo $logo; ?>" alt="<?php echo $store_name; ?>" style="margin-bottom: 20px; border: none;" /></a>

<?php //[SB] Added address ?>
<p style="margin-top:0px;margin-top:10px;margin-bottom:30px;width:35%;float:right;"><?php echo $text_address; ?></p>

<div style="font-size:0px;content:'.';display:block;height:0px;visibility:hidden;clear:both;"></div>
  <p style="margin-top: 20px;">
	<?php echo $dear; ?><br><br>
	<?php echo $content; ?>
  </p>
</div>
</body>
</html>
