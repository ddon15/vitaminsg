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
      <h1><img src="view/image/order.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><?php $route = explode('/', $this->request->get['route']); ?>
				<?php $no_ids = array('module', 'shipping', 'payment', 'total', 'feed'); ?>
				<?php if ((!in_array($route[0], $no_ids) && $route[1] != 'setting') && !strpos($this->request->server['REQUEST_URI'], '_id')) { ?>
					<a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
				<?php } else { ?>
					<a onclick="$('#form').submit();" class="button"><?php echo $this->language->get('button_save_and_exit'); ?></a>
					<a onclick="$('#form').attr('action', location + '&keepediting=true' + ($('#tabs a.selected').attr('href') ? '&tabselected=' + $('#tabs a.selected').attr('href').substring(1) : '')); $('#form').submit();" class="button"><?php echo $this->language->get('button_save_and_keep_editing'); ?></a>&nbsp;
				<?php } ?><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_name; ?></td>
            <td><?php foreach ($languages as $language) { ?>
              <input type="text" name="order_status[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($order_status[$language['language_id']]) ? $order_status[$language['language_id']]['name'] : ''; ?>" />
              <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
              <?php if (isset($error_name[$language['language_id']])) { ?>
              <span class="error"><?php echo $error_name[$language['language_id']]; ?></span><br />
              <?php } ?>
              <?php } ?></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>