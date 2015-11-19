<!DOCTYPE html>
<!--[if IE 7]>                  <html class="ie7 no-js"  dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>"     <![endif]-->
<!--[if lte IE 8]>              <html class="ie8 no-js"  dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>"     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="not-ie no-js" dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">  <!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/oxy/stylesheet/foundation.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/oxy/stylesheet/stylesheet.css" />
<?php if($this->config->get('oxy_layout_s') =='1') { ?>	
<link rel="stylesheet" type="text/css" href="catalog/view/theme/oxy/stylesheet/stylesheet-small-screens.css" />
<?php }	
if($this->config->get('oxy_layout_l') =='2') { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/oxy/stylesheet/stylesheet-large-screens.css" />
<?php }	
if($this->config->get('oxy_layout_l') =='3') { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/oxy/stylesheet/stylesheet-very-large-screens.css" />
<?php } ?>
<?php if($this->config->get('oxy_others_totop') =='1') { ?>	
<link rel="stylesheet" type="text/css" href="catalog/view/theme/oxy/stylesheet/ui.totop.css" media="screen" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/oxy/stylesheet/tipTip.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/oxy/stylesheet/cloud-zoom.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/oxy/stylesheet/elastic_slideshow.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/common.js?r=<?php echo time(); ?>"></script>
<script type="text/javascript" src="catalog/view/theme/oxy/js/common.js"></script>
<script type="text/javascript" src="catalog/view/theme/oxy/js/jquery.foundation.reveal.js"></script>
<?php if($this->config->get('oxy_category_prod_swap_status') ==1) { ?>
<script type="text/javascript" src="catalog/view/theme/oxy/js/simpleswap.js"></script>
<?php } ?>
<script type="text/javascript" src="catalog/view/theme/oxy/js/jquery.swipebox.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/oxy/stylesheet/swipebox.css" />
<?php if($this->config->get('oxy_homepage_banner_slider_type') ==1) { ?>
<script type="text/javascript" src="catalog/view/theme/oxy/js/camera.js"></script>
<?php } ?>
<script type="text/javascript" src="catalog/view/theme/oxy/js/jquery.flexslider-min.js"></script>
<?php if($this->config->get('oxy_homepage_banner_slider_type') ==3) { ?>
<script type="text/javascript" src="catalog/view/theme/oxy/js/jquery.nivo.slider.pack.js"></script>
<?php } ?>
<script type="text/javascript" src="catalog/view/theme/oxy/js/revolution/jquery.themepunch.plugins.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/oxy/js/revolution/jquery.themepunch.revolution.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/oxy/stylesheet/rs-plugin/css/settings.css" media="screen" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/oxy/stylesheet/rs-plugin/css/oxy-revo.css" media="screen" />
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<script> document.createElement('header'); document.createElement('section'); document.createElement('article'); document.createElement('aside'); document.createElement('nav'); document.createElement('footer'); </script>
<?php //[SB] Add custom stylesheet ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/oxy/stylesheet/vitaminsg.css?ver=1.05" />
<!--[if lt IE 9]> 
<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script> 
<![endif]--> 
<!--[if IE 8]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/oxy/stylesheet/ie8.css" />
<![endif]-->
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/oxy/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/oxy/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php if($this->config->get('oxy_status') =='1') { ?>	
<style type="text/css">
/*  Body background color and pattern  */
body {
<?php if($this->config->get('oxy_body_bg_color') !='') { ?>
	background-color: <?php echo $this->config->get('oxy_body_bg_color'); ?>;
<?php }	
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $this->config->get('config_ssl') . 'image/';
} else {
	$path_image = $this->config->get('config_url') . 'image/';
}
if($this->config->get('oxy_bg_image_custom') !='') { ?>
	background-image: url("<?php echo $path_image . $this->config->get('oxy_bg_image_custom') ?>"); ?>;
<?php } else if($this->config->get('oxy_pattern_oxy') !='') { ?>
	background-image: url("catalog/view/theme/oxy/image/patterns/p<?php echo $this->config->get('oxy_pattern_oxy'); ?>.png");
<?php } else { ?>
	background-image: none;
<?php } 
if(($this->config->get('oxy_bg_image_position') !='') || ($this->config->get('oxy_bg_image_repeat') !='') || ($this->config->get('oxy_bg_image_attachment') !='')) { ?>
	background-position: <?php echo $this->config->get('oxy_bg_image_position'); ?>;
	background-repeat: <?php echo $this->config->get('oxy_bg_image_repeat'); ?>;
	background-attachment: <?php echo $this->config->get('oxy_bg_image_attachment'); ?>;
<?php } ?>
}
/*  Headings color  */
h1, h2, h3, h4, h5, h6, #content .box-heading {color: <?php echo $this->config->get('oxy_headings_color'); ?>;}
/*  Body text color  */
body, .cart-info thead td, .checkout-product thead td, table tbody tr td, .wishlist-info thead td, .sitemap-info ul li ul li, .sitemap-info ul li ul li a, .product-grid .name a, #content .box-product .name a, .product-list .name a, .product-info .wishlist-compare-friend a, .product-bottom-related .name a, .product-box-slider .name a, .product-right-sm-info span.p_title a, .box-category-home .subcat a, .product-compare a, .product-info .review > div a, .mini-cart-info .name small, .mini-cart-info td, .mini-cart-total td {color: <?php echo $this->config->get('oxy_body_text_color'); ?>;}
/*  Light text color  */
.heading h5, .product_box_brand span, .product_box_brand a, .product-description-l, .product-description-l span, .product-description-l a, ul.breadcrumbs li:before, .product-info .cart .minimum, .product-info .you-save, .product-right-sm-info span.p_subtitle, .articleHeader span, .updateInfo, .commentList li .created, #comments .pagination, #commentRespond .note, .blogModule .info {color: <?php echo $this->config->get('oxy_light_text_color'); ?>;}
/*  Links color  */
a, .box ul li, .product-info .save-percent, #product-top .product-description .product-description-l span.stock, .commentList li .name, .commentList li .name a {color: <?php echo $this->config->get('oxy_other_links_color'); ?>;}
#menu_contacts .mc:hover span.mm_icon, .product-info .cart .dec:hover, .product-info .cart .inc:hover, .contact-info .mc:hover span.mm_icon, #footer_a .mc:hover span.mm_icon, .es-nav span:hover, .product-related .bx-wrapper div.bx-next:hover, .product-related .bx-wrapper div.bx-prev:hover, #toTopHover, .product-right-sm-info span.p_icon, #livesearch_search_results li:hover, #livesearch_search_results .highlighted, #swipebox-action, .top-bar ul > li a:hover {background-color: <?php echo $this->config->get('oxy_other_links_color'); ?>;}
/*  Links hover color  */
a:hover, .product-info .review > div a:hover, .sitemap-info ul li ul li:hover, .sitemap-info ul li ul li a:hover, .htabs a:hover, #header #cart:hover .heading a div#cart-total, .product-grid .name a:hover, #content .box-product .name a:hover, .product-list .name a:hover, .product-info .wishlist-compare-friend a:hover, .product-bottom-related .name a:hover, .product-right-sm-info span.p_title a:hover, .box-category-home .subcat a:hover {color: <?php echo $this->config->get('oxy_links_hover_color'); ?>;}
.product-right-sm-info .product-right-sm-info-content:hover span.p_icon, .camera_wrap .camera_pag .camera_pag_ul li:hover > span, .flex-control-paging li a:hover, #swipebox-action:hover, .tp-bullets.simplebullets.round .bullet:hover {background-color: <?php echo $this->config->get('oxy_links_hover_color'); ?>;}
/*  General icons style  */
.product-list .wishlist, .product-grid .wishlist {background: url("catalog/view/theme/oxy/image/oxy-wishlist-<?php echo $this->config->get('oxy_general_icons_style'); ?>.png") no-repeat scroll center transparent;}
.product-list .compare, .product-grid .compare {background: url("catalog/view/theme/oxy/image/oxy-compare-<?php echo $this->config->get('oxy_general_icons_style'); ?>.png")  no-repeat scroll center transparent;}
span.wishlist {background: url("catalog/view/theme/oxy/image/oxy-wishlist-<?php echo $this->config->get('oxy_general_icons_style'); ?>.png") no-repeat scroll left center transparent;}
span.compare {background: url("catalog/view/theme/oxy/image/oxy-compare-<?php echo $this->config->get('oxy_general_icons_style'); ?>.png") no-repeat scroll left center transparent;}
span.friend {background: url("catalog/view/theme/oxy/image/oxy-send-<?php echo $this->config->get('oxy_general_icons_style'); ?>.png") no-repeat scroll left center transparent;}
/*  Main Column  */
.wrapper {
<?php if(($this->config->get('oxy_main_column_bg_color') !='') && ($this->config->get('oxy_main_column_status') ==1)) { ?>
	background-color: <?php echo $this->config->get('oxy_main_column_bg_color'); ?>;
<?php }	
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $this->config->get('config_ssl') . 'image/';
} else {
	$path_image = $this->config->get('config_url') . 'image/';
}
if($this->config->get('oxy_bg_image_mc_custom') !='') { ?>
	background-image: url("<?php echo $path_image . $this->config->get('oxy_bg_image_mc_custom') ?>"); ?>;
<?php } else if($this->config->get('oxy_pattern_oxy_mc') !='') { ?>
	background-image: url("catalog/view/theme/oxy/image/patterns/p<?php echo $this->config->get('oxy_pattern_oxy_mc'); ?>.png");
<?php } else { ?>
	background-image: none;
<?php } 
if(($this->config->get('oxy_bg_image_mc_position') !='') || ($this->config->get('oxy_bg_image_mc_repeat') !='') || ($this->config->get('oxy_bg_image_mc_attachment') !='')) { ?>
	background-position: <?php echo $this->config->get('oxy_bg_image_mc_position'); ?>;
	background-repeat: <?php echo $this->config->get('oxy_bg_image_mc_repeat'); ?>;
	background-attachment: <?php echo $this->config->get('oxy_bg_image_mc_attachment'); ?>;
<?php } 
if($this->config->get('oxy_main_column_border_status') ==1) { ?>
	border: <?php echo $this->config->get('oxy_main_column_border_size'); ?>px <?php echo $this->config->get('oxy_main_column_border_style'); ?> <?php echo $this->config->get('oxy_main_column_border_color'); ?>;
<?php } 
if($this->config->get('oxy_main_column_shadow') ==1) { ?>
	box-shadow: 0 1px 3px rgba(0,0,0,0.2); -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.2); -moz-box-shadow:0 1px 3px rgba(0,0,0,0.2);
<?php } ?>
}
/*  Content Column  */
.product-filter, #content .content, .cart-info thead td, .checkout-heading, .checkout-product thead td, table.list thead td, .compare-info thead td, .compare-info thead tr td:first-child, .attribute thead td, .attribute thead tr td:first-child, .tab-content, .manufacturer-heading, .wishlist-info thead td, #header #cart .content, .reveal-modal, .custom_box, .success, .warning, .attention, #cboxContent {
	background-color: <?php echo $this->config->get('oxy_content_column_hli_bg_color'); ?>;
}
.pagination, .product-info .price, .product-info .review, .product-info .options, .product-info .cart, .product-right-sm-logo, .product-right-sm-custom, .product-right-sm-info, .product-right-sm-related, .product-share, .product-right-sm-tags, .commentList .even, .childComment .even, .commentList .odd, .childComment .odd, .articleCat {
    border-top: <?php echo $this->config->get('oxy_content_column_separator_size'); ?>px <?php echo $this->config->get('oxy_content_column_separator_style'); ?> 
	<?php echo $this->config->get('oxy_content_column_separator_color'); ?>;	
}
<?php if($this->config->get('oxy_content_column_head_border_status') ==1) { ?>	
#content h1, #content .box-heading, .product-bottom-related h2 {
    border-bottom: <?php echo $this->config->get('oxy_content_column_head_border_size'); ?>px <?php echo $this->config->get('oxy_content_column_head_border_style'); ?> 
	<?php echo $this->config->get('oxy_content_column_head_border_color'); ?>;	
}	
<?php } ?>
.product-compare {
    border-left: <?php echo $this->config->get('oxy_content_column_separator_size'); ?>px <?php echo $this->config->get('oxy_content_column_separator_style'); ?> 
	<?php echo $this->config->get('oxy_content_column_separator_color'); ?>;	
}
.product-info .image, .product-info .image-additional img, .product-info .image-additional-left img, .contact-map, .manufacturer-list, .checkout-heading, .review-list, .product-info .option-image img {
	border: 1px <?php echo $this->config->get('oxy_content_column_separator_style'); ?> <?php echo $this->config->get('oxy_content_column_separator_color'); ?>;	
}
.product-info .image-additional img:hover, .product-info .image-additional-left img:hover {
	border: 1px <?php echo $this->config->get('oxy_content_column_separator_style'); ?> <?php echo $this->config->get('oxy_other_links_color'); ?>;	
}
.cart-info table, .cart-total table, .checkout-product table, .wishlist-info table, .order-list .order-content, table.list, .attribute, .compare-info {
	border-top: 1px <?php echo $this->config->get('oxy_content_column_separator_style'); ?> <?php echo $this->config->get('oxy_content_column_separator_color'); ?>;	
}
.cart-info thead td, .cart-info tbody td, .cart-total table, .checkout-product thead td, .checkout-product tbody td, .checkout-product tfoot td, .wishlist-info thead td, .wishlist-info tbody td, .order-list .order-content, table.list td, .box-category-home .subcat li, .attribute td, .compare-info td, .mini-cart-info td, .mini-cart-total {
	border-bottom: 1px <?php echo $this->config->get('oxy_content_column_separator_style'); ?> <?php echo $this->config->get('oxy_content_column_separator_color'); ?>;	
}
.cart-info table, .checkout-product table, .wishlist-info table, table.list, .attribute, .compare-info {
	border-left: 1px <?php echo $this->config->get('oxy_content_column_separator_style'); ?> <?php echo $this->config->get('oxy_content_column_separator_color'); ?>;	
}
.cart-info table, .checkout-product table, table thead tr th:last-child, table tfoot tr td:last-child, .wishlist-info table, table.list td, .attribute td, .compare-info td {
	border-right: 1px <?php echo $this->config->get('oxy_content_column_separator_style'); ?> <?php echo $this->config->get('oxy_content_column_separator_color'); ?>;	
}
/*  Left Column Heading  */
#column-left .box .box-heading, #column-left .product-box-slider .box-heading  {
<?php if(($this->config->get('oxy_left_column_head_bg_color') !='') && ($this->config->get('oxy_left_column_head_status') ==1)) { ?>	
	background-color: <?php echo $this->config->get('oxy_left_column_head_bg_color'); ?>;
<?php }
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $this->config->get('config_ssl') . 'image/';
} else {
	$path_image = $this->config->get('config_url') . 'image/';
}
if($this->config->get('oxy_left_column_head_custom') !='') { ?>
	background-image: url("<?php echo $path_image . $this->config->get('oxy_left_column_head_custom') ?>"); ?>;
<?php } else { ?>
	background-image: none;
<?php } ?>
}
#column-left .box .box-heading, #column-left .product-box-slider .box-heading {color: <?php echo $this->config->get('oxy_left_column_head_title_color'); ?>;}
#column-left .box .box-heading, #column-left .product-box-slider .box-heading  {
<?php if($this->config->get('oxy_left_column_head_border_status') ==1) { ?>	
	border-bottom: <?php echo $this->config->get('oxy_left_column_head_border_size'); ?>px <?php echo $this->config->get('oxy_left_column_head_border_style'); ?> 
	<?php echo $this->config->get('oxy_left_column_head_border_color'); ?>;
<?php } ?>
<?php if($this->config->get('oxy_left_column_head_status') ==1) { ?>	
	padding: 12px 15px;
	<?php } else { ?>
	padding: 12px 0;
<?php } ?>
}
/*  Left Column Box  */
#column-left .box .box-content, #column-left .product-box-slider .box-content {
<?php if(($this->config->get('oxy_left_column_box_bg_color') !='') && ($this->config->get('oxy_left_column_box_status') ==1)) { ?>	
	background-color: <?php echo $this->config->get('oxy_left_column_box_bg_color'); ?>;
<?php } ?>
<?php if($this->config->get('oxy_left_column_box_status') ==1) { ?>	
	padding: 20px 15px;
	<?php } else { ?>
	padding: 15px 0;
<?php } ?>
}
#column-left .box-product, #column-left .box-product a, #column-left .box .box-content ul li a, #column-left .product-box-slider .name a {color: <?php echo $this->config->get('oxy_left_column_box_links_color'); ?>;}
#column-left .box-product a:hover, #column-left .box .box-content ul li a:hover, #column-left .product-box-slider .name a:hover {color: <?php echo $this->config->get('oxy_left_column_box_links_color_hover'); ?>;}
/*  Right Column Heading  */
#column-right .box .box-heading, #column-right .product-box-slider .box-heading  {
<?php if(($this->config->get('oxy_right_column_head_bg_color') !='') && ($this->config->get('oxy_right_column_head_status') ==1)) { ?>	
	background-color: <?php echo $this->config->get('oxy_right_column_head_bg_color'); ?>;
<?php }
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $this->config->get('config_ssl') . 'image/';
} else {
	$path_image = $this->config->get('config_url') . 'image/';
}
if($this->config->get('oxy_right_column_head_custom') !='') { ?>
	background-image: url("<?php echo $path_image . $this->config->get('oxy_right_column_head_custom') ?>"); ?>;
<?php } else { ?>
	background-image: none;
<?php } ?>
}
#column-right .box .box-heading, #column-right .product-box-slider .box-heading {color: <?php echo $this->config->get('oxy_right_column_head_title_color'); ?>;}
#column-right .box .box-heading, #column-right .product-box-slider .box-heading  {
<?php if($this->config->get('oxy_right_column_head_border_status') ==1) { ?>	
	border-bottom: <?php echo $this->config->get('oxy_right_column_head_border_size'); ?>px <?php echo $this->config->get('oxy_right_column_head_border_style'); ?> 
	<?php echo $this->config->get('oxy_right_column_head_border_color'); ?>;
<?php } ?>
<?php if($this->config->get('oxy_right_column_head_status') ==1) { ?>	
	padding: 12px 15px;
	<?php } else { ?>
	padding: 12px 0;
<?php } ?>
}
/*  Right Column Box  */
#column-right .box .box-content, #column-right .product-box-slider .box-content {
<?php if(($this->config->get('oxy_right_column_box_bg_color') !='') && ($this->config->get('oxy_right_column_box_status') ==1)) { ?>	
	background-color: <?php echo $this->config->get('oxy_right_column_box_bg_color'); ?>;
<?php } ?>
<?php if($this->config->get('oxy_right_column_box_status') ==1) { ?>	
	padding: 20px 15px;
	<?php } else { ?>
	padding: 15px 0;
<?php } ?>
}
#column-right .box-product, #column-right .box-product a, #column-right .box .box-content ul li a, #column-right .product-box-slider .name a {color: <?php echo $this->config->get('oxy_right_column_box_links_color'); ?>;}
#column-right .box-product a:hover, #column-right .box .box-content ul li a:hover, #column-right .product-box-slider .name a:hover {color: <?php echo $this->config->get('oxy_right_column_box_links_color_hover'); ?>;}
/*  Category Box Heading  */
.box-category .box-heading-category {
<?php if(($this->config->get('oxy_category_box_head_bg_color') !='') && ($this->config->get('oxy_category_box_head_status') ==1)) { ?>	
	background-color: <?php echo $this->config->get('oxy_category_box_head_bg_color'); ?>;
<?php }
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $this->config->get('config_ssl') . 'image/';
} else {
	$path_image = $this->config->get('config_url') . 'image/';
}
if($this->config->get('oxy_category_box_head_custom') !='') { ?>
	background-image: url("<?php echo $path_image . $this->config->get('oxy_category_box_head_custom') ?>"); ?>;
<?php } else { ?>
	background-image: none;
<?php } ?>
}
.box-category .box-heading-category {color: <?php echo $this->config->get('oxy_category_box_head_title_color'); ?>;}
.box-category .box-heading-category  {
<?php if($this->config->get('oxy_category_box_head_border_status') ==1) { ?>	
	border-bottom: <?php echo $this->config->get('oxy_category_box_head_border_size'); ?>px <?php echo $this->config->get('oxy_category_box_head_border_style'); ?> 
	<?php echo $this->config->get('oxy_category_box_head_border_color'); ?>;
<?php } ?>
<?php if($this->config->get('oxy_category_box_head_status') ==1) { ?>	
	padding: 12px 15px;
	<?php } else { ?>
	padding: 12px 0;
<?php } ?>
}
/*  Category Box Content  */
.box-category .box-content-category {
<?php if(($this->config->get('oxy_category_box_box_bg_color') !='') && ($this->config->get('oxy_category_box_box_status') ==1)) { ?>	
	background-color: <?php echo $this->config->get('oxy_category_box_box_bg_color'); ?>;
<?php } ?>
}
.box-category .box-content-category ul > li > a:hover {
<?php if($this->config->get('oxy_category_box_box_status') ==1) { ?>	
	padding-left: 18px;
	<?php } else { ?>
	padding-left: 3px;
<?php } ?>
}
.box-category .box-content-category ul > li > a {
<?php if($this->config->get('oxy_category_box_box_status') ==1) { ?>	
	padding: 10px 25px 10px 15px;
	<?php } else { ?>
	padding: 10px 25px 10px 0;
<?php } ?>
}
.box-category .box-content-category ul > li > ul > li > a {
<?php if($this->config->get('oxy_category_box_box_status') ==1) { ?>	
	padding: 10px 25px 10px 30px;
	<?php } else { ?>
	padding: 10px 25px 10px 15px;
<?php } ?>
}
.box-category .box-content-category ul > li > ul > li > a:hover  {
<?php if($this->config->get('oxy_category_box_box_status') ==1) { ?>	
	padding-left: 33px;
	<?php } else { ?>
	padding-left: 18px;
<?php } ?>
}
.box-category .box-content-category ul > li + li, .box-category .box-content-category ul > li ul {
	border-top: <?php echo $this->config->get('oxy_category_box_box_separator_size'); ?>px <?php echo $this->config->get('oxy_category_box_box_separator_style'); ?> <?php echo $this->config->get('oxy_category_box_box_separator_color'); ?>;	
}
.box-category .box-content-category ul > li > a {color: <?php echo $this->config->get('oxy_category_box_box_links_color'); ?>;}
.box-category .box-content-category ul > li > a:hover {
	background-color: <?php echo $this->config->get('oxy_category_box_box_bg_color_hover'); ?>;
	color: <?php echo $this->config->get('oxy_category_box_box_links_color_hover'); ?>;
}
/*  Filter Box Heading  */
.box-filter .box-heading  {
<?php if(($this->config->get('oxy_filter_box_head_bg_color') !='') && ($this->config->get('oxy_filter_box_head_status') ==1)) { ?>	
	background-color: <?php echo $this->config->get('oxy_filter_box_head_bg_color'); ?>;
<?php }
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $this->config->get('config_ssl') . 'image/';
} else {
	$path_image = $this->config->get('config_url') . 'image/';
}
if($this->config->get('oxy_filter_box_head_custom') !='') { ?>
	background-image: url("<?php echo $path_image . $this->config->get('oxy_filter_box_head_custom') ?>"); ?>;
<?php } else { ?>
	background-image: none;
<?php } ?>
}
.box-filter .box-heading {color: <?php echo $this->config->get('oxy_filter_box_head_title_color'); ?>;}
.box-filter .box-heading  {
<?php if($this->config->get('oxy_filter_box_head_border_status') ==1) { ?>	
	border-bottom: <?php echo $this->config->get('oxy_filter_box_head_border_size'); ?>px <?php echo $this->config->get('oxy_filter_box_head_border_style'); ?> 
	<?php echo $this->config->get('oxy_filter_box_head_border_color'); ?>;
<?php } ?>
<?php if($this->config->get('oxy_filter_box_head_status') ==1) { ?>	
	padding: 12px 15px;
	<?php } else { ?>
	padding: 12px 0;
<?php } ?>
}
/*  Filter Box Content  */
.box-filter .box-content {
<?php if(($this->config->get('oxy_filter_box_box_bg_color') !='') && ($this->config->get('oxy_filter_box_box_status') ==1)) { ?>	
	background-color: <?php echo $this->config->get('oxy_filter_box_box_bg_color'); ?>;
<?php } ?>
<?php if($this->config->get('oxy_filter_box_box_status') ==1) { ?>	
	padding: 20px 15px;
	<?php } else { ?>
	padding: 15px 0;
<?php } ?>
}
.box-filter .box-content span, .box-filter label {color: <?php echo $this->config->get('oxy_filter_box_box_links_color'); ?>;}
.box-filter label:hover {color: <?php echo $this->config->get('oxy_filter_box_box_links_color_hover'); ?>;}
/*  Prices */
.price, .total, .product-info .price .discount {color: <?php echo $this->config->get('oxy_price_color'); ?>;}
.price-old, .wishlist-info tbody .price s {color: <?php echo $this->config->get('oxy_price_old_color'); ?>;}
.price-new, .cart-total .total-r {color: <?php echo $this->config->get('oxy_price_new_color'); ?>;}
.price-tax, .product-info .price .reward {color: <?php echo $this->config->get('oxy_price_tax_color'); ?>;}
/*  Buttons */
a.button, input.button, .ei-title h4 a.button {
	background-color: <?php echo $this->config->get('oxy_button_bg_color'); ?>;
	color: <?php echo $this->config->get('oxy_button_text_color'); ?>;
}
a.button:hover, input.button:hover, .ei-title h4 a.button:hover {
	background-color: <?php echo $this->config->get('oxy_button_bg_hover_color'); ?>;
    color: <?php echo $this->config->get('oxy_button_text_hover_color'); ?>;	
}
a.button-exclusive, input.button-exclusive {
	background-color: <?php echo $this->config->get('oxy_button_exclusive_bg_color'); ?>;
	color: <?php echo $this->config->get('oxy_button_exclusive_text_color'); ?>;
}
a.button-exclusive:hover, input.button-exclusive:hover {
	background-color: <?php echo $this->config->get('oxy_button_exclusive_bg_hover_color'); ?>;
	color: <?php echo $this->config->get('oxy_button_exclusive_text_hover_color'); ?>;
}
.product-grid .cart input.button, .product-list .cart input.button, #content .box-product .cart input.button, .product-right-sm-tags div a, .product-box-slider .cart input.button, .product-bottom-related .cart input.button, #header #cart .checkout .mini-cart-button {
	background-color: <?php echo $this->config->get('oxy_button_light_bg_color'); ?>;
	color: <?php echo $this->config->get('oxy_button_light_text_color'); ?>;
}
.product-grid .cart input.button:hover, .product-list .cart input.button:hover, #content .box-product .cart input.button:hover, .product-right-sm-tags div a:hover, .product-box-slider .cart input.button:hover, .product-bottom-related .cart input.button:hover, #header #cart .checkout .mini-cart-button:hover {
	background-color: <?php echo $this->config->get('oxy_button_light_bg_hover_color'); ?>;
	color: <?php echo $this->config->get('oxy_button_light_text_hover_color'); ?>;
}
.prev-next a, .product-bottom-related .flex-direction-nav a, .product-bottom-related .flex-direction-nav .flex-disabled:hover, .product-right-sm-related .flex-direction-nav a, .product-right-sm-related .flex-direction-nav .flex-disabled:hover, .product-box-slider .flex-direction-nav a, .product-box-slider .flex-direction-nav .flex-disabled:hover, .pagination .links a, .flex-direction-nav a, .flex-control-paging li a, .camera_prevThumbs, .camera_nextThumbs, .camera_prev, .camera_next, .camera_commands, .camera_thumbs_cont, .camera_wrap .camera_pag .camera_pag_ul li, .slideshow .nivo-directionNav a, .tp-bullets.simplebullets.round .bullet, .tp-leftarrow.default, .tp-rightarrow.default {
	background-color: <?php echo $this->config->get('oxy_button_slider_bg_color'); ?>;
}
.prev-next a:hover, .product-right-sm-related .flex-direction-nav a:hover, .product-bottom-related .flex-direction-nav a:hover, .product-box-slider .flex-direction-nav a:hover, .pagination .links b, .pagination .links a:hover, .flexslider:hover .flex-next:hover, .flexslider:hover .flex-prev:hover, .camera_prevThumbs:hover, .camera_nextThumbs:hover, .camera_prev:hover, .camera_next:hover, .camera_commands:hover, .camera_thumbs_cont:hover, .camera_wrap .camera_pag .camera_pag_ul li.cameracurrent > span, .flex-control-paging li a.flex-active, .slideshow .nivo-directionNav a:hover, .tp-bullets.simplebullets .bullet.selected, .tp-leftarrow:hover, .tp-rightarrow:hover {
	background-color: <?php echo $this->config->get('oxy_button_slider_bg_hover_color'); ?>;
}
<?php if($this->config->get('oxy_button_border_radius') !='') { ?>
a.button, input.button, a.button-exclusive, input.button-exclusive {
	-webkit-border-radius: <?php echo $this->config->get('oxy_button_border_radius'); ?>px;
	-moz-border-radius: <?php echo $this->config->get('oxy_button_border_radius'); ?>px;
	border-radius: <?php echo $this->config->get('oxy_button_border_radius'); ?>px;
}
<?php } ?>
/*  Top Area */
#header {
<?php if(($this->config->get('oxy_top_area_bg_color') !='') && ($this->config->get('oxy_top_area_status') ==1)) { ?>
	background-color: <?php echo $this->config->get('oxy_top_area_bg_color'); ?>;
<?php }	
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $this->config->get('config_ssl') . 'image/';
} else {
	$path_image = $this->config->get('config_url') . 'image/';
}
if($this->config->get('oxy_bg_image_ta_custom') !='') { ?>
	background-image: url("<?php echo $path_image . $this->config->get('oxy_bg_image_ta_custom') ?>"); ?>;
<?php } else if($this->config->get('oxy_pattern_oxy_ta') !='') { ?>
	background-image: url("catalog/view/theme/oxy/image/patterns/p<?php echo $this->config->get('oxy_pattern_oxy_ta'); ?>.png");
<?php } else { ?>
	background-image: none;
<?php } 
if(($this->config->get('oxy_bg_image_ta_position') !='') || ($this->config->get('oxy_bg_image_ta_repeat') !='') || ($this->config->get('oxy_bg_image_ta_attachment') !='')) { ?>
	background-position: <?php echo $this->config->get('oxy_bg_image_ta_position'); ?>;
	background-repeat: <?php echo $this->config->get('oxy_bg_image_ta_repeat'); ?>;
	background-attachment: <?php echo $this->config->get('oxy_bg_image_ta_attachment'); ?>;
<?php } ?>
}
.is-sticky #header {
	background-color: <?php echo $this->config->get('oxy_top_area_mini_bg_color'); ?>;
	background-image: none;
}
/*  Top Bar  */
<?php if($this->config->get('oxy_top_area_tb_bg_status') ==1) { ?>
#top-line {
	background-color: <?php echo $this->config->get('oxy_top_area_tb_bg_color'); ?>;
}
<?php } ?>
#top-line {
	color: <?php echo $this->config->get('oxy_top_area_tb_text_color'); ?>;
}
#top-line a {
	color: <?php echo $this->config->get('oxy_top_area_tb_link_color'); ?>;
}
#top-line a:hover {
	color: <?php echo $this->config->get('oxy_top_area_tb_link_color_hover'); ?>;
}
.currency, .language, .my-account {
	border-left: 1px solid <?php echo $this->config->get('oxy_top_area_tb_separator_color'); ?>;
}
.currency {
	border-right: 1px solid <?php echo $this->config->get('oxy_top_area_tb_separator_color'); ?>;
}
@media only screen and (max-width: 767px) {
.currency, .language {
	border-top: 1px solid <?php echo $this->config->get('oxy_top_area_tb_separator_color'); ?>;
}
}
<?php if($this->config->get('oxy_top_area_tb_top_border_status') ==1) { ?>
#top-line {
	border-top: 4px solid <?php echo $this->config->get('oxy_top_area_tb_top_border_color'); ?>;
}
<?php } ?>
<?php if($this->config->get('oxy_top_area_tb_bottom_border_status') ==1) { ?>
#top-line {
	border-bottom: 1px solid <?php echo $this->config->get('oxy_top_area_tb_bottom_border_color'); ?>;
}
<?php } ?>
.dropdown_l ul {
	background-color: <?php echo $this->config->get('oxy_top_area_tb_dropdown_bg_color'); ?>;
}
.dropdown_l li a {
	color: <?php echo $this->config->get('oxy_top_area_tb_dropdown_link_color'); ?>!important;
}
.dropdown_l li a:hover {
	background-color: <?php echo $this->config->get('oxy_top_area_tb_dropdown_bg_color_hover'); ?>;
	color: <?php echo $this->config->get('oxy_top_area_tb_dropdown_link_color_hover'); ?>!important;
}
#header #search input {
	background-color: <?php echo $this->config->get('oxy_top_area_search_bg_color'); ?>;
	border-color: <?php echo $this->config->get('oxy_top_area_search_border_color'); ?>;
	color: <?php echo $this->config->get('oxy_top_area_search_text_color'); ?>;
}
#header #search input:focus {
	border-color: <?php echo $this->config->get('oxy_top_area_search_border_color_hover'); ?>;
}
#header #cart h5 {
	color: <?php echo $this->config->get('oxy_top_area_cart_text_color'); ?>;
}
#header #cart .heading a div#cart-total {
	color: <?php echo $this->config->get('oxy_top_area_cart_link_color'); ?>;
	border-right: 1px solid <?php echo $this->config->get('oxy_top_area_cart_separator_color'); ?>;
}
#header #cart .heading a div#cart-total:hover {
	color: <?php echo $this->config->get('oxy_top_area_cart_link_color_hover'); ?>;
}
#header #cart .heading a div#cart-icon {
    background: url('catalog/view/theme/oxy/image/icon_cart_<?php echo $this->config->get('oxy_top_area_cart_icon_style'); ?>.png')  no-repeat scroll 65% 50%;
}
<?php if($this->config->get('oxy_logo_position') =='left') { ?>	
#header #logo {padding: 5px 15px 5px 0;}
<?php } ?>
<?php if($this->config->get('oxy_logo_position') =='center') { ?>	
#header #logo {padding: 0; text-align: center;}
<?php } ?>
<?php if(($this->config->get('oxy_logo_position') =='left') && ($this->config->get('oxy_search_bar_position') =='center')) { ?>	
#header #search {margin-top: 22px;}
<?php } ?>
<?php if(($this->config->get('oxy_logo_position') =='center') && ($this->config->get('oxy_search_bar_position') =='center')) { ?>	
#header #search {margin-top: 15px;}
@media only screen and (max-width: 767px) {
#header #search {margin-top: 20px;}
}
<?php } ?>
<?php if(($this->config->get('oxy_logo_position') =='left') && ($this->config->get('oxy_search_bar_position') =='left')) { ?>	
#header #search {margin-top: 15px;}
<?php } ?>
<?php if(($this->config->get('oxy_logo_position') =='center') && ($this->config->get('oxy_search_bar_position') =='left')) { ?>	
#header #search {margin-top: 22px;}
@media only screen and (max-width: 767px) {
#header #search {margin-top: 10px;}
#header #logo {padding: 20px 0 0;}
}
<?php } ?>
<?php if(($this->config->get('oxy_logo_position') =='center') && ($this->config->get('oxy_search_bar_position') =='right')) { ?>	
#header #logo {padding: 10px 0;}
<?php } ?>
<?php if($this->config->get('oxy_search_bar_position') =='right') { ?>
#header #cart {top: 8px;}	
#header #search {margin-top: 70px;}
.is-sticky #header #search {margin-top: 55px;}
.is-sticky #header #logo img {
    max-height: none;
}
@media only screen and (max-width: 767px) {
#header #cart {margin: 10px auto; top: auto;}	
#header #search {margin-top: 20px;}
}
<?php } ?>
/*  Main Menu  */
/*  Main Menu Bar  */
#menu {
<?php if(($this->config->get('oxy_mm_bg_color') !='') && ($this->config->get('oxy_mm_bg_color_status') ==1)) { ?>	
	background-color: <?php echo $this->config->get('oxy_mm_bg_color'); ?>;
<?php }
if(($this->config->get('oxy_mm_border_top_color') !='') && ($this->config->get('oxy_mm_border_top_status') ==1)) { ?>	
    border-top: <?php echo $this->config->get('oxy_mm_border_top_size'); ?>px <?php echo $this->config->get('oxy_mm_border_top_style'); ?> <?php echo $this->config->get('oxy_mm_border_top_color'); ?>;	
<?php }
if(($this->config->get('oxy_mm_border_bottom_color') !='') && ($this->config->get('oxy_mm_border_bottom_status') ==1)) { ?>	
    border-bottom: <?php echo $this->config->get('oxy_mm_border_bottom_size'); ?>px <?php echo $this->config->get('oxy_mm_border_bottom_style'); ?> <?php echo $this->config->get('oxy_mm_border_bottom_color'); ?>;	
<?php }
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $this->config->get('config_ssl') . 'image/';
} else {
	$path_image = $this->config->get('config_url') . 'image/';
}
if(($this->config->get('oxy_bg_image_mm_custom') !='') && ($this->config->get('oxy_mm_bg_color_status') ==1)) { ?>
	background-image: url("<?php echo $path_image . $this->config->get('oxy_bg_image_mm_custom') ?>"); ?>;
<?php } else if(($this->config->get('oxy_pattern_oxy_mm') !='') && ($this->config->get('oxy_mm_bg_color_status') ==1)) { ?>
	background-image: url("catalog/view/theme/oxy/image/patterns/p<?php echo $this->config->get('oxy_pattern_oxy_mm'); ?>.png");
<?php } else { ?>
	background-image: none;
<?php } 
if($this->config->get('oxy_bg_image_mm_repeat') !='') { ?>
	background-repeat: <?php echo $this->config->get('oxy_bg_image_mm_repeat'); ?>;
<?php } ?>
}
<?php if($this->config->get('oxy_mm_separator_status') ==1) { ?>
#menu_oc > ul > li, #menu_v > ul > li, #menu_h > ul > li, #menu_brands > ul > li, .menu_links, #menu_custom_menu > ul > li, .menu_custom_block > ul > li, #menu_informations > ul > li, #menu_contacts > ul > li {
	border-left: <?php echo $this->config->get('oxy_mm_separator_size'); ?>px <?php echo $this->config->get('oxy_mm_separator_style'); ?> <?php echo $this->config->get('oxy_mm_separator_color'); ?>;
}
<?php } ?>
/*  Home Page Link  */
<?php if(($this->config->get('oxy_mm1_bg_color') !='') && ($this->config->get('oxy_mm1_bg_color_status') ==1)) { ?> 
#menu #homepage {
	background-color: <?php echo $this->config->get('oxy_mm1_bg_color'); ?>;
}
<?php }
if($this->config->get('oxy_mm1_bg_hover_color') !='') { ?> 
#menu #homepage:hover {
	background-color: <?php echo $this->config->get('oxy_mm1_bg_hover_color'); ?>;
}	
<?php }
if(($this->config->get('oxy_mm1_link_color') !='') || ($this->config->get('oxy_mm1_link_hover_color') !='')) { ?> 
#menu #homepage a {
	color: <?php echo $this->config->get('oxy_mm1_link_color'); ?>;
}	
#menu #homepage:hover a {
	color: <?php echo $this->config->get('oxy_mm1_link_hover_color'); ?>;
}
<?php } ?>
/*  Categories Section  */
<?php if(($this->config->get('oxy_mm2_bg_color') !='') && ($this->config->get('oxy_mm2_bg_color_status') ==1)) { ?> 
#menu_oc > ul > li, #menu_v > ul > li, #menu_h > ul > li  {
	background-color: <?php echo $this->config->get('oxy_mm2_bg_color'); ?>;
}
<?php }
if($this->config->get('oxy_mm2_bg_hover_color') !='') { ?> 
#menu_oc > ul > li:hover, #menu_v > ul > li:hover, #menu_h > ul > li:hover  {
	background-color: <?php echo $this->config->get('oxy_mm2_bg_hover_color'); ?>;
}
<?php }
if(($this->config->get('oxy_mm2_link_color') !='') || ($this->config->get('oxy_mm2_link_hover_color') !='')) { ?> 
#menu_oc > ul > li > a, #menu_v > ul > li > a, #menu_h > ul > li > a {
	color: <?php echo $this->config->get('oxy_mm2_link_color'); ?>;
}	
#menu_oc > ul > li:hover > a, #menu_v > ul > li:hover > a, #menu_h > ul > li:hover > a {
	color: <?php echo $this->config->get('oxy_mm2_link_hover_color'); ?>;
}
<?php } ?>
/*  Brands Section  */
<?php if(($this->config->get('oxy_mm3_bg_color') !='') && ($this->config->get('oxy_mm3_bg_color_status') ==1)) { ?> 
#menu_brands > ul > li {
	background-color: <?php echo $this->config->get('oxy_mm3_bg_color'); ?>;
}
<?php }
if($this->config->get('oxy_mm3_bg_hover_color') !='') { ?> 
#menu_brands > ul > li:hover {
	background-color: <?php echo $this->config->get('oxy_mm3_bg_hover_color'); ?>;
}
<?php }
if(($this->config->get('oxy_mm3_link_color') !='') || ($this->config->get('oxy_mm3_link_hover_color') !='')) { ?> 
#menu_brands > ul > li > a {
	color: <?php echo $this->config->get('oxy_mm3_link_color'); ?>;
}	
#menu_brands > ul > li:hover > a {
	color: <?php echo $this->config->get('oxy_mm3_link_hover_color'); ?>;
}
<?php } ?>
/*  Custom Links Section  */
<?php if(($this->config->get('oxy_mm4_bg_color') !='') && ($this->config->get('oxy_mm4_bg_color_status') ==1)) { ?> 
.menu_links {
	background-color: <?php echo $this->config->get('oxy_mm4_bg_color'); ?>;
}	
<?php }
if($this->config->get('oxy_mm4_bg_hover_color') !='') { ?> 
.menu_links:hover {
	background-color: <?php echo $this->config->get('oxy_mm4_bg_hover_color'); ?>;
}	
<?php }
if(($this->config->get('oxy_mm4_link_color') !='') || ($this->config->get('oxy_mm4_link_hover_color') !='')) { ?> 
.menu_links a {
	color: <?php echo $this->config->get('oxy_mm4_link_color'); ?>;
}	
.menu_links:hover a {
	color: <?php echo $this->config->get('oxy_mm4_link_hover_color'); ?>;
}
<?php } ?>
/*  Information Section  */
<?php if(($this->config->get('oxy_mm5_bg_color') !='') && ($this->config->get('oxy_mm5_bg_color_status') ==1)) { ?> 
#menu_informations > ul > li {
	background-color: <?php echo $this->config->get('oxy_mm5_bg_color'); ?>;
}
<?php }
if($this->config->get('oxy_mm5_bg_hover_color') !='') { ?> 
#menu_informations > ul > li:hover {
	background-color: <?php echo $this->config->get('oxy_mm5_bg_hover_color'); ?>;
}
<?php }
if(($this->config->get('oxy_mm5_link_color') !='') || ($this->config->get('oxy_mm5_link_hover_color') !='')) { ?> 
#menu_informations > ul > li > a {
	color: <?php echo $this->config->get('oxy_mm5_link_color'); ?>;
}	
#menu_informations > ul > li:hover > a {
	color: <?php echo $this->config->get('oxy_mm5_link_hover_color'); ?>;
}
<?php } ?>
/*  Custom Menu Section  */
<?php if(($this->config->get('oxy_mm6_bg_color') !='') && ($this->config->get('oxy_mm6_bg_color_status') ==1)) { ?> 
#menu_custom_menu > ul > li {
	background-color: <?php echo $this->config->get('oxy_mm6_bg_color'); ?>;
}
<?php }
if($this->config->get('oxy_mm6_bg_hover_color') !='') { ?> 
#menu_custom_menu > ul > li:hover {
	background-color: <?php echo $this->config->get('oxy_mm6_bg_hover_color'); ?>;
}
<?php }
if(($this->config->get('oxy_mm6_link_color') !='') || ($this->config->get('oxy_mm6_link_hover_color') !='')) { ?> 
#menu_custom_menu > ul > li > a {
	color: <?php echo $this->config->get('oxy_mm6_link_color'); ?>;
}	
#menu_custom_menu > ul > li:hover > a {
	color: <?php echo $this->config->get('oxy_mm6_link_hover_color'); ?>;
}
<?php } ?>
/*  Custom Blocks Section  */
<?php if(($this->config->get('oxy_mm8_bg_color') !='') && ($this->config->get('oxy_mm8_bg_color_status') ==1)) { ?> 
.menu_custom_block > ul > li {
	background-color: <?php echo $this->config->get('oxy_mm8_bg_color'); ?>;
}
<?php }
if($this->config->get('oxy_mm8_bg_hover_color') !='') { ?> 
.menu_custom_block > ul > li:hover {
	background-color: <?php echo $this->config->get('oxy_mm8_bg_hover_color'); ?>;
}	
<?php }
if(($this->config->get('oxy_mm8_link_color') !='') || ($this->config->get('oxy_mm8_link_hover_color') !='')) { ?> 
.menu_custom_block > ul > li > a {
	color: <?php echo $this->config->get('oxy_mm8_link_color'); ?>;
}	
.menu_custom_block > ul > li:hover > a {
	color: <?php echo $this->config->get('oxy_mm8_link_hover_color'); ?>;
}
<?php } ?>
/*  Contact Section  */
<?php if(($this->config->get('oxy_mm7_bg_color') !='') && ($this->config->get('oxy_mm7_bg_color_status') ==1)) { ?> 
#menu_contacts > ul > li {
	background-color: <?php echo $this->config->get('oxy_mm7_bg_color'); ?>;
}
<?php }
if($this->config->get('oxy_mm7_bg_hover_color') !='') { ?> 
#menu_contacts > ul > li:hover {
	background-color: <?php echo $this->config->get('oxy_mm7_bg_hover_color'); ?>;
}
<?php }
if(($this->config->get('oxy_mm7_link_color') !='') || ($this->config->get('oxy_mm7_link_hover_color') !='')) { ?> 
#menu_contacts > ul > li > a {
	color: <?php echo $this->config->get('oxy_mm7_link_color'); ?>;
}	
#menu_contacts > ul > li:hover > a {
	color: <?php echo $this->config->get('oxy_mm7_link_hover_color'); ?>;
}
<?php } ?>
/*  Sub-Menu  */
#menu_oc > ul > li > div, #menu_oc > ul > li > div > ul > li > div, #menu_v > ul > li > div, #menu_v > ul > li > div > ul > li > div, #menu_v > ul > li > div > ul > li > div > ul > li > div, #menu_h > ul > li > div, #menu_brands > ul > li > div, #menu_custom_menu > ul > li > div, .menu_custom_block > ul > li > div, #menu_informations > ul > li > div, #menu_contacts > ul > li > div {
	background-color: <?php echo $this->config->get('oxy_mm_sub_bg_color'); ?>;
}	
#menu, #menu_informations span, .menu_custom_block h1, #menu_contacts > ul > li > div > ul > li > .ngw, #menu_contacts span.mm {
	color: <?php echo $this->config->get('oxy_mm_sub_text_color'); ?>;
}	
#menu_oc > ul > li ul > li > a, #menu_v > ul > li ul > li > a, #menu_h span a, #menu_h > ul > li ul > li > a, #menu_brands > ul > li > div > div a, #menu_custom_menu > ul > li ul > li > a, .menu_custom_block > ul > li > div a, #menu_informations > ul > li ul > li > a {
	color: <?php echo $this->config->get('oxy_mm_sub_link_color'); ?>;
}	
#menu_oc > ul > li ul > li > a:hover, #menu_v > ul > li ul > li > a:hover, #menu_v > ul > li > div > ul > li ul > li > a:hover, #menu_h span a:hover, #menu_h > ul > li ul > li > a:hover, #menu_brands > ul > li > div > div:hover a, #menu_custom_menu > ul > li ul > li > a:hover, .menu_custom_block > ul > li > div a:hover, #menu_informations > ul > li ul > li > a:hover {
	color: <?php echo $this->config->get('oxy_mm_sub_link_hover_color'); ?>;
}	
#menu_h > ul > li ul > li ul > li:first-child {
	border-top: 1px <?php echo $this->config->get('oxy_mm_sub_separator_style'); ?> <?php echo $this->config->get('oxy_mm_sub_separator_color'); ?>;
}
#menu_oc > ul > li ul > li, #menu_v > ul > li ul > li, #menu_h > ul > li ul > li, #menu_brands > ul > li > div > div, #menu_custom_menu > ul > li ul > li, #menu_informations > ul > li ul > li {
	border-bottom: 1px <?php echo $this->config->get('oxy_mm_sub_separator_style'); ?> <?php echo $this->config->get('oxy_mm_sub_separator_color'); ?>;
}
#menu_oc > ul > li ul > li > a:hover, #menu_v > ul > li ul > li > a:hover, #menu_h > ul > li ul > li > a:hover, #menu_v > ul > li > div > ul > li ul > li > a:hover, #menu_h span a:hover, #menu_brands > ul > li > div > div:hover, #menu_custom_menu > ul > li ul > li > a:hover, #menu_informations > ul > li ul > li > a:hover {
	background-color: <?php echo $this->config->get('oxy_mm_sub_bg_hover_color'); ?>;
}	
#menu_h span a, #menu_informations span, #menu_contacts > ul > li > div > ul > li > .ngw, #menu_contacts > ul > li > div > ul > li > .social_widget {
	background-color: <?php echo $this->config->get('oxy_mm_sub_titles_bg_color'); ?>;
}	
<?php if($this->config->get('oxy_mm_sub_box_shadow') == 1) { ?>
#menu_oc > ul > li > div, #menu_oc > ul > li > div > ul > li > div, #menu_v > ul > li > div, #menu_v > ul > li > div > ul > li > div, #menu_v > ul > li > div > ul > li > div > ul > li > div, #menu_h > ul > li > div, #menu_brands > ul > li > div, #menu_custom_menu > ul > li > div, .menu_custom_block > ul > li > div, #menu_informations > ul > li > div, #menu_contacts > ul > li > div {
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3); -webkit-box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3); -moz-box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
}	
<?php } ?>
/*  Mobile Main Menu Bar  */
.top-bar ul > li.name a {
	background-color: <?php echo $this->config->get('oxy_mm_mobile_bg_color'); ?>;
	color: <?php echo $this->config->get('oxy_mm_mobile_text_color'); ?>!important;
}
.top-bar:hover ul > li.name a {
	background-color: <?php echo $this->config->get('oxy_mm_mobile_bg_hover_color'); ?>;
}
/*  Layout  */
<?php if($this->config->get('oxy_layout_s') =='0') { ?>	
.wrapper {
    min-width: 940px;
}
.row {
    min-width: 920px;
}
<?php } ?>
<?php if($this->config->get('oxy_layout_style') =='2') { ?>	
.wrapper {
	max-width: 100%;
	margin: 0;
	padding: 0 10px;
}
<?php } ?>
/*  Product Box  */
.product-grid > div:hover, .product-list > div:hover, #content .box-product > div:hover {
	background-color: <?php echo $this->config->get('oxy_mid_prod_box_bg_hover_color'); ?>;
}
<?php if($this->config->get('oxy_mid_prod_box_shadow_hover') == 1) { ?>	
.product-grid > div:hover, #content .box-product > div:hover {
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.25);
}
<?php } ?>
span.sale-icon {
	background-color: <?php echo $this->config->get('oxy_mid_prod_box_sale_icon_color'); ?>;
}
<?php if($this->config->get('oxy_category_prod_name_status') == 0) { ?>	
.product-grid .name, #content .box-product .name, .product-list .name, .product-bottom-related .name, .product-box-slider .name {display: none;}
<?php } ?>
<?php if($this->config->get('oxy_category_prod_brand_status') == 0) { ?>	
.product-grid .product_box_brand, .product-list .product_box_brand {display: none;}
<?php } ?>
<?php if($this->config->get('oxy_category_prod_price_status') == 0) { ?>	
.product-grid .price, #content .box-product .price, .product-list .price, .product-bottom-related .price, .product-box-slider .price {display: none;}
<?php } ?>
<?php if($this->config->get('oxy_category_prod_cart_status') == 0) { ?>	
.product-grid .cart, #content .box-product .cart, .product-list .cart, .product-box-slider .cart {display: none;}
<?php } ?>
<?php if($this->config->get('oxy_category_prod_ratings_status') == 0) { ?>	
.product-grid .rating, .product-list .rating, #content .box-product .rating, #column-left .box-product .rating, #column-right .box-product .rating, .product-box-slider .rating {display: none;}
<?php } ?>
<?php if($this->config->get('oxy_category_prod_wis_com_status') == 0) { ?>	
.product-list .wishlist, .product-grid .wishlist, .product-list .compare, .product-grid .compare {display: none;}
<?php } ?>
<?php if($this->config->get('oxy_category_prod_zoom_status') == 1) { ?>	
#content .product-grid div:hover .image a img, #content .box-product div:hover .image a img {
	transform: scale(1.1);
    -moz-transform: scale(1.1);
    -webkit-transform: scale(1.1);
    -o-transform: scale(1.1);
    -ms-transform: scale(1.1);
}
<?php } ?>
.product-grid .name, #content .box-product .name, .product-bottom-related .name, .product-box-slider .name, .product-grid .product_box_brand, .product-grid .price, #content .box-product .price, .product-box-slider .price, .product-bottom-related .price, .product-grid .rating, #content .box-product .rating, .product-box-slider .rating, .product-grid .cart, #content .box-product .cart, .product-box-slider .cart, .product-bottom-related .cart {
<?php if($this->config->get('oxy_category_prod_align') ==1) { ?>	
	text-align: left;
	<?php } else { ?>
	text-align: center;
<?php } ?>
}
/*  Tabs  */
.htabs a {
	background-color: <?php echo $this->config->get('oxy_mid_prod_page_tabs_bg_color'); ?>;
}
.htabs a.selected {
	background-color: <?php echo $this->config->get('oxy_mid_prod_page_tabs_selected_bg_color'); ?>;
}
.htabs a, .htabs a.selected {
	color: <?php echo $this->config->get('oxy_mid_prod_page_tabs_text_color'); ?>;
}
/*  Product Slider on Home Page  */
.ei-slider {
<?php if($this->config->get('oxy_mid_prod_slider_bg_color') !='') { ?>
	background-color: <?php echo $this->config->get('oxy_mid_prod_slider_bg_color'); ?>;
<?php }	
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $this->config->get('config_ssl') . 'image/';
} else {
	$path_image = $this->config->get('config_url') . 'image/';
}
if($this->config->get('oxy_mid_prod_slider_custom') !='') { ?>
	background-image: url("<?php echo $path_image . $this->config->get('oxy_mid_prod_slider_custom') ?>"); ?>;
<?php } else { ?>
	background-image: url("catalog/view/theme/oxy/image/bg_prod_slider_1.png");
<?php }
if(($this->config->get('oxy_mid_prod_slider_custom_position') !='') || ($this->config->get('oxy_mid_prod_slider_custom_repeat') !='')) { ?>
	background-position: <?php echo $this->config->get('oxy_mid_prod_slider_custom_position'); ?>;
	background-repeat: <?php echo $this->config->get('oxy_mid_prod_slider_custom_repeat'); ?>;
<?php } ?>
}
@media screen and (max-width: 767px) {
.ei-slider{background-image: none;background-color: #FFFFFF;}
}
.ei-title h2 a{color: <?php echo $this->config->get('oxy_mid_prod_slider_name_color'); ?>;}
.ei-title h3 a, .ei-title h4 a .price-old{color: <?php echo $this->config->get('oxy_mid_prod_slider_desc_color'); ?>;}
.ei-title h4 a{color: <?php echo $this->config->get('oxy_mid_prod_slider_price_color'); ?>;}
.ei-title h2 a:hover, .ei-title h3 a:hover{color: <?php echo $this->config->get('oxy_mid_prod_slider_links_color_hover'); ?>;}
.ei-slider-thumbs li a{background: <?php echo $this->config->get('oxy_mid_prod_slider_bottom_bar_bg_color') ?>;}
.ei-slider-thumbs li a:hover{background: <?php echo $this->config->get('oxy_mid_prod_slider_bottom_bar_bg_color_hover'); ?>;}
.ei-slider-thumbs li.ei-slider-element{background: <?php echo $this->config->get('oxy_mid_prod_slider_bottom_bar_bg_color_active'); ?>;}
<?php if($this->config->get('oxy_video_box_status')== 1) { ?>  
/*  Video Box  */
.video_box_left #video_box_icon, .video_box_right #video_box_icon {
    background-color: <?php echo $this->config->get('oxy_video_box_bg'); ?>;
}
.video_box_right .video_box, .video_box_left .video_box {
    border: 4px solid <?php echo $this->config->get('oxy_video_box_bg'); ?>;
}
<?php } ?>
<?php if($this->config->get('oxy_custom_box_status')== 1) { ?>  
/*  Custom Box  */
.custom_box_left #custom_box_icon, .custom_box_right #custom_box_icon {
    background-color: <?php echo $this->config->get('oxy_custom_box_bg'); ?>;
}
.custom_box_right .custom_box, .custom_box_left .custom_box {
    border: 4px solid <?php echo $this->config->get('oxy_custom_box_bg'); ?>;
}
<?php } ?>
/*  Bottom Area  */
/*  Feature Block  */
#footer_p {
	background-color: <?php echo $this->config->get('oxy_fp_bg_color'); ?>;
}
#footer_p span.p_title a {
	color: <?php echo $this->config->get('oxy_fp_title_color'); ?>;
}
#footer_p span.p_title a:hover {
	color: <?php echo $this->config->get('oxy_fp_title_color_hover'); ?>;
}
#footer_p span.p_subtitle {
	color: <?php echo $this->config->get('oxy_fp_subtitle_color'); ?>;
}
#footer_p span.pi1 {
	background-color: <?php echo $this->config->get('oxy_fp_fb1_bg_color'); ?>;
}
#footer_p .p_content:hover span.pi1 {
	background-color: <?php echo $this->config->get('oxy_fp_fb1_bg_color_hover'); ?>;
}
#footer_p span.pi2 {
	background-color: <?php echo $this->config->get('oxy_fp_fb2_bg_color'); ?>;
}
#footer_p .p_content:hover span.pi2 {
	background-color: <?php echo $this->config->get('oxy_fp_fb2_bg_color_hover'); ?>;
}
#footer_p span.pi3 {
	background-color: <?php echo $this->config->get('oxy_fp_fb3_bg_color'); ?>;
}
#footer_p .p_content:hover span.pi3 {
	background-color: <?php echo $this->config->get('oxy_fp_fb3_bg_color_hover'); ?>;
}
#footer_p span.pi4 {
	background-color: <?php echo $this->config->get('oxy_fp_fb4_bg_color'); ?>;
}
#footer_p .p_content:hover span.pi4 {
	background-color: <?php echo $this->config->get('oxy_fp_fb4_bg_color_hover'); ?>;
}
/*  About Us, Custom Column, Follow Us, Contact Us  */
#footer_a {
	color: <?php echo $this->config->get('oxy_f1_text_color'); ?>;
