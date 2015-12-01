<div class="price">
	<?php if(empty($product['redeem_only']) || !$product['redeem_only']) { ?>
		
		<div class="vit-usual-price">
			<div class="vit-price <?php echo (!$product['special'] && !$product['is_on_promo']) ? '' : 'vit-price-struck'; ?>"><?php echo $product['price']; ?></div><div class="vit-badge"><?php echo $text_price_usual; ?></div>
		</div>
		
		<?php if ($product['special']) { ?>
		<div class="vit-sale-price">
			<div class="vit-price"><?php echo $product['special']; ?></div><div class="vit-badge"><?php echo $text_sale; ?></div>
		</div>
		<?php } else if ($product['is_on_promo']) { ?>
		<a href="<?php echo $product['href']; ?>">VIEW OFFER</a>
		<?php } else { ?>
			<div class="vit-sale-empty"> </div>
		<?php } ?>

		<?php if ($product['premium_member_price']) { ?>
			<div class="vit-member-price">
				<div class="vit-price"><?php echo $product['premium_member_price']; ?></div><div class="vit-badge"><?php echo $text_price_member; ?></div>
			</div>
		<?php } ?>
	<?php } else { ?>
		<div class="vit-usual-price">
			<div class="vit-price"><?php echo sprintf($text_vit_dollar, $product['points']); ?></div>
		</div>
	<?php } ?>
</div>