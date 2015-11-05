<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<section id="content" class="columns"><?php echo $content_top; ?>
<!-- <h1><?php //[SB]Moved to below echo $heading_title; ?></h1> -->

  <div id="product-top">
  
  <div class="product-top-1">
  <div class="row">
  
  <div class="nine mobile-three columns">
  <ul class="breadcrumbs">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php /* [SB]Remove description */if(false) { ?>
  <div class="product-description">
    <?php if ($manufacturer) { ?>
    <div class="product-description-l"><span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></div>
    <?php } ?>
    <div class="product-description-l"><span><?php echo $text_model; ?></span> <?php echo $model; ?></div>
    <?php if ($reward) { ?>
    <div class="product-description-l"><span><?php //echo $text_reward; ?></span> <?php //echo $reward; ?><?php echo sprintf($text_reward, $reward); //[SB] Changed Vit$ Reward ?></div>
    <?php } ?> 
    <div class="product-description-l"><span><?php echo $text_stock; ?></span> <span class="stock"><?php echo $stock; ?></span></div>
  </div>
  <?php } ?>
  </div>
  
  <div class="three mobile-one columns">
    <div class="prev-next">
	  <?php if ($prev_prod_name) { ?>
		  <a href="<?php echo $prev_prod_url; ?>" class="product-prev">&nbsp;</a>
          <a href="<?php echo $prev_prod_url; ?>" class="product-prev-tip"><?php echo $prev_prod_name;?></a>
      <?php } ?>
	  <?php if ($next_prod_name) { ?>
		<a href="<?php echo $next_prod_url; ?>" class="product-next">&nbsp;</a>
        <a href="<?php echo $next_prod_url; ?>" class="product-next-tip"><?php echo $next_prod_name;?></a>
      <?php } ?>
	</div>  
  </div>
  
  </div>
  </div>  
  
  </div>
  
  <div class="product-info row">
    <?php if ($thumb || $images) { ?>
    
    <?php if(($this->config->get('oxy_layout_product_page')== 8) || ($this->config->get('oxy_layout_product_page')== 9) || ($this->config->get('oxy_layout_product_page')== 10)) { ?>
    <div class="product-left-image-additional one mobile-one columns">      
      <?php if($this->config->get('oxy_product_zoom_type')== 1) { ?>     
      <?php if ($images) { ?>
      <div class="image-additional-left">
        <?php foreach ($images as $image) { ?>
        <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox"> 
        <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php if($this->config->get('oxy_product_zoom_type')== 0) { ?>  
      <?php if ($images) { ?>
      <div class="image-additional-left">
        <a href='<?php echo $popup; ?>' title='<?php echo $heading_title; ?>' class='cloud-zoom-gallery' rel="useZoom: 'zoom1', smallImage: '<?php echo $thumb; ?>' ">
        <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt = "<?php echo $heading_title; ?>"/></a>  
        <?php foreach ($images as $image) { ?>
        <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery" rel="useZoom: 'zoom1', smallImage: '<?php echo $image['thumb']; ?>' ">
        <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>  
    </div>
    <?php } ?> 
    
    <?php if($this->config->get('oxy_layout_product_page')== 1) { ?>    
    <div class="product-left six mobile-four columns">
    <?php }
    if($this->config->get('oxy_layout_product_page')== 2) { ?>    
    <div class="product-left four mobile-four columns">
    <?php }
    if($this->config->get('oxy_layout_product_page')== 3) { ?>    
    <div class="product-left seven mobile-four columns">
    <?php }
    if($this->config->get('oxy_layout_product_page')== 4) { ?>  
    <div class="product-left twelve mobile-four columns">
    <?php }
    if($this->config->get('oxy_layout_product_page')== 5) { ?>  
    <div class="product-left four mobile-four columns">
    <?php }
    if($this->config->get('oxy_layout_product_page')== 6) { ?>  
    <div class="product-left three mobile-four columns">
    <?php }
    if($this->config->get('oxy_layout_product_page')== 7) { ?>  
    <div class="product-left five mobile-four columns">         
    <?php } 
    if($this->config->get('oxy_layout_product_page')== 8) { ?>  
    <div class="product-left six mobile-three columns">         
    <?php }   
    if($this->config->get('oxy_layout_product_page')== 9) { ?>  
    <div class="product-left four mobile-three columns">         
    <?php }     
    if($this->config->get('oxy_layout_product_page')== 10) { ?>  
    <div class="product-left four mobile-three columns">         
    <?php } ?>                       

      <?php if($this->config->get('oxy_product_zoom_type')== 1) { ?>     
      <?php if ($thumb) { ?>
      <div class="image">
      <?php if (($special)&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?>
      <span class="sale-icon"><?php echo $text_sale; ?></span>
      <?php } ?> 
      <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox">
      <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a></div>
      <?php } ?>
      <?php if(($this->config->get('oxy_layout_product_page')== 1) || ($this->config->get('oxy_layout_product_page')== 2) || ($this->config->get('oxy_layout_product_page')== 3) || ($this->config->get('oxy_layout_product_page')== 4) || ($this->config->get('oxy_layout_product_page')== 5) || ($this->config->get('oxy_layout_product_page')== 6) || ($this->config->get('oxy_layout_product_page')== 7)) { ?>
      <?php if ($images) { ?>
      <div class="image-additional">
        <?php foreach ($images as $image) { ?>
        <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox ia<?php echo $this->config->get('oxy_layout_product_page'); ?> mobile-one columns"> 
        <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php } ?>
      <?php if($this->config->get('oxy_product_zoom_type')== 0) { ?>  
      <?php if ($thumb) { ?>
      <div class="image">
      <?php if (($special)&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?>
      <span class="sale-icon"><?php echo $text_sale; ?></span>
      <?php } ?>        
      <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom" id='zoom1' rel="position:'inside', adjustX: 0, adjustY: 0, tint:'#ffffff', tintOpacity:0.1, smoothMove:3, showTitle:false">
	  <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a>
      <div class="zoom-b">
        <a id="zoom-cb" title="<?php echo $heading_title; ?>" class="swipebox" href="<?php echo $popup; ?>">Zoom</a>        
      </div>
      </div>
      <?php } ?>
      <?php if(($this->config->get('oxy_layout_product_page')== 1) || ($this->config->get('oxy_layout_product_page')== 2) || ($this->config->get('oxy_layout_product_page')== 3) || ($this->config->get('oxy_layout_product_page')== 4) || ($this->config->get('oxy_layout_product_page')== 5) || ($this->config->get('oxy_layout_product_page')== 6) || ($this->config->get('oxy_layout_product_page')== 7)) { ?>
      <?php if ($images) { ?>
      <div class="image-additional">
        <a href='<?php echo $popup; ?>' title='<?php echo $heading_title; ?>' class='cloud-zoom-gallery ia<?php echo $this->config->get('oxy_layout_product_page'); ?> mobile-one columns' rel="useZoom: 'zoom1', smallImage: '<?php echo $thumb; ?>' ">
        <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"/></a>  
        <?php foreach ($images as $image) { ?>
        <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery ia<?php echo $this->config->get('oxy_layout_product_page'); ?> mobile-one columns" rel="useZoom: 'zoom1', smallImage: '<?php echo $image['thumb']; ?>' ">
        <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php } ?>
      <div class="product-description-b">
        <?php if($this->config->get('oxy_product_viewed_status') ==1) { ?>
        <div class="product-description-l"><span><?php echo $text_product_viewed; ?></span> <?php echo $product_info['viewed']; ?></div>
        <?php } ?>    
      </div>
      
    </div>
    <?php } ?>
    
    <?php if($this->config->get('oxy_layout_product_page')== 1) { ?>    
    <div class="product-buy six mobile-four columns">
    <?php }
    if($this->config->get('oxy_layout_product_page')== 2) { ?>    
    <div class="product-buy eight mobile-four columns">
    <?php }
    if($this->config->get('oxy_layout_product_page')== 3) { ?>    
    <div class="product-buy five mobile-four columns">
    <?php }
    if($this->config->get('oxy_layout_product_page')== 4) { ?>  
    <div class="product-buy twelve mobile-four columns">
    <?php }
    if($this->config->get('oxy_layout_product_page')== 5) { ?>  
    <div class="product-buy five mobile-four columns">
    <?php }
    if($this->config->get('oxy_layout_product_page')== 6) { ?>  
    <div class="product-buy six mobile-four columns">
    <?php }
    if($this->config->get('oxy_layout_product_page')== 7) { ?>  
    <div class="product-buy four mobile-four columns">   
    <?php }
    if($this->config->get('oxy_layout_product_page')== 8) { ?>  
    <div class="product-buy five mobile-four columns">        
    <?php }   
    if($this->config->get('oxy_layout_product_page')== 9) { ?>  
    <div class="product-buy seven mobile-four columns">       
    <?php }     
    if($this->config->get('oxy_layout_product_page')== 10) { ?>  
    <div class="product-buy four mobile-four columns">        
    <?php } ?>         
    <h1><?php /*[SB]Moved from above */ echo $heading_title; ?></h1>
      <?php if ($price) { ?>
      <div class="price">
		<?php if (empty($redeem_only) || !$redeem_only) { //[SB] Added Redemption ?>
	  
			<?php if (!$special) { ?>
			<div class="product-details-price-original-price"><?php echo $price; ?></div>
			<div class="product-details-price-bulk-price"><a href="<?php echo $bulkpriceurl; ?>"><?php echo $bulkprice; ?></a></div>
			<?php /* [SB]Display Premium Member price */?>
				<?php if ($premium_member_price) { ?>
				<div class="product-details-price-block">
					<div class="product-details-member-price-tag">MEMBER PRICE</div>
					<span class="product-details-member-price"><?php echo $premium_member_price; ?></span>
					<?php if($this->config->get('oxy_product_save_percent_status') ==1) { ?>
					<div class="product-details-member-discount"><?php echo $premium_member_percent_savings; ?>% discount</div>
					
					<?php if ($reward) { //[SB] Changed to display rewards instead of points?>
						<div style='display:block;float:left;color:#dc911b;font-weight:bold;padding-left:5px;'><?php //echo $text_reward; ?> <?php //echo $reward; ?>+ <?php echo sprintf($text_reward, $reward); //[SB] Changed Vit$ Reward ?></div><br />
					<?php } ?>
					<?php }?>
				</div>
				<?php }?>
			<?php } else { ?>
				<div class="product-details-price-original-price"><?php echo $price; ?></div>
				<div class="product-details-price-bulk-price"><a href="<?php echo $bulkpriceurl; ?>"><?php echo $bulkprice; ?></a></div>
				<div class="clearfix">
				<div class="product-details-price-block">
					<div class="product-details-sale-price-tag">SALE PRICE</div>
					<span class="product-details-sale-price"><?php echo $special; ?></span>
					<?php if($this->config->get('oxy_product_save_percent_status') ==1) { ?>
					<div class="product-details-sale-discount"><?php echo $percent_savings; ?>% discount</div>
					<?php }?>
				</div>
			
				<?php /* [SB]Display Premium Member price */?>
				<?php if ($premium_member_price) { ?>
				<div class="product-details-price-block">
					<div class="product-details-member-price-tag">MEMBER PRICE</div>
					<span class="product-details-member-price"><?php echo $premium_member_price; ?></span>
					<?php if($this->config->get('oxy_product_save_percent_status') ==1) { ?>
					<div class="product-details-member-discount"><?php echo $premium_member_percent_savings; ?>% discount</div>
					<?php if ($reward) { //[SB] Changed to display rewards instead of points?>
						<div style='display:block;float:left;color:#dc911b;font-weight:bold;padding-left:5px;'><?php //echo $text_reward; ?> <?php //echo $reward; ?>+ <?php echo sprintf($text_reward, $reward); //[SB] Changed Vit$ Reward ?></div><br />
					<?php } ?>
					<?php }?>
				</div>
				<?php }?>
				</div>
			<?php }//.end else ?>
			<?php if($this->config->get('oxy_product_tax_status') ==1) { ?>
				<?php if ($tax) { ?>
					<div class="tax"><span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span></div>
				<?php } ?>
			<?php } ?>
			
			<?php if ($discounts) { ?>
			<br />
			<div class="discount">
			  <?php foreach ($discounts as $discount) { ?>
			  <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
			  <?php } ?>
			</div>
			<?php } ?>
			
		<?php } else { //[SB] Added Redemption ?>
			<div class="product-details-price-original-price" style="font-size:36px;"><?php echo sprintf($text_vit_dollar, $points); ?></div>
			<div class="product-details-price-bulk-price"><a href="<?php echo $bulkpriceurl; ?>"><?php echo $bulkprice; ?></a></div>
		<?php } ?>
		
      </div>
      <?php } ?>  
      
      <?php if ($review_status) { ?>
      <div class="review">
        <div class="review-stars"><img src="catalog/view/theme/oxy/image/stars/stars<?php echo $this->config->get('oxy_mid_prod_stars_color'); ?>-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" /></div>
        <div><a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $reviews; ?></a>
		
		<?php if($can_write_review) { //[SB] Added write review filter ?>
			&nbsp;&nbsp;|&nbsp;
			<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $text_write; ?></a>
		<?php } ?>
		
		</div>
      </div>
      <?php } ?>   
      
      <?php if ($profiles): ?>
      <div class="option">
          <h2><span class="required">*</span><?php echo $text_payment_profile ?></h2>
          <br />
          <select name="profile_id">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($profiles as $profile): ?>
              <option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>
              <?php endforeach; ?>
          </select>
          <br />
          <br />
          <span id="profile-description"></span>
          <br />
          <br />
      </div>
      <?php endif; ?>      
      <?php if ($options) { ?>
      <div class="options">
        <h5><?php echo $text_option; ?></h5>
        <br />
        <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <select name="option[<?php echo $option['product_option_id']; ?>]">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
            </option>
            <?php } ?>
          </select>
        </div>
        
        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
       
        <?php } ?>
        <?php if ($option['type'] == 'checkbox') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
        
        <?php } ?>
        <?php if ($option['type'] == 'image') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <table class="option-image">
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <tr>
              <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                </label></td>
            </tr>
            <?php } ?>
          </table>
        </div>
        
        <?php } ?>
        <?php if ($option['type'] == 'text') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
        </div>
        
        <?php } ?>
        <?php if ($option['type'] == 'textarea') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
        </div>
      
        <?php } ?>
        <?php if ($option['type'] == 'file') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
          <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
        </div>
        
        <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
        </div>
        
        <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
        </div>
       
        <?php } ?>
        <?php if ($option['type'] == 'time') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
        </div>
       
        <?php } ?>
        <?php } ?>
      </div>
      <?php } ?>
       <div class="cart">
        <div class="add-to-cart">
          <div id="qty-text"><?php echo $text_qty; ?></div>
          <?php if($this->config->get('oxy_product_i_c_status') ==1) { ?>   
          <div id="qty-dec"><input type="button" class="dec button" value=" " /></div>
          <?php } ?> 
          <div id="qty"><input type="text" name="quantity" size="3" class="i-d-quantity input-mini" value="<?php echo $minimum; ?>" /></div>
          <?php if($this->config->get('oxy_product_i_c_status') ==1) { ?>   
          <div id="qty-inc"><input type="button" class="inc button" value=" " /></div>
          <?php } ?> 
          <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="button-exclusive" />
        </div>
        <?php function curPageURL() {
          if (!empty($_SERVER['HTTPS'])) {
            $pref = 'https';
          } else {
            $pref = 'http';
          }
          $pageURL = $pref."://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
          return urlencode($pageURL);
        } ?>
        <div class="wishlist-compare-friend">  
        <div class="prod-wishlist" style='margin-right:5px;'><a onclick="addToWishList('<?php echo $product_id; ?>');"><span class="wishlist"></span><?php echo $button_wishlist; ?></a></div>
        <div class="prod-compare" style='margin-right:5px;'><a onclick="addToCompare('<?php echo $product_id; ?>');"><span class="compare"></span><?php echo $button_compare; ?></a></div> 
        <div class="prod-friend"><a href="mailto:enterfriend@addresshere.com?subject=<?php echo $heading_title; ?>&body=<?php echo $heading_title; ?>: <?php echo curPageURL(); ?>"><span class="friend"></span><?php echo $text_product_friend; ?></a></div>   
        </div>     
        <?php if ($minimum > 1) { ?>
        <div class="minimum"><?php echo $text_minimum; ?></div>
        <?php } ?>
        
    <div class="product-share">
    <!-- AddThis Button BEGIN -->
    <div class="addthis_toolbox addthis_default_style ">
    <a class="addthis_button_preferred_1"></a>
    <a class="addthis_button_preferred_2"></a>
    <a class="addthis_button_preferred_3"></a>
    <a class="addthis_button_preferred_4"></a>
    <a class="addthis_button_preferred_5"></a>
    <a class="addthis_button_preferred_6"></a>
    <a class="addthis_button_preferred_7"></a>
    <a class="addthis_button_preferred_8"></a>
    <a class="addthis_button_compact"></a>
    </div>
    <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js"></script>
    <!-- AddThis Button END -->
    </div>
        
      </div>
    </div>

    <?php if(($this->config->get('oxy_layout_product_page')== 5) || ($this->config->get('oxy_layout_product_page')== 6) || ($this->config->get('oxy_layout_product_page')== 7) || ($this->config->get('oxy_layout_product_page')== 10)) { ?>

	<?php //[SB] Display only when there is something to display
	if(!empty($manufacturer) || !empty($promotions) || !empty($clearance) || !empty($additional_info)) { ?>
	
		<div class="product-right-sm three columns"><?php //[SB] Removed hide-for-small ?>
			<?php //[MY]?>
			<?php if(!empty($promotions) || !empty($clearance)){?>
			<h3 style='border-bottom:1px solid #EAEAEA;'><?php echo $heading_promotions;?></h3>
			<?php }?>
			<?php if (!empty($promotions)) { ?>
				<div class="discount" style='margin-bottom:30px;'>
				  <?php foreach ($promotions as $promo) {?>
					<div class='float:left;'>
						<img src="<?php echo 'image/data/badge_promo.jpg'; ?>" alt="+" title="+" style='float:left;display:block;padding-right:5px;'>
						<div style='font-size:18px;font-weight:600;text-transform: uppercase;padding-top:10px;'><?php echo $promo['label']; ?></div>
						<div style='font-size:12px;font-weight:600;color:#dd8f1a;'><?php echo $text_limited;?></div>
					</div>
				  <?php } ?>
				</div>
				<?php if($clearance){?>
					 <img src="<?php echo 'image/data/badge_discount.jpg'; ?>" alt="+" title="+" style='float:left;display:block;padding-right:5px;'>
					 <div style='font-size:18px;font-weight:600;text-transform: uppercase;padding-top:10px;'><?php echo $text_clearance; ?></div>   
					 <div style='font-size:12px;font-weight:600;color:#dd8f1a;'><?php echo $text_limited;?></div>
				<?php }?>
			<?php } ?>
		<?php if ($manufacturer) { ?>    
			<h3 style='border-bottom:1px solid #EAEAEA;'><?php echo $heading_brand;?></h3>
			<?php if ($manufacturers_img) { ?>       
				<?php if($this->config->get('oxy_product_manufacturer_logo_status') ==1) { ?>
				<div class="product-right-sm-logo">
				<a href="<?php echo $manufacturers; ?>"><?php echo ($manufacturers_img) ? '<img src="'.$manufacturers_img.'" title="'.$manufacturers.'" />' : $manufacturers ;?></a>
				</div> 
			<?php } ?> 
		<?php }//.end manufacturer ?> 
		<?php } ?> 
		
		<?php //[SB] Add Additional Info
		if($additional_info) { ?>
			<div class="product-right-sm-additional_info"><?php echo $additional_info; ?></div> 
		<?php } ?>
		
    <?php } ?>
	
    <?php if($this->config->get('oxy_product_custom_status')== 1) { ?> 
    <?php if($oxy_product_custom_content) { ?>
    <div class="product-right-sm-custom">
    <?php echo htmlspecialchars_decode($oxy_product_custom_content); ?>          
    </div> 
    <?php } ?>
    <?php } ?> 
    
    <?php if(($oxy_product_fb1_title) || ($oxy_product_fb2_title) || ($oxy_product_fb3_title)) { ?>
    <div class="product-right-sm-info">
    
    <?php if($oxy_product_fb1_title) { ?>
    <div class="product-right-sm-info-content">
      <span class="p_icon">
        <?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	        $path_image = $this->config->get('config_ssl') . 'image/';
        } else {
        	$path_image = $this->config->get('config_url') . 'image/';
        }
        if ($this->config->get('oxy_product_fb1_icon') != ''){ ?>   
		<img src="<?php echo $path_image . $this->config->get('oxy_product_fb1_icon') ?>" alt="+" title="+">
        <?php } else { ?>
        <img src="catalog/view/theme/oxy/image/icons_feature_box/fbs_icon_1.png" alt="+" title="+">
		<?php } ?>
      </span>
    <span class="p_title"><a href="#" data-reveal-id="oxyprodModal1"><?php echo $oxy_product_fb1_title; ?></a></span>
    <?php if($oxy_product_fb1_subtitle) { ?>
    <span class="p_subtitle"><?php echo $oxy_product_fb1_subtitle; ?></span>
    <?php } ?>
    </div>
    <?php } ?>
    
    <?php if($oxy_product_fb2_title) { ?>
    <div class="product-right-sm-info-content">
      <span class="p_icon">
        <?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	        $path_image = $this->config->get('config_ssl') . 'image/';
        } else {
        	$path_image = $this->config->get('config_url') . 'image/';
        }
        if ($this->config->get('oxy_product_fb2_icon') != ''){ ?>   
		<img src="<?php echo $path_image . $this->config->get('oxy_product_fb2_icon') ?>" alt="+" title="+">
        <?php } else { ?>
        <img src="catalog/view/theme/oxy/image/icons_feature_box/fbs_icon_1.png" alt="+" title="+">
		<?php } ?>
      </span>
    <span class="p_title"><a href="#" data-reveal-id="oxyprodModal2"><?php echo $oxy_product_fb2_title; ?></a></span>
    <?php if($oxy_product_fb2_subtitle) { ?>
    <span class="p_subtitle"><?php echo $oxy_product_fb2_subtitle; ?></span>
    <?php } ?>
    </div>
    <?php } ?>
    
    <?php if($oxy_product_fb3_title) { ?>
    <div class="product-right-sm-info-content">
      <span class="p_icon">
        <?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	        $path_image = $this->config->get('config_ssl') . 'image/';
        } else {
        	$path_image = $this->config->get('config_url') . 'image/';
        }
        if ($this->config->get('oxy_product_fb3_icon') != ''){ ?>   
		<img src="<?php echo $path_image . $this->config->get('oxy_product_fb3_icon') ?>" alt="+" title="+">
        <?php } else { ?>
        <img src="catalog/view/theme/oxy/image/icons_feature_box/fbs_icon_1.png" alt="+" title="+">
		<?php } ?>
      </span>
    <span class="p_title"><a href="#" data-reveal-id="oxyprodModal3"><?php echo $oxy_product_fb3_title; ?></a></span>
    <?php if($oxy_product_fb3_subtitle) { ?>
    <span class="p_subtitle"><?php echo $oxy_product_fb3_subtitle; ?></span>
    <?php } ?>
    </div>
    <?php } ?>   
    
    </div>  
    <?php } ?>
 
