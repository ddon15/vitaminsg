
<script type="text/javascript">
	jQuery(function($) {
      $('.carousel<?php echo $module; ?>').flexslider({
        animation: "slide",
        animationLoop: true,
		slideshow: true,  
		controlNav: false,
		itemWidth: <?php echo $width; ?>,
		maxItems: 100,
		minItems: 1
       }); 	
	});
</script>

<div class="carousel-flex">     
<div class="carousel<?php echo $module; ?> carousel">       
   <ul class="slides">
    <?php foreach ($banners as $banner) { ?>
    <li><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></li>
    <?php } ?>
  </ul> 
</div>  
</div>  