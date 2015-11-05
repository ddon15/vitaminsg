<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a
                href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
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
            <h1><img src="view/image/module.png" alt=""/> <?php echo $heading_title; ?></h1>

            <div class="buttons"><?php $route = explode('/', $this->request->get['route']); ?>
				<?php $no_ids = array('module', 'shipping', 'payment', 'total', 'feed'); ?>
				<?php if ((!in_array($route[0], $no_ids) && $route[1] != 'setting') && !strpos($this->request->server['REQUEST_URI'], '_id')) { ?>
					<a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
				<?php } else { ?>
					<a onclick="$('#form').submit();" class="button"><?php echo $this->language->get('button_save_and_exit'); ?></a>
					<a onclick="$('#form').attr('action', location + '&keepediting=true' + ($('#tabs a.selected').attr('href') ? '&tabselected=' + $('#tabs a.selected').attr('href').substring(1) : '')); $('#form').submit();" class="button"><?php echo $this->language->get('button_save_and_keep_editing'); ?></a>&nbsp;
				<?php } ?>
                <a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
        </div>
        <div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <table class="form">
                    <tr>
                        <td><span class="required">*</span> <?php echo $label_claim_code; ?>:</td>
                        <td><input type="text" name="freemember_claim_code" maxlength="20" size="20"
                                   value="<?php echo $freemember_claim_code; ?>" <?php echo ($this->data['edit_mode']?"readonly style='color:#808080'":"") ?>/>
                            <?php if (isset($error['freemember_claim_code'])) { ?>
                            <span class="error"><?php echo $error['freemember_claim_code']; ?></span>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span> <?php echo $label_code_description; ?>:</td>
                        <td><input type="text" name="freemember_code_description" maxlength="100" size="50"
                                   value="<?php echo $freemember_code_description; ?>"/>
                            <?php if (isset($error['freemember_code_description'])) { ?>
                            <span class="error"><?php echo $error['freemember_code_description']; ?></span>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span> <?php echo $label_max_usage; ?>:</td>
                        <td><input type="text" name="freemember_max_usage" maxlength="10" size="6"
                                   value="<?php echo $freemember_max_usage; ?>"/>
                            <?php if (isset($error['freemember_max_usage'])) { ?>
                            <span class="error"><?php echo $error['freemember_max_usage']; ?></span>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span> <?php echo $label_expiry; ?>:</td>
                        <td><input type="text" name="freemember_expiry" maxlength="10" size="10"
                                   value="<?php echo $freemember_expiry; ?>"/>
                            <?php if (isset($error['freemember_expiry'])) { ?>
                            <span class="error"><?php echo $error['freemember_expiry']; ?></span>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr
                    <?php echo ($this->data['edit_mode']?"":"style='display:none'") ?>>
                    <td>&nbsp;&nbsp;&nbsp;<?php echo $label_usage; ?>:</td>
                    <td><?php echo $freemember_usage; ?></td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span> <?php echo $label_start_date; ?>:</td>
                        <td><input type="text" name="freemember_start_date" maxlength="12"  size="12" class="date"
                                   value="<?php echo $freemember_start_date; ?>"/>
                            <?php if (isset($error['freemember_start_date'])) { ?>
                            <span class="error"><?php echo $error['freemember_start_date']; ?></span>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span> <?php echo $label_end_date; ?>:</td>
                        <td><input type="text" name="freemember_end_date" maxlength="12" size="12" class="date"
                                   value="<?php echo $freemember_end_date; ?>"/>
                            <?php if (isset($error['freemember_end_date'])) { ?>
                            <span class="error"><?php echo $error['freemember_end_date']; ?></span>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr
                    <?php echo ($this->data['edit_mode']?"":"style='display:none'") ?>>
                    <td>&nbsp;&nbsp;&nbsp;<?php echo $label_date_added; ?>:</td>
                    <td><?php echo $freemember_date_added; ?></td>
                    </tr>
                    <tr
                    <?php echo ($this->data['edit_mode']?"":"style='display:none'") ?>>
                    <td>&nbsp;&nbsp;&nbsp;<?php echo $label_date_modified; ?>:</td>
                    <td><?php echo $freemember_date_modified; ?></td>
                    </tr>
                </table>
                <input type="hidden" name="claim_code_id" value="<?php echo $claim_code_id; ?>" />
            </form>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
    $(document).ready(function () {
        $('.date').datepicker({changeMonth: true, changeYear: true, dateFormat: 'yy-mm-dd'});
    });
    //--></script>
<?php echo $footer; ?>
