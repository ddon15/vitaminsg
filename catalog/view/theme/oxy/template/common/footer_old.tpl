</div>
</section>

<footer id="footer">

<?php if(($oxy_fp_fb1_title) || ($oxy_fp_fb2_title) || ($oxy_fp_fb3_title) || ($oxy_fp_fb4_title)) { ?>
<div id="footer_p">
<div class="row">
<?php if($oxy_fp_fb1_title) { ?>
<div class="p_content s3 columns">
      <span class="p_icon pi1">
        <?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	        $path_image = $this->config->get('config_ssl') . 'image/';
        } else {
        	$path_image = $this->config->get('config_url') . 'image/';
        }
        if ($this->config->get('oxy_fp_fb1_icon') != ''){ ?>   
		<img src="<?php echo $path_image . $this->config->get('oxy_fp_fb1_icon') ?>" alt="+" title="+">
        <?php } else { ?>
        <img src="catalog/view/theme/oxy/image/icons_feature_box/fbb_icon_1.png" alt="+" title="+">
		<?php } ?>
      </span>
<span class="p_title"><a href="#" data-reveal-id="oxyModal1"><?php echo $oxy_fp_fb1_title; ?></a></span>
<?php if($oxy_fp_fb1_subtitle) { ?>
<span class="p_subtitle"><?php echo $oxy_fp_fb1_subtitle; ?></span>
<?php } ?>
</div>
<?php } ?>

<?php if($oxy_fp_fb2_title) { ?>
<div class="p_content s3 columns">
      <span class="p_icon pi2">
        <?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	        $path_image = $this->config->get('config_ssl') . 'image/';
        } else {
        	$path_image = $this->config->get('config_url') . 'image/';
        }
        if ($this->config->get('oxy_fp_fb2_icon') != ''){ ?>   
		<img src="<?php echo $path_image . $this->config->get('oxy_fp_fb2_icon') ?>" alt="+" title="+">
        <?php } else { ?>
        <img src="catalog/view/theme/oxy/image/icons_feature_box/fbb_icon_1.png" alt="+" title="+">
		<?php } ?>
      </span>
<span class="p_title"><a href="#" data-reveal-id="oxyModal2"><?php echo $oxy_fp_fb2_title; ?></a></span>
<?php if($oxy_fp_fb2_subtitle) { ?>
<span class="p_subtitle"><?php echo $oxy_fp_fb2_subtitle; ?></span>
<?php } ?>
</div>
<?php } ?>

<?php if($oxy_fp_fb3_title) { ?>
<div class="p_content s3 columns">
      <span class="p_icon pi3">
        <?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	        $path_image = $this->config->get('config_ssl') . 'image/';
        } else {
        	$path_image = $this->config->get('config_url') . 'image/';
        }
        if ($this->config->get('oxy_fp_fb3_icon') != ''){ ?>   
		<img src="<?php echo $path_image . $this->config->get('oxy_fp_fb3_icon') ?>" alt="+" title="+">
        <?php } else { ?>
        <img src="catalog/view/theme/oxy/image/icons_feature_box/fbb_icon_1.png" alt="+" title="+">
		<?php } ?>
      </span>
<span class="p_title"><a href="#" data-reveal-id="oxyModal3"><?php echo $oxy_fp_fb3_title; ?></a></span>
<?php if($oxy_fp_fb3_subtitle) { ?>
<span class="p_subtitle"><?php echo $oxy_fp_fb3_subtitle; ?></span>
<?php } ?>
</div>
<?php } ?>

<?php if($oxy_fp_fb4_title) { ?> 
<div class="p_content s3 columns">
      <span class="p_icon pi4">
        <?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	        $path_image = $this->config->get('config_ssl') . 'image/';
        } else {
        	$path_image = $this->config->get('config_url') . 'image/';
        }
        if ($this->config->get('oxy_fp_fb4_icon') != ''){ ?>   
		<img src="<?php echo $path_image . $this->config->get('oxy_fp_fb4_icon') ?>" alt="+" title="+">
        <?php } else { ?>
        <img src="catalog/view/theme/oxy/image/icons_feature_box/fbb_icon_1.png" alt="+" title="+">
		<?php } ?>
      </span>
<span class="p_title"><a href="#" data-reveal-id="oxyModal4"><?php echo $oxy_fp_fb4_title; ?></a></span>
<?php if($oxy_fp_fb4_subtitle) { ?>
<span class="p_subtitle"><?php echo $oxy_fp_fb4_subtitle; ?></span>
<?php } ?>
</div>
<?php } ?>

</div>
</div>
<?php } ?>