<?php if($this->config->get('oxy_f1_bg_color') !='') { ?>
	background-color: <?php echo $this->config->get('oxy_f1_bg_color'); ?>;
<?php }	
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $this->config->get('config_ssl') . 'image/';
} else {
	$path_image = $this->config->get('config_url') . 'image/';
}
if($this->config->get('oxy_bg_image_f1_custom') !='') { ?>
	background-image: url("<?php echo $path_image . $this->config->get('oxy_bg_image_f1_custom') ?>"); ?>;
<?php } else if($this->config->get('oxy_pattern_oxy_f1') !='') { ?>
	background-image: url("catalog/view/theme/oxy/image/patterns/p<?php echo $this->config->get('oxy_pattern_oxy_f1'); ?>.png");
<?php } else { ?>
	background-image: none;
<?php } 
if(($this->config->get('oxy_bg_image_f1_position') !='') || ($this->config->get('oxy_bg_image_f1_repeat') !='')) { ?>
	background-position: <?php echo $this->config->get('oxy_bg_image_f1_position'); ?>;
	background-repeat: <?php echo $this->config->get('oxy_bg_image_f1_repeat'); ?>;
<?php } 
if($this->config->get('oxy_f1_border_top_status') ==1) { ?>
	border-top: <?php echo $this->config->get('oxy_f1_border_top_size'); ?>px <?php echo $this->config->get('oxy_f1_border_top_style'); ?> <?php echo $this->config->get('oxy_f1_border_top_color'); ?>;
<?php } ?>
}
#footer_a h3 {color: <?php echo $this->config->get('oxy_f1_titles_color'); ?>; border-bottom: <?php echo $this->config->get('oxy_f1_titles_border_bottom_size'); ?>px <?php echo $this->config->get('oxy_f1_titles_border_bottom_style'); ?> <?php echo $this->config->get('oxy_f1_titles_border_bottom_color'); ?>;}
#footer_a a {color: <?php echo $this->config->get('oxy_f1_link_color'); ?>;}
#footer_a a:hover {color: <?php echo $this->config->get('oxy_f1_link_hover_color'); ?>;}
#footer_a span.mm_icon, #footer_a .social_widget ul li {background-color: <?php echo $this->config->get('oxy_f1_icon_color'); ?>;}
/*  Information, Customer Service, Extras, My Account  */
#footer_c {
<?php if($this->config->get('oxy_f2_bg_color') !='') { ?>
	background-color: <?php echo $this->config->get('oxy_f2_bg_color'); ?>;
<?php }	
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $this->config->get('config_ssl') . 'image/';
} else {
	$path_image = $this->config->get('config_url') . 'image/';
}
if($this->config->get('oxy_bg_image_f2_custom') !='') { ?>
	background-image: url("<?php echo $path_image . $this->config->get('oxy_bg_image_f2_custom') ?>"); ?>;
<?php } else if($this->config->get('oxy_pattern_oxy_f2') !='') { ?>
	background-image: url("catalog/view/theme/oxy/image/patterns/p<?php echo $this->config->get('oxy_pattern_oxy_f2'); ?>.png");
<?php } else { ?>
	background-image: none;
<?php } 
if(($this->config->get('oxy_bg_image_f2_position') !='') || ($this->config->get('oxy_bg_image_f2_repeat') !='')) { ?>
	background-position: <?php echo $this->config->get('oxy_bg_image_f2_position'); ?>;
	background-repeat: <?php echo $this->config->get('oxy_bg_image_f2_repeat'); ?>;
<?php } 
if($this->config->get('oxy_f2_border_top_status') ==1) { ?>
	border-top: <?php echo $this->config->get('oxy_f2_border_top_size'); ?>px <?php echo $this->config->get('oxy_f2_border_top_style'); ?> <?php echo $this->config->get('oxy_f2_border_top_color'); ?>;	
<?php } ?>
}
#footer_c h3 {color: <?php echo $this->config->get('oxy_f2_titles_color'); ?>; border-bottom: <?php echo $this->config->get('oxy_f2_titles_border_bottom_size'); ?>px <?php echo $this->config->get('oxy_f2_titles_border_bottom_style'); ?> <?php echo $this->config->get('oxy_f2_titles_border_bottom_color'); ?>;}
#footer_c a {color: <?php echo $this->config->get('oxy_f2_link_color'); ?>;}
#footer_c a:hover {color: <?php echo $this->config->get('oxy_f2_link_hover_color'); ?>;}
#footer_c ul li {color: <?php echo $this->config->get('oxy_f2_titles_border_bottom_color'); ?>;}
/*  Powered by, Payment Images  */
#footer_d {
<?php if($this->config->get('oxy_f4_bg_color') !='') { ?>
	background-color: <?php echo $this->config->get('oxy_f4_bg_color'); ?>;
<?php }	
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $this->config->get('config_ssl') . 'image/';
} else {
	$path_image = $this->config->get('config_url') . 'image/';
}
if($this->config->get('oxy_bg_image_f4_custom') !='') { ?>
	background-image: url("<?php echo $path_image . $this->config->get('oxy_bg_image_f4_custom') ?>"); ?>;
<?php } else if($this->config->get('oxy_pattern_oxy_f4') !='') { ?>
	background-image: url("catalog/view/theme/oxy/image/patterns/p<?php echo $this->config->get('oxy_pattern_oxy_f4'); ?>.png");
<?php } else { ?>
	background-image: none;
<?php } 
if(($this->config->get('oxy_bg_image_f4_position') !='') || ($this->config->get('oxy_bg_image_f4_repeat') !='')) { ?>
	background-position: <?php echo $this->config->get('oxy_bg_image_f4_position'); ?>;
	background-repeat: <?php echo $this->config->get('oxy_bg_image_f4_repeat'); ?>;
<?php } 
if($this->config->get('oxy_f4_border_top_status') ==1) { ?>
	border-top: <?php echo $this->config->get('oxy_f4_border_top_size'); ?>px <?php echo $this->config->get('oxy_f4_border_top_style'); ?> <?php echo $this->config->get('oxy_f4_border_top_color'); ?>;	
<?php } ?>
}
#footer_d {color: <?php echo $this->config->get('oxy_f4_text_color'); ?>;}
#footer_d a {color: <?php echo $this->config->get('oxy_f4_link_color'); ?>;}
#footer_d a:hover {color: <?php echo $this->config->get('oxy_f4_link_hover_color'); ?>;}
/*  Bottom Custom Block  */
#footer_e {
<?php if($this->config->get('oxy_f5_bg_color') !='') { ?>
	background-color: <?php echo $this->config->get('oxy_f5_bg_color'); ?>;
<?php }	
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	$path_image = $this->config->get('config_ssl') . 'image/';
} else {
	$path_image = $this->config->get('config_url') . 'image/';
}
if($this->config->get('oxy_bg_image_f5_custom') !='') { ?>
	background-image: url("<?php echo $path_image . $this->config->get('oxy_bg_image_f5_custom') ?>"); ?>;
<?php } else if($this->config->get('oxy_pattern_oxy_f5') !='') { ?>
	background-image: url("catalog/view/theme/oxy/image/patterns/p<?php echo $this->config->get('oxy_pattern_oxy_f5'); ?>.png");
<?php } else { ?>
	background-image: none;
<?php } 
if(($this->config->get('oxy_bg_image_f5_position') !='') || ($this->config->get('oxy_bg_image_f5_repeat') !='')) { ?>
	background-position: <?php echo $this->config->get('oxy_bg_image_f5_position'); ?>;
	background-repeat: <?php echo $this->config->get('oxy_bg_image_f5_repeat'); ?>;
<?php } 
if($this->config->get('oxy_f5_border_top_status') ==1) { ?>
	border-top: <?php echo $this->config->get('oxy_f5_border_top_size'); ?>px <?php echo $this->config->get('oxy_f5_border_top_style'); ?> <?php echo $this->config->get('oxy_f5_border_top_color'); ?>;	
<?php } ?>
}
#footer_e {color: <?php echo $this->config->get('oxy_f5_text_color'); ?>;}
#footer_e a {color: <?php echo $this->config->get('oxy_f5_link_color'); ?>;}
#footer_e a:hover {color: <?php echo $this->config->get('oxy_f5_link_hover_color'); ?>;}