<?php if ($product_tabs_4) { ?>
					<?php foreach($product_tabs_4 as $product_tab_4) { ?>
						<a href="#tab-product-tab<?php echo $product_tab_4['tab_id'];?>"><?php echo $product_tab_4['name']; ?></a>
					<?php } ?>
				<?php } ?>
<?php if ($products) { ?>
<?php if($this->config->get('oxy_product_related_status')== 1) { ?>  
<?php if($this->config->get('oxy_product_related_position')== 0) { ?>  
<?php if ($product_tabs_5) { ?>
					<?php foreach($product_tabs_5 as $product_tab_5) { ?>
						<a href="#tab-product-tab<?php echo $product_tab_5['tab_id'];?>"><?php echo $product_tab_5['name']; ?></a>
					<?php } ?>
				<?php } ?>
<div class="product-right-sm-related">
<h5><?php echo $tab_related; ?></h5>   
<script type="text/javascript">
	jQuery(function($) {
      $('.product-right-sm-related-flexslider').flexslider({
        animation: "slide",
        animationLoop: false,
		controlNav: false
       }); 	
	});
</script>
<div class="product-right-sm-related-flexslider carousel">       
   <ul class="slides">
    <?php foreach ($products as $product) { ?> 
    <li>
        <?php if ($product['thumb']) { ?>
        <div class="image"><?php if (($product['special'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="sale-icon"><?php echo $text_sale; ?></span><?php } ?>
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <div class="description-r"><?php echo $product['description']; ?></div>
        <?php if ($product['price']) { ?>
        <?php //[SB] Replaced price display style ?>
		<div class="price">
			<div class="vit-usual-price">
				<div class="vit-price"><?php echo $product['price']; ?></div><div class="vit-badge"><?php echo $text_price_usual; ?></div>
			</div>
			
			<?php if ($product['premium_member_price']) { ?>
				<div class="vit-member-price">
					<div class="vit-price"><?php echo $product['premium_member_price']; ?></div><div class="vit-badge"><?php echo $text_price_member; ?></div>
				</div>
			<?php } ?>
			
			<?php if ($product['special']) { ?>
			<div class="vit-sale-price">
				<div class="vit-price"><?php echo $product['special']; ?></div><div class="vit-badge"><?php echo $text_sale; ?></div>
			</div>
			<?php } else { ?>
				<div class="vit-sale-empty"> </div>
			<?php } ?> 
		</div>
        <?php } ?>
    </li>
    <?php } ?>
  </ul> 
</div>  
</div>    
<?php } ?>
<?php } ?>
<?php } ?>      

<?php if ($product_tabs_5) { ?>
					<?php foreach($product_tabs_5 as $product_tab_5) { ?>
						<div id="tab-product-tab<?php echo $product_tab_5['tab_id'];?>" class="tab-content"><?php echo $product_tab_5['text']; ?></div>
					<?php } ?>
				<?php } ?>
    <?php if ($tags) { ?>
    <div class="product-right-sm-tags">  
    <h5><?php echo $text_tags; ?></h5>
      <?php for ($i = 0; $i < count($tags); $i++) { ?>
      <?php if ($i < (count($tags) - 1)) { ?>
      <div><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></div>
      <?php } else { ?>
      <div><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></div>
      <?php } ?>
      <?php } ?>
    </div>
    <?php } ?>
   
    </div>
    <?php } ?> 
    
</div>    

  <div id="tabs" class="htabs"><?php if ($product_tabs_1) { ?>
					<?php foreach($product_tabs_1 as $product_tab_1) { ?>
						<a href="#tab-product-tab<?php echo $product_tab_1['tab_id'];?>"><?php echo $product_tab_1['name']; ?></a>
					<?php } ?>
				<?php } ?>
				<a href="#tab-description"><?php echo $tab_description; ?></a>
<?php if ($product_tabs_2) { ?>
					<?php foreach($product_tabs_2 as $product_tab_2) { ?>
						<a href="#tab-product-tab<?php echo $product_tab_2['tab_id'];?>"><?php echo $product_tab_2['name']; ?></a>
					<?php } ?>
				<?php } ?>
    <?php if ($attribute_groups) { ?>
    <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
    <?php } ?>
    <?php if ($review_status && !$redeem_only) { //[SB] Do not display reviews on Redemption ?>
    <a href="#tab-review"><?php echo $tab_review; ?></a>
    <?php } ?>
	
	<?php //[SB]Add Ask a Question ?>
	<a href="#tab-ask-a-question"><?php echo $tab_ask_a_question; ?></a>
	
    <?php if($this->config->get('oxy_product_custom_tab_1_status')== 1) { ?>
    <?php if ($oxy_product_custom_tab_1_content) { ?>   
    <a href="#tab-custom"><?php echo $oxy_product_custom_tab_1_title; ?></a>
    <?php } ?>
    <?php } ?>
    <?php if($this->config->get('oxy_product_custom_tab_2_status')== 1) { ?>
    <?php if ($oxy_product_custom_tab_2_content) { ?>   
    <a href="#tab-custom-2"><?php echo $oxy_product_custom_tab_2_title; ?></a>
    <?php } ?>
    <?php } ?> 
    <?php if($this->config->get('oxy_product_custom_tab_3_status')== 1) { ?>
    <?php if ($oxy_product_custom_tab_3_content) { ?>   
    <a href="#tab-custom-3"><?php echo $oxy_product_custom_tab_3_title; ?></a>
    <?php } ?>
    <?php } ?>  
  </div>
<?php if ($product_tabs_1) { ?>
					<?php foreach($product_tabs_1 as $product_tab_1) { ?>
						<div id="tab-product-tab<?php echo $product_tab_1['tab_id'];?>" class="tab-content"><?php echo $product_tab_1['text']; ?></div>
					<?php } ?>
				<?php } ?>
  <div id="tab-description" class="tab-content"><?php echo $description; ?></div>
<?php if ($product_tabs_2) { ?>
					<?php foreach($product_tabs_2 as $product_tab_2) { ?>
						<div id="tab-product-tab<?php echo $product_tab_2['tab_id'];?>" class="tab-content"><?php echo $product_tab_2['text']; ?></div>
					<?php } ?>
				<?php } ?>
  <?php if ($attribute_groups) { ?>
  <div id="tab-attribute" class="tab-content">
    <table class="attribute">
      <?php foreach ($attribute_groups as $attribute_group) { ?>
      <thead>
        <tr>
          <td colspan="2"><?php echo $attribute_group['name']; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
        <tr>
          <td><?php echo $attribute['name']; ?></td>
          <td><?php echo $attribute['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
      <?php } ?>
    </table>
  </div>
  <?php } ?>
<?php if ($product_tabs_3) { ?>
					<?php foreach($product_tabs_3 as $product_tab_3) { ?>
						<div id="tab-product-tab<?php echo $product_tab_3['tab_id'];?>" class="tab-content"><?php echo $product_tab_3['text']; ?></div>
					<?php } ?>
				<?php } ?>
  <?php if ($review_status && !$redeem_only) { //[SB] Do not display reviews on Redemption ?>
  <div id="tab-review" class="tab-content">
    <div id="review"></div>
	
	<?php if($can_write_review) { //[SB] Added write review filter ?>
		<h2 id="review-title"><?php echo $text_write; ?></h2>
		<b><?php echo $entry_name; ?></b><br />
		<input type="text" name="name" value="" />
		<br />

		<b><?php echo $entry_review; ?></b>
		<textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
		<span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
		<br />
		<b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
		<input type="radio" name="rating" value="1" />
		&nbsp;
		<input type="radio" name="rating" value="2" />
		&nbsp;
		<input type="radio" name="rating" value="3" />
		&nbsp;
		<input type="radio" name="rating" value="4" />
		&nbsp;
		<input type="radio" name="rating" value="5" />
		&nbsp;<span><?php echo $entry_good; ?></span><br />
		<br />
		<b><?php echo $entry_captcha; ?></b><br />
		<input type="text" name="captcha" value="" />
		<br />
		<img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
		<br />
		<div class="buttons">
		  <div class="right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
		</div>
	<?php } ?>
  </div>
  <?php } ?>
  
  <?php //[SB] Add Ask a Question ?>
  <div id="tab-ask-a-question" class="tab-content">
    <h2 id="ask-a-question-title"><?php echo $text_ask_a_question_title; ?></h2>
	<div id="ask-a-question-description"><?php echo $text_ask_a_question_description; ?></div>
	<br />
    <b><?php echo $entry_name; ?></b><br />
    <input type="text" name="ask-name" value="" />
    <br />
	<b><?php echo $entry_email; ?></b><br />
    <input type="text" name="ask-email" value="" />
    <br />

    <b><?php echo $entry_question; ?></b>
    <textarea name="ask-text" cols="40" rows="8" style="width: 98%;"></textarea>
    <span style="font-size: 11px;"><?php echo $text_note; ?></span><br /><br />
    
    <b><?php echo $entry_captcha; ?></b><br />
    <input type="text" name="ask-captcha" value="" />
    <br />
    <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
    <br />
    <div class="buttons">
      <div class="right"><a id="button-ask-a-question" class="button"><?php echo $button_continue; ?></a></div>
    </div>
  </div>
  
  <?php if($this->config->get('oxy_product_custom_tab_1_status')== 1) { ?> 
  <?php if ($oxy_product_custom_tab_1_content) { ?>  
  <div id="tab-custom" class="tab-content" style="display:block">
  <?php echo htmlspecialchars_decode($oxy_product_custom_tab_1_content); ?>
  </div>
  <?php } ?>
  <?php } ?> 
  <?php if($this->config->get('oxy_product_custom_tab_2_status')== 1) { ?> 
  <?php if ($oxy_product_custom_tab_2_content) { ?>  
  <div id="tab-custom-2" class="tab-content" style="display:block">
  <?php echo htmlspecialchars_decode($oxy_product_custom_tab_2_content); ?>
  </div>
  <?php } ?>
  <?php } ?> 
  <?php if($this->config->get('oxy_product_custom_tab_3_status')== 1) { ?> 
  <?php if ($oxy_product_custom_tab_3_content) { ?>  
  <div id="tab-custom-3" class="tab-content" style="display:block">
  <?php echo htmlspecialchars_decode($oxy_product_custom_tab_3_content); ?>
  </div>
  <?php } ?>
  <?php } ?>    

<?php if ($products) { ?>
<?php if($this->config->get('oxy_product_related_status')== 1) { ?>  
<?php if(($this->config->get('oxy_product_related_position')== 1)&&($this->config->get('oxy_product_related_style')== 1)) { ?>    
<div class="product-bottom-related">
<h2><?php echo $tab_related; ?></h2>   
<script type="text/javascript">
	jQuery(function($) {
      $('.product-bottom-related-flexslider').flexslider({
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
<div class="products-slider">       
<div class="product-bottom-related-flexslider carousel products-slider-slides">       
   <ul class="slides">
    <?php foreach ($products as $product) { ?> 
    <li>
        <?php if ($product['thumb']) { ?>
        <div class="image"><?php if (($product['special'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="sale-icon"><?php echo $text_sale; ?></span><?php } ?>
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <div class="cart">
        <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />
      </div>
    </li>
    <?php } ?>
  </ul> 
</div>  
</div> 
</div>
<?php } ?>
<?php } ?>
<?php } ?>     

  <?php if ($products) { ?>
  <?php if($this->config->get('oxy_product_related_status')== 1) { ?>  
  <?php if(($this->config->get('oxy_product_related_position')== 1)&&($this->config->get('oxy_product_related_style')== 0)) { ?>      
    <div class="box-heading"><?php echo $tab_related; ?></div>
    <div class="product-grid product-related-grid">   
    <?php foreach ($products as $product) { ?>
    <div class="<?php echo $this->config->get('oxy_layout_pb_noc'); ?> mobile-two columns">
    <div>
      <?php if ($product['thumb']) { ?>
      <div class="image">
      <?php if (($product['special'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="sale-icon"><?php echo $text_sale; ?></span><?php } ?> 
      <div class="flybar"> 
      <?php if ($product['rating']) { ?>
      <div class="rating"><img src="catalog/view/theme/oxy/image/stars/stars<?php echo $this->config->get('oxy_mid_prod_stars_color'); ?>-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
      <?php } ?>      
      <a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="wishlist"><div><?php echo $button_wishlist; ?></div></a>
      <a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="wishlist-tip" title="<?php echo $button_wishlist; ?>"><div><?php echo $button_wishlist; ?></div></a>
      <a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="compare"><div><?php echo $button_compare; ?></div></a>
      <a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="compare-tip" title="<?php echo $button_compare; ?>"><div><?php echo $button_compare; ?></div></a>
      </div>
      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
      </div>
      <?php } ?>     
      <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
      <div class="description"><?php echo $product['description']; ?></div>
      <?php if ($product['price']) { ?>
      <?php //[SB] Replaced price display style ?>
            <div class="price">
			
				<div class="vit-usual-price">
						<div class="vit-price"><?php echo $product['price']; ?></div><div class="vit-badge"><?php echo $text_price_usual; ?></div>
				</div>

				<?php if ($product['premium_member_price']) { ?>
						<div class="vit-member-price">
								<div class="vit-price"><?php echo $product['premium_member_price']; ?></div><div class="vit-badge"><?php echo $text_price_member; ?></div>
						</div>
				<?php } ?>

				<?php if ($product['special']) { ?>
				<div class="vit-sale-price">
						<div class="vit-price"><?php echo $product['special']; ?></div><div class="vit-badge"><?php echo $text_sale; ?></div>
				</div>
				<?php } else { ?>
						<div class="vit-sale-empty"> </div>
				<?php } ?>
				
            </div>
      <?php } else if (empty($product['redeem_only']) || !$product['redeem_only']) { //[SB] Added Redemption ?>
			<div class="vit-usual-price">
				<div class="vit-price"><?php echo $text_vit_dollar . $product['points']; ?></div>
			</div>
	<?php } ?>
	  	  
      <div class="cart">
        <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />
      </div>
    </div>
    </div>
    <?php } ?>
    </div>
  <?php } ?>
  <?php } ?>
  <?php } ?>
  
   <?php if(($this->config->get('oxy_layout_product_page')== 1) || ($this->config->get('oxy_layout_product_page')== 2) || ($this->config->get('oxy_layout_product_page')== 3) || ($this->config->get('oxy_layout_product_page')== 4) || ($this->config->get('oxy_layout_product_page')== 8) || ($this->config->get('oxy_layout_product_page')== 9)) { ?>
   <div class="product-right-sm-tags hide-for-small" style="margin-bottom:30px;">  
    <h5><?php echo $text_tags; ?></h5>
      <?php for ($i = 0; $i < count($tags); $i++) { ?>
      <?php if ($i < (count($tags) - 1)) { ?>
      <div><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></div>
      <?php } else { ?>
      <div><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></div>
      <?php } ?>
      <?php } ?>
    </div>   
   <?php } ?>  
   
<?php if ($product_tabs_5) { ?>
					<?php foreach($product_tabs_5 as $product_tab_5) { ?>
						<div id="tab-product-tab<?php echo $product_tab_5['tab_id'];?>" class="tab-content"><?php echo $product_tab_5['text']; ?></div>
					<?php } ?>
				<?php } ?>
   <?php if ($tags) { ?>
    <div class="product-right-sm-tags show-for-small" style="margin-bottom:30px;">  
    <h5><?php echo $text_tags; ?></h5>
      <?php for ($i = 0; $i < count($tags); $i++) { ?>
      <?php if ($i < (count($tags) - 1)) { ?>
      <div><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></div>
      <?php } else { ?>
      <div><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></div>
      <?php } ?>
      <?php } ?>
    </div>
    <?php } ?>   
  
  <?php echo $content_bottom; ?></section>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: "colorbox"
	});
});
//--></script> 
<script type="text/javascript"><!--

$('select[name="profile_id"], input[name="quantity"]').change(function(){
    $.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
		dataType: 'json',
        beforeSend: function() {
            $('#profile-description').html('');
        },
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
            
			if (json['success']) {
                $('#profile-description').html(json['success']);
			}	
		}
	});
});
    
$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			

			if (json['error']) {
				if (json['error']['warning']) {
					$('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/oxy/image/close.png" alt="" class="close" /></div>');
				
					$('.warning').fadeIn('slow');
				}
				
				for (i in json['error']) {
					$('#option-' + i).after('<span class="error">' + json['error'][i] + '</span>');
				}
			}	 
            
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
                
                if (json['error']['profile']) {
                    $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
                }
			} 
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
				$('.success').fadeIn('slow');
					
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
	
	//[KianAnn] track add to cart in GA
	ga('sainhall_tracker.send', 'pageview', '/index.php?route=checkout/cart/add');

});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		

			if (json['error']) {
				if (json['error']['warning']) {
					$('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/oxy/image/close.png" alt="" class="close" /></div>');
				
					$('.warning').fadeIn('slow');
				}
				
				for (i in json['error']) {
					$('#option-' + i).after('<span class="error">' + json['error'][i] + '</span>');
				}
			}	 
            
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
//[SB] Added Ask a Question
$('#button-ask-a-question').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/ask&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'ask-name=' + encodeURIComponent($('input[name=\'ask-name\']').val()) + '&ask-text=' + encodeURIComponent($('textarea[name=\'ask-text\']').val()) + '&ask-email=' + encodeURIComponent($('input[name=\'ask-email\']').val()) + '&ask-captcha=' + encodeURIComponent($('input[name=\'ask-captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-ask-a-question').attr('disabled', true);
			$('#ask-a-question-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-ask-a-question').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#ask-a-question-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#ask-a-question-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'ask-name\']').val('');
				$('textarea[name=\'ask-text\']').val('');
				$('input[name=\'ask-email\']').val('');
				$('input[name=\'ask-captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'h:m'
	});
	$('.time').timepicker({timeFormat: 'h:m'});
});
//--></script> 
<?php echo $footer; ?>
