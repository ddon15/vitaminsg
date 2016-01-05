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
    <?php if ($brands_banner): ?>
      <li>
      <!-- <h2 style="display: table; margin: 0 auto">Top Brands</h2> -->
      <div style="padding: 30px !important;border: 10px solid gray; display: inline-block; background-color: white;overflow:hidden">
        <div style="clear:both;margin: 0 auto;display:table">
          <?php foreach ($brands_top_banner as $each): ?>
            <div style="width:200px;height:70px;float:left; text-align:center; line-height:100px;margin: 5px;">
            <a href="<?php echo $each['name']; ?>"><img src="image/<?php echo $each['image']; ?>" alt="<?php echo $each['name']; ?>" style="vertical-align: middle !important;border:none;max-height:50px" /></a>    
            </div>
          <?php endforeach ?>
        </div>
        <div style="clear:both">
          <?php foreach ($brands_banner as $each): ?>
            <div style="width:100px;height:50px;float:left; text-align:center; line-height:100px;margin: 5px;">
            <a href="<?php echo $each['name']; ?>"><img src="image/<?php echo $each['image']; ?>" alt="<?php echo $each['name']; ?>" style="vertical-align: middle !important;border:none;max-height:50px" /></a>    
            </div>
          <?php endforeach ?>
        </div>
      </div>
      </li>
    <?php endif ?>
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
