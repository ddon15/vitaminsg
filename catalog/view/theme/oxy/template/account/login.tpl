<?php echo $header; ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php echo $column_left; ?><!--<?php echo $column_right; ?>-->
<section id="content" class="columns op"><?php echo $content_top; ?>
  <div class="login-content">
    <!--<div class="right">
      <h2><?php echo $text_new_customer; ?></h2>
      <div class="content">
        <p><b><?php echo $text_register; ?></b></p>
        <p><?php echo $text_register_account; ?></p>
        <a href="<?php echo $register; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>-->
    <div class="left">
      <h2><?php echo $text_returning_customer; ?></h2>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="content">
          <p><?php echo $text_i_am_returning_customer; ?></p>
          <b><?php echo $entry_email; ?></b><br />
          <input type="text" name="email" value="<?php echo $email; ?>" />
          <br />

          <b><?php echo $entry_password; ?></b><br />
          <input type="password" name="password" value="<?php echo $password; ?>" />
          <br />
          <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a><br />
          <br />
          <input type="submit" value="<?php echo $button_login; ?>" class="button" /><br /><br />
          <?php if ($redirect) { ?>
          <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
          <?php } ?>
        </div>
      </form>
    </div>
  </div>
  <?php echo $content_bottom; ?></section>
<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#login').submit();
	}
});
//--></script> 
<?php echo $footer; ?>