/*  Fonts  */
<?php if ($this->config->get('oxy_body_font') =='') { ?>
body, p, .ei-title h3 a, .cart-info thead .price, .cart-info tbody .price, .box-category-home .subcat a, .box-category-home .all a { 
    font-family: 'Open Sans',Arial,Helvetica,sans-serif; 
}
<?php }
if ($this->config->get('oxy_body_font') !='') {
$fontgoogle = $this->config->get('oxy_body_font');
$fontop = str_replace("+", " ", $fontgoogle); ?>
body, p, .ei-title h3 a, .cart-info thead .price, .cart-info tbody .price, .top-bar ul > li.name h1 a, .box-category-home .subcat a, .box-category-home .all a { 
    font-family: <?php echo $fontop ?>,Arial,Helvetica,sans-serif; 
}
<?php } ?>
<?php if ($this->config->get('oxy_title_font') =='') { ?>
h1, h2, h3, h4, h5, h6, #content .box-heading, .box-category .box-heading-category, .box-filter .box-heading, #column-left .box .box-heading, #column-right .box .box-heading, #column-left .product-box-slider .box-heading, #column-right .product-box-slider .box-heading, .product-grid .name a, .product-list .name a, #content .box-product .name a, .product-right-sm-related .name a, .product-bottom-related .name a, #column-left .box-product .name a, #column-right .box-product .name a, .product-box-slider .name a, .box-category-home a { 
    font-family: Bitter,Arial,Helvetica,sans-serif; 
}
<?php }
if ($this->config->get('oxy_title_font_weight') !='') { ?>
h1, h2, h3, h4, h5, h6, #content .box-heading, .box-category .box-heading-category, .box-filter .box-heading, #column-left .box .box-heading, #column-right .box .box-heading, #column-left .product-box-slider .box-heading, #column-right .product-box-slider .box-heading, .product-grid .name a, .product-list .name a, #content .box-product .name a, .product-right-sm-related .name a, .product-bottom-related .name a, #column-left .box-product .name a, #column-right .box-product .name a, .product-box-slider .name a, .box-category-home a { 
    font-weight: <?php echo $this->config->get('oxy_title_font_weight'); ?>; 
}
<?php }
if ($this->config->get('oxy_title_font_uppercase') ==1) { ?>
h1, h2, h3, h4, h5, h6, #content .box-heading, .box-category .box-heading-category, .box-filter .box-heading, #column-left .box .box-heading, #column-right .box .box-heading, #column-left .product-box-slider .box-heading, #column-right .product-box-slider .box-heading, .product-grid .name a, .product-list .name a, #content .box-product .name a, .product-right-sm-related .name a, .product-bottom-related .name a, #column-left .box-product .name a, #column-right .box-product .name a, .product-box-slider .name a, .box-category-home a { 
    text-transform: uppercase;
}
<?php }
if ($this->config->get('oxy_title_font') !='') {
$fontgoogle = $this->config->get('oxy_title_font');
$fontop = str_replace("+", " ", $fontgoogle); ?>
h1, h2, h3, h4, h5, h6, #content .box-heading, .box-category .box-heading-category, .box-filter .box-heading, #column-left .box .box-heading, #column-right .box .box-heading, #column-left .product-box-slider .box-heading, #column-right .product-box-slider .box-heading, .product-grid .name a, .product-list .name a, #content .box-product .name a, .product-right-sm-related .name a, .product-bottom-related .name a, #column-left .box-product .name a, #column-right .box-product .name a, .product-box-slider .name a, .box-category-home a { 
    font-family: <?php echo $fontop ?>,Arial,Helvetica,sans-serif; 
}
<?php } ?>
<?php if ($this->config->get('oxy_price_font') =='') { ?>
.price, .price-new, .price-old, .ei-title h4 a { 
    font-family: Bitter,Arial,Helvetica,sans-serif; 
}
<?php }
if ($this->config->get('oxy_price_font') !='') {
$fontgoogle = $this->config->get('oxy_price_font');
$fontop = str_replace("+", " ", $fontgoogle); ?>
.price, .price-new, .price-old, .ei-title h4 a { 
    font-family: <?php echo $fontop ?>,Arial,Helvetica,sans-serif; 
}
<?php } 
if ($this->config->get('oxy_price_font_weight') !='') { ?>
.price, .price-new, .price-old, .ei-title h4 a { 
    font-weight: <?php echo $this->config->get('oxy_price_font_weight'); ?>; 
}
<?php } ?>
<?php if ($this->config->get('oxy_button_font') =='') { ?>
a.button, input.button, a.button-exclusive, input.button-exclusive, .ei-title h4 a.button { 
    font-family: 'Open Sans',Arial,Helvetica,sans-serif; 
}
<?php }
if ($this->config->get('oxy_button_font') !='') {
$fontgoogle = $this->config->get('oxy_button_font');
$fontop = str_replace("+", " ", $fontgoogle); ?>
a.button, input.button, a.button-exclusive, input.button-exclusive, .ei-title h4 a.button { 
    font-family: <?php echo $fontop ?>,Arial,Helvetica,sans-serif; 
}
<?php } 
if ($this->config->get('oxy_button_font_weight') !='') { ?>
a.button, input.button, a.button-exclusive, input.button-exclusive, .ei-title h4 a.button { 
    font-weight: <?php echo $this->config->get('oxy_button_font_weight'); ?>; 
}
<?php }
if ($this->config->get('oxy_button_font_uppercase') ==1) { ?>
a.button, input.button, a.button-exclusive, input.button-exclusive, .ei-title h4 a.button { 
    text-transform: uppercase;
}
<?php } ?>
<?php if ($this->config->get('oxy_search_font') =='') { ?>
#t-header #search input { 
    font-family: 'Open Sans',Arial,Helvetica,sans-serif; 
}
<?php }
if ($this->config->get('oxy_search_font') !='') {
$fontgoogle = $this->config->get('oxy_search_font');
$fontop = str_replace("+", " ", $fontgoogle); ?>
#t-header #search input { 
    font-family: <?php echo $fontop ?>,Arial,Helvetica,sans-serif; 
}
<?php } ?>
#t-header #search input { 
<?php if(($this->config->get('oxy_search_font_size') !='') || ($this->config->get('oxy_search_font_weight') !='')) { ?>
	font-size: <?php echo $this->config->get('oxy_search_font_size'); ?>px;
    font-weight: <?php echo $this->config->get('oxy_search_font_weight'); ?>;
<?php }	
if($this->config->get('oxy_search_font_uppercase') ==1) { ?>	
	text-transform: uppercase;
<?php } ?>
}
<?php if ($this->config->get('oxy_cart_font') =='') { ?>
#header #cart .heading a div#cart-total { 
    font-family: Bitter,Arial,Helvetica,sans-serif; 
}
<?php }
if ($this->config->get('oxy_cart_font') !='') {
$fontgoogle = $this->config->get('oxy_cart_font');
$fontop = str_replace("+", " ", $fontgoogle); ?>
#header #cart .heading a div#cart-total { 
    font-family: <?php echo $fontop ?>,Arial,Helvetica,sans-serif; 
}
<?php }
if(($this->config->get('oxy_cart_font_size') !='') || ($this->config->get('oxy_cart_font_weight') !='')) { ?>
#header #cart .heading a div#cart-total { 
	font-size: <?php echo $this->config->get('oxy_cart_font_size'); ?>px;
    font-weight: <?php echo $this->config->get('oxy_cart_font_weight'); ?>;
}
<?php }
if ($this->config->get('oxy_cart_font_uppercase') ==1) { ?>
#header #cart .heading a div#cart-total { 
    text-transform: uppercase;
}
<?php } ?>
<?php if ($this->config->get('oxy_main_menu_font') =='') { ?>
#menu #homepage a, #menu_oc > ul > li > a, #menu_v > ul > li > a, #menu_h > ul > li > a, #menu_brands > ul > li > a, .menu_links a, #menu_custom_menu > ul > li > a, .menu_custom_block > ul > li > a, #menu_informations > ul > li > a, #menu_contacts > ul > li > a, .top-bar > ul .name h1 a { 
    font-family: Bitter,Arial,Helvetica,sans-serif; 
}
<?php }
if ($this->config->get('oxy_main_menu_font') !='') {
$fontgoogle = $this->config->get('oxy_main_menu_font');
$fontop = str_replace("+", " ", $fontgoogle); ?>
#menu #homepage a, #menu_oc > ul > li > a, #menu_v > ul > li > a, #menu_h > ul > li > a, #menu_brands > ul > li > a, .menu_links a, #menu_custom_menu > ul > li > a, .menu_custom_block > ul > li > a, #menu_informations > ul > li > a, #menu_contacts > ul > li > a, .top-bar > ul .name h1 a { 
    font-family: <?php echo $fontop ?>,Arial,Helvetica,sans-serif; 
}
<?php }
if(($this->config->get('oxy_mm_font_size') !='') || ($this->config->get('oxy_mm_font_weight') !='')) { ?>
#menu, #menu #homepage a, #menu_oc > ul > li > a, #menu_v > ul > li > a, #menu_h > ul > li > a, #menu_brands > ul > li > a, .menu_links a, #menu_custom_menu > ul > li > a, .menu_custom_block > ul > li > a, #menu_informations > ul > li > a, #menu_contacts > ul > li > a, .top-bar > ul .name h1 a {
	font-size: <?php echo $this->config->get('oxy_mm_font_size'); ?>px;
    font-weight: <?php echo $this->config->get('oxy_mm_font_weight'); ?>;
<?php }
if($this->config->get('oxy_mm_font_uppercase') ==1) { ?>	
	text-transform: uppercase;
<?php } ?>
}
<?php if($this->config->get('oxy_custom_css') !='') { ?>
/*  Custom CSS */
<?php echo htmlspecialchars_decode( $this->config->get('oxy_custom_css'), ENT_QUOTES ); ?>
<?php } ?>
</style>
<?php } ?>
<link href='//fonts.googleapis.com/css?family=Open+Sans&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Bitter&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=PT+Sans+Narrow&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Droid+Sans&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
<?php
if($this->config->get('oxy_body_font')!='' || $this->config->get('oxy_title_font')!='' || $this->config->get('oxy_price_font')!='' || $this->config->get('oxy_button_font')!='' || $this->config->get('oxy_search_font')!='' || $this->config->get('oxy_main_menu_font')!='') {
    $opfonts = array('Open Sans','Arial','Helvetica'); 
		if (in_array($this->config->get('oxy_body_font'),$opfonts)==false) { ?>
        <link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('oxy_body_font') ?>&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
        <?php }
		if (in_array($this->config->get('oxy_title_font'),$opfonts)==false) { ?>
        <link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('oxy_title_font') ?>&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
        <?php }
		if (in_array($this->config->get('oxy_price_font'),$opfonts)==false) { ?>
        <link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('oxy_price_font') ?>&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
        <?php }
		if (in_array($this->config->get('oxy_button_font'),$opfonts)==false) { ?>
        <link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('oxy_button_font') ?>&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
        <?php } 
		if (in_array($this->config->get('oxy_search_font'),$opfonts)==false) { ?>
        <link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('oxy_search_font') ?>&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
        <?php }   
		if (in_array($this->config->get('oxy_cart_font'),$opfonts)==false) { ?>
        <link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('oxy_cart_font') ?>&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
        <?php }         
		if (in_array($this->config->get('oxy_main_menu_font'),$opfonts)==false) { ?>
        <link href='//fonts.googleapis.com/css?family=<?php echo $this->config->get('oxy_main_menu_font') ?>&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic,greek-ext,greek,vietnamese' rel='stylesheet' type='text/css'>
        <?php }                                       
   }  
