<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>

<aside id="column-right" class="four columns hide-for-small">
	<div class="box">
		<div class="box-heading"><?php echo $text_aside_title; ?></div>
		<div class="box-content box-account">
			<ul>
				<?php foreach($aside_links as $link) { ?>
					<li>
						<?php if($link['link']) { ?>
							<a href="<?php echo $link['link']; ?>" title="<?php echo $link['title']; ?>"><?php echo $link['title']; ?></a>
						<?php } else { ?>
							<span style="text-transform:uppercase;"><?php echo $link['title']; ?></span>
						<?php } ?>
					</li>
				<?php } ?>
			</ul>
		</div>
	</div>
</aside>

<section id="content" class="columns op" style="width:66.66667%;">
	
	<?php echo $content_top; ?>

	<h2><?php echo $heading_title; ?></h2>
	<div><?php echo $content ?></div>
	
	<?php echo $content_bottom; ?>

</section>
<?php echo $footer; ?>