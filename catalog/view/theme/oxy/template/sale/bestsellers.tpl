<?php echo $header; ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<section id="content" class="columns op">
<?php echo $content_top; ?>
<h1><?php echo $heading_title; ?></h1>
  <ul class="breadcrumbs">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  
  <div class="product-grid clearfix">
    <?php foreach ($products as $product) { ?>
    <div class="overflow-hidden <?php echo $this->config->get('oxy_layout_pb_noc'); ?> mobile-two columns">
      <?php if ($product['thumb']) { ?>
      <div class="image">
        <?php if (!$product['is_packed']): ?>
          <?php if (($product['special'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="sale-icon"><?php echo $text_sale; ?></span><?php } ?> 
          <?php //[SB] Added promo icon
          if (($product['is_on_promo'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="promo-icon"><?php echo $text_promo; ?></span><?php } ?>
        <?php endif; ?>
        <!-- PACKED ICON -->
        <?php if ($product['is_packed']): ?>
          <span class="sale-packed-icon">PACK OF <?php echo $product['no_bottles'] . 'SAVE $';?></span>
        <?php endif; ?>
      <div class="flybar">     
      <a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="wishlist"><div><?php echo $button_wishlist; ?></div></a>
      <a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="wishlist-tip" title="<?php echo $button_wishlist; ?>"><div><?php echo $button_wishlist; ?></div></a>
      <a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="compare"><div><?php echo $button_compare; ?></div></a>
      <a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="compare-tip" title="<?php echo $button_compare; ?>"><div><?php echo $button_compare; ?></div></a>
      </div>
      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
      </div>
      <?php } ?>
      <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
      <?php //[SB] Removed ratings ?>
      <?php if ($product['price']) { ?>
     
		<?php //[SB] Replaced price display style
			include 'catalog/view/theme/oxy/template/common/price_display.tpl';
		?>
	 
      <?php } ?>
      <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
    </div>
    <?php } ?>
  </div>
  
  <div class="divider"> </div>
  
<?php echo $content_bottom; ?>
</section> <!-- end #content -->
<?php echo $footer; ?>