<?php if($this->config->get('oxy_custom_1_status')== 1 || $this->config->get('oxy_custom_2_status')== 1 || $this->config->get('oxy_follow_us_status')== 1 || $this->config->get('oxy_contacts_status')== 1) { ?>
<div id="footer_a">
<div class="row">

<?php if($this->config->get('oxy_custom_1_status')== 1) { ?> 
<?php if($oxy_custom_1_content) { ?>
<div id="footer_a_1" class="s<?php echo 12 / ($this->config->get('oxy_custom_1_status') + $this->config->get('oxy_custom_2_status') + $this->config->get('oxy_follow_us_status') + $this->config->get('oxy_contacts_status')) ; ?> columns">
		<?php if($oxy_custom_1_title) { ?>
        <h3><?php echo $oxy_custom_1_title; ?></h3>
		<?php } ?>  
        <?php echo htmlspecialchars_decode($oxy_custom_1_content); ?>
</div>
<?php } ?>
<?php } ?>

<?php if($this->config->get('oxy_custom_2_status')== 1) { ?> 
<?php if($oxy_custom_2_content) { ?>
<div id="footer_a_2" class="s<?php echo 12 / ($this->config->get('oxy_custom_1_status') + $this->config->get('oxy_custom_2_status') + $this->config->get('oxy_follow_us_status') + $this->config->get('oxy_contacts_status')) ; ?> columns">
		<?php if($oxy_custom_2_title) { ?>
        <h3><?php echo $oxy_custom_2_title; ?></h3>
		<?php } ?>  
        <?php echo htmlspecialchars_decode($oxy_custom_2_content); ?>
</div>
<?php } ?>
<?php } ?>

<?php if($this->config->get('oxy_follow_us_status')== 1) { ?>
<script type="text/javascript">
    $(function(){
        $(".tiptip").tipTip();
    });
</script>
<div id="footer_a_3" class="s<?php echo 12 / ($this->config->get('oxy_custom_1_status') + $this->config->get('oxy_custom_2_status') + $this->config->get('oxy_follow_us_status') + $this->config->get('oxy_contacts_status')) ; ?> columns">

        <?php if($oxy_follow_us_title) { ?>
        <h3><?php echo $oxy_follow_us_title; ?></h3>
		<?php } ?> 

        <div class="social_widget">
        <ul>
        <?php if($this->config->get('oxy_facebook') != '') { ?>
        <li class="facebook"><a href="<?php echo $this->config->get('oxy_facebook'); ?>" class="tiptip" title="Facebook" target="_blank">Facebook</a></li>
        <?php } ?>
	    <?php if($this->config->get('oxy_twitter') != '') { ?>
        <li class="twitter"><a href="<?php echo $this->config->get('oxy_twitter'); ?>" class="tiptip" title="Twitter" target="_blank">Twitter</a></li>
        <?php } ?>
	    <?php if($this->config->get('oxy_googleplus') != '') { ?>
        <li class="google"><a href="<?php echo $this->config->get('oxy_googleplus'); ?>" class="tiptip" title="Google+" target="_blank">Google</a></li>
        <?php } ?>
	    <?php if($this->config->get('oxy_rss') != '') { ?>
        <li class="rrs"><a href="<?php echo $this->config->get('oxy_rss'); ?>" class="tiptip" title="RSS" target="_blank">RSS</a></li>
        <?php } ?>
	    <?php if($this->config->get('oxy_pinterest') != '') { ?>
        <li class="pinterest"><a href="<?php echo $this->config->get('oxy_pinterest'); ?>" class="tiptip" title="Pinterest" target="_blank">Pinterest</a></li>
        <?php } ?>
	    <?php if($this->config->get('oxy_vimeo') != '') { ?>
        <li class="vimeo"><a href="<?php echo $this->config->get('oxy_vimeo'); ?>" class="tiptip" title="Vimeo" target="_blank">Vimeo</a></li>
        <?php } ?> 
	    <?php if($this->config->get('oxy_flickr') != '') { ?>
        <li class="flickr"><a href="<?php echo $this->config->get('oxy_flickr'); ?>" class="tiptip" title="Flickr" target="_blank">Flickr</a></li>
        <?php } ?>  
	    <?php if($this->config->get('oxy_linkedin') != '') { ?>
        <li class="linkedin"><a href="<?php echo $this->config->get('oxy_linkedin'); ?>" class="tiptip" title="LinkedIn" target="_blank">LinkedIn</a></li>
        <?php } ?>
	    <?php if($this->config->get('oxy_youtube') != '') { ?>
        <li class="youtube"><a href="<?php echo $this->config->get('oxy_youtube'); ?>" class="tiptip" title="YouTube" target="_blank">YouTube</a></li>
        <?php } ?>
	    <?php if($this->config->get('oxy_dribbble') != '') { ?>
        <li class="dribbble"><a href="<?php echo $this->config->get('oxy_dribbble'); ?>" class="tiptip" title="Dribbble" target="_blank">Dribbble</a></li>
        <?php } ?>
        <?php if($this->config->get('oxy_instagram') != '') { ?>
        <li class="instagram"><a href="<?php echo $this->config->get('oxy_instagram'); ?>" class="tiptip" title="Instagram" target="_blank">Instagram</a></li>
        <?php } ?>   
        <?php if($this->config->get('oxy_behance') != '') { ?>
        <li class="behance"><a href="<?php echo $this->config->get('oxy_behance'); ?>" class="tiptip" title="Behance" target="_blank">Behance</a></li>
        <?php } ?>   
        <?php if($this->config->get('oxy_skype') != '') { ?>
        <li class="skype"><a href="skype:<?php echo $this->config->get('oxy_skype'); ?>" class="tiptip" title="Skype" target="_blank">Skype</a></li>
        <?php } ?>   
        <?php if($this->config->get('oxy_forrst') != '') { ?>
        <li class="forrst"><a href="<?php echo $this->config->get('oxy_forrst'); ?>" class="tiptip" title="Forrst" target="_blank">Forrst</a></li>
        <?php } ?>   
        <?php if($this->config->get('oxy_bing') != '') { ?>
        <li class="bing"><a href="<?php echo $this->config->get('oxy_bing'); ?>" class="tiptip" title="Bing" target="_blank">Bing</a></li>
        <?php } ?>   
        <?php if($this->config->get('oxy_myspace') != '') { ?>
        <li class="myspace"><a href="<?php echo $this->config->get('oxy_myspace'); ?>" class="tiptip" title="Myspace" target="_blank">Myspace</a></li>
        <?php } ?>   
        <?php if($this->config->get('oxy_tumblr') != '') { ?>
        <li class="tumblr"><a href="<?php echo $this->config->get('oxy_tumblr'); ?>" class="tiptip" title="Tumblr" target="_blank">Tumblr</a></li>
        <?php } ?>   
        <?php if($this->config->get('oxy_reddit') != '') { ?>
        <li class="reddit"><a href="<?php echo $this->config->get('oxy_reddit'); ?>" class="tiptip" title="Reddit" target="_blank">Reddit</a></li>
        <?php } ?>       
        </ul>
        </div>    
</div>
<?php } ?>

<?php if($this->config->get('oxy_contacts_status')== 1) { ?>
<?php if(($oxy_contact_mphone1) || ($oxy_contact_mphone2) || ($oxy_contact_sphone1) || ($oxy_contact_sphone2) || ($oxy_contact_fax1) || ($oxy_contact_fax2) || ($oxy_contact_email1) || ($oxy_contact_email2) || ($oxy_contact_skype1) || ($oxy_contact_skype2) || ($oxy_contact_location1) || ($oxy_contact_location2) || ($oxy_contact_hours)) { ?>
<div id="footer_a_4" class="s<?php echo 12 / ($this->config->get('oxy_custom_1_status') + $this->config->get('oxy_custom_2_status') + $this->config->get('oxy_follow_us_status') + $this->config->get('oxy_contacts_status')) ; ?> columns">

		<?php if($oxy_contacts_title) { ?>
        <h3><?php echo $oxy_contacts_title; ?></h3>
		<?php } ?>   
   
        <?php if(($oxy_contact_mphone1) || ($oxy_contact_mphone2)) { ?>   
        <div class="mc">    
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-mphone-38.png" alt="Phone" title="Phone"></span>     
        <?php if ($oxy_contact_mphone1) { ?>
        <span class="mm"><?php echo $oxy_contact_mphone1; ?></span>
		<?php } ?>
		<?php if ($oxy_contact_mphone2) { ?>
        <span class="mm"><?php echo $oxy_contact_mphone2; ?></span>
		<?php } ?>
        </div>
        <?php } ?> 
        
        <?php if(($oxy_contact_sphone1) || ($oxy_contact_sphone2)) { ?>   
        <div class="mc">    
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-sphone-38.png" alt="Phone" title="Phone"></span>     
        <?php if ($oxy_contact_sphone1) { ?>
        <span class="mm"><?php echo $oxy_contact_sphone1; ?></span>
		<?php } ?>
		<?php if ($oxy_contact_sphone2) { ?>
        <span class="mm"><?php echo $oxy_contact_sphone2; ?></span>
		<?php } ?>
        </div>
        <?php } ?>  
        
        <?php if(($oxy_contact_fax1) || ($oxy_contact_fax2)) { ?>   
        <div class="mc">    
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-fax-38.png" alt="Fax" title="Fax"></span>     
        <?php if ($oxy_contact_fax1) { ?>
        <span class="mm"><?php echo $oxy_contact_fax1; ?></span>
		<?php } ?>
		<?php if ($oxy_contact_fax2) { ?>
        <span class="mm"><?php echo $oxy_contact_fax2; ?></span>
		<?php } ?>
        </div>
        <?php } ?>  
        
        <?php if(($oxy_contact_email1) || ($oxy_contact_email2)) { ?>   
        <div class="mc">    
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-email-38.png" alt="E-mail" title="E-mail"></span>     
        <?php if ($oxy_contact_email1) { ?>
        <span class="mm"><?php echo $oxy_contact_email1; ?></span>
		<?php } ?>
		<?php if ($oxy_contact_email2) { ?>
        <span class="mm"><?php echo $oxy_contact_email2; ?></span>
		<?php } ?>
        </div>
        <?php } ?>  
        
        <?php if(($oxy_contact_skype1) || ($oxy_contact_skype2)) { ?>   
        <div class="mc">    
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-skype-38.png" alt="Skype" title="Skype"></span>     
        <?php if ($oxy_contact_skype1) { ?>
        <span class="mm"><?php echo $oxy_contact_skype1; ?></span>
		<?php } ?>
		<?php if ($oxy_contact_skype2) { ?>
        <span class="mm"><?php echo $oxy_contact_skype2; ?></span>
		<?php } ?>
        </div>
        <?php } ?>  
        
        <?php if(($oxy_contact_location1) || ($oxy_contact_location2)) { ?>     
        <div class="mc">        
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-location-38.png" alt="Location" title="Location"></span>         
		<?php if($oxy_contact_location1) { ?>
        <span class="mm"><?php echo $oxy_contact_location1; ?></span>
		<?php } ?>
		<?php if($oxy_contact_location2) { ?>
        <span class="mm"><?php echo $oxy_contact_location2; ?></span>
		<?php } ?>
        </div>
        <?php } ?>   
        
        <?php if($oxy_contact_hours) { ?>
        <div class="mc">            
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-hours-38.png" alt="Hours" title="Hours"></span>         
        <span class="mm"><pre><?php echo $oxy_contact_hours; ?></pre></span>
        </div>
        <?php } ?> 
        
</div>
<?php } ?>
<?php } ?>

</div>
</div>
<?php } ?>

