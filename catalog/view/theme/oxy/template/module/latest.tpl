<?php if($this->config->get('oxy_homepage_latest_status')== 0) { ?>
<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-product">
      <?php foreach ($products as $product) { ?>
      <div class="<?php echo $this->config->get('oxy_layout_pb_noc'); ?> mobile-two columns">
        <?php if ($product['thumb_swap']) { ?>
        <div class="image">
        <?php if (($product['special'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="sale-icon"><?php echo $text_sale; ?></span><?php } ?> 
        <a href="<?php echo $product['href']; ?>"><img oversrc="<?php echo $product['thumb_swap']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
        </div>
        <?php } else {?>
        <div class="image">
        <?php if (($product['special'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="sale-icon"><?php echo $text_sale; ?></span><?php } ?> 
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
        </div>
        <?php } ?> 
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/oxy/image/stars/stars<?php echo $this->config->get('oxy_mid_prod_stars_color'); ?>-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>        
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
      </div>
      <?php } ?>
    </div>
  </div>
</div>
<?php } ?>

<?php if($this->config->get('oxy_homepage_latest_status')== 1) { ?>
<div class="product-box-slider">
<div class="box-heading"><?php echo $heading_title; ?></div>
<script type="text/javascript">
	jQuery(function($) {
      $('.product-box-slider-flexslider').flexslider({
        animation: "slide",
        animationLoop: false,
		slideshow: false,  
		controlNav: false,
		itemWidth: 188,
		maxItems: 6,
		minItems: 1
       }); 	
	});
</script>
<div class="products-slider box-content">       
<div class="product-box-slider-flexslider products-slider-slides">       
   <ul class="slides">
    <?php foreach ($products as $product) { ?>
    <li>
        <?php if ($product['thumb_swap']) { ?>
        <div class="image">
        <?php if (($product['special'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="sale-icon"><?php echo $text_sale; ?></span><?php } ?> 
        <a href="<?php echo $product['href']; ?>"><img oversrc="<?php echo $product['thumb_swap']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
        </div>
        <?php } else {?>
        <div class="image">
        <?php if (($product['special'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="sale-icon"><?php echo $text_sale; ?></span><?php } ?> 
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
        </div>
        <?php } ?> 
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/oxy/image/stars/stars<?php echo $this->config->get('oxy_mid_prod_stars_color'); ?>-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>        
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
    </li>
    <?php } ?>
  </ul> 
</div>  
</div> 
</div>
<?php } ?>