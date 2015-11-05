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
      <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('#form').attr('action', '<?php echo $copy; ?>'); $('#form').submit();" class="button"><?php echo $button_copy; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>        
                <td class="center" width="1"><input type="checkbox" onclick="$('input[name*=\'profile_ids\']').attr('checked', this.checked)" /></td>
                <td class="left"><?php echo $column_name ?></td>
                <td class="left"><?php echo $column_sort_order ?></td>
                <td class="right"><?php echo $column_action ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($profiles) { ?>
                <?php foreach ($profiles as $profile) { ?>
                <tr>
                    <td class="center"><input type="checkbox" name="profile_ids[]" value="<?php echo $profile['profile_id'] ?>" /></td>
                    <td class="left"><?php echo $profile['name'] ?></td>
                    <td class="left"><?php echo $profile['sort_order'] ?></td>
                    <td class="right">
                        <?php foreach ($profile['action'] as $action): ?>
                        [<a href="<?php echo $action['href'] ?>"><?php echo $action['name'] ?></a>]
                        <?php endforeach;?>
                    </td>
                </tr>
                <?php } ?>
            <?php } else { ?>
                <tr>
                  <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
                </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<?php echo $footer; ?>