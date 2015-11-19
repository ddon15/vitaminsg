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
	
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
		<h2><?php echo $text_your_account; ?></h2>
		<div class="content">
			<table class="form">
				<tr>
					<td class="input_instructions"><span class="required">*</span> <?php echo $entry_email; ?></td>
					<td>
						<input type="text" name="email" value="<?php echo $email; ?>" readonly="readonly" />
						<?php if(isset($error_expiry)) { ?>
							<span class="input_instructions"><?php echo $error_expiry; ?></span>
						<?php } ?>
					</td>
				</tr>
				<?php if($can_use_reward) { ?>
				<tr>
					<td>
						<input type="checkbox" name="use_reward" value="use_reward" <?php if($use_reward) { ?> checked <?php } ?> /><?php echo $entry_use_reward; ?>
					</td>
					<td></td>
				</tr>
				<?php } ?>
			</table> <!-- end table.form -->
		</div> <!-- end .content -->
		
		<?php if(!isset($error_expiry)) { ?>
			<?php if ($text_agree) { ?>
				<div class="buttons">
					<div class="right"><?php echo $text_agree; ?>
						<?php if ($agree) { ?>
							<input type="checkbox" name="agree" value="1" checked="checked" />
						<?php } else { ?>
							<input type="checkbox" name="agree" value="1" />
						<?php } ?>
						<input type="submit" value="<?php echo $button_continue; ?>" class="button" />
					</div>
				</div>
			<?php } else { ?>
				<div class="buttons">
					<div class="right">
						<input type="submit" value="<?php echo $button_continue; ?>" class="button" />
					</div>
				</div>
			<?php } ?>
		<?php } ?>
	
	</form>

<?php echo $content_bottom; ?>
</section> <!-- end #content -->

<?php echo $footer; ?>