<?php if($this->config->get('oxy_information_block_status')== 1) { ?>
<div id="footer_c">
<div class="row">

<?php if($this->config->get('oxy_information_column_1_status')== 1) { ?>
<div id="footer_c_1" class="s<?php echo 12 / ($this->config->get('oxy_information_column_1_status') + $this->config->get('oxy_information_column_2_status') + $this->config->get('oxy_information_column_3_status') + $this->config->get('oxy_information_column_4_status')) ; ?> columns">
    <h3><?php echo $text_information; ?></h3>
    <ul>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
    </ul>
</div>
<?php } ?>
<?php if($this->config->get('oxy_information_column_2_status')== 1) { ?>
<div id="footer_c_2" class="s<?php echo 12 / ($this->config->get('oxy_information_column_1_status') + $this->config->get('oxy_information_column_2_status') + $this->config->get('oxy_information_column_3_status') + $this->config->get('oxy_information_column_4_status')) ; ?> columns">
    <h3><?php echo $text_service; ?></h3>
    <ul>
      <?php if($this->config->get('oxy_i_c_2_1_status')== 1) { ?><li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li><?php } ?>
      <?php if($this->config->get('oxy_i_c_2_2_status')== 1) { ?><li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li><?php } ?>
      <?php if($this->config->get('oxy_i_c_2_3_status')== 1) { ?><li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li><?php } ?>
    </ul>
</div>
<?php } ?>
<?php if($this->config->get('oxy_information_column_3_status')== 1) { ?>
<div id="footer_c_3" class="s<?php echo 12 / ($this->config->get('oxy_information_column_1_status') + $this->config->get('oxy_information_column_2_status') + $this->config->get('oxy_information_column_3_status') + $this->config->get('oxy_information_column_4_status')) ; ?> columns">
    <h3><?php echo $text_extra; ?></h3>
    <ul>
      <?php if($this->config->get('oxy_i_c_3_1_status')== 1) { ?><li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li><?php } ?>
      <?php if($this->config->get('oxy_i_c_3_2_status')== 1) { ?><li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li><?php } ?>
      <?php if($this->config->get('oxy_i_c_3_3_status')== 1) { ?><li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li><?php } ?>
      <?php if($this->config->get('oxy_i_c_3_4_status')== 1) { ?><li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li><?php } ?>
    </ul>
</div>
<?php } ?>
<?php if($this->config->get('oxy_information_column_4_status')== 1) { ?>
<div id="footer_c_4" class="s<?php echo 12 / ($this->config->get('oxy_information_column_1_status') + $this->config->get('oxy_information_column_2_status') + $this->config->get('oxy_information_column_3_status') + $this->config->get('oxy_information_column_4_status')) ; ?> columns">
    <h3><?php echo $text_account; ?></h3>
    <ul>
      <?php if($this->config->get('oxy_i_c_4_1_status')== 1) { ?><li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li><?php } ?>
      <?php if($this->config->get('oxy_i_c_4_2_status')== 1) { ?><li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li><?php } ?>
      <?php if($this->config->get('oxy_i_c_4_3_status')== 1) { ?><li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li><?php } ?>
      <?php if($this->config->get('oxy_i_c_4_4_status')== 1) { ?><li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li><?php } ?>
    </ul>
</div>
<?php } ?>

</div>
</div>
<?php } ?>

