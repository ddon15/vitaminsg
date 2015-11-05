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
	<h3><?php echo $text_heading_contact; ?></h3>
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
		<span class="required">*</span>&nbsp;<b><?php echo $entry_contact; ?></b><br />
		<input type="text" name="contact" value="<?php echo $contact; ?>" />
		<?php if ($error_contact) { ?>
		<span class="error"><?php echo $error_contact; ?></span>
		<?php } ?>
		<br />
		<span class="required">*</span>&nbsp;<b><?php echo $entry_partnership_type;?></b><br/>
		<select name="partnership_type">
			<option value=""><?php echo $text_select; ?></option>
			<?php foreach ($partnership_types as $type) { ?>
				<?php if ($type == $partnership_type) { ?>
					<option value="<?php echo $type; ?>" selected="selected"><?php echo $type; ?></option>
				<?php } else { ?>
					<option value="<?php echo $type; ?>"><?php echo $type; ?></option>
				<?php } ?>
			<?php } ?>
		</select>
		<?php if ($error_partnership_type) { ?>
		<span class="error"><?php echo $error_partnership_type; ?></span>
		<?php } ?>
	</div>
	<h3><?php echo $text_heading_company; ?></h3>
    <div class="content">
		<b><?php echo $entry_company_name; ?></b><br />
		<input type="text" name="company_name" value="<?php echo $company_name; ?>" />
		<br />
		<b><?php echo $entry_company_address; ?></b><br />
		<input type="text" name="company_address" value="<?php echo $company_address; ?>" />
		<br />
		<b><?php echo $entry_city; ?></b><br />
		<input type="text" name="city" value="<?php echo $city; ?>" />
		<br />
		<b><?php echo $entry_state; ?></b><br />
		<input type="text" name="state" value="<?php echo $state; ?>" />
		<br />
		<b><?php echo $entry_postal; ?></b><br />
		<input type="text" name="postal" value="<?php echo $postal; ?>" />
		<br />
		<b><?php echo $entry_country; ?></b><br />
		<input type="text" name="country" value="<?php echo $country; ?>" />
    </div>
	<h3><?php echo $text_heading_enquiry; ?></h3>
	<div class="content">
		<span class="required">*</span>&nbsp;<b><?php echo $entry_enquiry; ?></b><br />
		<textarea name="enquiry" cols="40" rows="10" style="width: 100%;"><?php echo $enquiry; ?></textarea>
		<?php if ($error_enquiry) { ?>
		<span class="error"><?php echo $error_enquiry; ?></span>
		<?php } ?>
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

<?php echo $content_bottom; ?></section>
<?php echo $footer; ?>