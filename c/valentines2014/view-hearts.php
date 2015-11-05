<p class="instruction" style="padding-bottom: 0;"><strong style="font-size:1.3em;">Pick a "right" heart.</strong></p>
<p class="instruction2"  style="padding-top: 0;">More than <strong>$40,000</strong> worth of prizes to be won from <strong>10 Feb to 23 Feb.</strong> <br /><strong>1 lucky winner</strong> to walk away with <strong>$200 cash voucher daily.</strong></p>

<div class="hearts">
	<div id="message">
		<div class="congrats"><img src="images/congrats.png"/><br />You have won...</div>
		<div class="win"></div>
		<div class="thanks">Thank you for your participation. You will be notified on the self-collection details for your prize via email within 1 working day.</div>
		<div ><a href="http://www.vitamin.sg" class="exit">Exit</a></div>
	</div>
	<?php 
		$allimages = array(1,2,3,4,5,6,7,8,9,10,11,12,13,14);
		$start = 1;
		shuffle($allimages);
		foreach ($allimages as $image) {
			echo '<img src="images/heart' . $image . '.png" class="heart raw h' . $start++ . '">';
		}
	?>
</div>

<div>
	<input type="hidden" id="ticket" name="ticket" value="<?php echo $formdata['ticket']; ?>">
	<input type="hidden" id="frmmobile" name="frmmobile" value="<?php echo $formdata['frmmobile']; ?>">
</div>
<div class="clear"></div>