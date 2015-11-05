<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>

	<aside id="column-right" class="four columns hide-for-small">
		<div class="box">
			<div class="box-heading"><?php echo $text_aside_title; ?></div>
			<div class="box-content box-account">
				<ul>
					<?php foreach($aside_links as $link) { ?>
						<li>
							<?php if($link['link']) { ?>
								<a href="<?php echo $link['link']; ?>" title="<?php echo $link['title']; ?>"><?php echo $link['title']; ?></a>
							<?php } else { ?>
								<span style="text-transform:uppercase;"><?php echo $link['title']; ?></span>
							<?php } ?>
						</li>
					<?php } ?>
				</ul>
			</div>
		</div>
	</aside>
  
	<section id="content" class="columns op" style="width:66.66667%;"><?php echo $content_top; ?>
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
		<h2><?php echo $heading_title; ?></h2>
		<div class="enquiry_intro"><?php echo $text_intro; ?></p>
		<div class="contact-form">
		
		<div class="content">
			<span class="required">*</span>&nbsp;<b><?php echo $entry_first_name; ?></b><br />
			<input type="text" name="first_name" value="<?php echo $first_name; ?>" />
			<?php if ($error_first_name) { ?>
			<span class="error"><?php echo $error_first_name; ?></span>
			<?php } ?>
			<br />
			<span class="required">*</span>&nbsp;<b><?php echo $entry_last_name; ?></b><br />
			<input type="text" name="last_name" value="<?php echo $last_name; ?>" />
			<?php if ($error_last_name) { ?>
			<span class="error"><?php echo $error_last_name; ?></span>
			<?php } ?>
			<br />
			<span class="required">*</span>&nbsp;<b><?php echo $entry_email; ?></b><br />
			<input type="text" name="email" value="<?php echo $email; ?>" />
			<?php if ($error_email) { ?>
			<span class="error"><?php echo $error_email; ?></span>
			<?php } ?>
			<br />
			<span class="required">*</span>&nbsp;<b><?php echo $entry_product; ?></b><br />
			<input type="text" name="product" value="<?php echo $product; ?>" />
			<?php if ($error_product) { ?>
			<span class="error"><?php echo $error_product; ?></span>
			<?php } ?>
			<br />
			<span class="required">*</span>&nbsp;<b><?php echo $entry_brand; ?></b><br />
			<input type="text" name="brand" value="<?php echo $brand; ?>" />
			<?php if ($error_brand) { ?>
			<span class="error"><?php echo $error_brand; ?></span>
			<?php } ?>
			<br />
			<b><?php echo $entry_comments; ?></b><br />
			<textarea name="comments" cols="40" rows="10" style="width: 100%;"><?php echo $comments; ?></textarea>
			<br />
			<span class="required">*</span>&nbsp;<b><?php echo $entry_captcha; ?></b><br />
			<input type="text" name="captcha" value="<?php echo $captcha; ?>" />
			<img src="index.php?route=information/contact/captcha" alt="" />
			<?php if ($error_captcha) { ?>
			<span class="error"><?php echo $error_captcha; ?></span>
			<?php } ?>
		</div>
    </div>
    <div class="buttons">
      <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
    </div>
	</form>
  </section>
  
<?php echo $content_bottom; ?></section>
<?php echo $footer; ?>