<?php if($this->config->get('oxy_powered_status')== 1 || $this->config->get('oxy_payment_block_status')== 1) { ?>
<div id="footer_d">
<div class="row">

<?php if($this->config->get('oxy_powered_status')== 1) { ?>
<div id="footer_d_1" class="s<?php echo 12 / ($this->config->get('oxy_powered_status') + $this->config->get('oxy_payment_block_status')) ; ?> columns">
<div id="powered_content">
		<?php if($oxy_powered_content) { ?>
        <?php echo htmlspecialchars_decode($oxy_powered_content); ?>
        <?php } ?>             
</div>
</div>
<?php } ?>
<?php if($this->config->get('oxy_payment_block_status')== 1) { ?>
<div id="footer_d_2" class="s<?php echo 12 / ($this->config->get('oxy_powered_status') + $this->config->get('oxy_payment_block_status')) ; ?> columns">
<div id="payment_logos">
        <?php if ($this->config->get('oxy_payment_block_custom_status') == "1"): ?>
        <?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	        $path_image = $this->config->get('config_ssl') . 'image/';
        } else {
        	$path_image = $this->config->get('config_url') . 'image/';
        }
        if ($this->config->get('oxy_payment_block_custom') != ''){ ?>   
        <?php if($this->config->get('oxy_payment_block_custom_url') != ''): ?> 
		<a href="<?php echo $this->config->get('oxy_payment_block_custom_url'); ?>" target="_blank">
			<img src="<?php echo $path_image . $this->config->get('oxy_payment_block_custom') ?>" alt="Payment" title="Payment"></a>
        <?php else: ?>         
			<img src="<?php echo $path_image . $this->config->get('oxy_payment_block_custom') ?>" alt="Payment" title="Payment">
        <?php endif; ?>
		<?php } ?>
		<?php endif; ?>           
 
        <?php if ($this->config->get('oxy_payment_paypal') == "1"): ?>
        <?php if($this->config->get('oxy_payment_paypal_url') != ''): ?>
			<a href="<?php echo $this->config->get('oxy_payment_paypal_url'); ?>" target="_blank">
			<img src="catalog/view/theme/oxy/image/payment/payment_image_paypal.png" alt="PayPal" title="PayPal"></a>
        <?php else: ?>
            <img src="catalog/view/theme/oxy/image/payment/payment_image_paypal.png" alt="PayPal" title="PayPal">
        <?php endif; ?>
		<?php endif; ?>  
        
        <?php if ($this->config->get('oxy_payment_visa') == "1"): ?>
        <?php if($this->config->get('oxy_payment_visa_url') != ''): ?>
			<a href="<?php echo $this->config->get('oxy_payment_visa_url'); ?>" target="_blank">
			<img src="catalog/view/theme/oxy/image/payment/payment_image_visa.png" alt="Visa" title="Visa"></a>
        <?php else: ?>
            <img src="catalog/view/theme/oxy/image/payment/payment_image_visa.png" alt="Visa" title="Visa">
        <?php endif; ?>
		<?php endif; ?>   
        
        <?php if ($this->config->get('oxy_payment_mastercard') == "1"): ?>
        <?php if($this->config->get('oxy_payment_mastercard_url') != ''): ?>
			<a href="<?php echo $this->config->get('oxy_payment_mastercard_url'); ?>" target="_blank">
			<img src="catalog/view/theme/oxy/image/payment/payment_image_mastercard.png" alt="MasterCard" title="MasterCard"></a>
        <?php else: ?>
            <img src="catalog/view/theme/oxy/image/payment/payment_image_mastercard.png" alt="MasterCard" title="MasterCard">
        <?php endif; ?>
		<?php endif; ?> 
       
        <?php if ($this->config->get('oxy_payment_maestro') == "1"): ?>
        <?php if($this->config->get('oxy_payment_maestro_url') != ''): ?>
			<a href="<?php echo $this->config->get('oxy_payment_maestro_url'); ?>" target="_blank">
			<img src="catalog/view/theme/oxy/image/payment/payment_image_maestro.png" alt="Maestro" title="Maestro"></a>
        <?php else: ?>
            <img src="catalog/view/theme/oxy/image/payment/payment_image_maestro.png" alt="Maestro" title="Maestro">
        <?php endif; ?>
		<?php endif; ?>
       
        <?php if ($this->config->get('oxy_payment_discover') == "1"): ?>
        <?php if($this->config->get('oxy_payment_discover_url') != ''): ?>
			<a href="<?php echo $this->config->get('oxy_payment_discover_url'); ?>" target="_blank">
			<img src="catalog/view/theme/oxy/image/payment/payment_image_discover.png" alt="Discover" title="Discover"></a>
        <?php else: ?>
            <img src="catalog/view/theme/oxy/image/payment/payment_image_discover.png" alt="Discover" title="Discover">
        <?php endif; ?>
		<?php endif; ?>                   
        
        <?php if ($this->config->get('oxy_payment_moneybookers') == "1"): ?>
        <?php if($this->config->get('oxy_payment_moneybookers_url') != ''): ?>
			<a href="<?php echo $this->config->get('oxy_payment_moneybookers_url'); ?>" target="_blank">
			<img src="catalog/view/theme/oxy/image/payment/payment_image_moneybookers.png" alt="Moneybookers" title="Moneybookers"></a>
        <?php else: ?>
            <img src="catalog/view/theme/oxy/image/payment/payment_image_moneybookers.png" alt="Moneybookers" title="Moneybookers">
        <?php endif; ?>
		<?php endif; ?>   
        
        <?php if ($this->config->get('oxy_payment_american_express') == "1"): ?>
        <?php if($this->config->get('oxy_payment_american_express_url') != ''): ?>
			<a href="<?php echo $this->config->get('oxy_payment_american_express_url'); ?>" target="_blank">
			<img src="catalog/view/theme/oxy/image/payment/payment_image_american_express.png" alt="American Express" title="American Express"></a>
        <?php else: ?>
            <img src="catalog/view/theme/oxy/image/payment/payment_image_american_express.png" alt="American Express" title="American Express">
        <?php endif; ?>
		<?php endif; ?> 
                   
        <?php if ($this->config->get('oxy_payment_cirrus') == "1"): ?>
        <?php if($this->config->get('oxy_payment_cirrus_url') != ''): ?>
			<a href="<?php echo $this->config->get('oxy_payment_cirrus_url'); ?>" target="_blank">
			<img src="catalog/view/theme/oxy/image/payment/payment_image_cirrus.png" alt="Cirrus" title="Cirrus"></a>
        <?php else: ?>
            <img src="catalog/view/theme/oxy/image/payment/payment_image_cirrus.png" alt="Cirrus" title="Cirrus">
        <?php endif; ?>
		<?php endif; ?>   
        
        <?php if ($this->config->get('oxy_payment_delta') == "1"): ?>
        <?php if($this->config->get('oxy_payment_delta_url') != ''): ?>
			<a href="<?php echo $this->config->get('oxy_payment_delta_url'); ?>" target="_blank">
			<img src="catalog/view/theme/oxy/image/payment/payment_image_delta.png" alt="Delta" title="Delta"></a>
        <?php else: ?>
            <img src="catalog/view/theme/oxy/image/payment/payment_image_delta.png" alt="Delta" title="Delta">
        <?php endif; ?>
		<?php endif; ?>   
        
        <?php if ($this->config->get('oxy_payment_google') == "1"): ?>
        <?php if($this->config->get('oxy_payment_google_url') != ''): ?>
			<a href="<?php echo $this->config->get('oxy_payment_google_url'); ?>" target="_blank">
			<img src="catalog/view/theme/oxy/image/payment/payment_image_google.png" alt="Google Checkout" title="Google Checkout"></a>
        <?php else: ?>
            <img src="catalog/view/theme/oxy/image/payment/payment_image_google.png" alt="Google Checkout" title="Google Checkout">
        <?php endif; ?>
		<?php endif; ?>
        
        <?php if ($this->config->get('oxy_payment_2co') == "1"): ?>
        <?php if($this->config->get('oxy_payment_2co_url') != ''): ?>
			<a href="<?php echo $this->config->get('oxy_payment_2co_url'); ?>" target="_blank">
			<img src="catalog/view/theme/oxy/image/payment/payment_image_2co.png" alt="2CheckOut" title="2CheckOut"></a>
        <?php else: ?>
            <img src="catalog/view/theme/oxy/image/payment/payment_image_2co.png" alt="2CheckOut" title="2CheckOut">
        <?php endif; ?>
		<?php endif; ?> 
        
        <?php if ($this->config->get('oxy_payment_sage') == "1"): ?>
        <?php if($this->config->get('oxy_payment_sage_url') != ''): ?>
			<a href="<?php echo $this->config->get('oxy_payment_sage_url'); ?>" target="_blank">
			<img src="catalog/view/theme/oxy/image/payment/payment_image_sage.png" alt="Sage" title="Sage"></a>
        <?php else: ?>
            <img src="catalog/view/theme/oxy/image/payment/payment_image_sage.png" alt="Sage" title="Sage">
        <?php endif; ?>
		<?php endif; ?>   
        
        <?php if ($this->config->get('oxy_payment_solo') == "1"): ?>
        <?php if($this->config->get('oxy_payment_solo_url') != ''): ?>
			<a href="<?php echo $this->config->get('oxy_payment_solo_url'); ?>" target="_blank">
			<img src="catalog/view/theme/oxy/image/payment/payment_image_solo.png" alt="Solo" title="Solo"></a>
        <?php else: ?>
            <img src="catalog/view/theme/oxy/image/payment/payment_image_solo.png" alt="Solo" title="Solo">
        <?php endif; ?>
		<?php endif; ?> 
        
        <?php if ($this->config->get('oxy_payment_switch') == "1"): ?>
        <?php if($this->config->get('oxy_payment_switch_url') != ''): ?>
			<a href="<?php echo $this->config->get('oxy_payment_switch_url'); ?>" target="_blank">
			<img src="catalog/view/theme/oxy/image/payment/payment_image_switch.png" alt="Switch" title="Switch"></a>
        <?php else: ?>
            <img src="catalog/view/theme/oxy/image/payment/payment_image_switch.png" alt="Switch" title="Switch">
        <?php endif; ?>
		<?php endif; ?>
        
        <?php if ($this->config->get('oxy_payment_western_union') == "1"): ?>
        <?php if($this->config->get('oxy_payment_western_union_url') != ''): ?>
			<a href="<?php echo $this->config->get('oxy_payment_western_union_url'); ?>" target="_blank">
			<img src="catalog/view/theme/oxy/image/payment/payment_image_western_union.png" alt="Western Union" title="Western Union"></a>
        <?php else: ?>
            <img src="catalog/view/theme/oxy/image/payment/payment_image_western_union.png" alt="Western Union" title="Western Union">
        <?php endif; ?>
		<?php endif; ?>              
</div>
</div>
<?php } ?>

