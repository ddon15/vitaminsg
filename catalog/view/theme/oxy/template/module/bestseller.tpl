<?php if($this->config->get('oxy_homepage_bestseller_status')== 0) { ?>
<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-product">
      <?php foreach ($products as $product) { ?>
      <div class="<?php echo $this->config->get('oxy_layout_pb_noc'); ?> mobile-two columns">
        <?php if ($product['thumb_swap']) { ?>
        <div class="image">
        <?php if ((!$product['is_packed']&&$product['special'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="sale-icon"><?php echo $text_sale; ?></span><?php } ?>
        <?php if ($product['is_packed']): ?>
          <span class="sale-packed-icon">PACK OF <?php echo $product['no_bottles'] . ', SAVE $';?></span>
        <?php endif; ?>
		<?php //[SB] Added promo icon
		if (($product['is_on_promo'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="promo-icon"><?php echo $text_promo; ?></span><?php } ?>
        <a href="<?php echo $product['href']; ?>"><img oversrc="<?php echo $product['thumb_swap']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
        </div>
        <?php } else {?>
        <div class="image">
        <?php if ((!$product['is_packed']&&$product['special'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="sale-icon"><?php echo $text_sale; ?></span><?php } ?>
        <?php if ($product['is_packed']): ?>
          <span class="sale-packed-icon">PACK OF <?php echo $product['no_bottles'] . ', SAVE $';?></span>
        <?php endif; ?>
		<?php //[SB] Added promo icon
		if (($product['is_on_promo'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="promo-icon"><?php echo $text_promo; ?></span><?php } ?>
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
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
  </div>
</div>
<?php } ?>

<?php if($this->config->get('oxy_homepage_bestseller_status')== 1) { ?>
<div class="product-box-slider">
<div class="box-heading"><?php echo $heading_title; ?></div>
<?php //[SB] Tweaked itemWidth to 178 from 188 to cater for right margin
// Added itemMargin for correct calculation ?>
<script type="text/javascript">
	jQuery(function($) {
      $('#slider1').flexslider({
        animation: "slide",
        animationLoop: false,
        slideshow: false,
        controlNav: true,
        directionNav: false,
        itemWidth: 178,
        itemMargin: 10,
        maxItems: 6,
        minItems: 1,
        controlsContainer: ".control-page.best",
        manualControls: ".control-page.best .total-page b"
       });
    });
</script>
<div class="products-slider box-content">       
<div class="product-box-slider-flexslider products-slider-slides" id="slider1">
   <ul class="slides">
       <?php $total_items = 0; ?>
    <?php foreach ($products as $product) { ?>
    <li>
        <?php $total_items +=1; ?>
        <?php if ($product['thumb_swap']) { ?>
        <div class="image">
        <?php if ((!product['is_packed']&&$product['special'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="sale-icon"><?php echo $text_sale; ?></span><?php } ?>
        <?php if ($product['is_packed']): ?>
          <span class="sale-packed-icon">PACK OF <?php echo $product['no_bottles'] . ', SAVE $';?></span>
        <?php endif; ?>
		<?php //[SB] Added promo icon
		if (($$product['is_on_promo'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="promo-icon"><?php echo $text_promo; ?></span><?php } ?>
        <a href="<?php echo $product['href']; ?>"><img oversrc="<?php echo $product['thumb_swap']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
        </div>
        <?php } else { ?>
        <div class="image">
        <?php if ((!$product['is_packed']&&$product['special'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="sale-icon"><?php echo $text_sale; ?></span><?php } ?> 
        <?php if ($product['is_packed']): ?>
          <span class="sale-packed-icon">PACK OF <?php echo $product['no_bottles'] . ', SAVE $';?></span>
        <?php endif; ?>
		<?php //[SB] Added promo icon
		if (($product['is_on_promo'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="promo-icon"><?php echo $text_promo; ?></span><?php } ?>
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
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
    </li>
    <?php } ?>
  </ul>
</div>
<div class="control-page best">
<div class="text-page">
    <?php echo"<p>Pages:&nbsp</p>"; ?>
</div>
<div class="total-page">
    <?php $max_items=6; ?>
    <?php $total_pages = ceil($total_items/$max_items); ?>
    <?php if($total_pages) { ?>
        <?php for($i=1; $i<=$total_pages; $i++) {
            echo "<b>".$i."</b>";
        }
        ?>
    <?php } ?>
</div>
</div>
</div>
<?php } ?>