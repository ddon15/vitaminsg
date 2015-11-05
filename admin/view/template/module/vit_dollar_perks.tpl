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
			<thead style="text-align: left;background-color: lightgray;">
				<tr><th style="padding: 10px 20px;color: #333;font-size: 13px;"><?php echo $text_rowhead_display ?></th><th></th></tr>
			</thead>
			<tbody>
				<tr>
					<td><span class="required">*</span> <?php echo $entry_vit_display_redeem; ?></td>
					<td><input type="text" name="vit_display_redeem" value="<?php echo $display_redeem; ?>"/>
					</td>
				</tr>
				<tr>
					<td><span class="required">*</span> <?php echo $entry_vit_display_earn; ?></td>
					<td><input type="text" name="vit_display_earn" value="<?php echo $display_earn; ?>"/>
					</td>
				</tr>
			</tbody>
			<thead style="text-align: left;background-color: lightgray;">
				<tr><th style="padding: 10px 20px;color: #333;font-size: 13px;"><?php echo $text_rowhead_first_time ?></th><th></th></tr>
			</thead>
			<tbody>
				<tr>
					<td><span class="required">*</span> <?php echo $entry_first_total_more_than; ?></td>
					<td><input type="text" name="vit_first_total_more_than" value="<?php echo $first_total_more_than; ?>"/>
						<?php if (isset($error['first_total_more_than'])) { ?>
							<span class="error"><?php echo $error['first_total_more_than']; ?></span>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<td><span class="required">*</span> <?php echo $entry_first_additional_rewards; ?></td>
					<td><input type="text" name="vit_first_additional_rewards" value="<?php echo $first_additional_rewards; ?>"/>
						<?php if (isset($error['first_additional_rewards'])) { ?>
							<span class="error"><?php echo $error['first_additional_rewards']; ?></span>
						<?php } ?>
					</td>
				</tr>
			</tbody>
			<thead style="text-align: left;background-color: lightgray;">
				<tr><th style="padding: 10px 20px;color: #333;font-size: 13px;"><?php echo $text_rowhead_birthday ?></th><th></th></tr>
			</thead>
			<tbody>
				<tr>
					<td><span class="required">*</span> <?php echo $entry_bd_rewards_multiple; ?></td>
					<td><input type="text" name="vit_bd_rewards_multiple" value="<?php echo $bd_rewards_multiple; ?>"/>
						<?php if (isset($error['bd_rewards_multiple'])) { ?>
							<span class="error"><?php echo $error['bd_rewards_multiple']; ?></span>
						<?php } ?>
					</td>
				</tr>
			</tbody>
			<thead style="text-align: left;background-color: lightgray;">
				<tr><th style="padding: 10px 20px;color: #333;font-size: 13px;"><?php echo $text_rowhead_reviews ?></th><th></th></tr>
			</thead>
			<tbody>
				<tr>
					<td><span class="required">*</span> <?php echo $entry_review_rewards; ?></td>
					<td><input type="text" name="vit_review_rewards" value="<?php echo $review_rewards; ?>"/>
						<?php if (isset($error['review_rewards'])) { ?>
							<span class="error"><?php echo $error['review_rewards']; ?></span>
						<?php } ?>
					</td>
				</tr>
			</tbody>
			<thead style="text-align: left;background-color: lightgray;">
				<tr><th style="padding: 10px 20px;color: #333;font-size: 13px;"><?php echo $text_rowhead_timed ?></th><th></th></tr>
			</thead>
			<tbody>
				<tr>
					<td><?php echo $entry_timed_from; ?></td>
					<td><input type="text" name="vit_timed_from" class="date" value="<?php echo $timed_from; ?>"/></td>
				</tr>
				<tr>
					<td><?php echo $entry_timed_to; ?></td>
					<td><input type="text" name="vit_timed_to" class="date" value="<?php echo $timed_to; ?>"/></td>
				</tr>
				<tr>
					<td><?php echo $entry_timed_label; ?></td>
					<td><input type="text" name="vit_timed_label" value="<?php echo $timed_label; ?>"/></td>
				</tr>
				<tr>
					<td><?php echo $entry_timed_total_more_than; ?></td>
					<td><input type="text" name="vit_timed_total_more_than" value="<?php echo $timed_total_more_than; ?>"/></td>
				</tr>
				<tr>
					<td><?php echo $entry_timed_additional_rewards; ?></td>
					<td><input type="text" name="vit_timed_additional_rewards" value="<?php echo $timed_additional_rewards; ?>"/></td>
				</tr>
			</tbody>
			<thead style="text-align: left;background-color: lightgray;">
				<tr><th style="padding: 10px 20px;color: #333;font-size: 13px;"><?php echo $text_rowhead_membership ?></th><th></th></tr>
			</thead>
			<tbody>
				<tr>
					<td><?php echo $entry_membership_reward_renew; ?></td>
					<td><input type="checkbox" name="vit_membership_reward_renew" value="vit_membership_reward_renew"
						<?php if($membership_reward_renew) { ?> checked <?php } ?>/>
					</td>
				</tr>
			</tbody>
			<thead style="text-align: left;background-color: lightgray;">
				<tr><th style="padding: 10px 20px;color: #333;font-size: 13px;"><?php echo $text_rowhead_referral; ?></th><th></th></tr>
			</thead>
			<tbody>
				<tr>
					<td><?php echo $entry_referral_enable ?></td>
					<td><input type="checkbox" name="vit_referral_enable" value="vit_referral_enable"
						<?php if($referral_enable) { ?> checked <?php } ?>/>
					</td>
				</tr>
				<tr>
					<td><?php echo $entry_referral_reward; ?></td>
					<td><input type="text" name="vit_referral_reward" value="<?php echo $referral_reward; ?>"/></td>
				</tr>
				<tr>
					<td><?php echo $entry_referral_prefix; ?></td>
					<td><input type="text" name="vit_referral_prefix" value="<?php echo $referral_prefix; ?>"/></td>
				</tr>
				<tr>
					<td><?php echo $entry_referral_coupon_amount; ?></td>
					<td><input type="text" name="vit_referral_coupon_amount" value="<?php echo $referral_coupon_amount; ?>"/></td>
				</tr>
				<tr>
					<td><?php echo $entry_referral_coupon_min; ?></td>
					<td><input type="text" name="vit_referral_coupon_min" value="<?php echo $referral_coupon_min; ?>"/></td>
				</tr>
			</tbody>
		</table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript"><!--
    $(document).ready(function() {
        $('.date').datepicker({dateFormat: 'yy-mm-dd'});
    });
//--></script>
<?php echo $footer; ?>