<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">

<?php

/*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  CAUTION: This file exists in two places
	/admin/view/template/mail
	/catalog/view/theme/default/template/mail
 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
 
 ?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><?php echo $title; ?></title>
</head>
<body>

<div style="width:680px;margin:auto;font-family:'Helvatica',sans-serif;font-size:16px;">
	<div style="width:100%;height:25px;background-color:#00A651;"></div>
	
	<table border="0" cellpadding="20" style="width:100%;padding:0 20px;margin:auto;"><tbody>
		
		<tr>
			<td align="center">
				<div style="border-bottom:2px solid #d6d6d6;">
					<a title="<?php echo $store_name; ?>" href="<?php echo $store_url; ?>" target="_blank">
						<img src="<?php echo $logo; ?>" style="border:none;padding-bottom:20px;">
					</a>
				</div>
			</td>
		</tr>
		
		<tr>
			<td align="center">
				<div style="font-size:36px;font-weight:bold;"><?php echo $text_welcome; ?></div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div style="line-height:150%;">
				Dear <?php echo $member_name; ?>,<br><br>
				Thank you for joining <?php echo $store_name; ?> membership community! Your Membership No. is <span style="font-weight:bold;color:#00a651;"><?php echo $member_num; ?></span><br><br>
				<?php echo $store_name; ?> membership offers you exclusivity to special promotions, discounts, events and rewards.  It's our way of saying THANK YOU!<br><br>

				<span style="font-weight:bold;">It pays to get these all year round privileges:</span>
				<ul style="list-style-type:circle;line-height:150%;color:#00a651;">
					<li>10% off all items, up to 50% off selected items. Brand exclusions apply</li>
					<li>Earn Vit$ for your purchases</li>
					<li>Redeem Vit$ to offset purchases / for attractive gifts</li>
					<li>Be rewarded with exclusive treats</li>
					<li>Exclusive invitations to special events</li>
					<li>Receive first-hand updates on health articles/tips, new product info, discounts, special offers and exciting contests</li>
				</ul>
					
				And most importantly, <?php echo $store_name; ?> member can track order status, reorder conveniently, view purchase history and update your particulars easily!
				<br><br>
				We look forward to serving you soon.
				
				<br><br>-----<br><br>
				Cheers,<br>
				<?php echo $store_name; ?> Team
				</div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div style="font-weight:bold;">
					<span style="color:#F7941D;font-weight:bold;">Login to access the following:</span>
					<ul style="list-style-type:circle;line-height:150%;">
						<li>View order history</li>
						<li>Re-order with ease</li>
						<li>Add your favourite products to your Wish List</li>
						<li>Shop with great savings</li>
					</ul>
				</div>
				<br>
				<a href="<?php echo $login_url; ?>" style="padding:10px 20px;background-color:#ef4035;text-decoration:none;font-weight:bold;color:#fff;font-size:18px;" target="_blank">SHOP NOW</a>
			</td>
		</tr>
		
		<tr>
			<td>
				<div style="padding:20px 10px;border-top:2px solid #d6d6d6;border-bottom:2px solid #d6d6d6;font-size:14px;line-height:150%;">
					<?php echo $text_enquiries; ?>
				</div>
			</td>
		</tr>
		
		<tr>
			<td align="center">
				<div style="color:#666;font-weight:bold;font-size:20px;"><?php echo $text_social_title; ?></div>
				<ul style="list-style:none;padding:10px 0;">
					<li style="display:inline-block;"><a href="<?php echo $link_facebook; ?>" target="_blank" style="background-color:#3B5998;background-image:url(<?php echo $image_facebook; ?>);background-position:left center;background-repeat:no-repeat;padding:8px 0 8px 12px;text-decoration:none;color:#fff;width:108px;display:block;"><?php echo $text_social_facebook; ?></a></li>
					
					<li style="display:inline-block;"><a href="<?php echo $link_twitter; ?>" target="_blank" style="background-color:#4BB8E2;background-image:url(<?php echo $image_twitter; ?>);background-position:left center;background-repeat:no-repeat;padding:8px 0 8px 12px;text-decoration:none;color:#fff;width:108px;display:block;"><?php echo $text_social_twitter; ?></a></li>
        	    </ul>
				<div style="font-size:12px;font-weight:bold;"><?php echo $text_copyright; ?></div>
			</td>
		</tr>
	
	</tbody></table>
	
</div>

</body>

</html>
