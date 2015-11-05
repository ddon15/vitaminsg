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
      <h1><img src="view/image/shipping.png" alt="" /> <?php echo $heading_title; ?></h1>
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
            <td><?php echo $entry_geo_zone; ?></td>
            <td><select name="pickup_geo_zone_id">
                <option value="0"><?php echo $text_all_zones; ?></option>
                <?php foreach ($geo_zones as $geo_zone) { ?>
                <?php if ($geo_zone['geo_zone_id'] == $pickup_geo_zone_id) { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="pickup_status">
                <?php if ($pickup_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_sort_order; ?></td>
            <td><input type="text" name="pickup_sort_order" value="<?php echo $pickup_sort_order; ?>" size="1" /></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>