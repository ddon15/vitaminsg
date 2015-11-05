<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php echo $column_left; ?><!--<?php echo $column_right; ?>-->
<section id="content" class="columns op"><?php echo $content_top; ?>
	<h1><?php echo $heading_title; ?></h1>
	<ul class="breadcrumbs">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul> <!-- end .breadcrumbs -->
	<p><?php echo $text_account_already; ?></p>
	
	<div id="premium-member-perks" class="clearfix">
		<div class="premium-member-perks-titles clearfix">
			<div class="premium-member-perks-title-left">
				<?php echo $text_title; ?><br />
			</div>
			<div class="premium-member-perks-title-right">
				<?php echo $text_subscribe_price; ?>
			</div>
		</div>
		<div class="premium-member-perks-freegift clearfix">
			<img class="premium-member-perks-img-freegift" src="<?php echo $img_perks_member_freegift; ?>" />
			<div class="premium-member-perks-freegift-text"><?php echo $text_freegift; ?></div>
		</div>
		<div class="premium-member-perks-details clearfix">
			<div class="premium-member-perks premium-member-perk-1">
				<img class="premium-member-perks-img" src="<?php echo $img_perks_member_special; ?>" />
				<?php echo $text_perks_member_special; ?>
			</div>
			<div class="premium-member-perks premium-member-perk-2">
				<img class="premium-member-perks-coming-soon" src="<?php echo $img_perks_coming_soon; ?>" />
				<img class="premium-member-perks-img" src="<?php echo $img_perks_product_offer; ?>" />
				<br /><?php echo $text_perks_product_offer; ?>
			</div>
			<div class="premium-member-perks premium-member-perk-3">
				<img class="premium-member-perks-img" src="<?php echo $img_perks_health_newsletter; ?>" />
				<br /><?php echo $text_perks_health_newsletter; ?>
			</div>
			<div class="premium-member-perks premium-member-perk-4">
				<img class="premium-member-perks-img" src="<?php echo $img_perks_seminar_invitation; ?>" />
				<br /><?php echo $text_perks_seminar_invitation; ?>
			</div>
		</div>
	</div>
	
	<div class="premium-member-perks-intro"><?php echo $text_intro; ?></div>
	
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
					<td><span class="required">*</span> <?php echo $entry_id_number; ?></td>
					<td><input type="text" name="id_number" value="<?php echo $id_number; ?>" />
                                            <span class="input_instructions"><?php echo $text_id_number_help; ?></span>
					<?php if ($error_id_number) { ?>
						<span class="error"><?php echo $error_id_number; ?></span>
					<?php } ?></td>
				</tr>
				<tr>
					<td><span class="required">*</span> <?php echo $entry_telephone; ?></td>
					<td><input type="text" name="telephone" value="<?php echo $telephone; ?>" />
					<?php if ($error_telephone) { ?>
						<span class="error"><?php echo $error_telephone; ?></span>
					<?php } ?></td>
				</tr>
				<tr>
					<td><span class="required">*</span> <?php echo $entry_dob; ?></td>
					<td><input type="text" class="date" name="dob" value="<?php echo $dob; ?>" style="width:12em;" />
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
			</table> <!-- end table.form -->
		</div> <!-- end .content -->
		
		<h2><?php echo $text_your_address; ?></h2>
		<div class="content">
			<table class="form">
				<tr>
					<td class="input_instructions"><span class="required">*</span> <?php echo $entry_address_1; ?></td>
					<td><input type="text" name="address_1" value="<?php echo $address_1; ?>" />
					<span class="input_instructions"><?php echo $text_address_instructions; ?></span>
					<?php if ($error_address_1) { ?>
						<span class="error"><?php echo $error_address_1; ?></span>
					<?php } ?></td>
				</tr>
				<tr>
					<td><?php echo $entry_address_2; ?></td>
					<td><input type="text" name="address_2" value="<?php echo $address_2; ?>" /></td>
				</tr>
				<tr>
					<td><?php echo $entry_city; ?></td>
					<td><input type="text" name="city" value="<?php echo $city; ?>" /></td>
				</tr>
				<tr>
				<?php //[SB] Changed span id from postcode-required to required ?>
					<td><span id="required" class="required">*</span> <?php echo $entry_postcode; ?></td>
					<td><input type="text" name="postcode" value="<?php echo $postcode; ?>" />
					<?php if ($error_postcode) { ?>
						<span class="error"><?php echo $error_postcode; ?></span>
					<?php } ?></td>
				</tr>
				<tr>
					<td><span class="required">*</span> <?php echo $entry_country; ?></td>
					<td>
						<select name="country_id">
							<option value=""><?php echo $text_select; ?></option>
							<?php foreach ($countries as $country) { ?>
								<?php if ($country['country_id'] == $country_id) { ?>
									<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
						<?php if ($error_country) { ?>
							<span class="error"><?php echo $error_country; ?></span>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<td><span class="required">*</span> <?php echo $entry_zone; ?></td>
					<td><select name="zone_id">
					</select>
					<?php if ($error_zone) { ?>
						<span class="error"><?php echo $error_zone; ?></span>
					<?php } ?></td>
				</tr>
			</table> <!-- end table.form -->
		</div> <!-- end .content -->
		
		<h2><?php echo $text_your_password; ?></h2>
		<div class="content">
			<table class="form">
				<tr>
					<td><span class="required">*</span> <?php echo $entry_password; ?></td>
					<td><input type="password" name="password" value="<?php echo $password; ?>" />
					<?php if ($error_password) { ?>
						<span class="error"><?php echo $error_password; ?></span>
					<?php } ?></td>
				</tr>
				<tr>
					<td><span class="required">*</span> <?php echo $entry_confirm; ?></td>
					<td><input type="password" name="confirm" value="<?php echo $confirm; ?>" />
					<?php if ($error_confirm) { ?>
						<span class="error"><?php echo $error_confirm; ?></span>
					<?php } ?></td>
				</tr>
			</table> <!-- end table.form -->
		</div> <!-- end .content -->
		
		<h2 style="display:none"><?php echo $text_notifications; ?></h2>
		<div class="content" style="display:none">
			<p><strong><?php echo $text_signup ?></strong></p>
			<table class="form">
				<tr>
					<td><?php echo $entry_newsletter; ?></td>
					<td><?php if ($newsletter == 0) { ?>
						<input type="radio" name="newsletter" value="1" />
						<?php echo $text_yes; ?>
						<input type="radio" name="newsletter" value="0" checked="checked" />
						<?php echo $text_no; ?>
					<?php } else { ?>
						<input type="radio" name="newsletter" value="1" checked="checked" />
						<?php echo $text_yes; ?>
						<input type="radio" name="newsletter" value="0" />
						<?php echo $text_no; ?>
					<?php } ?></td>
				</tr>
				<tr>
					<td><?php echo $entry_sms; ?></td>
					<td><?php if ($sms == 0) { ?>
						<input type="radio" name="sms" value="1" />
						<?php echo $text_yes; ?>
						<input type="radio" name="sms" value="0" checked="checked" />
						<?php echo $text_no; ?>
					<?php } else { ?>
						<input type="radio" name="sms" value="1" checked="checked" />
						<?php echo $text_yes; ?>
						<input type="radio" name="sms" value="0" />
						<?php echo $text_no; ?>
					<?php } ?></td>
				</tr>
			</table> <!-- end table.form -->
		</div> <!-- end .content -->
		
		<?php if ($text_agree) { ?>
			<div class="buttons">
				<div class="right"><?php echo $text_agree; ?>
					<?php if ($agree) { ?>
						<input type="checkbox" name="agree" value="1" checked="checked" />
					<?php } else { ?>
						<input type="checkbox" name="agree" value="1" />
					<?php } ?>
					<input type="submit" value="<?php echo $button_continue; ?>" class="button" />
				</div>
			</div>
		<?php } else { ?>
			<div class="buttons">
				<div class="right">
					<input type="submit" value="<?php echo $button_continue; ?>" class="button" />
				</div>
			</div>
		<?php } ?>
	
	</form>

<?php echo $content_bottom; ?>
</section> <!-- end #content -->

<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/register/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('.date').datepicker({dateFormat: 'yy-mm-dd', changeMonth: true, changeYear: true, yearRange: "-100:-18"});
	$('.colorbox').colorbox({
		width: 640,
		height: 480
	});
//--></script> 
<?php echo $footer; ?>