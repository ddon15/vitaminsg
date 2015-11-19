<?php echo $header; ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<section id="content" class="columns op"><?php echo $content_top; ?>
  <h1><?php echo $heading_title; ?></h1>
  <ul class="breadcrumbs">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php
  date_default_timezone_set('Asia/Singapore');
  if(strtotime(date("Y-m-d 23:59:59",strtotime($expiry))) > strtotime(date("Y-m-d H:i:s"))) { // lw: only display for non expired members ?>
  <h2><?php echo $text_member_num; if($member_num) { ?>&nbsp;<span style="color:#00A651;"><?php echo $member_num; //[SB] Added member num ?></span><?php } if($expiry) { ?> <span style="font-size:12px;">(<?php echo $text_expiry; echo $expiry; //[SB] Added expiry ?>)</span> <?php } ?></h2>
  <?php } ?>
  <div class="content">
    <ul>
      <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
      <li><a href="<?php echo $extend; ?>"><?php echo $text_extend; ?></a></li> <?php //[SB] Added extend account ?>
      <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
      <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
    </ul>
  </div>
  <h2><?php echo $text_my_orders; ?></h2>
  <div class="content">
    <ul> <?php //[SB] Removed download, returns and recurring, transaction ?>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <?php if ($reward) { ?>
      <li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  
  <?php //[SB] Removed newsletter ?>
  <?php echo $content_bottom; ?></section>
<?php echo $footer; ?> 