<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<section id="content" class="columns op"><?php echo $content_top; ?>

<?php if($this->config->get('oxy_contact_map_status')== 1) { ?>   
  <div class="row">
  <div class="twelve columns">
  <h2><?php echo $text_location; ?></h2>
  <div class="contact-map">
  <div id="map_div"></div>
  </div>
<script src="//maps.google.com/maps/api/js?sensor=true" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	//------- Google Maps ---------//
	// Creating a LatLng object containing the coordinate for the center of the map
	var latlng = new google.maps.LatLng(<?php echo $oxy_contact_map_ll; ?>);
	 
	// Creating an object literal containing the properties we want to pass to the map  
	var options = {  
		zoom: 15, // This number can be set to define the initial zoom level of the map
		center: latlng,
		mapTypeId: google.maps.MapTypeId.<?php echo $oxy_contact_map_type; ?> // This value can be set to define the map type ROADMAP/SATELLITE/HYBRID/TERRAIN
	};  
	// Calling the constructor, thereby initializing the map  
	var map = new google.maps.Map(document.getElementById('map_div'), options);  
	
	// Define Marker properties
	var image = new google.maps.MarkerImage(
		//Image file name
		'catalog/view/theme/oxy/image/map_marker.png',
		// This marker is 129 pixels wide by 42 pixels tall.
		new google.maps.Size(57, 76),
		// The origin for this image is 0,0.
		new google.maps.Point(0,0),
		// The anchor for this image is the base of the flagpole at 18,42.
		new google.maps.Point(30, 76)
	);

	// Add Marker
	var marker1 = new google.maps.Marker({
		position: new google.maps.LatLng(<?php echo $oxy_contact_map_ll; ?>), 
		map: map,
		icon: image // This path is the custom pin to be shown. Remove this line and the proceeding comma to use default pin
	});	
	
	// Add listener for a click on the pin
	google.maps.event.addListener(marker1, 'click', function() {
        infowindow1.open(map, marker1);
	    });

	// Add information window
	var infowindow1 = new google.maps.InfoWindow({  
		content:  '<div> </div>'
	}); 
	
});
</script> 
  </div>
  </div>
<?php } ?> 

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">   
  <div class="row">
  
  <div class="four columns">
    <h2><?php echo $heading_title; ?></h2>
    <div class="contact-info">
      <div class="content">
      <div class="twelve columns">  
      
        <?php if(($oxy_contact_mphone1) || ($oxy_contact_mphone2)) { ?>   
        <div class="mc">    
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-mphone-38.png"></span>     
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
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-sphone-38.png"></span>     
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
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-fax-38.png"></span>     
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
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-email-38.png"></span>     
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
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-skype-38.png"></span>     
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
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-location-38.png"></span>         
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
        <span class="mm_icon"><img src="catalog/view/theme/oxy/image/icons_contact/icon-contact-hours-38.png"></span>         
        <span class="mm"><pre><?php echo $oxy_contact_hours; ?></pre></span>
        </div>
        <?php } ?> 
        
      </div>
      </div>
      
      <?php if($this->config->get('oxy_contact_custom_status')== 1) { ?> 
      <?php if($oxy_contact_custom_content) { ?>
      <div class="content">
      <div class="twelve columns">  
      <div class="contact-custom">
        <?php echo htmlspecialchars_decode($oxy_contact_custom_content); ?>           
      </div>
      </div>
      </div>
      <?php } ?>
      <?php } ?> 
 
    </div>
	
	<aside id="column-left" class="hide-for-small">
	<div class="box">
		<div class="box-heading" style="margin:0;"><?php echo $text_aside_title; ?></div>
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
	
  </div>
  
  <div class="eight columns">  
    <?php //[MY]?>
    <h2><?php echo $text_contact; ?></h2>
	<!--
    <div><?php //echo $text_corporate_link;?></div>
    <div><?php //echo $text_partner_link;?></div><br/>
	-->
        
    <div class="contact-form">
    <div class="content">
    <span class="required">*</span>&nbsp;<b><?php echo $entry_name; ?></b><br />
    <input type="text" name="name" value="<?php echo $name; ?>" />
    <?php if ($error_name) { ?>
    <span class="error"><?php echo $error_name; ?></span>
    <?php } ?>
    <br />
    <span class="required">*</span>&nbsp;<b><?php echo $entry_email; ?></b><br />
    <input type="text" name="email" value="<?php echo $email; ?>" />
    <?php if ($error_email) { ?>
    <span class="error"><?php echo $error_email; ?></span>
    <?php } ?>
    <br />
    <span class="required">*</span>&nbsp;<b><?php echo $entry_enquiry; ?></b><br />
    <textarea name="enquiry" cols="40" rows="10" style="width: 100%;"><?php echo $enquiry; ?></textarea>
    <?php if ($error_enquiry) { ?>
    <span class="error"><?php echo $error_enquiry; ?></span>
    <?php } ?>
    <br />
    <span class="required">*</span>&nbsp;<b><?php echo $entry_how;?></b><br/>
    <select name="how">
		<option value=""><?php echo $text_select; ?></option>
		<?php foreach ($select_how as $select_option) { ?>
			<?php if ($select_option == $how) { ?>
				<option value="<?php echo $select_option; ?>" selected="selected"><?php echo $select_option; ?></option>
			<?php } else { ?>
				<option value="<?php echo $select_option; ?>"><?php echo $select_option; ?></option>
			<?php } ?>
		<?php } ?>
    </select>
    <br/>
	<?php if ($error_how) { ?>
    <span class="error"><?php echo $error_how; ?></span>
    <?php } ?>
	<br/>
    <b><?php echo $entry_captcha; ?></b><br />
    <input type="text" name="captcha" value="<?php echo $captcha; ?>" />
    <img src="index.php?route=information/contact/captcha" alt="" />
    <?php if ($error_captcha) { ?>
    <span class="error"><?php echo $error_captcha; ?></span>
    <?php } ?>
    </div>
    </div>
    <div class="buttons">
      <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
    </div>
  </div>
  
  </div>   
</form>

<?php echo $content_bottom; ?></section>
<?php echo $footer; ?>