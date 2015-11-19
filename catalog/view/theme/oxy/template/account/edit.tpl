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
  </ul>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <h2><?php echo $text_your_details; ?></h2>
    <div class="content">
      <table class="form">
        <tr>
          <td><span class="required">*</span> <?php echo $entry_firstname; ?></td>
          <td><input type="text" name="firstname" value="<?php echo $firstname; ?>" />
            <?php if ($error_firstname) { ?>
            <span class="error"><?php echo $error_firstname; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_lastname; ?></td>
          <td><input type="text" name="lastname" value="<?php echo $lastname; ?>" />
            <?php if ($error_lastname) { ?>
            <span class="error"><?php echo $error_lastname; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_email; ?></td>
          <td><input type="text" name="email" value="<?php echo $email; ?>" />
            <?php if ($error_email) { ?>
            <span class="error"><?php echo $error_email; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_telephone; ?></td>
          <td><input type="text" name="telephone" value="<?php echo $telephone; ?>" />
            <?php if ($error_telephone) { ?>
            <span class="error"><?php echo $error_telephone; ?></span>
            <?php } ?></td>
        </tr>
        <tr><?php //[SB] Removed fax, added DOB and gender ?>
			<td class="input_instructions"><?php echo $entry_dob; ?></td>
			<td><input type="text" class="date" name="dob" value="<?php echo $dob; ?>" style="width:12em;" readonly />
			<span class="input_instructions"><?php echo $text_dob_instructions; ?></span>
			<?php if ($error_dob) { ?>
				<span class="error"><?php echo $error_dob; ?></span>
			<?php } ?></td>
		</tr>
		<tr>
			<td><span class="required">*</span> <?php echo $entry_gender; ?></td>
			<td><?php if ($gender == 1) { ?>
				<input type="radio" name="gender" value="0" />
				<?php echo $text_female; ?>
				<input type="radio" name="gender" value="1" checked="checked" />
				<?php echo $text_male; ?>
			<?php } else { ?>
				<input type="radio" name="gender" value="0" checked="checked" />
				<?php echo $text_female; ?>
				<input type="radio" name="gender" value="1" />
				<?php echo $text_male; ?>
			<?php } ?></td>
		</tr>
      </table>
    </div>
    <div class="buttons">
      <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
      <div class="right">
        <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
      </div>
    </div>
  </form>
  <?php echo $content_bottom; ?></section>
<?php echo $footer; ?>