</div>
</div>
<?php } ?>

<?php if($this->config->get('oxy_custom_3_status')== 1) { ?>
<?php if($oxy_custom_3_content) { ?>
<div id="footer_e">
<div class="row">
<div id="footer_e_1" class="twelve columns">
        <?php echo htmlspecialchars_decode($oxy_custom_3_content); ?>         
</div>
</div>
</div>
<?php } ?>
<?php } ?>

</footer>
</div>

<script type="text/javascript">
  $(document).ready(function() {
    $("#buttonForModal").click(function() {
      $("#myModal").reveal();
    });
  });
</script>
<div id="oxyModal1" class="reveal-modal [expand, xlarge, large, medium, small]">
  <?php if($oxy_fp_fb1_title) { ?>
  <h2><?php echo $oxy_fp_fb1_title; ?></h2>
  <?php } ?>
  <?php if($oxy_fp_fb1_subtitle) { ?>
  <p class="lead"><?php echo $oxy_fp_fb1_subtitle; ?></p>
  <?php } ?>
  <?php if($oxy_fp_fb1_content) { ?>
  <p><?php echo htmlspecialchars_decode($oxy_fp_fb1_content); ?></p>
  <?php } ?>
  <?php if($oxy_fp_fb2_title) { ?>
  <p><a href="#" data-reveal-id="oxyModal2" class="button"><?php echo $oxy_fp_fb2_title; ?></a></p>
  <?php } ?>
  <a class="close-reveal-modal">&#215;</a>
