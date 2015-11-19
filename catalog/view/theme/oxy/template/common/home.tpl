<?php echo $header; ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div class="twelve columns" id="content"><?php echo $content_top; ?>
<?php if($this->config->get('oxy_homepage_category_wall_status')== 1) { ?>
<section id="homepage-category-wall">
  <div class="box-category-home row">  
    <?php foreach ($categories as $category) { ?>
    <div class="<?php echo $this->config->get('oxy_homepage_category_wall_per_row'); ?> mobile-two columns">   
    <?php if($this->config->get('oxy_homepage_category_wall_icon_status')== 1) { ?>       
    <div class="image"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" title="<?php echo $category['name']; ?>" alt="<?php echo $category['name']; ?>" /></a></div>
    <?php } ?>
      <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
      <div class="subcat">
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <?php if($i<$this->config->get('oxy_homepage_category_wall_sub_number')){ ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <div class="all"><a href="<?php echo $category['href']; ?>"><?php echo $text_more; ?></a></div>
      <?php } ?>
    </div>
     <?php } ?>
  </div> 
</section>  
<?php } ?>   
<?php if ($this->config->get('oxy_homepage_brands_wall_status') == "1"): ?>
<section id="homepage-brands-wall">
<div class="box-manufacturers-home row">  
<?php if ($manufacturers) { ?>
<?php foreach ($manufacturers as $manufacturer) { ?>
    <div class="<?php echo $this->config->get('oxy_homepage_brands_wall_per_row'); ?> mobile-two columns">
          <?php if($this->config->get('oxy_homepage_brands_wall_style')== "1") { ?>           
          <div class="image"><a href="<?php echo $manufacturer['href']; ?>"><img src="<?php echo $manufacturer['image']; ?>" title="<?php echo $manufacturer['name']; ?>" alt="<?php echo $manufacturer['name']; ?>" /></a></div>
          <?php } ?>
          <?php if($this->config->get('oxy_homepage_brands_wall_style')== "2") { ?>           
          <div class="name"><a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
          <?php } ?>
          <?php if($this->config->get('oxy_homepage_brands_wall_style')== "3") { ?>           
          <div class="image"><a href="<?php echo $manufacturer['href']; ?>"><img src="<?php echo $manufacturer['image']; ?>" title="<?php echo $manufacturer['name']; ?>" alt="<?php echo $manufacturer['name']; ?>" /></a></div>
          <div class="name"><a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
          <?php } ?>  
</div>
<?php } ?>
<?php } ?>
</div>
</section>
<?php endif; ?>   
<h1 style="display: none;"><?php echo $heading_title; ?></h1>
<?php echo $content_bottom; ?></div>
<?php echo $footer; ?>