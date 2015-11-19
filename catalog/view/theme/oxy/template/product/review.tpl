<?php if ($reviews) { ?>
<p><?php echo $text_signin_to_review; ?></p>
<?php foreach ($reviews as $review) { ?>
<div class="review-list">

<div class="reviews-left two mobile-four columns">
<b><?php echo $review['author']; ?></b><span><img src="catalog/view/theme/oxy/image/stars/stars<?php echo $this->config->get('oxy_mid_prod_stars_color'); ?>-<?php echo $review['rating'] . '.png'; ?>" alt="<?php echo $review['reviews']; ?>" /></span>
<span>(<?php echo $review['date_added']; ?>)</span>
</div>

<div class="reviews-right ten mobile-four columns">
<div class="review-arrow hidden-phone"></div>
<?php echo $review['text']; ?>
</div>

</div>
<?php } ?>
<div class="review-disclaimer"><?php echo $text_review_disclaimer; ?></div>
<div class="pagination"><?php echo $pagination; ?></div>
<?php } else { ?>
<div class="content"><?php echo $text_no_reviews; ?><br><?php echo $text_signin_to_review; ?></div>
<?php } ?>
