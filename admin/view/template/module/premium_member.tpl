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
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
			<tr>
				<td><span class="required">*</span> <?php echo $entry_name; ?></td>
				<td><input type="text" name="premium_member_name" value="<?php echo $premium_member_name; ?>"/>
					<?php if (isset($error['premium_member_name'])) { ?>
						<span class="error"><?php echo $error['premium_member_name']; ?></span>
					<?php } ?>
				</td>
			</tr>
			<tr>
				<td><span class="required">*</span> <?php echo $entry_display_name; ?></td>
				<td><input type="text" name="premium_member_display_name" value="<?php echo $premium_member_display_name; ?>"/>
					<?php if (isset($error['premium_member_display_name'])) { ?>
						<span class="error"><?php echo $error['premium_member_display_name']; ?></span>
					<?php } ?>
				</td>
			</tr>
			<tr>
				<td><span class="required">*</span> <?php echo $entry_price; ?></td>
				<td><input type="text" name="premium_member_price" value="<?php echo $premium_member_price; ?>"/>
					<?php if (isset($error['premium_member_price'])) { ?>
						<span class="error"><?php echo $error['premium_member_price']; ?></span>
					<?php } ?>
				</td>
			</tr>
			<tr>
				<td><span class="required">*</span> <?php echo $entry_length; ?></td>
				<td><input type="text" name="premium_member_length" value="<?php echo $premium_member_length; ?>"/>
					<?php if (isset($error['premium_member_length'])) { ?>
						<span class="error"><?php echo $error['premium_member_length']; ?></span>
					<?php } ?>
				</td>
			</tr>
		</table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>