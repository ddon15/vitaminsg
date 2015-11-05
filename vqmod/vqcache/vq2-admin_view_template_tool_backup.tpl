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
  <?php if (false) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
<style type="text/css">
					.buttons {
						background: url('view/image/box.png') repeat-x;
						border: 1px solid #DDD;
						border-radius: 7px;
						box-shadow: 0 3px 6px #999;
						margin: -1px 0 0 !important;
						padding: 6px;
						position: fixed;
						right: 30px;
					}
				</style>
				<?php if (!empty($success) || isset($this->session->data['success'])) { ?>
					<div class="success"><?php echo (!empty($success)) ? $success : $this->session->data['success']; ?></div>
					<?php unset($this->session->data['success']); ?>
				<?php } ?>
				<?php if (isset($this->session->data['tabselected'])) { ?>
					<script type="text/javascript">
						$(window).load(function(){
							$('a[href="#<?php echo $this->session->data['tabselected']; ?>"]').click();
						});
					</script>
					<?php unset($this->session->data['tabselected']); ?>
				<?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/backup.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#restore').submit();" class="button"><?php echo $button_restore; ?></a><a onclick="$('#backup').submit();" class="button"><?php echo $button_backup; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $restore; ?>" method="post" enctype="multipart/form-data" id="restore">
        <table class="form">
          <tr>
            <td><?php echo $entry_restore; ?></td>
            <td><input type="file" name="import" /></td>
          </tr>
        </table>
      </form>
      <form action="<?php echo $backup; ?>" method="post" enctype="multipart/form-data" id="backup">
        <table class="form">
          <tr>
            <td><?php echo $entry_backup; ?></td>
            <td><div class="scrollbox" style="margin-bottom: 5px;">
                <?php $class = 'odd'; ?>
                <?php foreach ($tables as $table) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <input type="checkbox" name="backup[]" value="<?php echo $table; ?>" checked="checked" />
                  <?php echo $table; ?></div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>