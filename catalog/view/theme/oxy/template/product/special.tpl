<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<section id="content" class="columns op"><?php echo $content_top; ?>
  <h1><?php echo $heading_title; ?></h1><br>
  
  <?php //kianann's ugly code - pls delete this segment after 19 April 2015 ?>
  <?php if ((date("Y-m-d") >= '2015-04-16') && (date("Y-m-d") <= '2015-04-18')): ?>
  <div style="border: 2px solid #d00; background-color: #fee; font-weight: bold; padding: 15px 10px; margin-bottom: 5px; text-align: center; color: #d00; "><a style='color: #d00; font-size: 1.2em; text-decoration: underline' href="http://www.vitamin.sg/c/7th-anniversary" target="_blank">3 DAYS ONLY: Click Here to Get a Free 1-Year Vitamin.sg Membership Worth $35!</a></div>
  <?php endif; ?>
  
  
    <div class="pagination" id="top_page"><?php echo $pagination; ?></div><br><br>
  <ul class="breadcrumbs">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
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
  <div class="product-list">
    <?php foreach ($products as $product) { ?>
    <div class="overflow-hidden <?php echo $this->config->get('oxy_layout_pb_noc'); ?> mobile-two columns">
      <?php if ($product['thumb']) { ?>
      <div class="image ribbon-wrapper">
        <?php if (!$product['is_packed']): ?>
          <?php if (($product['special'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="sale-icon"><?php echo $text_sale; ?></span><?php } ?> 
          <?php //[SB] Added promo icon
          if (($product['is_on_promo'])&&($this->config->get('oxy_category_sale_badge_status') == 1)) { ?><span class="promo-icon"><?php echo $text_promo; ?></span><?php } ?>
        <?php endif; ?>
        <?php if ($product['is_packed']): ?>
          <div class="ribbon-wrapper-green">
            <div class="ribbon-green">
              <span class="ribbon-save-text">SAVE $</span>  </br>
              <?php echo $product['no_bottles']. ' Pack'; ?> 
            </div>
          </div>
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
      <?php //[SB] Removed ratings, added brands ?> 
	  <div class="product_box_brand"><?php if ($product['brand']) { ?><span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $product['brand_url']; ?>"><?php echo $product['brand']; ?></a><?php } ?></div>
      <div class="description"><?php echo $product['description']; ?></div>
      <?php if ($product['price']) { ?>
      	  
		<?php //[SB] Replaced price display style
			include 'catalog/view/theme/oxy/template/common/price_display.tpl';
		?>
		
      <?php } ?>
      <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
      <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a></div>
      <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a></div>
    </div>
    <?php } ?>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php }?>
  <?php echo $content_bottom; ?></section>
<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {

			html = '<div class="row">';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image ribbon-wrapper">' + image + '</div>';
			}
			
			html += '<div class="six columns">';
			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
			//[SB] Added brands
			html += '<div class="product_box_brand">' + $(element).find('.product_box_brand').html() + '</div>';
			
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
				html += '<div class="image ribbon-wrapper">' + image + '</div>';
			}
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			//[SB] Added brands
			html += '<div class="product_box_brand">' + $(element).find('.product_box_brand').html() + '</div>';
			
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