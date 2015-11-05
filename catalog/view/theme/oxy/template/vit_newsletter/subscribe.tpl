<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<section id="content" class="columns op"><?php echo $content_top; ?>
	<h1><?php echo $heading_title; ?></h1>
	<ul class="breadcrumbs">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul> <!-- end .breadcrumbs -->
	
	
	<form id="vit-newsletter-subscribe" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
		<div class="content">
			<table class="form">
				<tbody><tr>
					<td><span class="required">*</span> <?php echo $text_name;?></td>
					<td><input type="text" name="subscribe-name" value="<?php echo $subscribe_name; ?>">
					<?php if ($error_subscribe_name) { ?>
						<span class="error"><?php echo $error_subscribe_name; ?></span>
					<?php } ?></td>
				</tr>
				<tr>
					<td><span class="required">*</span> <?php echo $text_email;?></td>
					<td><input type="text" name="subscribe-email" value="<?php echo $subscribe_email; ?>">
					<?php if ($error_subscribe_email) { ?>
						<span class="error"><?php echo $error_subscribe_email; ?></span>
					<?php } ?></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input name="subscribe-consent" type="checkbox" value="1" />&nbsp;<?php echo $text_consent;?></td>
				</tr>
			</tbody></table> <!-- end table.form -->
		</div>
		<div class="buttons">
			<div class="right"><input type="submit" value="<?php echo $text_submit;?>" class="button" /></div>
		</div>
	</form>

<?php echo $content_bottom; ?>
</section> <!-- end #content -->
<?php echo $footer; ?>