</div>

<div id="oxyModal2" class="reveal-modal [expand, xlarge, large, medium, small]">
  <?php if($oxy_fp_fb2_title) { ?>
  <h2><?php echo $oxy_fp_fb2_title; ?></h2>
  <?php } ?>
  <?php if($oxy_fp_fb2_subtitle) { ?>
  <p class="lead"><?php echo $oxy_fp_fb2_subtitle; ?></p>
  <?php } ?>
  <?php if($oxy_fp_fb2_content) { ?>
  <p><?php echo htmlspecialchars_decode($oxy_fp_fb2_content); ?></p>
  <?php } ?>
  <?php if($oxy_fp_fb3_title) { ?>
  <p><a href="#" data-reveal-id="oxyModal3" class="button"><?php echo $oxy_fp_fb3_title; ?></a></p>
  <?php } ?>
  <a class="close-reveal-modal">&#215;</a>
</div>

<div id="oxyModal3" class="reveal-modal [expand, xlarge, large, medium, small]">
  <?php if($oxy_fp_fb3_title) { ?>
  <h2><?php echo $oxy_fp_fb3_title; ?></h2>
  <?php } ?>
  <?php if($oxy_fp_fb3_subtitle) { ?>
  <p class="lead"><?php echo $oxy_fp_fb3_subtitle; ?></p>
  <?php } ?>
  <?php if($oxy_fp_fb3_content) { ?>
  <p><?php echo htmlspecialchars_decode($oxy_fp_fb3_content); ?></p>
  <?php } ?>
  <?php if($oxy_fp_fb4_title) { ?>
  <p><a href="#" data-reveal-id="oxyModal4" class="button"><?php echo $oxy_fp_fb4_title; ?></a></p>
  <?php } ?>
  <a class="close-reveal-modal">&#215;</a>
