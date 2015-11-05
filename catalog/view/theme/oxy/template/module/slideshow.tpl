<?php if($this->config->get('oxy_homepage_banner_slider_type') ==1) { ?>
<section id="banner-slider">
   <div class="camera_wrap camera_azure_skin" id="camera_wrap_<?php echo $module; ?>">
   <?php foreach ($banners as $banner) { ?>
       <div data-link="<?php echo $banner['link']; ?>" data-thumb="<?php echo $banner['image']; ?>" data-src="<?php echo $banner['image']; ?>"></div>
   <?php } ?>
   </div>
</section>   
      
<script>
	jQuery(function(){		
		jQuery('#camera_wrap_<?php echo $module; ?>').camera({
			thumbnails: true,
			loader: true,
            hover: true,
		});	
	});
</script>
<?php }	?>

<?php if($this->config->get('oxy_homepage_banner_slider_type') ==2) { ?>
<section id="banner-slider" class="flexslider">
   <ul class="slides">
   <?php foreach ($banners as $banner) { ?>
	  <li>
      <?php if ($banner['link']) { ?>
      <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
      <?php } else { ?>
      <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
      <?php } ?>
	  </li>    
   <?php } ?>
   </ul>
</section>
      
<script type="text/javascript">
	$(window).load(function() {
	$('.flexslider').flexslider();
	});
</script>
<?php }	?>    

<?php if($this->config->get('oxy_homepage_banner_slider_type') ==3) { ?>
<div class="slideshow">
  <div id="slideshow<?php echo $module; ?>" class="nivoSliderx">
    <?php foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
    <?php } ?>
    <?php } ?>
  </div>
</div>

<script type="text/javascript">
    $(window).load(function() {
        $('#slideshow<?php echo $module; ?>').nivoSliderx();
    });
</script>
<?php }	?>
