<?php echo $header; ?>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
  <div class="content">
  	<table id="module" class="list">
    	<thead>
        	<tr style="text-align:center;">
            	<td style="font-size:18px;">Category Pages</td>
  				<td style="font-size:18px;">Product Pages</td>
  			</tr>
  		</thead>
  			<tr style="text-align:center;">
  				<td style="font-size:16px;"><?php echo '<b>' . $percent_cats . $text_percent . '<br/>' . $cats . $text_out . $total_cats . '</b>' . $text_have_custom; ?></td>
  				<td style="font-size:16px;"><?php echo '<b>' . $percent_prods . $text_percent . '<br/>' . $prods . $text_out . $total_prods . '</b>' . $text_have_custom; ?></td>
  			</tr>
  	</table>
  	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
</div>
    </div>
</div>