</div>

<div id="oxyModal4" class="reveal-modal [expand, xlarge, large, medium, small]">
  <?php if($oxy_fp_fb4_title) { ?>
  <h2><?php echo $oxy_fp_fb4_title; ?></h2>
  <?php } ?>
  <?php if($oxy_fp_fb4_subtitle) { ?>
  <p class="lead"><?php echo $oxy_fp_fb4_subtitle; ?></p>
  <?php } ?>
  <?php if($oxy_fp_fb4_content) { ?>
  <p><?php echo htmlspecialchars_decode($oxy_fp_fb4_content); ?></p>
  <?php } ?>
  <a class="close-reveal-modal">&#215;</a>
</div>

<div id="oxyprodModal1" class="reveal-modal [expand, xlarge, large, medium, small]">
  <?php if($oxy_product_fb1_title) { ?>
  <h2><?php echo $oxy_product_fb1_title; ?></h2>
  <?php } ?>
  <?php if($oxy_product_fb1_subtitle) { ?>
  <p class="lead"><?php echo $oxy_product_fb1_subtitle; ?></p>
  <?php } ?>
  <?php if($oxy_product_fb1_content) { ?>
  <p><?php echo htmlspecialchars_decode($oxy_product_fb1_content); ?></p>
  <?php } ?>
  <?php if($oxy_product_fb2_title) { ?>
  <p><a href="#" data-reveal-id="oxyprodModal2" class="button"><?php echo $oxy_product_fb2_title; ?></a></p>
  <?php } ?>
  <a class="close-reveal-modal">&#215;</a>
