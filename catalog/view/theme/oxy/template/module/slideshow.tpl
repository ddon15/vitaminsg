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
    padding: 20px 10px 20px 35px;
    border: 10px solid #FF8D31;
    background-color: white;
    overflow: hidden;
  }
  .brands-banner-wrapper .brands-banner-top {
    width: 140px;
    height: 70px;
    float: left;
    margin: 5px;
  }

  .brands-banner-wrapper .brands-banner {
    width: 140px;
    height: 70px;
    float: left;
    margin: 5px;
  }

  .brands-banner-wrapper .brands-banner img {
    -webkit-transition: .3s ease-in-out;
    transition: .3s ease-in-out;
  }

  .brands-banner-wrapper .brands-banner-top img {
    -webkit-transition: .3s ease-in-out;
    transition: .3s ease-in-out;
  }

  .img-size {
    width: 140px;
    height: 70px;
  }

  .brands-banner:hover img{
    width: 150px;
    opacity: .5;
  }

  .brands-banner-top:hover img{
    width: 150px;
    opacity: .5;
  }

  .max-dim-top {
    max-height: 70px;
    max-width: 140px;
  }
  .max-dim-def {
    max-height: 70px;
    max-width: 140px;
  }
  .brands-banner-header {
    font-size: x-large;
    display: table;
    margin: 0 auto;
    background-color: #FF8D31;
    color: #FFF;
    padding: 5px 20px 5px 20px;
    border-radius: 0px 0px 40px 40px;
    margin-top: -28px;
  }
  .margin-top-25 {    
    margin-top: 25px;
  }
</style>

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
