<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<section id="content" class="columns op">
  <h1><?php echo $heading_title; ?></h1>
  <ul class="breadcrumbs">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php echo $content_top; ?>
  <?php if ($products) { ?>
  
  
  <div class="product-filter">
    <div class="display"><span><?php echo $text_display; ?></span>&nbsp;<img src="catalog/view/theme/oxy/image/icon_list.png" alt="<?php echo $text_list; ?>" title="<?php echo $text_list; ?>" />&nbsp;<a onclick="display('grid');"><img src="catalog/view/theme/oxy/image/icon_grid.png" alt="<?php echo $text_grid; ?>" title="<?php echo $text_grid; ?>" /></a></div>
    <div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>    
    <div class="limit"><?php echo $text_limit; ?>
      <select onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    <div class="sort"><?php echo $text_sort; ?>
      <select onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
  </div>
  
  
  
  <div class="product-grid clearfix">
    <?php foreach ($products as $product) { ?>
    <div class="<?php echo $this->config->get('oxy_layout_pb_noc'); ?> mobile-two columns">
      <?php if ($product['thumb']) { ?>
      <div class="image">
       <?php if (!isset($product['is_packed'])): ?>
          <?php if (($product['special'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="sale-icon"><?php echo $text_sale; ?></span><?php } ?> 
          <?php //[SB] Added promo icon
          if (($product['is_on_promo'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="promo-icon"><?php echo $text_promo; ?></span><?php } ?>
        <?php endif; ?>
         <!-- PACKED ICON -->
        <?php if (isset($product['is_packed'])&&$product['is_packed']): ?>
           <span class="sale-packed-icon">PACK OF <?php echo $product['no_bottles'];?></span>
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
	  <div class="expiry"><b><?php echo $text_expiry; ?></b><?php echo $product['date_expiry']; ?></div>
      <div class="description"><?php echo $product['description']; ?></div>
      <?php if ($product['price']) { ?>
      
	  <?php //[SB] Replaced price display style ?>
		<div class="price">
			<div class="vit-usual-price">
				<div class="vit-price vit-price-struck"><?php echo $product['price']; ?></div><div class="vit-badge"><?php echo $text_price_usual; ?></div>
			</div>
			
			<?php if ($product['special']) { ?>
			<div class="vit-sale-price">
				<div class="vit-price"><?php echo $product['special']; ?></div><div class="vit-badge"><?php echo $text_sale; ?></div>
			</div>
			<?php } else { ?>
				<div class="vit-sale-empty"> </div>
			<?php } ?> 

			<?php if ($product['premium_member_price']) { ?>
				<div class="vit-member-price">
					<div class="vit-price"><?php echo $product['premium_member_price']; ?></div><div class="vit-badge"><?php echo $text_price_member; ?></div>
				</div>
			<?php } ?>
		</div>
		
      <?php } ?>
      <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
    </div>
    <?php } ?>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php }?>
  <?php echo $content_bottom; ?></section>
  
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.total-storage.min.js"></script>
<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {

			html = '<div class="row">';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			}
			
			html += '<div class="six columns">';
			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
			html += '<div class="expiry">' + $(element).find('.expiry').html() + '</div>';
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}	
			
			html += '  <div class="description">' + $(element).find('.description').html() + '</div>';	
			
			html += '</div>';	
			
			html += '<div class="three columns">';
				
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
				html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			}				
			
			html += '</div>';			

			html += '</div>';
						
			$(element).html(html);
		});		
		
		$('.display').html('<span><?php echo $text_display; ?></span>&nbsp;<img src="catalog/view/theme/oxy/image/icon_list.png" alt="<?php echo $text_list; ?>" title="<?php echo $text_list; ?>" /><a onclick="display(\'grid\');">&nbsp;<img src="catalog/view/theme/oxy/image/icon_grid.png" alt="<?php echo $text_grid; ?>" title="<?php echo $text_grid; ?>" /></a>');
		
		$.totalStorage('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid > div').each(function(index, element) {
			html = '';
			
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			html += '<div class="expiry">' + $(element).find('.expiry').html() + '</div>';
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}	
			
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
						
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			
			$(element).html(html);
		});	
					
			$('.display').html('<span><?php echo $text_display; ?></span>&nbsp;<img src="catalog/view/theme/oxy/image/icon_list.png" alt="<?php echo $text_list; ?>" title="<?php echo $text_list; ?>" onclick="display(\'list\');"/>&nbsp;<img src="catalog/view/theme/oxy/image/icon_grid.png" alt="<?php echo $text_grid; ?>" title="<?php echo $text_grid; ?>"/><a onclick="display(\'list\');">');	
		
		$.totalStorage('display', 'grid');
	}
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('<?php echo $this->config->get('oxy_category_prod_display'); ?>');
}
//--></script> 
<?php echo $footer; ?>