</div> 
<div id="oxyprodModal2" class="reveal-modal [expand, xlarge, large, medium, small]">
  <?php if($oxy_product_fb2_title) { ?>
  <h2><?php echo $oxy_product_fb2_title; ?></h2>
  <?php } ?>
  <?php if($oxy_product_fb2_subtitle) { ?>
  <p class="lead"><?php echo $oxy_product_fb2_subtitle; ?></p>
  <?php } ?>
  <?php if($oxy_product_fb2_content) { ?>
  <p><?php echo htmlspecialchars_decode($oxy_product_fb2_content); ?></p>
  <?php } ?>
  <?php if($oxy_product_fb3_title) { ?>
  <p><a href="#" data-reveal-id="oxyprodModal3" class="button"><?php echo $oxy_product_fb3_title; ?></a></p>
  <?php } ?>
  <a class="close-reveal-modal">&#215;</a>
</div> 
<div id="oxyprodModal3" class="reveal-modal [expand, xlarge, large, medium, small]">
  <?php if($oxy_product_fb3_title) { ?>
  <h2><?php echo $oxy_product_fb3_title; ?></h2>
  <?php } ?>
  <?php if($oxy_product_fb3_subtitle) { ?>
  <p class="lead"><?php echo $oxy_product_fb3_subtitle; ?></p>
  <?php } ?>
  <?php if($oxy_product_fb3_content) { ?>
  <p><?php echo htmlspecialchars_decode($oxy_product_fb3_content); ?></p>
  <?php } ?>
  <a class="close-reveal-modal">&#215;</a>
</div> 

<script type="text/javascript" src="catalog/view/theme/oxy/js/cloud-zoom.js"></script>
<script type="text/javascript" src="catalog/view/theme/oxy/js/jquery.tipTip.js"></script>
<?php if($this->config->get('oxy_left_right_column_categories_type') =='0') { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/oxy/stylesheet/dcaccordion.css" />	
<script type="text/javascript" src="catalog/view/theme/oxy/js/jquery.dcjqaccordion.js"></script>
<?php } ?>
<?php if($this->config->get('oxy_others_totop') =='1') { ?>	
<script type="text/javascript" src="catalog/view/theme/oxy/js/jquery.ui.totop.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/*
		var defaults = {
	  		containerID: 'toTop', // fading element id
			containerHoverID: 'toTopHover', // fading element hover id
			scrollSpeed: 1200,
			easingType: 'linear' 
	 	};
		*/	
		$().UItoTop({ easingType: 'easeOutQuart' });	
	});
</script>
<?php } ?>
<script type="text/javascript" src="catalog/view/theme/oxy/js/foundation.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/oxy/js/app.js"></script>
<?php if($this->config->get('oxy_header_fixed_header_status') ==1) { ?>
<script type="text/javascript" src="catalog/view/theme/oxy/js/jquery.sticky.js"></script>
<?php } ?>
<?php if($this->config->get('oxy_header_auto_suggest_status') ==1) { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/oxy/stylesheet/livesearch.css" />
<script type="text/javascript" src="catalog/view/theme/oxy/js/livesearch.js"></script>
<?php } ?>
<script type="text/javascript">
	jQuery(function($) {
		$(".swipebox").swipebox();
	});
</script>

	<script type="text/javascript">

		var revapi;

		jQuery(document).ready(function() {

			   revapi = jQuery('.fullwidthbanner').revolution(
				{
					delay:9000,
					startwidth:1170,
					startheight:450,
					soloArrowLeftHOffset:0,
					soloArrowRightHOffset:0,	
					hideThumbs:10

				});

		});	//ready

	</script>
  
<?php if($this->config->get('oxy_custom_js') !='') { ?>
<?php echo htmlspecialchars_decode( $this->config->get('oxy_custom_js'), ENT_QUOTES ); ?>
<?php } ?>
</body></html>