?>
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body>
<?php if($this->config->get('oxy_facebook_likebox_status')== 1) { ?>  
<?php if($this->config->get('oxy_facebook_likebox_id') != '') { ?>
<div class="facebook_<?php echo $this->config->get('oxy_facebook_likebox_position'); ?> hide-for-small">
<div id="facebook_icon"></div>
<div class="facebook_box">
  <script src="//connect.facebook.net/en_US/all.js#xfbml=1"></script>
  <fb:fan profile_id="<?php echo $this->config->get('oxy_facebook_likebox_id'); ?>" stream="0" connections="16" logobar="0" width="237" height="389"></fb:fan>  
  <script type="text/javascript">    
  $(function(){        
        $(".facebook_right").hover(function(){            
        $(".facebook_right").stop(true, false).animate({right: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $(".facebook_right").stop(true, false).animate({right: "-245" }, 800, 'easeInQuint' );        
        },1000);    
  });
  $(function(){        
        $(".facebook_left").hover(function(){            
        $(".facebook_left").stop(true, false).animate({left: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $(".facebook_left").stop(true, false).animate({left: "-245" }, 800, 'easeInQuint' );        
        },1000);    
  });  
  </script>
</div>
</div>
<?php } ?>
<?php } ?>
<?php if($this->config->get('oxy_twitter_block_status')== 1) { ?>  
<?php if($this->config->get('oxy_twitter_block_user') != '') { ?>
<div class="twitter_<?php echo $this->config->get('oxy_twitter_block_position'); ?> hide-for-small">
<div id="twitter_icon"></div>
<div class="twitter_box">
  <?php if($this->config->get('oxy_twitter_block_user') != '') { ?>
  <p><a class="twitter-timeline"  href="https://twitter.com/<?php echo $this->config->get('oxy_twitter_block_user'); ?>" data-chrome="noheader nofooter noborders noscrollbar transparent" data-tweet-limit="<?php echo $this->config->get('oxy_twitter_block_tweets'); ?>"  data-widget-id="<?php echo $this->config->get('oxy_twitter_block_widget_id'); ?>" data-theme="light" data-related="twitterapi,twitter" data-aria-polite="assertive">Tweets by <?php echo $this->config->get('oxy_twitter_block_user'); ?></a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script></p>
		<?php } ?>
  <script type="text/javascript">    
  $(function(){        
        $(".twitter_right").hover(function(){            
        $(".twitter_right").stop(true, false).animate({right: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $(".twitter_right").stop(true, false).animate({right: "-245" }, 800, 'easeInQuint' );        
        },1000);    
  });
  $(function(){        
        $(".twitter_left").hover(function(){            
        $(".twitter_left").stop(true, false).animate({left: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $(".twitter_left").stop(true, false).animate({left: "-245" }, 800, 'easeInQuint' );        
        },1000);    
  });  
  </script>
</div>
</div>
<?php } ?>
<?php } ?>
<?php if($this->config->get('oxy_video_box_status')== 1) { ?>  
<?php if ($oxy_video_box_content) { ?>
<div class="video_box_<?php echo $this->config->get('oxy_video_box_position'); ?> hide-for-small">
<div id="video_box_icon"></div>
<div class="video_box">
<?php echo htmlspecialchars_decode($oxy_video_box_content); ?> 
  <script type="text/javascript">    
  $(function(){        
        $(".video_box_right").hover(function(){            
        $(".video_box_right").stop(true, false).animate({right: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $(".video_box_right").stop(true, false).animate({right: "-588" }, 800, 'easeInQuint' );      
        },1000);    
  });
  $(function(){        
        $(".video_box_left").hover(function(){            
        $(".video_box_left").stop(true, false).animate({left: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $(".video_box_left").stop(true, false).animate({left: "-588" }, 800, 'easeInQuint' );        
        },1000);    
  });  
  </script>
</div>
</div>
<?php } ?>
<?php } ?>
<?php if($this->config->get('oxy_custom_box_status')== 1) { ?>  
<?php if ($oxy_custom_box_content) { ?>
<div class="custom_box_<?php echo $this->config->get('oxy_custom_box_position'); ?> hide-for-small">
<div id="custom_box_icon"></div>
<div class="custom_box">
<?php echo htmlspecialchars_decode($oxy_custom_box_content); ?> 
  <script type="text/javascript">    
  $(function(){        
        $(".custom_box_right").hover(function(){            
        $(".custom_box_right").stop(true, false).animate({right: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $(".custom_box_right").stop(true, false).animate({right: "-245" }, 800, 'easeInQuint' );      
        },1000);    
  });
  $(function(){        
        $(".custom_box_left").hover(function(){            
        $(".custom_box_left").stop(true, false).animate({left: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $(".custom_box_left").stop(true, false).animate({left: "-245" }, 800, 'easeInQuint' );        
        },1000);    
  });  
  </script>
</div>
</div>
<?php } ?>
<?php } ?>
<div class="wrapper">
<?php //[SB] Took out top line ?>
<?php if($this->config->get('oxy_header_fixed_header_status')) { //[SB] Added check for sticky header ?>
<script>
  $(window).load(function(){
    $("#header").sticky({ topSpacing: 0 });
  });
</script>
<?php } ?>
<header id="header">
<div id="t-header" class="row">
  <div class="four columns">
  <div id="vit_header_account" class="hide top" >
	  <?php echo $homes; ?>&nbsp;&nbsp;|&nbsp;&nbsp;<?php echo $join; ?>&nbsp;&nbsp;|&nbsp;&nbsp;<?php echo $my_account; ?>&nbsp;&nbsp;|&nbsp;&nbsp;<?php echo $smallcart; ?>
  </div>
  <?php if($this->config->get('oxy_logo_position') =='left') { ?>	
  <?php if ($logo) { ?>
  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
  <?php } ?>
  <?php } ?>
  <?php if($this->config->get('oxy_search_bar_position') =='left') { ?>	
  <div id="search">
    <div class="button-search"></div>
    <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
  </div>
  <?php } ?> 
  </div>
  
  <div class="four columns">
  <?php if($this->config->get('oxy_logo_position') =='center') { ?>	
  <?php if ($logo) { ?>
  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
  <?php } ?>
  <?php } ?>
  <?php if($this->config->get('oxy_search_bar_position') =='center') { ?>	
  <div id="search">
    <div class="button-search"></div>
    <input class="search-bar" type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
  </div>
  <?php } ?>
  </div>
  
  <div class="four columns clearfix">
	
	<?php //[SB] Custom Header ?>
  <div id="vit_header_account">
	  <?php echo $homes; ?>&nbsp;&nbsp;|&nbsp;&nbsp;<?php echo $hello; ?>&nbsp;&nbsp;|&nbsp;&nbsp;<?php echo
$my_account; ?>
  </div>


  <div id="vit_header_phone">
	<?php echo $phone; ?>
  </div>
  
  <div id="vit_header_cart">
	  <?php echo $cart; ?>
  </div>
    
  <?php if($this->config->get('oxy_search_bar_position') =='right') { ?>	
  <div id="search">
    <div class="button-search"></div>
    <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
  </div>
  <?php } ?>
  </div>
</div>
<div class="row">
<div class="twelve columns">
<?php if($this->config->get('oxy_layout_s')== 1) { ?> 
        <nav class="top-bar show-for-small">

          <ul>
            <li class="name"><h1 class="toggle-topbar"><a href="#"><?php echo $text_menu_menu; ?></a></h1></li>
            <li class="toggle-name">  <div id="search">
					<div class="button-search"></div>
					<input class="search-bar" type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
				</div></li>
          </ul>
          <section>
            <ul class="left">
				<?php //[SB] Moved Bestseller up ?>
                <li><?php if(($this->config->get('oxy_menu_link_3_status') =='1') && ($this->config->get('oxy_menu_link_3_url') !='')) { ?>
		        <a href="<?php echo $this->config->get('oxy_menu_link_3_url'); ?>"><?php echo $oxy_menu_link_3; ?></a>
                <?php } ?></li>
				<!--<?php //[SB] Added Promotions to Mobile View ?>
				<?php if($this->config->get('oxy_menu_cm_status')== 1) { ?>
				<li><a><?php echo $oxy_menu_cm_title; ?></a>
					<ul>
					<?php if(($this->config->get('oxy_menu_cm_link_1_status') =='1') && ($this->config->get('oxy_menu_cm_link_1_url') !='')) { ?>
					<li>
					<a href="<?php echo $this->config->get('oxy_menu_cm_link_1_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_1_target'); ?>">
					<?php echo $oxy_menu_cm_link_1; ?>
					</a>
					</li>
					<?php } ?>  
					<?php if(($this->config->get('oxy_menu_cm_link_2_status') =='1') && ($this->config->get('oxy_menu_cm_link_2_url') !='')) { ?>
					<li>
					<a href="<?php echo $this->config->get('oxy_menu_cm_link_2_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_2_target'); ?>">
					<?php echo $oxy_menu_cm_link_2; ?>
					</a>
					</li>
					<?php } ?>  
					<?php if(($this->config->get('oxy_menu_cm_link_3_status') =='1') && ($this->config->get('oxy_menu_cm_link_3_url') !='')) { ?>
					<li>
					<a href="<?php echo $this->config->get('oxy_menu_cm_link_3_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_3_target'); ?>">
					<?php echo $oxy_menu_cm_link_3; ?>
					</a>
					</li>
					<?php } ?>  
					<?php if(($this->config->get('oxy_menu_cm_link_4_status') =='1') && ($this->config->get('oxy_menu_cm_link_4_url') !='')) { ?>
					<li>
					<a href="<?php echo $this->config->get('oxy_menu_cm_link_4_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_4_target'); ?>">
					<?php echo $oxy_menu_cm_link_4; ?>
					</a>
					</li>
					<?php } ?>  
					<?php if(($this->config->get('oxy_menu_cm_link_5_status') =='1') && ($this->config->get('oxy_menu_cm_link_5_url') !='')) { ?>
					<li>
					<a href="<?php echo $this->config->get('oxy_menu_cm_link_5_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_5_target'); ?>">
					<?php echo $oxy_menu_cm_link_5; ?>
					</a>
					</li>
					<?php } ?>  
					<?php if(($this->config->get('oxy_menu_cm_link_6_status') =='1') && ($this->config->get('oxy_menu_cm_link_6_url') !='')) { ?>
					<li>
					<a href="<?php echo $this->config->get('oxy_menu_cm_link_6_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_6_target'); ?>">
					<?php echo $oxy_menu_cm_link_6; ?>
					</a>
					</li>
					<?php } ?>  
					<?php if(($this->config->get('oxy_menu_cm_link_7_status') =='1') && ($this->config->get('oxy_menu_cm_link_7_url') !='')) { ?>
					<li>
					<a href="<?php echo $this->config->get('oxy_menu_cm_link_7_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_7_target'); ?>">
					<?php echo $oxy_menu_cm_link_7; ?>
					</a>
					</li>
					<?php } ?>  
					<?php if(($this->config->get('oxy_menu_cm_link_8_status') =='1') && ($this->config->get('oxy_menu_cm_link_8_url') !='')) { ?>
					<li>
					<a href="<?php echo $this->config->get('oxy_menu_cm_link_8_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_8_target'); ?>">
					<?php echo $oxy_menu_cm_link_8; ?>
					</a>
					</li>
					<?php } ?>  
					<?php if(($this->config->get('oxy_menu_cm_link_9_status') =='1') && ($this->config->get('oxy_menu_cm_link_9_url') !='')) { ?>
					<li>
					<a href="<?php echo $this->config->get('oxy_menu_cm_link_9_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_9_target'); ?>">
					<?php echo $oxy_menu_cm_link_9; ?>
					</a>
					</li>
					<?php } ?>  
					<?php if(($this->config->get('oxy_menu_cm_link_10_status') =='1') && ($this->config->get('oxy_menu_cm_link_10_url') !='')) { ?>
					<li>
					<a href="<?php echo $this->config->get('oxy_menu_cm_link_10_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_10_target'); ?>">
					<?php echo $oxy_menu_cm_link_10; ?>
					</a>
					</li>
					<?php } ?>                                
				</ul> 
			</li>
	<?php } ?>-->
			
                <?php foreach ($categories as $category) { ?>
                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                  <?php if ($category['children']) { ?>
                   <?php for ($i = 0; $i < count($category['children']);) { ?>
                    <ul class="dropdown">
                      <?php $j = $i + ceil(count($category['children'])); ?>
                      <?php for (; $i < $j; $i++) { ?>
                      <?php if (isset($category['children'][$i])) { ?>
                      <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
                      <?php if($this->config->get('oxy_menu_categories_3_level') ==1) { ?>
			          <?php if ($category['children'][$i]['children_level_2']) { ?>
				      <div>
			            <ul>
				          <?php for ($si = 0; $si < count($category['children'][$i]['children_level_2']); $si++) { ?>
					        <li><a href="<?php echo $category['children'][$i]['children_level_2'][$si]['href']; ?>"  ><?php echo $category['children'][$i]['children_level_2'][$si]['name']; ?></a></li>
				          <?php } ?>
				        </ul>
			          </div>
			          <?php } ?>
                      <?php } ?>		  
			          </li>
                      <?php } ?>
                      <?php } ?>
                    </ul>
                    <?php } ?>
                  <?php } ?>
                </li>
                <?php } ?>
                <li><?php if(($this->config->get('oxy_menu_link_1_status') =='1') && ($this->config->get('oxy_menu_link_1_url') !='')) { ?>
		        <a href="<?php echo $this->config->get('oxy_menu_link_1_url'); ?>"><?php echo $oxy_menu_link_1; ?></a>
                <?php } ?></li>
                <li><?php if(($this->config->get('oxy_menu_link_2_status') =='1') && ($this->config->get('oxy_menu_link_2_url') !='')) { ?>
		        <a href="<?php echo $this->config->get('oxy_menu_link_2_url'); ?>"><?php echo $oxy_menu_link_2; ?></a>
                <?php } ?></li>
				<?php //[SB] Moved Bestseller up ?>
                <li><?php if(false && ($this->config->get('oxy_menu_link_3_status') =='1') && ($this->config->get('oxy_menu_link_3_url') !='')) { ?>
		        <a href="<?php echo $this->config->get('oxy_menu_link_3_url'); ?>"><?php echo $oxy_menu_link_3; ?></a>
                <?php } ?></li>
                <li><?php if(($this->config->get('oxy_menu_link_4_status') =='1') && ($this->config->get('oxy_menu_link_4_url') !='')) { ?>
		        <a href="<?php echo $this->config->get('oxy_menu_link_4_url'); ?>"><?php echo $oxy_menu_link_4; ?></a>
                <?php } ?></li>
                <li><?php if(($this->config->get('oxy_menu_link_5_status') =='1') && ($this->config->get('oxy_menu_link_5_url') !='')) { ?>
		        <a href="<?php echo $this->config->get('oxy_menu_link_5_url'); ?>"><?php echo $oxy_menu_link_5; ?></a>
                <?php } ?></li>
                <li><?php if(($this->config->get('oxy_menu_link_6_status') =='1') && ($this->config->get('oxy_menu_link_6_url') !='')) { ?>
		        <a href="<?php echo $this->config->get('oxy_menu_link_6_url'); ?>"><?php echo $oxy_menu_link_6; ?></a>
                <?php } ?></li>
                <li><?php if(($this->config->get('oxy_menu_link_7_status') =='1') && ($this->config->get('oxy_menu_link_7_url') !='')) { ?>
		        <a href="<?php echo $this->config->get('oxy_menu_link_7_url'); ?>"><?php echo $oxy_menu_link_7; ?></a>
                <?php } ?></li>
                <li><?php if(($this->config->get('oxy_menu_link_8_status') =='1') && ($this->config->get('oxy_menu_link_8_url') !='')) { ?>
		        <a href="<?php echo $this->config->get('oxy_menu_link_8_url'); ?>"><?php echo $oxy_menu_link_8; ?></a>
                <?php } ?></li>
                <li><?php if(($this->config->get('oxy_menu_link_9_status') =='1') && ($this->config->get('oxy_menu_link_9_url') !='')) { ?>
		        <a href="<?php echo $this->config->get('oxy_menu_link_9_url'); ?>"><?php echo $oxy_menu_link_9; ?></a>
                <?php } ?></li>
                <li><?php if(($this->config->get('oxy_menu_link_10_status') =='1') && ($this->config->get('oxy_menu_link_10_url') !='')) { ?>
		        <a href="<?php echo $this->config->get('oxy_menu_link_10_url'); ?>"><?php echo $oxy_menu_link_10; ?></a>
                <?php } ?></li>
				
				<?php //[SB] Took out Contact Us from Mobile View
				if(false) { ?>
                <li><a href="<?php echo $contact; ?>"><?php echo $text_menu_contact_us; ?></a></li>
				<?php } ?>
            </ul>
          </section>
        </nav>
<?php } ?>        
<nav id="menu" class="hide-for-small">
<?php if(($this->config->get('oxy_menu_homepage_status')== 1) && ($this->config->get('oxy_menu_homepage_style')== 1)) { ?>
<div id="homepage"><a href="<?php echo $home; ?>"><img src="catalog/view/theme/oxy/image/homepage.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
<?php }
if(($this->config->get('oxy_menu_homepage_status')== 1) && ($this->config->get('oxy_menu_homepage_style')== 2)) { ?>
<div id="homepage"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></div>
<?php } ?> 
<?php 
//[MY] best sellers
if(($this->config->get('oxy_menu_link_3_status') =='1') && ($this->config->get('oxy_menu_link_3_url') !='')) { ?>
    <div class="menu_links" id="menu-bestseller">
		<a href="<?php echo $this->config->get('oxy_menu_link_3_url'); ?>" target="<?php echo $this->config->get('oxy_menu_link_3_target'); ?>" >
		<?php echo $oxy_menu_link_3; ?>
        </a>
    </div>
<?php } ?>   
<?php if ($categories) { ?>
<?php if($this->config->get('oxy_menu_categories_style')== 1) { ?>
<?php if($this->config->get('oxy_menu_categories_status')== 1) { ?>
<?php //[MY] major edit to modify menu to suit design?>
<div id="menu_oc">
    <ul>
        <?php foreach ($categories as $category) { ?><?php //malcolm modify menu to include span.. css overrides to center text ?>
            <?php //malcolm for width?>
            <?php $counter = 0; ?>
            <?php $custom_width = array('Deals' => 120, 'Body &amp; Beauty' => 150, 'Diet &amp; Detox' => 80, 'Vitamins &amp; Supplements' =>  240, 'Home &amp; Organic' => 150, 'Men' => 65, 'Home &amp; Health' => 150, 'Women' => 70, 'Babies &amp; Kids' => 150); ?>
            <?php $set_width = '110px'; ?>
            <?php if (!empty($custom_width[$category['name']])) { ?>
                <?php $set_width = $custom_width[$category['name']] . "px"; ?>
            <?php } ?>
            <li>
                <?php if ($category['children']) { ?>
				<a href="#" style="width:<?php echo $set_width; ?>"><span><?php echo $category['name']; ?></span></a>
                    <?php $total_child = count($category['children']); //[MY] ?>
                    <?php $counter = 0; //[MY]?>
                    <?php $col_limit = 10; //[MY] ?>
                    <?php $col_needed = array(0 => 'two', 1 => 'two', 2 => 'four', 3 => 'six', 4 => 'eight', 5 => 'ten'); //[MY]  ?>
                    <?php $inner_cols = array(0 => 'four', 1 => 'four', 2 => 'six', 3 => 'four', 4 => 'three', 5 => 'five-nb', 6 => 'two'); //[MY]?>
                    <?php $col_count = ceil($total_child / $col_limit); //[MY]  ?>
                    <div class="<?php echo $col_needed[$col_count]; ?> columns <?php echo $col_count;?>">
                        <?php for ($i = 0; $i < count($category['children']);) { ?>
                            <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                            <?php for (; $i < $j; $i++) { ?>
                                <?php if (($i % $col_limit) == 0) { ?>
                                    <ul class="<?php echo $inner_cols[$col_count]; ?> columns">
                                    <?php } ?>
                                    <?php if (isset($category['children'][$i])) { ?>
                                        <?php $counter++; ?>
                                        <li class = "<?php echo $category['children'][$i]['name']; ?>"><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
                                            <?php if ($this->config->get('oxy_menu_categories_3_level') == 1) { ?>
                                                <?php if ($category['children'][$i]['children_level_2']) { ?>
                                                    <div>
                                                        <ul>
                                                            <?php for ($si = 0; $si < count($category['children'][$i]['children_level_2']); $si++) { ?>
                                                                <li><a href="<?php echo $category['children'][$i]['children_level_2'][$si]['href']; ?>"  ><?php echo $category['children'][$i]['children_level_2'][$si]['name']; ?><?php echo 'child'; ?></a></li>
                                                            <?php }//.$si  ?>
                                                        </ul>
                                                    </div>
                                                <?php }//.$catlvl2  ?>		 
                                            <?php }//.$config   ?>		 
                                        </li>
                                    <?php }//.ifisset   ?>
                                    <?php if (((($i + 1) % $col_limit) == 0)) { ?>
                                    </ul>
                                <?php }//.end check   ?>
                            <?php }//.endforeach     ?>
                        <?php } ?>
                    </div>
                <?php } else { ?> <a href="<?php echo $category['href']; ?>" style="width:<?php echo $set_width; ?>"><span><?php echo $category['name']; ?></span></a> <?php } ?>
            </li>
        <?php } ?>
    </ul>
</div>
<?php } ?>
<?php } ?>
<?php if($this->config->get('oxy_menu_categories_style')== 2) { ?>
<?php if($this->config->get('oxy_menu_categories_status')== 1) { ?>
<div id="menu_v">
  <ul>
    <li><a><?php echo $text_menu_categories; ?></a>  
      <div>    
  <ul>
    <?php foreach ($categories as $category) { ?>
    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
                <?php if($this->config->get('oxy_menu_categories_3_level') ==1) { ?>
				<?php if ($category['children'][$i]['children_level_2']) { ?>
				<div>
			      <ul>
				    <?php for ($si = 0; $si < count($category['children'][$i]['children_level_2']); $si++) { ?>
					   <li><a href="<?php echo $category['children'][$i]['children_level_2'][$si]['href']; ?>"  ><?php echo $category['children'][$i]['children_level_2'][$si]['name']; ?></a></li>
				    <?php } ?>
				  </ul>
			    </div>
			    <?php } ?>		
                <?php } ?>	  
		  </li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
  </ul>
      </div>  
    </li>
  </ul> 
</div>  
<?php } ?>  
<?php } ?> 
<?php if($this->config->get('oxy_menu_categories_style')== 3) { ?>
<?php if($this->config->get('oxy_menu_categories_status')== 1) { ?>
<div id="menu_h">
  <ul>
    <li><a><?php echo $text_menu_categories; ?></a>   
    <div class="ten columns">
    <?php $counter = 0; foreach ($categories as $category) { 
	if (($counter+$this->config->get('oxy_menu_categories_per_row')) %$this->config->get('oxy_menu_categories_per_row') == 0) $xclass="span-first-child"; 
	else $xclass=""; ?>
    <?php if($this->config->get('oxy_menu_categories_per_row')== 3) { ?>   
    <div class="four columns <?php echo $xclass; ?>">
    <?php } ?> 
    <?php if($this->config->get('oxy_menu_categories_per_row')== 4) { ?>   
    <div class="three columns <?php echo $xclass; ?>">
    <?php } ?> 
    <?php if($this->config->get('oxy_menu_categories_per_row')== 5) { ?>   
    <div class="five-nb columns <?php echo $xclass; ?>">
    <?php } ?> 
    <?php if($this->config->get('oxy_menu_categories_per_row')== 6) { ?>   
    <div class="two columns <?php echo $xclass; ?>">
    <?php } ?>    
    <?php if($this->config->get('oxy_mm2_main_category_icon_status')== 1) { ?>       
    <div class="image"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" title="<?php echo $category['name']; ?>" alt="<?php echo $category['name']; ?>" /></a></div>
    <?php } ?>
      <span><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></span>
      <?php if ($category['children']) { ?>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
                <?php if($this->config->get('oxy_menu_categories_3_level') ==1) { ?>
				<?php if ($category['children'][$i]['children_level_2']) { ?>
				<div>
			      <ul>
				    <?php for ($si = 0; $si < count($category['children'][$i]['children_level_2']); $si++) { ?>
					   <li><a href="<?php echo $category['children'][$i]['children_level_2'][$si]['href']; ?>"  ><?php echo $category['children'][$i]['children_level_2'][$si]['name']; ?></a></li>
				    <?php } ?>
				  </ul>
			    </div>
			    <?php } ?>	
                <?php } ?>	  
		  </li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      <?php } ?>
    </div>
    <?php $counter++; } ?>
    </div> 
    </li>
  </ul>
</div>   
<?php } ?>  
<?php } ?> 
<?php } ?>
<?php if ($this->config->get('oxy_menu_brands_status') == "1"): ?>
<div id="menu_brands">        
  <ul>
    <li><a><?php echo $text_menu_brands; ?></a> 
      <div class="ten columns"> 
          <?php if ($manufacturers) { ?>           
          <?php $counter = 0; foreach ($manufacturers as $manufacturer) { 
	      if (($counter+$this->config->get('oxy_menu_brands_per_row')) %$this->config->get('oxy_menu_brands_per_row') == 0) $xclass="span-first-child"; 
          else $xclass=""; ?>
          <?php if($this->config->get('oxy_menu_brands_per_row')== 3) { ?>   
          <div class="four columns <?php echo $xclass; ?>">
          <?php } ?> 
          <?php if($this->config->get('oxy_menu_brands_per_row')== 4) { ?>   
          <div class="three columns <?php echo $xclass; ?>">
          <?php } ?> 
          <?php if($this->config->get('oxy_menu_brands_per_row')== 5) { ?>   
          <div class="five-nb columns <?php echo $xclass; ?>">
          <?php } ?> 
          <?php if($this->config->get('oxy_menu_brands_per_row')== 6) { ?>   
          <div class="two columns <?php echo $xclass; ?>">
          <?php } ?> 
          <?php if($this->config->get('oxy_menu_brands_per_row')== 8) { ?>   
          <div class="eight-nb columns <?php echo $xclass; ?>">
          <?php } ?>  
          <?php if($this->config->get('oxy_menu_brands_per_row')== 10) { ?>   
          <div class="ten-nb columns <?php echo $xclass; ?>">
          <?php } ?>                    
          <?php if($this->config->get('oxy_menu_brands_per_row')== 12) { ?>   
          <div class="one columns <?php echo $xclass; ?>">
          <?php } ?>     
          <?php if($this->config->get('oxy_menu_brands_style')== "1") { ?>           
          <div class="image"><a href="<?php echo $manufacturer['href']; ?>"><img src="<?php echo $manufacturer['image']; ?>" title="<?php echo $manufacturer['name']; ?>" alt="<?php echo $manufacturer['name']; ?>" /></a></div>
          <?php } ?>
          <?php if($this->config->get('oxy_menu_brands_style')== "2") { ?>           
          <div class="name"><a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
          <?php } ?>
          <?php if($this->config->get('oxy_menu_brands_style')== "3") { ?>           
          <div class="image"><a href="<?php echo $manufacturer['href']; ?>"><img src="<?php echo $manufacturer['image']; ?>" title="<?php echo $manufacturer['name']; ?>" alt="<?php echo $manufacturer['name']; ?>" /></a></div>
          <div class="name"><a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
          <?php } ?>                    
          </div>
          <?php $counter++; } ?>
          <?php } ?>
      </div>  
    </li>
  </ul>
</div>
<?php endif; ?> 

<?php if(($this->config->get('oxy_menu_link_1_status') =='1') && ($this->config->get('oxy_menu_link_1_url') !='')) { ?>
    <div class="menu_links">
		<a href="<?php echo $this->config->get('oxy_menu_link_1_url'); ?>" target="<?php echo $this->config->get('oxy_menu_link_1_target'); ?>">
        <?php echo $oxy_menu_link_1; ?>
        </a>
    </div>
<?php } ?>   
<?php if(($this->config->get('oxy_menu_link_2_status') =='1') && ($this->config->get('oxy_menu_link_2_url') !='')) { ?>
    <div class="menu_links">
		<a href="<?php echo $this->config->get('oxy_menu_link_2_url'); ?>" target="<?php echo $this->config->get('oxy_menu_link_2_target'); ?>">
        <?php echo $oxy_menu_link_2; ?>
        </a>
    </div>
<?php } ?>   
<?php 
//malcolm
if(false && ($this->config->get('oxy_menu_link_3_status') =='1') && ($this->config->get('oxy_menu_link_3_url') !='')) { ?>
    <div class="menu_links">
		<a href="<?php echo $this->config->get('oxy_menu_link_3_url'); ?>" target="<?php echo $this->config->get('oxy_menu_link_3_target'); ?>">
		<?php echo $oxy_menu_link_3; ?>
        </a>
    </div>
<?php } ?>   
<?php if(($this->config->get('oxy_menu_link_4_status') =='1') && ($this->config->get('oxy_menu_link_4_url') !='')) { ?>
    <div class="menu_links">
		<a href="<?php echo $this->config->get('oxy_menu_link_4_url'); ?>" target="<?php echo $this->config->get('oxy_menu_link_4_target'); ?>">
		<?php echo $oxy_menu_link_4; ?>
        </a>
    </div>
<?php } ?>   
<?php if(($this->config->get('oxy_menu_link_5_status') =='1') && ($this->config->get('oxy_menu_link_5_url') !='')) { ?>
    <div class="menu_links">
		<a href="<?php echo $this->config->get('oxy_menu_link_5_url'); ?>" target="<?php echo $this->config->get('oxy_menu_link_5_target'); ?>">
		<?php echo $oxy_menu_link_5; ?>
        </a>
    </div>
<?php } ?>   
<?php if(($this->config->get('oxy_menu_link_6_status') =='1') && ($this->config->get('oxy_menu_link_6_url') !='')) { ?>
    <div class="menu_links">
		<a href="<?php echo $this->config->get('oxy_menu_link_6_url'); ?>" target="<?php echo $this->config->get('oxy_menu_link_6_target'); ?>">
		<?php echo $oxy_menu_link_6; ?>
        </a>
    </div>
<?php } ?>   
<?php if(($this->config->get('oxy_menu_link_7_status') =='1') && ($this->config->get('oxy_menu_link_7_url') !='')) { ?>
    <div class="menu_links">
		<a href="<?php echo $this->config->get('oxy_menu_link_7_url'); ?>" target="<?php echo $this->config->get('oxy_menu_link_7_target'); ?>">
		<?php echo $oxy_menu_link_7; ?>
        </a>
    </div>
<?php } ?>   
<?php if(($this->config->get('oxy_menu_link_8_status') =='1') && ($this->config->get('oxy_menu_link_8_url') !='')) { ?>
    <div class="menu_links">
		<a href="<?php echo $this->config->get('oxy_menu_link_8_url'); ?>" target="<?php echo $this->config->get('oxy_menu_link_8_target'); ?>">
		<?php echo $oxy_menu_link_8; ?>
        </a>
    </div>
<?php } ?>   
<?php if(($this->config->get('oxy_menu_link_9_status') =='1') && ($this->config->get('oxy_menu_link_9_url') !='')) { ?>
    <div class="menu_links">
		<a href="<?php echo $this->config->get('oxy_menu_link_9_url'); ?>" target="<?php echo $this->config->get('oxy_menu_link_9_target'); ?>">
		<?php echo $oxy_menu_link_9; ?>
        </a>
    </div>
<?php } ?>   
<?php if(($this->config->get('oxy_menu_link_10_status') =='1') && ($this->config->get('oxy_menu_link_10_url') !='')) { ?>
    <div class="menu_links">
		<a href="<?php echo $this->config->get('oxy_menu_link_10_url'); ?>" target="<?php echo $this->config->get('oxy_menu_link_10_target'); ?>">
		<?php echo $oxy_menu_link_10; ?>
        </a>
    </div>
<?php } ?>   


<?php if($this->config->get('oxy_menu_cm_status')== 1) { ?>
<div id="menu_custom_menu">       
  <ul>
	  <!--<li><a href="<?php echo $this->config->get('oxy_menu_cm_link_2_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_2_target'); ?>"><?php echo $oxy_menu_cm_title; ?></a>-->
      <div>
        <ul>
          <li>            
            <div>
              <ul>
				  <!--<?php if(($this->config->get('oxy_menu_cm_link_1_status') =='1') && ($this->config->get('oxy_menu_cm_link_1_url') !='')) { ?>
                <li>
                <a href="<?php echo $this->config->get('oxy_menu_cm_link_1_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_1_target'); ?>">
                <?php echo $oxy_menu_cm_link_1; ?>
                </a>
                </li>
                <?php } ?>  
                <?php if(($this->config->get('oxy_menu_cm_link_2_status') =='1') && ($this->config->get('oxy_menu_cm_link_2_url') !='')) { ?>
                <li>
                <a href="<?php echo $this->config->get('oxy_menu_cm_link_2_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_2_target'); ?>">
                <?php echo $oxy_menu_cm_link_2; ?>
                </a>
                </li>
                <?php } ?>  -->
                <?php if(($this->config->get('oxy_menu_cm_link_3_status') =='1') && ($this->config->get('oxy_menu_cm_link_3_url') !='')) { ?>
                <li>
                <a href="<?php echo $this->config->get('oxy_menu_cm_link_3_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_3_target'); ?>">
                <?php echo $oxy_menu_cm_link_3; ?>
                </a>
                </li>
                <?php } ?>  
                <?php if(($this->config->get('oxy_menu_cm_link_4_status') =='1') && ($this->config->get('oxy_menu_cm_link_4_url') !='')) { ?>
                <li>
                <a href="<?php echo $this->config->get('oxy_menu_cm_link_4_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_4_target'); ?>">
                <?php echo $oxy_menu_cm_link_4; ?>
                </a>
                </li>
                <?php } ?>  
                <?php if(($this->config->get('oxy_menu_cm_link_5_status') =='1') && ($this->config->get('oxy_menu_cm_link_5_url') !='')) { ?>
                <li>
                <a href="<?php echo $this->config->get('oxy_menu_cm_link_5_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_5_target'); ?>">
                <?php echo $oxy_menu_cm_link_5; ?>
                </a>
                </li>
                <?php } ?>  
                <?php if(($this->config->get('oxy_menu_cm_link_6_status') =='1') && ($this->config->get('oxy_menu_cm_link_6_url') !='')) { ?>
                <li>
                <a href="<?php echo $this->config->get('oxy_menu_cm_link_6_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_6_target'); ?>">
                <?php echo $oxy_menu_cm_link_6; ?>
                </a>
                </li>
                <?php } ?>  
                <?php if(($this->config->get('oxy_menu_cm_link_7_status') =='1') && ($this->config->get('oxy_menu_cm_link_7_url') !='')) { ?>
                <li>
                <a href="<?php echo $this->config->get('oxy_menu_cm_link_7_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_7_target'); ?>">
                <?php echo $oxy_menu_cm_link_7; ?>
                </a>
                </li>
                <?php } ?>  
                <?php if(($this->config->get('oxy_menu_cm_link_8_status') =='1') && ($this->config->get('oxy_menu_cm_link_8_url') !='')) { ?>
                <li>
                <a href="<?php echo $this->config->get('oxy_menu_cm_link_8_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_8_target'); ?>">
                <?php echo $oxy_menu_cm_link_8; ?>
                </a>
                </li>
                <?php } ?>  
                <?php if(($this->config->get('oxy_menu_cm_link_9_status') =='1') && ($this->config->get('oxy_menu_cm_link_9_url') !='')) { ?>
                <li>
                <a href="<?php echo $this->config->get('oxy_menu_cm_link_9_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_9_target'); ?>">
                <?php echo $oxy_menu_cm_link_9; ?>
                </a>
                </li>
                <?php } ?>  
                <?php if(($this->config->get('oxy_menu_cm_link_10_status') =='1') && ($this->config->get('oxy_menu_cm_link_10_url') !='')) { ?>
                <li>
                <a href="<?php echo $this->config->get('oxy_menu_cm_link_10_url'); ?>" target="<?php echo $this->config->get('oxy_menu_cm_link_10_target'); ?>">
                <?php echo $oxy_menu_cm_link_10; ?>
                </a>
                </li>
                <?php } ?>                                
              </ul>
            </div>      
          </li>
        </ul>       
      </div>  
    </li>
  </ul>
</div>    
<?php } ?>  
<?php if($this->config->get('oxy_menu_custom_block_1_status')== 1) { ?>
<?php if ($oxy_menu_custom_block_content_1) { ?>
<div class="menu_custom_block">        
  <ul>
    <li><a><?php echo $oxy_menu_custom_block_title_1; ?></a> 
      <div>  
        <ul>
          <li> 
          <div>
          <?php echo htmlspecialchars_decode($oxy_menu_custom_block_content_1); ?>  
          </div>    
          </li>
        </ul>         
      </div>  
    </li>
  </ul>
</div>    
<?php } ?>                 
<?php } ?>
<?php if($this->config->get('oxy_menu_custom_block_2_status')== 1) { ?>
<?php if ($oxy_menu_custom_block_content_2) { ?>
<div class="menu_custom_block">        
  <ul>
    <li><a><?php echo $oxy_menu_custom_block_title_2; ?></a> 
      <div>  
        <ul>
          <li> 
          <div>
          <?php echo htmlspecialchars_decode($oxy_menu_custom_block_content_2); ?>  
          </div>    
          </li>
        </ul>         
      </div>  
    </li>
  </ul>
</div>    
<?php } ?>                 
<?php } ?> 
<?php if($this->config->get('oxy_menu_custom_block_3_status')== 1) { ?>
<?php if ($oxy_menu_custom_block_content_3) { ?>
<div class="menu_custom_block">        
  <ul>
    <li><a><?php echo $oxy_menu_custom_block_title_3; ?></a> 
      <div>  
        <ul>
          <li> 
          <div>
          <?php echo htmlspecialchars_decode($oxy_menu_custom_block_content_3); ?>  
          </div>    
          </li>
        </ul>         
      </div>  
    </li>
  </ul>
</div>    
<?php } ?>                 
<?php } ?>       
<?php if($this->config->get('oxy_menu_information_pages_status')== 1) { ?>
<?php if($this->config->get('oxy_information_column_1_status')== 1 || $this->config->get('oxy_information_column_2_status')== 1 || $this->config->get('oxy_information_column_3_status')== 1) { ?>
<div id="menu_informations">       
  <ul>
    <li><a><?php echo $text_information; ?></a>
      <div class="eight columns"> 
        <?php if($this->config->get('oxy_information_column_1_status')== 1) { ?>
        <ul class="s<?php echo 12 / ($this->config->get('oxy_information_column_1_status') + $this->config->get('oxy_information_column_2_status') + $this->config->get('oxy_information_column_3_status')) ; ?> columns">
          <li>            
            <div>
              <span><?php echo $text_information; ?></span>
              <ul>
                <?php foreach ($informations as $information) { ?>
                <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                <?php } ?>
              </ul>
            </div>
          </li>
        </ul>
        <?php } ?>
        <?php if($this->config->get('oxy_information_column_2_status')== 1) { ?>
        <ul class="s<?php echo 12 / ($this->config->get('oxy_information_column_1_status') + $this->config->get('oxy_information_column_2_status') + $this->config->get('oxy_information_column_3_status')) ; ?> columns">
          <li>
            <div>
              <span><?php echo $text_service; ?></span>
              <ul>
                <?php if($this->config->get('oxy_i_c_2_1_status')== 1) { ?><li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li><?php } ?>
                <?php if($this->config->get('oxy_i_c_2_2_status')== 1) { ?><li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li><?php } ?>
                <?php if($this->config->get('oxy_i_c_2_3_status')== 1) { ?><li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li><?php } ?>
              </ul>
            </div>
          </li>
        </ul>
        <?php } ?>
        <?php if($this->config->get('oxy_information_column_3_status')== 1) { ?>
        <ul class="s<?php echo 12 / ($this->config->get('oxy_information_column_1_status') + $this->config->get('oxy_information_column_2_status') + $this->config->get('oxy_information_column_3_status')) ; ?> columns">
          <li>
            <div>
              <span><?php echo $text_extra; ?></span>
              <ul>
                <?php if($this->config->get('oxy_i_c_3_2_status')== 1) { ?><li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li><?php } ?>
                <?php if($this->config->get('oxy_i_c_3_3_status')== 1) { ?><li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li><?php } ?>
                <?php if($this->config->get('oxy_i_c_3_4_status')== 1) { ?><li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li><?php } ?>
              </ul>
            </div>
          </li>
        </ul>
        <?php } ?>
      </div>
    </li>
  </ul>
</div>
<?php } ?>
<?php } ?>
<?php if($this->config->get('oxy_menu_contacts_block_status')== 1) { ?>
<div id="menu_contacts">
  <ul>
    <li><a href="<?php echo $contact; ?>"><?php echo $text_menu_contact_us; ?></a>
    <?php if($this->config->get('oxy_menu_contacts_status')== 1 || $this->config->get('oxy_menu_contacts_address_status')== 1) { ?>
      <div class="six columns">
      <?php if($this->config->get('oxy_menu_contacts_status')== 1) { ?>
      <?php if(($oxy_contact_mphone1) || ($oxy_contact_mphone2) || ($oxy_contact_sphone1) || ($oxy_contact_sphone2) || ($oxy_contact_fax1) || ($oxy_contact_fax2) || ($oxy_contact_email1) || ($oxy_contact_email2) || ($oxy_contact_skype1) || ($oxy_contact_skype2)) { ?>
        <ul class="s<?php echo 12 / ($this->config->get('oxy_menu_contacts_status') + $this->config->get('oxy_menu_contacts_address_status')) ; ?> columns">
        <li>
        <span class="ngw"><?php echo $text_menu_contacts; ?></span>

			<?php if(($oxy_contact_mphone1) || ($oxy_contact_mphone2)) { ?>
        <div class="mc">
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-mphone-38.png" alt="Phone" title="Phone"></span>
        <?php if ($oxy_contact_mphone1) { ?>
        <span class="mm"><?php echo $oxy_contact_mphone1; ?></span>
        <?php } ?>
        <?php if ($oxy_contact_mphone2) { ?>
        <span class="mm"><?php echo $oxy_contact_mphone2; ?></span>
        <?php } ?>
        </div>
        <?php } ?>

        <?php if(($oxy_contact_sphone1) || ($oxy_contact_sphone2)) { ?>
        <div class="mc">
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-sphone-38.png" alt="Phone" title="Phone"></span>
        <?php if ($oxy_contact_sphone1) { ?>
        <span class="mm"><?php echo $oxy_contact_sphone1; ?></span>
        <?php } ?>
        <?php if ($oxy_contact_sphone2) { ?>
        <span class="mm"><?php echo $oxy_contact_sphone2; ?></span>
        <?php } ?>
        </div>
        <?php } ?>

        <?php if(($oxy_contact_fax1) || ($oxy_contact_fax2)) { ?>
        <div class="mc">
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-fax-38.png" alt="Fax" title="Fax"></span>
        <?php if ($oxy_contact_fax1) { ?>
        <span class="mm"><?php echo $oxy_contact_fax1; ?></span>
        <?php } ?>
        <?php if ($oxy_contact_fax2) { ?>
        <span class="mm"><?php echo $oxy_contact_fax2; ?></span>
        <?php } ?>
        </div>
        <?php } ?>

        <?php if(($oxy_contact_email1) || ($oxy_contact_email2)) { ?>
        <div class="mc">
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-email-38.png" alt="E-mail" title="E-mail"></span>
        <?php if ($oxy_contact_email1) { ?>
        <span class="mm"><?php echo $oxy_contact_email1; ?></span>
        <?php } ?>
        <?php if ($oxy_contact_email2) { ?>
        <span class="mm"><?php echo $oxy_contact_email2; ?></span>
        <?php } ?>
        </div>
        <?php } ?>

        <?php if(($oxy_contact_skype1) || ($oxy_contact_skype2)) { ?>
        <div class="mc">
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-skype-38.png" alt="Skype" title="Skype"></span>
        <?php if ($oxy_contact_skype1) { ?>
        <span class="mm"><?php echo $oxy_contact_skype1; ?></span>
        <?php } ?>
        <?php if ($oxy_contact_skype2) { ?>
        <span class="mm"><?php echo $oxy_contact_skype2; ?></span>
        <?php } ?>
        </div>
        <?php } ?>

        <?php if($this->config->get('oxy_menu_contacts_address_status')== 0) { ?>
        <a href="<?php echo $contact; ?>" class="button"><?php echo $text_menu_contact_form; ?></a>
        <?php } ?>
        </li>
        </ul>
     <?php } ?>
     <?php } ?>

     <?php if($this->config->get('oxy_menu_contacts_address_status')== 1) { ?>
     <?php if(($oxy_contact_location1) || ($oxy_contact_location2) || ($oxy_contact_hours)) { ?>
        <ul class="s<?php echo 12 / ($this->config->get('oxy_menu_contacts_status') + $this->config->get('oxy_menu_contacts_address_status')) ; ?> columns">
        <li>
        <?php if(($oxy_contact_location1) || ($oxy_contact_location2)) { ?>
        <span class="ngw"><?php echo $text_menu_contact_address; ?></span>
        <div class="mc">
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-location-38.png" alt="Location" title="Location"></span>
        <?php if($oxy_contact_location1) { ?>
        <span class="mm"><?php echo $oxy_contact_location1; ?></span>
        <?php } ?>
        <?php if($oxy_contact_location2) { ?>
        <span class="mm"><?php echo $oxy_contact_location2; ?></span>
        <?php } ?>
        </div>
        <br /><?php } ?>
        <?php if($oxy_contact_hours) { ?>
        <span class="ngw"><?php echo $text_menu_contact_hours; ?></span>
        <div class="mc">
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-hours-38.png" alt="Hours" title="Hours"></span>
        <span class="mm"><pre><?php echo $oxy_contact_hours; ?></pre></span>
        </div>
        <?php } ?><br />
        <a href="<?php echo $contact; ?>" class="button"><?php echo $text_menu_contact_form; ?></a>
        </li>
        </ul>
      <?php } ?>
      <?php } ?>

      </div>
      <?php } ?>
    </li>
  </ul>
</div>
<?php } ?>
</nav>
</div>
</div>
<?php //[SB] Second Menu ?>
<div class="row"><div class="twelve columns">
    <div class="sec-menu clearfix">

        <?php if(!empty($shopby) && $shopby) { ?>
            <div class="sec-menu-list six columns">
                <div class="sec-menu-left-title"><?php echo $text_shopby;?></div>
                <ul class="sec-menu-left clearfix">
                    <?php foreach($shopby as $filter) { ?>
                    <li>
                        <a href="<?php echo $filter['path'];?>" title="<?php echo $filter['name'];?>"><?php echo $filter['name'];?></a>
                    </li>
                    <?php } ?>
                    <li>
                        <a href="<?php echo $shopby_brands; ?>" title="<?php echo $text_brands;?>"><?php echo $text_brands;?></a>
                    </li>
                </ul>
            </div>
        <?php } ?>

        <ul class="sec-menu-list sec-menu-right clearfix six columns">
            <!--<li><a href="#" title="News and Articles">News and Articles</a></li>-->
			<li><a href="index.php?route=information/contact" title="<?php echo $text_menu_contact_us; ?>"><?php echo $text_menu_contact_us; ?></a></li>
			<!--<li><a href="free-samples" title="Free Samples">Free Samples</a></li>
			<li><a href="vit-dollar-redemption" title="Vit$ Redemption">Vit$ Redemptions</a></li>-->
		</ul>
	</div>
</div></div>
</header>
    
    


<div id="notification" class="row"></div>

<section id="midsection">
<div class="row">
<script type ="text/javascript">
	$(document).ready(function(){
		$(".box").first().attr("id", "surprise");
		$(".All.Deals > a").attr("href", "//vitamin.sg/index.php?route=product/special");
		$(".Clearance > a").attr("href", "//vitamin.sg/index.php?route=product/clearance");
		$(".Surprise.Deals > a").attr("href", "#surprise");
		$(".dropdown").first().find("li").eq(0).find("a").attr("href", "//vitamin.sg/index.php?route=product/special");
		$(".dropdown").first().find("li").eq(2).find("a").attr("href", "//vitamin.sg/index.php?route=product/clearance");
		$(".dropdown").first().find("li").eq(3).find("a").attr("href", "#surprise");
	});
</script>