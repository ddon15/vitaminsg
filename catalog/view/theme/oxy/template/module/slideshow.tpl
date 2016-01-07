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
<!-- Brands Banner CSS -->
<style type="text/css">
  .brands-banner-wrapper {
    padding: 20px 10px 20px 54px;
    border: 10px solid #FF8D31;
    background-color: white;
    overflow: hidden;
  }
  .brands-banner-wrapper .brands-banner-top {
    width: 200px;
    height: 70px;
    float: left;
  }

  .brands-banner-wrapper .brands-banner {
    width: 100px;
    height: 50px;
    float: left;
    margin: 5px;
  }
  .max-dim-top {
    max-height: 120px;
    max-width: 200px;
  }
  .max-dim-def {
    max-height: 50px;
    max-width: 100px;
  }
</style>

<section id="banner-slider" class="flexslider">
   <ul class="slides">
    <?php if ($brands_banner): ?>
      <li>
      <!-- <h2 style="display: table; margin: 0 auto">Top Brands</h2> -->
      <div class="brands-banner-wrapper">
        <div>
          <?php foreach ($brands_top_banner as $each): ?>
            <div class="brands-banner-top">
            <a href="<?php echo $each['href']; ?>"><img src="image/<?php echo $each['image']; ?>" alt="<?php echo $each['name']; ?>" class="max-dim-top"/></a>    
            </div>
          <?php endforeach ?>
        </div>
        <div>
          <?php foreach ($brands_banner as $each): ?>
            <div class="brands-banner">
            <a href="<?php echo $each['href']; ?>"><img src="image/<?php echo $each['image']; ?>" alt="<?php echo $each['name']; ?>" class="max-dim-def"/></a>    
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
