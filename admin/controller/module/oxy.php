<?php
class ControllerModuleOXY extends Controller {
	private $error = array();
	private $_name = 'oxy';	
	
	public function index() {
		$language = $this->language->load('module/oxy');
        $this->data = array_merge($this->data, $language);

		
        $this->document->setTitle($this->language->get('heading_title'));
		
        $this->load->model('setting/setting');
        $this->load->model('tool/image');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('oxy', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');		
		
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}	
		
            $this->data['text_image_manager'] = 'Image manager';
            $this->data['token'] = $this->session->data['token']; 
			
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_module_settings'] = $this->language->get('text_module_settings');	
		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_clear'] = $this->language->get('text_clear');
		$this->data['text_left'] = $this->language->get('text_left');	
		$this->data['text_right'] = $this->language->get('text_right');			

		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');		
		$this->data['entry_status'] = $this->language->get('entry_status');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');		
        

        $config_data = array(

        'oxy_status',
		
		'oxy_skin',	
		
		'oxy_layout_style',
		'oxy_layout_s',
		'oxy_layout_l',
		'oxy_layout_pb_noc',
		'oxy_layout_product_page',	
		
		'oxy_header_fixed_header_status',
		'oxy_header_auto_suggest_status',		
		
        'oxy_menu_homepage',		
        'oxy_menu_homepage_status',
		'oxy_menu_homepage_style',
		
        'oxy_menu_categories',		
        'oxy_menu_categories_status',
        'oxy_menu_categories_style',
		'oxy_menu_categories_per_row',	
		'oxy_menu_categories_3_level',
		
        'oxy_menu_brands',		
        'oxy_menu_brands_status',
        'oxy_menu_brands_style',		
        'oxy_menu_brands_per_row',				
		
        'oxy_menu_link_1_status',	
        'oxy_menu_link_1_url',
        'oxy_menu_link_1_target',		
	    'oxy_menu_link_2_status',	
        'oxy_menu_link_2_url',
        'oxy_menu_link_2_target',		
        'oxy_menu_link_3_status',		
        'oxy_menu_link_3_url',
        'oxy_menu_link_3_target',		
        'oxy_menu_link_4_status',		
        'oxy_menu_link_4_url',
        'oxy_menu_link_4_target',		
        'oxy_menu_link_5_status',
        'oxy_menu_link_5_url',
        'oxy_menu_link_5_target',		
        'oxy_menu_link_6_status',	
        'oxy_menu_link_6_url',
        'oxy_menu_link_6_target',		
	    'oxy_menu_link_7_status',	
        'oxy_menu_link_7_url',
        'oxy_menu_link_7_target',		
        'oxy_menu_link_8_status',		
        'oxy_menu_link_8_url',
        'oxy_menu_link_8_target',		
        'oxy_menu_link_9_status',		
        'oxy_menu_link_9_url',
        'oxy_menu_link_9_target',		
        'oxy_menu_link_10_status',
        'oxy_menu_link_10_url',
        'oxy_menu_link_10_target',
		
        'oxy_menu_cm_status',						
        'oxy_menu_cm_link_1_status',	
        'oxy_menu_cm_link_1_url',
        'oxy_menu_cm_link_1_target',		
	    'oxy_menu_cm_link_2_status',	
        'oxy_menu_cm_link_2_url',
        'oxy_menu_cm_link_2_target',		
        'oxy_menu_cm_link_3_status',		
        'oxy_menu_cm_link_3_url',
        'oxy_menu_cm_link_3_target',		
        'oxy_menu_cm_link_4_status',		
        'oxy_menu_cm_link_4_url',
        'oxy_menu_cm_link_4_target',		
        'oxy_menu_cm_link_5_status',
        'oxy_menu_cm_link_5_url',
        'oxy_menu_cm_link_5_target',		
        'oxy_menu_cm_link_6_status',	
        'oxy_menu_cm_link_6_url',
        'oxy_menu_cm_link_6_target',		
	    'oxy_menu_cm_link_7_status',	
        'oxy_menu_cm_link_7_url',
        'oxy_menu_cm_link_7_target',		
        'oxy_menu_cm_link_8_status',		
        'oxy_menu_cm_link_8_url',
        'oxy_menu_cm_link_8_target',		
        'oxy_menu_cm_link_9_status',		
        'oxy_menu_cm_link_9_url',
        'oxy_menu_cm_link_9_target',		
        'oxy_menu_cm_link_10_status',
        'oxy_menu_cm_link_10_url',
        'oxy_menu_cm_link_10_target',				
		
        'oxy_menu_custom_block_1_status',
        'oxy_menu_custom_block_2_status',
        'oxy_menu_custom_block_3_status',	
		
        'oxy_menu_information_pages',		
        'oxy_menu_information_pages_status',	
			
        'oxy_menu_contacts_block_status',
		'oxy_menu_contacts_status',
		'oxy_menu_contacts_address_status',
		
        'oxy_homepage_banner_slider_type',
        'oxy_homepage_bestseller_status',		
        'oxy_homepage_featured_status',		
        'oxy_homepage_latest_status',
        'oxy_homepage_specials_status',		
        'oxy_homepage_category_wall',		
        'oxy_homepage_category_wall_status',
        'oxy_homepage_category_wall_icon_status',		
        'oxy_homepage_category_wall_per_row',			
        'oxy_homepage_category_wall_sub_number',
        'oxy_homepage_brands_wall',		
        'oxy_homepage_brands_wall_status',
        'oxy_homepage_brands_wall_style',			
        'oxy_homepage_brands_wall_per_row',		
		
		'oxy_category_prod_display',
        'oxy_category_subcategories',
        'oxy_category_subcategories_status',				
        'oxy_category_subcategories_style',
		'oxy_category_sale_badge_status',
		'oxy_category_prod_name_status',
		'oxy_category_prod_brand_status',
		'oxy_category_prod_price_status',
		'oxy_category_prod_cart_status',
		'oxy_category_prod_ratings_status',
		'oxy_category_prod_wis_com_status',
		'oxy_category_prod_zoom_status',
		'oxy_category_prod_swap_status',
		'oxy_category_prod_align',
		
        'oxy_product_manufacturer_logo_status',		
		'oxy_product_save_percent_status',
		'oxy_product_tax_status',			
        'oxy_product_viewed_status',	
		'oxy_product_i_c_status',	
        'oxy_product_zoom_type',		
        'oxy_product_related_status',
        'oxy_product_related_position',
		'oxy_product_related_style',
        'oxy_product_custom_status',
		'oxy_product_fb1_icon',
		'oxy_product_fb1_icon_thumb',
		'oxy_product_fb2_icon',
		'oxy_product_fb2_icon_thumb',
		'oxy_product_fb3_icon',
		'oxy_product_fb3_icon_thumb',	
        'oxy_product_custom_tab_1_status',
		'oxy_product_custom_tab_2_status',
		'oxy_product_custom_tab_3_status',
		
        'oxy_contact_custom_status',		
        'oxy_contact_custom_content',
		'oxy_contact_map_status',
		'oxy_contact_map_ll',
		'oxy_contact_map_type',			
		
		'oxy_left_right_column_categories_type',	
		
		'oxy_others_totop',
		
		'oxy_custom_1_status',
        'oxy_custom_2_status',
		'oxy_custom_3_status',
	
        'oxy_contacts_status',					
		
        'oxy_information_block_status',
		'oxy_information_column_1_status',
		'oxy_information_column_2_status',	
		'oxy_i_c_2_1_status',
		'oxy_i_c_2_2_status',
		'oxy_i_c_2_3_status',
		'oxy_information_column_3_status',
		'oxy_i_c_3_1_status',
		'oxy_i_c_3_2_status',
		'oxy_i_c_3_3_status',
		'oxy_i_c_3_4_status',
		'oxy_information_column_4_status',
		'oxy_i_c_4_1_status',
		'oxy_i_c_4_2_status',
		'oxy_i_c_4_3_status',
		'oxy_i_c_4_4_status',		
		
        'oxy_follow_us_status',
        'oxy_facebook',
        'oxy_twitter',
        'oxy_googleplus',
        'oxy_rss',
        'oxy_pinterest',
        'oxy_vimeo',
        'oxy_flickr',		
        'oxy_linkedin',	
        'oxy_youtube',		
        'oxy_dribbble',
		'oxy_instagram',
		'oxy_behance',	
		'oxy_skype',	
		'oxy_forrst',	
		'oxy_bing',	
		'oxy_myspace',	
		'oxy_tumblr',		
		'oxy_reddit',				
		
        'oxy_powered_status',
		
        'oxy_payment_block_status',	
		'oxy_payment_block_custom',
		'oxy_payment_block_custom_thumb',
		'oxy_payment_block_custom_status',
		'oxy_payment_block_custom_url',		
        'oxy_payment_paypal',
        'oxy_payment_paypal_url',		
        'oxy_payment_visa',
        'oxy_payment_visa_url',			
        'oxy_payment_mastercard',	
        'oxy_payment_mastercard_url',
        'oxy_payment_maestro',	
        'oxy_payment_maestro_url',
        'oxy_payment_discover',	
        'oxy_payment_discover_url',			
        'oxy_payment_moneybookers',	
        'oxy_payment_moneybookers_url',
        'oxy_payment_american_express',	
        'oxy_payment_american_express_url',		
		'oxy_payment_cirrus',	
        'oxy_payment_cirrus_url',		
		'oxy_payment_delta',	
        'oxy_payment_delta_url',		
		'oxy_payment_google',	
        'oxy_payment_google_url',		
		'oxy_payment_2co',	
        'oxy_payment_2co_url',		
		'oxy_payment_sage',	
        'oxy_payment_sage_url',		
		'oxy_payment_solo',	
        'oxy_payment_solo_url',		
		'oxy_payment_switch',	
        'oxy_payment_switch_url',		
		'oxy_payment_western_union',	
        'oxy_payment_western_union_url',
		
		'oxy_layout_style',			
		'oxy_body_bg_color',
		'oxy_headings_color',
		'oxy_body_text_color',			
		'oxy_light_text_color',			
		'oxy_other_links_color',		
		'oxy_links_hover_color',
		'oxy_general_icons_style',			
		
		'oxy_main_column_status',		
		'oxy_main_column_bg_color',
		'oxy_main_column_border_status',		
		'oxy_main_column_border_color',
		'oxy_main_column_border_size',
		'oxy_main_column_border_style',		
		'oxy_main_column_shadow',	
		
		'oxy_content_column_hli_bg_color',	
		'oxy_content_column_head_border_status',		
		'oxy_content_column_head_border_color',
		'oxy_content_column_head_border_size',
		'oxy_content_column_head_border_style',
		'oxy_content_column_separator_color',
		'oxy_content_column_separator_style',	
		'oxy_content_column_separator_size',					
		
		'oxy_left_column_head_status',		
		'oxy_left_column_head_bg_color',
		'oxy_left_column_head_custom',
		'oxy_left_column_head_custom_thumb',
		'oxy_left_column_head_title_color',
		'oxy_left_column_head_border_status',		
		'oxy_left_column_head_border_color',
		'oxy_left_column_head_border_size',
		'oxy_left_column_head_border_style',	
		'oxy_left_column_box_status',		
		'oxy_left_column_box_bg_color',
		'oxy_left_column_box_links_color',	
		'oxy_left_column_box_links_color_hover',			
		
		'oxy_right_column_head_status',		
		'oxy_right_column_head_bg_color',
		'oxy_right_column_head_custom',
		'oxy_right_column_head_custom_thumb',
		'oxy_right_column_head_title_color',
		'oxy_right_column_head_border_status',		
		'oxy_right_column_head_border_color',
		'oxy_right_column_head_border_size',
		'oxy_right_column_head_border_style',	
		'oxy_right_column_box_status',		
		'oxy_right_column_box_bg_color',
		'oxy_right_column_box_links_color',	
		'oxy_right_column_box_links_color_hover',			
		
		'oxy_category_box_head_status',		
		'oxy_category_box_head_bg_color',
		'oxy_category_box_head_custom',
		'oxy_category_box_head_custom_thumb',
		'oxy_category_box_head_title_color',
		'oxy_category_box_head_border_status',		
		'oxy_category_box_head_border_color',
		'oxy_category_box_head_border_size',
		'oxy_category_box_head_border_style',	
		'oxy_category_box_box_status',		
		'oxy_category_box_box_bg_color',
		'oxy_category_box_box_bg_color_hover',		
		'oxy_category_box_box_links_color',	
		'oxy_category_box_box_links_color_hover',					
		'oxy_category_box_box_separator_color',
		'oxy_category_box_box_separator_style',	
		'oxy_category_box_box_separator_size',				
		
		'oxy_filter_box_head_status',		
		'oxy_filter_box_head_bg_color',
		'oxy_filter_box_head_custom',
		'oxy_filter_box_head_custom_thumb',
		'oxy_filter_box_head_title_color',
		'oxy_filter_box_head_border_status',		
		'oxy_filter_box_head_border_color',
		'oxy_filter_box_head_border_size',
		'oxy_filter_box_head_border_style',	
		'oxy_filter_box_box_status',		
		'oxy_filter_box_box_bg_color',		
		'oxy_filter_box_box_links_color',	
		'oxy_filter_box_box_links_color_hover',																	
				
		'oxy_price_color',
		'oxy_price_old_color',	
		'oxy_price_new_color',	
		'oxy_price_tax_color',			
		
		'oxy_button_bg_color',
		'oxy_button_bg_hover_color',
		'oxy_button_text_color',
		'oxy_button_text_hover_color',
		'oxy_button_exclusive_bg_color',
		'oxy_button_exclusive_bg_hover_color',
		'oxy_button_exclusive_text_color',
		'oxy_button_exclusive_text_hover_color',
		'oxy_button_light_bg_color',
		'oxy_button_light_bg_hover_color',
		'oxy_button_slider_bg_color',
		'oxy_button_slider_bg_hover_color',
		'oxy_button_light_text_color',
		'oxy_button_light_text_hover_color',
		'oxy_button_border_radius',
	
		'oxy_top_area_status',		
		'oxy_top_area_bg_color',
		'oxy_top_area_mini_bg_color',
		
		'oxy_top_area_tb_bg_status',
		'oxy_top_area_tb_bg_color',
		'oxy_top_area_tb_top_border_status',
		'oxy_top_area_tb_top_border_color',
		'oxy_top_area_tb_bottom_border_status',
		'oxy_top_area_tb_bottom_border_color',
		'oxy_top_area_tb_text_color',
		'oxy_top_area_tb_link_color',
		'oxy_top_area_tb_link_color_hover',
		'oxy_top_area_tb_separator_color',
		'oxy_top_area_tb_dropdown_bg_color',
		'oxy_top_area_tb_dropdown_bg_color_hover',
		'oxy_top_area_tb_dropdown_link_color',
		'oxy_top_area_tb_dropdown_link_color_hover',
		
		'oxy_top_area_search_bg_color',	
		'oxy_top_area_search_border_color',	
		'oxy_top_area_search_border_color_hover',
		'oxy_top_area_search_text_color',
							
		'oxy_top_area_cart_text_color',	
		'oxy_top_area_cart_link_color',	
		'oxy_top_area_cart_link_color_hover',
		'oxy_top_area_cart_separator_color',
		'oxy_top_area_cart_icon_style',
		'oxy_logo_position',		
		'oxy_search_bar_position',
		
		'oxy_mm_bg_color_status',		
		'oxy_mm_bg_color',
		'oxy_mm_separator_status',		
		'oxy_mm_separator_color',
		'oxy_mm_separator_style',	
		'oxy_mm_separator_size',
		'oxy_mm_border_top_status',		
		'oxy_mm_border_top_color',
		'oxy_mm_border_top_style',
		'oxy_mm_border_top_size',			
		'oxy_mm_border_bottom_status',		
		'oxy_mm_border_bottom_color',
		'oxy_mm_border_bottom_style',
		'oxy_mm_border_bottom_size',	
			
		'oxy_mm1_bg_color_status',		
		'oxy_mm1_bg_color',		
		'oxy_mm1_bg_hover_color',
		'oxy_mm1_link_color',
		'oxy_mm1_link_hover_color',		
		
		'oxy_mm2_bg_color_status',
		'oxy_mm2_bg_color',		
		'oxy_mm2_bg_hover_color',		
		'oxy_mm2_link_color',
		'oxy_mm2_link_hover_color',
        'oxy_mm2_main_category_icon_status',	

		'oxy_mm3_bg_color_status',
		'oxy_mm3_bg_color',
		'oxy_mm3_bg_hover_color',		
		'oxy_mm3_link_color',
		'oxy_mm3_link_hover_color',		
	
		'oxy_mm4_bg_color_status',
		'oxy_mm4_bg_color',
		'oxy_mm4_bg_hover_color',		
		'oxy_mm4_link_color',
		'oxy_mm4_link_hover_color',	

		'oxy_mm5_bg_color_status',
		'oxy_mm5_bg_color',
		'oxy_mm5_bg_hover_color',		
		'oxy_mm5_link_color',
		'oxy_mm5_link_hover_color',	

		'oxy_mm6_bg_color_status',
		'oxy_mm6_bg_color',
		'oxy_mm6_bg_hover_color',		
		'oxy_mm6_link_color',
		'oxy_mm6_link_hover_color',	

		'oxy_mm7_bg_color_status',
		'oxy_mm7_bg_color',
		'oxy_mm7_bg_hover_color',		
		'oxy_mm7_link_color',
		'oxy_mm7_link_hover_color',
		
		'oxy_mm8_bg_color_status',
		'oxy_mm8_bg_color',
		'oxy_mm8_bg_hover_color',	
		'oxy_mm8_link_color',
		'oxy_mm8_link_hover_color',		
		
		'oxy_mm_sub_bg_color',
		'oxy_mm_sub_bg_hover_color',		
		'oxy_mm_sub_titles_bg_color',				
		'oxy_mm_sub_text_color',
		'oxy_mm_sub_link_color',		
		'oxy_mm_sub_link_hover_color',
		'oxy_mm_sub_separator_color',
		'oxy_mm_sub_separator_style',	
		'oxy_mm_sub_box_shadow',
		
		'oxy_mm_mobile_bg_color',
		'oxy_mm_mobile_bg_hover_color',						
		'oxy_mm_mobile_text_color',
		
		'oxy_mid_prod_box_bg_hover_color',	
		'oxy_mid_prod_box_shadow_hover',		
		'oxy_mid_prod_box_sale_icon_color',			
		'oxy_mid_prod_stars_color',		
		'oxy_mid_prod_page_tabs_bg_color',
		'oxy_mid_prod_page_tabs_selected_bg_color',	
		'oxy_mid_prod_page_tabs_text_color',				
		
		'oxy_mid_prod_slider_bg_color',
		'oxy_mid_prod_slider_custom',
		'oxy_mid_prod_slider_custom_thumb',
		'oxy_mid_prod_slider_custom_position',
		'oxy_mid_prod_slider_custom_repeat',		
		'oxy_mid_prod_slider_name_color',
		'oxy_mid_prod_slider_desc_color',
		'oxy_mid_prod_slider_price_color',
		'oxy_mid_prod_slider_links_color_hover',			
		'oxy_mid_prod_slider_bottom_bar_bg_color',	
		'oxy_mid_prod_slider_bottom_bar_bg_color_hover',			
		'oxy_mid_prod_slider_bottom_bar_bg_color_active',		
		
		'oxy_content_column_head_border_status',		
		'oxy_content_column_head_border_color',
		
		'oxy_fp_bg_color',
		'oxy_fp_title_color',
		'oxy_fp_title_color_hover',
		'oxy_fp_subtitle_color',
		'oxy_fp_fb1_icon',
		'oxy_fp_fb1_icon_thumb',
		'oxy_fp_fb1_bg_color',
		'oxy_fp_fb1_bg_color_hover',
		'oxy_fp_fb2_icon',
		'oxy_fp_fb2_icon_thumb',
		'oxy_fp_fb2_bg_color',
		'oxy_fp_fb2_bg_color_hover',
		'oxy_fp_fb3_icon',
		'oxy_fp_fb3_icon_thumb',
		'oxy_fp_fb3_bg_color',
		'oxy_fp_fb3_bg_color_hover',
		'oxy_fp_fb4_icon',
		'oxy_fp_fb4_icon_thumb',
		'oxy_fp_fb4_bg_color',
		'oxy_fp_fb4_bg_color_hover',

        'oxy_f1_bg_color',
		'oxy_f1_titles_color',
		'oxy_f1_titles_border_bottom_color',
		'oxy_f1_titles_border_bottom_style',	
		'oxy_f1_titles_border_bottom_size',		
		'oxy_f1_text_color',		
		'oxy_f1_link_color',
		'oxy_f1_link_hover_color',
		'oxy_f1_icon_color',
		'oxy_f1_border_top_status',		
		'oxy_f1_border_top_color',
		'oxy_f1_border_top_style',	
		'oxy_f1_border_top_size',
		
		'oxy_f2_bg_color',
		'oxy_f2_titles_color',
		'oxy_f2_titles_border_bottom_color',
		'oxy_f2_titles_border_bottom_style',
		'oxy_f2_titles_border_bottom_size',			
		'oxy_f2_link_color',
		'oxy_f2_link_hover_color',
		'oxy_f2_border_top_status',		
		'oxy_f2_border_top_color',
		'oxy_f2_border_top_style',	
		'oxy_f2_border_top_size',		
		
		'oxy_f4_bg_color',
		'oxy_f4_text_color',		
		'oxy_f4_link_color',
		'oxy_f4_link_hover_color',
		'oxy_f4_border_top_status',		
		'oxy_f4_border_top_color',
		'oxy_f4_border_top_style',	
		'oxy_f4_border_top_size',		
		
		'oxy_f5_bg_color',
		'oxy_f5_text_color',		
		'oxy_f5_link_color',
		'oxy_f5_link_hover_color',
		'oxy_f5_border_top_status',		
		'oxy_f5_border_top_color',
		'oxy_f5_border_top_style',	
		'oxy_f5_border_top_size',	

		'oxy_pattern_oxy',
		'oxy_bg_image_custom',
		'oxy_bg_image_thumb',
		'oxy_bg_image_position',
		'oxy_bg_image_repeat',
		'oxy_bg_image_attachment',		

		'oxy_pattern_oxy_mc',
		'oxy_bg_image_mc_custom',
		'oxy_bg_image_mc_thumb',
		'oxy_bg_image_mc_position',
		'oxy_bg_image_mc_repeat',
		'oxy_bg_image_mc_attachment',
		
		'oxy_pattern_oxy_ta',
		'oxy_bg_image_ta_custom',
		'oxy_bg_image_ta_thumb',
		'oxy_bg_image_ta_position',
		'oxy_bg_image_ta_repeat',
		'oxy_bg_image_ta_attachment',		
		
		'oxy_pattern_oxy_mm',
		'oxy_bg_image_mm_custom',
		'oxy_bg_image_mm_thumb',
		'oxy_bg_image_mm_repeat',			
	
		'oxy_pattern_oxy_f1',
		'oxy_bg_image_f1_custom',
		'oxy_bg_image_f1_thumb',
		'oxy_bg_image_f1_position',
		'oxy_bg_image_f1_repeat',
		'oxy_pattern_oxy_f2',	
		'oxy_bg_image_f2_custom',
		'oxy_bg_image_f2_thumb',
		'oxy_bg_image_f2_position',
		'oxy_bg_image_f2_repeat',		
		'oxy_pattern_oxy_f4',	
		'oxy_bg_image_f4_custom',
		'oxy_bg_image_f4_thumb',
		'oxy_bg_image_f4_position',
		'oxy_bg_image_f4_repeat',
		'oxy_pattern_oxy_f5',			
		'oxy_bg_image_f5_custom',
		'oxy_bg_image_f5_thumb',
		'oxy_bg_image_f5_position',
		'oxy_bg_image_f5_repeat',		
		
		'oxy_body_font',
		'oxy_title_font',
		'oxy_title_font_weight',
		'oxy_title_font_uppercase',
		'oxy_cart_font',
		'oxy_cart_font_size',		
		'oxy_cart_font_weight',
		'oxy_cart_font_uppercase',		
		'oxy_main_menu_font',
		'oxy_mm_font_size',		
		'oxy_mm_font_weight',
		'oxy_mm_font_uppercase',				
		'oxy_price_font',
		'oxy_price_font_weight',			
		'oxy_button_font',
		'oxy_button_font_weight',
		'oxy_button_font_uppercase',
		'oxy_search_font',
		'oxy_search_font_size',		
		'oxy_search_font_weight',
		'oxy_search_font_uppercase',					

        'oxy_facebook_likebox_status',	
        'oxy_facebook_likebox_id',
        'oxy_facebook_likebox_position',	
		
		'oxy_twitter_block_status',
        'oxy_twitter_block_user',
        'oxy_twitter_block_widget_id',
		'oxy_twitter_block_tweets',
		'oxy_twitter_block_position',
		
		'oxy_video_box_status',	
        'oxy_video_box_position',
		'oxy_video_box_bg',
		
        'oxy_custom_box_status',	
        'oxy_custom_box_position',
		'oxy_custom_box_bg',
		
        'oxy_custom_css',
		'oxy_custom_js',	
		
        );
        
        foreach ($config_data as $conf) {
            if (isset($this->request->post[$conf])) {
                $this->data[$conf] = $this->request->post[$conf];
            } else {
                $this->data[$conf] = $this->config->get($conf);
            }
        }
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/oxy', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/oxy', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');	
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		$languages = $this->model_localisation_language->getLanguages();
		
		foreach ($languages as $language) {
			if (isset($this->request->post['oxy_menu_link_1' . $language['language_id']])) {
				$this->data['oxy_menu_link_1' . $language['language_id']] = $this->request->post['oxy_menu_link_1' . $language['language_id']];
			} else {
				$this->data['oxy_menu_link_1' . $language['language_id']] = $this->config->get('oxy_menu_link_1' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_menu_link_2' . $language['language_id']])) {
				$this->data['oxy_menu_link_2' . $language['language_id']] = $this->request->post['oxy_menu_link_2' . $language['language_id']];
			} else {
				$this->data['oxy_menu_link_2' . $language['language_id']] = $this->config->get('oxy_menu_link_2' . $language['language_id']);
			}			
			if (isset($this->request->post['oxy_menu_link_3' . $language['language_id']])) {
				$this->data['oxy_menu_link_3' . $language['language_id']] = $this->request->post['oxy_menu_link_3' . $language['language_id']];
			} else {
				$this->data['oxy_menu_link_3' . $language['language_id']] = $this->config->get('oxy_menu_link_3' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_menu_link_4' . $language['language_id']])) {
				$this->data['oxy_menu_link_4' . $language['language_id']] = $this->request->post['oxy_menu_link_4' . $language['language_id']];
			} else {
				$this->data['oxy_menu_link_4' . $language['language_id']] = $this->config->get('oxy_menu_link_4' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_menu_link_5' . $language['language_id']])) {
				$this->data['oxy_menu_link_5' . $language['language_id']] = $this->request->post['oxy_menu_link_5' . $language['language_id']];
			} else {
				$this->data['oxy_menu_link_5' . $language['language_id']] = $this->config->get('oxy_menu_link_5' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_menu_link_6' . $language['language_id']])) {
				$this->data['oxy_menu_link_6' . $language['language_id']] = $this->request->post['oxy_menu_link_6' . $language['language_id']];
			} else {
				$this->data['oxy_menu_link_6' . $language['language_id']] = $this->config->get('oxy_menu_link_6' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_menu_link_7' . $language['language_id']])) {
				$this->data['oxy_menu_link_7' . $language['language_id']] = $this->request->post['oxy_menu_link_7' . $language['language_id']];
			} else {
				$this->data['oxy_menu_link_7' . $language['language_id']] = $this->config->get('oxy_menu_link_7' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_menu_link_8' . $language['language_id']])) {
				$this->data['oxy_menu_link_8' . $language['language_id']] = $this->request->post['oxy_menu_link_8' . $language['language_id']];
			} else {
				$this->data['oxy_menu_link_8' . $language['language_id']] = $this->config->get('oxy_menu_link_8' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_menu_link_9' . $language['language_id']])) {
				$this->data['oxy_menu_link_9' . $language['language_id']] = $this->request->post['oxy_menu_link_9' . $language['language_id']];
			} else {
				$this->data['oxy_menu_link_9' . $language['language_id']] = $this->config->get('oxy_menu_link_9' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_menu_link_10' . $language['language_id']])) {
				$this->data['oxy_menu_link_10' . $language['language_id']] = $this->request->post['oxy_menu_link_10' . $language['language_id']];
			} else {
				$this->data['oxy_menu_link_10' . $language['language_id']] = $this->config->get('oxy_menu_link_10' . $language['language_id']);
			}
			
			if (isset($this->request->post['oxy_menu_cm_title' . $language['language_id']])) {
				$this->data['oxy_menu_cm_title' . $language['language_id']] = $this->request->post['oxy_menu_cm_title' . $language['language_id']];
			} else {
				$this->data['oxy_menu_cm_title' . $language['language_id']] = $this->config->get('oxy_menu_cm_title' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_menu_cm_link_1' . $language['language_id']])) {
				$this->data['oxy_menu_cm_link_1' . $language['language_id']] = $this->request->post['oxy_menu_cm_link_1' . $language['language_id']];
			} else {
				$this->data['oxy_menu_cm_link_1' . $language['language_id']] = $this->config->get('oxy_menu_cm_link_1' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_menu_cm_link_2' . $language['language_id']])) {
				$this->data['oxy_menu_cm_link_2' . $language['language_id']] = $this->request->post['oxy_menu_cm_link_2' . $language['language_id']];
			} else {
				$this->data['oxy_menu_cm_link_2' . $language['language_id']] = $this->config->get('oxy_menu_cm_link_2' . $language['language_id']);
			}			
			if (isset($this->request->post['oxy_menu_cm_link_3' . $language['language_id']])) {
				$this->data['oxy_menu_cm_link_3' . $language['language_id']] = $this->request->post['oxy_menu_cm_link_3' . $language['language_id']];
			} else {
				$this->data['oxy_menu_cm_link_3' . $language['language_id']] = $this->config->get('oxy_menu_cm_link_3' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_menu_cm_link_4' . $language['language_id']])) {
				$this->data['oxy_menu_cm_link_4' . $language['language_id']] = $this->request->post['oxy_menu_cm_link_4' . $language['language_id']];
			} else {
				$this->data['oxy_menu_cm_link_4' . $language['language_id']] = $this->config->get('oxy_menu_cm_link_4' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_menu_cm_link_5' . $language['language_id']])) {
				$this->data['oxy_menu_cm_link_5' . $language['language_id']] = $this->request->post['oxy_menu_cm_link_5' . $language['language_id']];
			} else {
				$this->data['oxy_menu_cm_link_5' . $language['language_id']] = $this->config->get('oxy_menu_cm_link_5' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_menu_cm_link_6' . $language['language_id']])) {
				$this->data['oxy_menu_cm_link_6' . $language['language_id']] = $this->request->post['oxy_menu_cm_link_6' . $language['language_id']];
			} else {
				$this->data['oxy_menu_cm_link_6' . $language['language_id']] = $this->config->get('oxy_menu_cm_link_6' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_menu_cm_link_7' . $language['language_id']])) {
				$this->data['oxy_menu_cm_link_7' . $language['language_id']] = $this->request->post['oxy_menu_cm_link_7' . $language['language_id']];
			} else {
				$this->data['oxy_menu_cm_link_7' . $language['language_id']] = $this->config->get('oxy_menu_cm_link_7' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_menu_cm_link_8' . $language['language_id']])) {
				$this->data['oxy_menu_cm_link_8' . $language['language_id']] = $this->request->post['oxy_menu_cm_link_8' . $language['language_id']];
			} else {
				$this->data['oxy_menu_cm_link_8' . $language['language_id']] = $this->config->get('oxy_menu_cm_link_8' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_menu_cm_link_9' . $language['language_id']])) {
				$this->data['oxy_menu_cm_link_9' . $language['language_id']] = $this->request->post['oxy_menu_cm_link_9' . $language['language_id']];
			} else {
				$this->data['oxy_menu_cm_link_9' . $language['language_id']] = $this->config->get('oxy_menu_cm_link_9' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_menu_cm_link_10' . $language['language_id']])) {
				$this->data['oxy_menu_cm_link_10' . $language['language_id']] = $this->request->post['oxy_menu_cm_link_10' . $language['language_id']];
			} else {
				$this->data['oxy_menu_cm_link_10' . $language['language_id']] = $this->config->get('oxy_menu_cm_link_10' . $language['language_id']);
			}
			
			if (isset($this->request->post['oxy_menu_custom_block_title_1' . $language['language_id']])) {
				$this->data['oxy_menu_custom_block_title_1' . $language['language_id']] = $this->request->post['oxy_menu_custom_block_title_1' . $language['language_id']];
			} else {
				$this->data['oxy_menu_custom_block_title_1' . $language['language_id']] = $this->config->get('oxy_menu_custom_block_title_1' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_menu_custom_block_title_2' . $language['language_id']])) {
				$this->data['oxy_menu_custom_block_title_2' . $language['language_id']] = $this->request->post['oxy_menu_custom_block_title_2' . $language['language_id']];
			} else {
				$this->data['oxy_menu_custom_block_title_2' . $language['language_id']] = $this->config->get('oxy_menu_custom_block_title_2' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_menu_custom_block_title_3' . $language['language_id']])) {
				$this->data['oxy_menu_custom_block_title_3' . $language['language_id']] = $this->request->post['oxy_menu_custom_block_title_3' . $language['language_id']];
			} else {
				$this->data['oxy_menu_custom_block_title_3' . $language['language_id']] = $this->config->get('oxy_menu_custom_block_title_3' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_menu_custom_block_content_1' . $language['language_id']])) {
				$this->data['oxy_menu_custom_block_content_1' . $language['language_id']] = $this->request->post['oxy_menu_custom_block_content_1' . $language['language_id']];
			} else {
				$this->data['oxy_menu_custom_block_content_1' . $language['language_id']] = $this->config->get('oxy_menu_custom_block_content_1' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_menu_custom_block_content_2' . $language['language_id']])) {
				$this->data['oxy_menu_custom_block_content_2' . $language['language_id']] = $this->request->post['oxy_menu_custom_block_content_2' . $language['language_id']];
			} else {
				$this->data['oxy_menu_custom_block_content_2' . $language['language_id']] = $this->config->get('oxy_menu_custom_block_content_2' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_menu_custom_block_content_3' . $language['language_id']])) {
				$this->data['oxy_menu_custom_block_content_3' . $language['language_id']] = $this->request->post['oxy_menu_custom_block_content_3' . $language['language_id']];
			} else {
				$this->data['oxy_menu_custom_block_content_3' . $language['language_id']] = $this->config->get('oxy_menu_custom_block_content_3' . $language['language_id']);
			}
			
			if (isset($this->request->post['oxy_product_custom_content' . $language['language_id']])) {
				$this->data['oxy_product_custom_content' . $language['language_id']] = $this->request->post['oxy_product_custom_content' . $language['language_id']];
			} else {
				$this->data['oxy_product_custom_content' . $language['language_id']] = $this->config->get('oxy_product_custom_content' . $language['language_id']);
			}
			
			if (isset($this->request->post['oxy_product_fb1_title' . $language['language_id']])) {
				$this->data['oxy_product_fb1_title' . $language['language_id']] = $this->request->post['oxy_product_fb1_title' . $language['language_id']];
			} else {
				$this->data['oxy_product_fb1_title' . $language['language_id']] = $this->config->get('oxy_product_fb1_title' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_product_fb1_subtitle' . $language['language_id']])) {
				$this->data['oxy_product_fb1_subtitle' . $language['language_id']] = $this->request->post['oxy_product_fb1_subtitle' . $language['language_id']];
			} else {
				$this->data['oxy_product_fb1_subtitle' . $language['language_id']] = $this->config->get('oxy_product_fb1_subtitle' . $language['language_id']);
			}		
			if (isset($this->request->post['oxy_product_fb1_content' . $language['language_id']])) {
				$this->data['oxy_product_fb1_content' . $language['language_id']] = $this->request->post['oxy_product_fb1_content' . $language['language_id']];
			} else {
				$this->data['oxy_product_fb1_content' . $language['language_id']] = $this->config->get('oxy_product_fb1_content' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_product_fb2_title' . $language['language_id']])) {
				$this->data['oxy_product_fb2_title' . $language['language_id']] = $this->request->post['oxy_product_fb2_title' . $language['language_id']];
			} else {
				$this->data['oxy_product_fb2_title' . $language['language_id']] = $this->config->get('oxy_product_fb2_title' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_product_fb2_subtitle' . $language['language_id']])) {
				$this->data['oxy_product_fb2_subtitle' . $language['language_id']] = $this->request->post['oxy_product_fb2_subtitle' . $language['language_id']];
			} else {
				$this->data['oxy_product_fb2_subtitle' . $language['language_id']] = $this->config->get('oxy_product_fb2_subtitle' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_product_fb2_content' . $language['language_id']])) {
				$this->data['oxy_product_fb2_content' . $language['language_id']] = $this->request->post['oxy_product_fb2_content' . $language['language_id']];
			} else {
				$this->data['oxy_product_fb2_content' . $language['language_id']] = $this->config->get('oxy_product_fb2_content' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_product_fb3_title' . $language['language_id']])) {
				$this->data['oxy_product_fb3_title' . $language['language_id']] = $this->request->post['oxy_product_fb3_title' . $language['language_id']];
			} else {
				$this->data['oxy_product_fb3_title' . $language['language_id']] = $this->config->get('oxy_product_fb3_title' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_product_fb3_subtitle' . $language['language_id']])) {
				$this->data['oxy_product_fb3_subtitle' . $language['language_id']] = $this->request->post['oxy_product_fb3_subtitle' . $language['language_id']];
			} else {
				$this->data['oxy_product_fb3_subtitle' . $language['language_id']] = $this->config->get('oxy_product_fb3_subtitle' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_product_fb3_content' . $language['language_id']])) {
				$this->data['oxy_product_fb3_content' . $language['language_id']] = $this->request->post['oxy_product_fb3_content' . $language['language_id']];
			} else {
				$this->data['oxy_product_fb3_content' . $language['language_id']] = $this->config->get('oxy_product_fb3_content' . $language['language_id']);
			}
			
			if (isset($this->request->post['oxy_product_custom_tab_1_title' . $language['language_id']])) {
				$this->data['oxy_product_custom_tab_1_title' . $language['language_id']] = $this->request->post['oxy_product_custom_tab_1_title' . $language['language_id']];
			} else {
				$this->data['oxy_product_custom_tab_1_title' . $language['language_id']] = $this->config->get('oxy_product_custom_tab_1_title' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_product_custom_tab_content' . $language['language_id']])) {
				$this->data['oxy_product_custom_tab_1_content' . $language['language_id']] = $this->request->post['oxy_product_custom_tab_1_content' . $language['language_id']];
			} else {
				$this->data['oxy_product_custom_tab_1_content' . $language['language_id']] = $this->config->get('oxy_product_custom_tab_1_content' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_product_custom_tab_2_title' . $language['language_id']])) {
				$this->data['oxy_product_custom_tab_2_title' . $language['language_id']] = $this->request->post['oxy_product_custom_tab_2_title' . $language['language_id']];
			} else {
				$this->data['oxy_product_custom_tab_2_title' . $language['language_id']] = $this->config->get('oxy_product_custom_tab_2_title' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_product_custom_tab_2_content' . $language['language_id']])) {
				$this->data['oxy_product_custom_tab_2_content' . $language['language_id']] = $this->request->post['oxy_product_custom_tab_2_content' . $language['language_id']];
			} else {
				$this->data['oxy_product_custom_tab_2_content' . $language['language_id']] = $this->config->get('oxy_product_custom_tab_2_content' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_product_custom_tab_3_title' . $language['language_id']])) {
				$this->data['oxy_product_custom_tab_3_title' . $language['language_id']] = $this->request->post['oxy_product_custom_tab_3_title' . $language['language_id']];
			} else {
				$this->data['oxy_product_custom_tab_3_title' . $language['language_id']] = $this->config->get('oxy_product_custom_tab_3_title' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_product_custom_tab_3_content' . $language['language_id']])) {
				$this->data['oxy_product_custom_tab_3_content' . $language['language_id']] = $this->request->post['oxy_product_custom_tab_3_content' . $language['language_id']];
			} else {
				$this->data['oxy_product_custom_tab_3_content' . $language['language_id']] = $this->config->get('oxy_product_custom_tab_3_content' . $language['language_id']);
			}
			
			if (isset($this->request->post['oxy_fp_fb1_title' . $language['language_id']])) {
				$this->data['oxy_fp_fb1_title' . $language['language_id']] = $this->request->post['oxy_fp_fb1_title' . $language['language_id']];
			} else {
				$this->data['oxy_fp_fb1_title' . $language['language_id']] = $this->config->get('oxy_fp_fb1_title' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_fp_fb1_subtitle' . $language['language_id']])) {
				$this->data['oxy_fp_fb1_subtitle' . $language['language_id']] = $this->request->post['oxy_fp_fb1_subtitle' . $language['language_id']];
			} else {
				$this->data['oxy_fp_fb1_subtitle' . $language['language_id']] = $this->config->get('oxy_fp_fb1_subtitle' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_fp_fb1_content' . $language['language_id']])) {
				$this->data['oxy_fp_fb1_content' . $language['language_id']] = $this->request->post['oxy_fp_fb1_content' . $language['language_id']];
			} else {
				$this->data['oxy_fp_fb1_content' . $language['language_id']] = $this->config->get('oxy_fp_fb1_content' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_fp_fb2_title' . $language['language_id']])) {
				$this->data['oxy_fp_fb2_title' . $language['language_id']] = $this->request->post['oxy_fp_fb2_title' . $language['language_id']];
			} else {
				$this->data['oxy_fp_fb2_title' . $language['language_id']] = $this->config->get('oxy_fp_fb2_title' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_fp_fb2_subtitle' . $language['language_id']])) {
				$this->data['oxy_fp_fb2_subtitle' . $language['language_id']] = $this->request->post['oxy_fp_fb2_subtitle' . $language['language_id']];
			} else {
				$this->data['oxy_fp_fb2_subtitle' . $language['language_id']] = $this->config->get('oxy_fp_fb2_subtitle' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_fp_fb2_content' . $language['language_id']])) {
				$this->data['oxy_fp_fb2_content' . $language['language_id']] = $this->request->post['oxy_fp_fb2_content' . $language['language_id']];
			} else {
				$this->data['oxy_fp_fb2_content' . $language['language_id']] = $this->config->get('oxy_fp_fb2_content' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_fp_fb3_title' . $language['language_id']])) {
				$this->data['oxy_fp_fb3_title' . $language['language_id']] = $this->request->post['oxy_fp_fb3_title' . $language['language_id']];
			} else {
				$this->data['oxy_fp_fb3_title' . $language['language_id']] = $this->config->get('oxy_fp_fb3_title' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_fp_fb3_subtitle' . $language['language_id']])) {
				$this->data['oxy_fp_fb3_subtitle' . $language['language_id']] = $this->request->post['oxy_fp_fb3_subtitle' . $language['language_id']];
			} else {
				$this->data['oxy_fp_fb3_subtitle' . $language['language_id']] = $this->config->get('oxy_fp_fb3_subtitle' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_fp_fb3_content' . $language['language_id']])) {
				$this->data['oxy_fp_fb3_content' . $language['language_id']] = $this->request->post['oxy_fp_fb3_content' . $language['language_id']];
			} else {
				$this->data['oxy_fp_fb3_content' . $language['language_id']] = $this->config->get('oxy_fp_fb3_content' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_fp_fb4_title' . $language['language_id']])) {
				$this->data['oxy_fp_fb4_title' . $language['language_id']] = $this->request->post['oxy_fp_fb4_title' . $language['language_id']];
			} else {
				$this->data['oxy_fp_fb4_title' . $language['language_id']] = $this->config->get('oxy_fp_fb4_title' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_fp_fb4_subtitle' . $language['language_id']])) {
				$this->data['oxy_fp_fb4_subtitle' . $language['language_id']] = $this->request->post['oxy_fp_fb4_subtitle' . $language['language_id']];
			} else {
				$this->data['oxy_fp_fb4_subtitle' . $language['language_id']] = $this->config->get('oxy_fp_fb4_subtitle' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_fp_fb4_content' . $language['language_id']])) {
				$this->data['oxy_fp_fb4_content' . $language['language_id']] = $this->request->post['oxy_fp_fb4_content' . $language['language_id']];
			} else {
				$this->data['oxy_fp_fb4_content' . $language['language_id']] = $this->config->get('oxy_fp_fb4_content' . $language['language_id']);
			}	
			
            if (isset($this->request->post['oxy_follow_us_title' . $language['language_id']])) {
				$this->data['oxy_follow_us_title' . $language['language_id']] = $this->request->post['oxy_follow_us_title' . $language['language_id']];
			} else {
				$this->data['oxy_follow_us_title' . $language['language_id']] = $this->config->get('oxy_follow_us_title' . $language['language_id']);
			}
			
			if (isset($this->request->post['oxy_contact_custom_content' . $language['language_id']])) {
				$this->data['oxy_contact_custom_content' . $language['language_id']] = $this->request->post['oxy_contact_custom_content' . $language['language_id']];
			} else {
				$this->data['oxy_contact_custom_content' . $language['language_id']] = $this->config->get('oxy_contact_custom_content' . $language['language_id']);
			}
			
			if (isset($this->request->post['oxy_contacts_title' . $language['language_id']])) {
				$this->data['oxy_contacts_title' . $language['language_id']] = $this->request->post['oxy_contacts_title' . $language['language_id']];
			} else {
				$this->data['oxy_contacts_title' . $language['language_id']] = $this->config->get('oxy_contacts_title' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_contact_mphone1' . $language['language_id']])) {
				$this->data['oxy_contact_mphone1' . $language['language_id']] = $this->request->post['oxy_contact_mphone1' . $language['language_id']];
			} else {
				$this->data['oxy_contact_mphone1' . $language['language_id']] = $this->config->get('oxy_contact_mphone1' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_contact_mphone2' . $language['language_id']])) {
				$this->data['oxy_contact_mphone2' . $language['language_id']] = $this->request->post['oxy_contact_mphone2' . $language['language_id']];
			} else {
				$this->data['oxy_contact_mphone2' . $language['language_id']] = $this->config->get('oxy_contact_mphone2' . $language['language_id']);
			}
			
			if (isset($this->request->post['oxy_contact_sphone1' . $language['language_id']])) {
				$this->data['oxy_contact_sphone1' . $language['language_id']] = $this->request->post['oxy_contact_sphone1' . $language['language_id']];
			} else {
				$this->data['oxy_contact_sphone1' . $language['language_id']] = $this->config->get('oxy_contact_sphone1' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_contact_sphone2' . $language['language_id']])) {
				$this->data['oxy_contact_sphone2' . $language['language_id']] = $this->request->post['oxy_contact_sphone2' . $language['language_id']];
			} else {
				$this->data['oxy_contact_sphone2' . $language['language_id']] = $this->config->get('oxy_contact_sphone2' . $language['language_id']);
			}
			
			if (isset($this->request->post['oxy_contact_fax1' . $language['language_id']])) {
				$this->data['oxy_contact_fax1' . $language['language_id']] = $this->request->post['oxy_contact_fax1' . $language['language_id']];
			} else {
				$this->data['oxy_contact_fax1' . $language['language_id']] = $this->config->get('oxy_contact_fax1' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_contact_fax2' . $language['language_id']])) {
				$this->data['oxy_contact_fax2' . $language['language_id']] = $this->request->post['oxy_contact_fax2' . $language['language_id']];
			} else {
				$this->data['oxy_contact_fax2' . $language['language_id']] = $this->config->get('oxy_contact_fax2' . $language['language_id']);
			}	
			
			if (isset($this->request->post['oxy_contact_email1' . $language['language_id']])) {
				$this->data['oxy_contact_email1' . $language['language_id']] = $this->request->post['oxy_contact_email1' . $language['language_id']];
			} else {
				$this->data['oxy_contact_email1' . $language['language_id']] = $this->config->get('oxy_contact_email1' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_contact_email2' . $language['language_id']])) {
				$this->data['oxy_contact_email2' . $language['language_id']] = $this->request->post['oxy_contact_email2' . $language['language_id']];
			} else {
				$this->data['oxy_contact_email2' . $language['language_id']] = $this->config->get('oxy_contact_email2' . $language['language_id']);
			}		

			if (isset($this->request->post['oxy_contact_skype1' . $language['language_id']])) {
				$this->data['oxy_contact_skype1' . $language['language_id']] = $this->request->post['oxy_contact_skype1' . $language['language_id']];
			} else {
				$this->data['oxy_contact_skype1' . $language['language_id']] = $this->config->get('oxy_contact_skype1' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_contact_skype2' . $language['language_id']])) {
				$this->data['oxy_contact_skype2' . $language['language_id']] = $this->request->post['oxy_contact_skype2' . $language['language_id']];
			} else {
				$this->data['oxy_contact_skype2' . $language['language_id']] = $this->config->get('oxy_contact_skype2' . $language['language_id']);
			}	
			
			if (isset($this->request->post['oxy_contact_location1' . $language['language_id']])) {
				$this->data['oxy_contact_location1' . $language['language_id']] = $this->request->post['oxy_contact_location1' . $language['language_id']];
			} else {
				$this->data['oxy_contact_location1' . $language['language_id']] = $this->config->get('oxy_contact_location1' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_contact_location2' . $language['language_id']])) {
				$this->data['oxy_contact_location2' . $language['language_id']] = $this->request->post['oxy_contact_location2' . $language['language_id']];
			} else {
				$this->data['oxy_contact_location2' . $language['language_id']] = $this->config->get('oxy_contact_location2' . $language['language_id']);
			}	
			
			if (isset($this->request->post['oxy_contact_hours' . $language['language_id']])) {
				$this->data['oxy_contact_hours' . $language['language_id']] = $this->request->post['oxy_contact_hours' . $language['language_id']];
			} else {
				$this->data['oxy_contact_hours' . $language['language_id']] = $this->config->get('oxy_contact_hours' . $language['language_id']);
			}	
			
			if (isset($this->request->post['oxy_custom_1_title' . $language['language_id']])) {
				$this->data['oxy_custom_1_title' . $language['language_id']] = $this->request->post['oxy_custom_1_title' . $language['language_id']];
			} else {
				$this->data['oxy_custom_1_title' . $language['language_id']] = $this->config->get('oxy_custom_1_title' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_custom_1_content' . $language['language_id']])) {
				$this->data['oxy_custom_1_content' . $language['language_id']] = $this->request->post['oxy_custom_1_content' . $language['language_id']];
			} else {
				$this->data['oxy_custom_1_content' . $language['language_id']] = $this->config->get('oxy_custom_1_content' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_custom_2_title' . $language['language_id']])) {
				$this->data['oxy_custom_2_title' . $language['language_id']] = $this->request->post['oxy_custom_2_title' . $language['language_id']];
			} else {
				$this->data['oxy_custom_2_title' . $language['language_id']] = $this->config->get('oxy_custom_2_title' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_custom_2_content' . $language['language_id']])) {
				$this->data['oxy_custom_2_content' . $language['language_id']] = $this->request->post['oxy_custom_2_content' . $language['language_id']];
			} else {
				$this->data['oxy_custom_2_content' . $language['language_id']] = $this->config->get('oxy_custom_2_content' . $language['language_id']);
			}
			if (isset($this->request->post['oxy_custom_3_content' . $language['language_id']])) {
				$this->data['oxy_custom_3_content' . $language['language_id']] = $this->request->post['oxy_custom_3_content' . $language['language_id']];
			} else {
				$this->data['oxy_custom_3_content' . $language['language_id']] = $this->config->get('oxy_custom_3_content' . $language['language_id']);
			}					
			if (isset($this->request->post['oxy_powered_content' . $language['language_id']])) {
				$this->data['oxy_powered_content' . $language['language_id']] = $this->request->post['oxy_powered_content' . $language['language_id']];
			} else {
				$this->data['oxy_powered_content' . $language['language_id']] = $this->config->get('oxy_powered_content' . $language['language_id']);
			}		
			
			if (isset($this->request->post['oxy_popup_content' . $language['language_id']])) {
				$this->data['oxy_popup_content' . $language['language_id']] = $this->request->post['oxy_popup_content' . $language['language_id']];
			} else {
				$this->data['oxy_popup_content' . $language['language_id']] = $this->config->get('oxy_popup_content' . $language['language_id']);
			}	
			if (isset($this->request->post['oxy_video_box_content' . $language['language_id']])) {
				$this->data['oxy_video_box_content' . $language['language_id']] = $this->request->post['oxy_video_box_content' . $language['language_id']];
			} else {
				$this->data['oxy_video_box_content' . $language['language_id']] = $this->config->get('oxy_video_box_content' . $language['language_id']);
			}				
			if (isset($this->request->post['oxy_custom_box_content' . $language['language_id']])) {
				$this->data['oxy_custom_box_content' . $language['language_id']] = $this->request->post['oxy_custom_box_content' . $language['language_id']];
			} else {
				$this->data['oxy_custom_box_content' . $language['language_id']] = $this->config->get('oxy_custom_box_content' . $language['language_id']);
			}														
		}

		$this->template = 'module/oxy.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
		
        if (isset($this->data['oxy_left_column_head_custom']) && $this->data['oxy_left_column_head_custom'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_left_column_head_custom'])) {
            $this->data['oxy_left_column_head_custom_thumb'] = $this->model_tool_image->resize($this->data['oxy_left_column_head_custom'], 100, 100);
        } else {
            $this->data['oxy_left_column_head_custom_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }	
		if (isset($this->data['oxy_right_column_head_custom']) && $this->data['oxy_right_column_head_custom'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_right_column_head_custom'])) {
            $this->data['oxy_right_column_head_custom_thumb'] = $this->model_tool_image->resize($this->data['oxy_right_column_head_custom'], 100, 100);
        } else {
            $this->data['oxy_right_column_head_custom_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }	  
		if (isset($this->data['oxy_category_box_head_custom']) && $this->data['oxy_category_box_head_custom'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_category_box_head_custom'])) {
            $this->data['oxy_category_box_head_custom_thumb'] = $this->model_tool_image->resize($this->data['oxy_category_box_head_custom'], 100, 100);
        } else {
            $this->data['oxy_category_box_head_custom_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }	 	
		if (isset($this->data['oxy_filter_box_head_custom']) && $this->data['oxy_filter_box_head_custom'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_filter_box_head_custom'])) {
            $this->data['oxy_filter_box_head_custom_thumb'] = $this->model_tool_image->resize($this->data['oxy_filter_box_head_custom'], 100, 100);
        } else {
            $this->data['oxy_filter_box_head_custom_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }	 			 		
        if (isset($this->data['oxy_mid_prod_slider_custom']) && $this->data['oxy_mid_prod_slider_custom'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_mid_prod_slider_custom'])) {
            $this->data['oxy_mid_prod_slider_thumb'] = $this->model_tool_image->resize($this->data['oxy_mid_prod_slider_custom'], 100, 100);
        } else {
            $this->data['oxy_mid_prod_slider_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }		
        if (isset($this->data['oxy_pattern_custom']) && $this->data['oxy_pattern_custom'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_pattern_custom'])) {
            $this->data['oxy_pattern_thumb'] = $this->model_tool_image->resize($this->data['oxy_pattern_custom'], 100, 100);
        } else {
            $this->data['oxy_pattern_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
        if (isset($this->data['oxy_bg_image_custom']) && $this->data['oxy_bg_image_custom'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_bg_image_custom'])) {
            $this->data['oxy_bg_image_thumb'] = $this->model_tool_image->resize($this->data['oxy_bg_image_custom'], 100, 100);
        } else {
            $this->data['oxy_bg_image_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
        if (isset($this->data['oxy_pattern_custom_mc']) && $this->data['oxy_pattern_custom_mc'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_pattern_custom_mc'])) {
            $this->data['oxy_pattern_thumb_mc'] = $this->model_tool_image->resize($this->data['oxy_pattern_custom_mc'], 100, 100);
        } else {
            $this->data['oxy_pattern_thumb_mc'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
        if (isset($this->data['oxy_bg_image_mc_custom']) && $this->data['oxy_bg_image_mc_custom'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_bg_image_mc_custom'])) {
            $this->data['oxy_bg_image_mc_thumb'] = $this->model_tool_image->resize($this->data['oxy_bg_image_mc_custom'], 100, 100);
        } else {
            $this->data['oxy_bg_image_mc_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }		
        if (isset($this->data['oxy_pattern_custom_ta']) && $this->data['oxy_pattern_custom_ta'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_pattern_custom_ta'])) {
            $this->data['oxy_pattern_thumb_ta'] = $this->model_tool_image->resize($this->data['oxy_pattern_custom_ta'], 100, 100);
        } else {
            $this->data['oxy_pattern_thumb_ta'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
        if (isset($this->data['oxy_bg_image_ta_custom']) && $this->data['oxy_bg_image_ta_custom'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_bg_image_ta_custom'])) {
            $this->data['oxy_bg_image_ta_thumb'] = $this->model_tool_image->resize($this->data['oxy_bg_image_ta_custom'], 100, 100);
        } else {
            $this->data['oxy_bg_image_ta_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }	
        if (isset($this->data['oxy_pattern_custom_mm']) && $this->data['oxy_pattern_custom_mm'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_pattern_custom_mm'])) {
            $this->data['oxy_pattern_thumb_mm'] = $this->model_tool_image->resize($this->data['oxy_pattern_custom_mm'], 100, 100);
        } else {
            $this->data['oxy_pattern_thumb_mm'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
        if (isset($this->data['oxy_bg_image_mm_custom']) && $this->data['oxy_bg_image_mm_custom'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_bg_image_mm_custom'])) {
            $this->data['oxy_bg_image_mm_thumb'] = $this->model_tool_image->resize($this->data['oxy_bg_image_mm_custom'], 100, 100);
        } else {
            $this->data['oxy_bg_image_mm_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
		if (isset($this->data['oxy_product_fb1_icon']) && $this->data['oxy_product_fb1_icon'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_product_fb1_icon'])) {
            $this->data['oxy_product_fb1_icon_thumb'] = $this->model_tool_image->resize($this->data['oxy_product_fb1_icon'], 100, 100);
        } else {
            $this->data['oxy_product_fb1_icon_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
		if (isset($this->data['oxy_product_fb2_icon']) && $this->data['oxy_product_fb2_icon'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_product_fb2_icon'])) {
            $this->data['oxy_product_fb2_icon_thumb'] = $this->model_tool_image->resize($this->data['oxy_product_fb2_icon'], 100, 100);
        } else {
            $this->data['oxy_product_fb2_icon_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
		if (isset($this->data['oxy_product_fb3_icon']) && $this->data['oxy_product_fb3_icon'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_product_fb3_icon'])) {
            $this->data['oxy_product_fb3_icon_thumb'] = $this->model_tool_image->resize($this->data['oxy_product_fb3_icon'], 100, 100);
        } else {
            $this->data['oxy_product_fb3_icon_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
		if (isset($this->data['oxy_fp_fb1_icon']) && $this->data['oxy_fp_fb1_icon'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_fp_fb1_icon'])) {
            $this->data['oxy_fp_fb1_icon_thumb'] = $this->model_tool_image->resize($this->data['oxy_fp_fb1_icon'], 100, 100);
        } else {
            $this->data['oxy_fp_fb1_icon_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
		if (isset($this->data['oxy_fp_fb2_icon']) && $this->data['oxy_fp_fb2_icon'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_fp_fb2_icon'])) {
            $this->data['oxy_fp_fb2_icon_thumb'] = $this->model_tool_image->resize($this->data['oxy_fp_fb2_icon'], 100, 100);
        } else {
            $this->data['oxy_fp_fb2_icon_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
		if (isset($this->data['oxy_fp_fb3_icon']) && $this->data['oxy_fp_fb3_icon'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_fp_fb3_icon'])) {
            $this->data['oxy_fp_fb3_icon_thumb'] = $this->model_tool_image->resize($this->data['oxy_fp_fb3_icon'], 100, 100);
        } else {
            $this->data['oxy_fp_fb3_icon_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }	
		if (isset($this->data['oxy_fp_fb4_icon']) && $this->data['oxy_fp_fb4_icon'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_fp_fb4_icon'])) {
            $this->data['oxy_fp_fb4_icon_thumb'] = $this->model_tool_image->resize($this->data['oxy_fp_fb4_icon'], 100, 100);
        } else {
            $this->data['oxy_fp_fb4_icon_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }	
			
	    if (isset($this->data['oxy_bg_image_f1_custom']) && $this->data['oxy_bg_image_f1_custom'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_bg_image_f1_custom'])) {
            $this->data['oxy_bg_image_f1_thumb'] = $this->model_tool_image->resize($this->data['oxy_bg_image_f1_custom'], 100, 100);
        } else {
            $this->data['oxy_bg_image_f1_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }	
	    if (isset($this->data['oxy_bg_image_f2_custom']) && $this->data['oxy_bg_image_f2_custom'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_bg_image_f2_custom'])) {
            $this->data['oxy_bg_image_f2_thumb'] = $this->model_tool_image->resize($this->data['oxy_bg_image_f2_custom'], 100, 100);
        } else {
            $this->data['oxy_bg_image_f2_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }	
	    if (isset($this->data['oxy_bg_image_f4_custom']) && $this->data['oxy_bg_image_f4_custom'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_bg_image_f4_custom'])) {
            $this->data['oxy_bg_image_f4_thumb'] = $this->model_tool_image->resize($this->data['oxy_bg_image_f4_custom'], 100, 100);
        } else {
            $this->data['oxy_bg_image_f4_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
	    if (isset($this->data['oxy_bg_image_f5_custom']) && $this->data['oxy_bg_image_f5_custom'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_bg_image_f5_custom'])) {
            $this->data['oxy_bg_image_f5_thumb'] = $this->model_tool_image->resize($this->data['oxy_bg_image_f5_custom'], 100, 100);
        } else {
            $this->data['oxy_bg_image_f5_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }			
		
        if (isset($this->data['oxy_payment_block_custom']) && $this->data['oxy_payment_block_custom'] != "" && file_exists(DIR_IMAGE . $this->data['oxy_payment_block_custom'])) {
            $this->data['oxy_payment_block_custom_thumb'] = $this->model_tool_image->resize($this->data['oxy_payment_block_custom'], 100, 100);
        } else {
            $this->data['oxy_payment_block_custom_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }		
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
		
		$color_schema  = $this->config->get('color_schema');

		if(isset($color_schema)&&(!empty( $color_schema))) :
 
		$this->data['color_schema'] = json_decode($color_schema, true);
		
		else:
		
		$color_schema =  array(
		'0'=>array(
		'skin_name'=>'Default',
		'oxy_layout_style'=>'1',
		'oxy_search_bar_position'=>'center',
		
		'oxy_body_bg_color'=>'#F6F6F6',
		'oxy_headings_color'=>'#464646',
		'oxy_body_text_color'=>'#464646',
		'oxy_light_text_color'=>'#B6B6B6',
		'oxy_other_links_color'=>'#4BB8E2',
		'oxy_links_hover_color'=>'#ED5053',
		'oxy_general_icons_style'=>'1',
		
		'oxy_main_column_status'=>'1',
		'oxy_main_column_bg_color'=>'#FFFFFF',
		'oxy_main_column_border_status'=>'0',
		'oxy_main_column_border_size'=>'1',
		'oxy_main_column_border_style'=>'solid',
		'oxy_main_column_border_color'=>'#CCCCCC',
		'oxy_main_column_shadow'=>'1',
		
		'oxy_content_column_hli_bg_color'=>'#F6F6F6',
		'oxy_content_column_head_border_status'=>'1',
		'oxy_content_column_head_border_size'=>'1',
		'oxy_content_column_head_border_style'=>'solid',
		'oxy_content_column_head_border_color'=>'#EAEAEA',
		'oxy_content_column_separator_size'=>'1',
		'oxy_content_column_separator_style'=>'solid',
		'oxy_content_column_separator_color'=>'#EAEAEA',
		
		'oxy_left_column_head_status'=>'1',
		'oxy_left_column_head_bg_color'=>'#4BB8E2',
		'oxy_left_column_head_custom'=>'',
		'oxy_left_column_head_title_color'=>'#FFFFFF',
		'oxy_left_column_head_border_status'=>'0',
		'oxy_left_column_head_border_size'=>'1',
		'oxy_left_column_head_border_style'=>'solid',
		'oxy_left_column_head_border_color'=>'#EAEAEA',
		'oxy_left_column_box_status'=>'1',
		'oxy_left_column_box_bg_color'=>'#F6F6F6',
		'oxy_left_column_box_links_color'=>'#464646',
		'oxy_left_column_box_links_color_hover'=>'#ED5053',
		
		'oxy_right_column_head_status'=>'1',
		'oxy_right_column_head_bg_color'=>'#4BB8E2',
		'oxy_right_column_head_custom'=>'',
		'oxy_right_column_head_title_color'=>'#FFFFFF',
		'oxy_right_column_head_border_status'=>'0',
		'oxy_right_column_head_border_size'=>'1',
		'oxy_right_column_head_border_style'=>'solid',
		'oxy_right_column_head_border_color'=>'#EAEAEA',
		'oxy_right_column_box_status'=>'1',
		'oxy_right_column_box_bg_color'=>'#F6F6F6',
		'oxy_right_column_box_links_color'=>'#464646',
		'oxy_right_column_box_links_color_hover'=>'#ED5053',
		
		'oxy_category_box_head_status'=>'1',
		'oxy_category_box_head_bg_color'=>'#ED5053',
		'oxy_category_box_head_custom'=>'',
		'oxy_category_box_head_title_color'=>'#FFFFFF',
		'oxy_category_box_head_border_status'=>'0',
		'oxy_category_box_head_border_size'=>'1',
		'oxy_category_box_head_border_style'=>'solid',
		'oxy_category_box_head_border_color'=>'#EAEAEA',
		'oxy_category_box_box_status'=>'1',
		'oxy_category_box_box_bg_color'=>'#F6F6F6',
		'oxy_category_box_box_bg_color_hover'=>'#F0F0F0',
		'oxy_category_box_box_links_color'=>'#464646',
		'oxy_category_box_box_links_color_hover'=>'#4BB8E2',
		'oxy_category_box_box_separator_size'=>'1',
		'oxy_category_box_box_separator_style'=>'solid',
		'oxy_category_box_box_separator_color'=>'#FFFFFF',
		
		'oxy_filter_box_head_status'=>'1',
		'oxy_filter_box_head_bg_color'=>'#424242',
		'oxy_filter_box_head_custom'=>'',
		'oxy_filter_box_head_title_color'=>'#FFFFFF',
		'oxy_filter_box_head_border_status'=>'0',
		'oxy_filter_box_head_border_size'=>'1',
		'oxy_filter_box_head_border_style'=>'solid',
		'oxy_filter_box_head_border_color'=>'#EAEAEA',
		'oxy_filter_box_box_status'=>'1',
		'oxy_filter_box_box_bg_color'=>'#F6F6F6',
		'oxy_filter_box_box_links_color'=>'#464646',
		'oxy_filter_box_box_links_color_hover'=>'#ED5053',
		
		'oxy_price_color'=>'#4BB8E2',
		'oxy_price_old_color'=>'#B6B6B6',
		'oxy_price_new_color'=>'#ED5053',
		'oxy_price_tax_color'=>'#B6B6B6',
		
		'oxy_button_border_radius'=>'0',
		'oxy_button_bg_color'=>'#4BB8E2',
		'oxy_button_bg_hover_color'=>'#ED5053',
		'oxy_button_text_color'=>'#FFFFFF',
		'oxy_button_text_hover_color'=>'#FFFFFF',
		'oxy_button_exclusive_bg_color'=>'#ED5053',
		'oxy_button_exclusive_bg_hover_color'=>'#4BB8E2',
		'oxy_button_exclusive_text_color'=>'#FFFFFF',
		'oxy_button_exclusive_text_hover_color'=>'#FFFFFF',
		'oxy_button_light_bg_color'=>'#EFEFEF',
		'oxy_button_light_bg_hover_color'=>'#4BB8E2',
		'oxy_button_light_text_color'=>'#464646',
		'oxy_button_light_text_hover_color'=>'#FFFFFF',
		'oxy_button_slider_bg_color'=>'#EEEEEE',
		'oxy_button_slider_bg_hover_color'=>'#4BB8E2',
		
		'oxy_top_area_status'=>'0',
		'oxy_top_area_bg_color'=>'#F8F8F8',
		'oxy_top_area_mini_bg_color'=>'#FFFFFF',
		'oxy_top_area_tb_bg_status'=>'1',
		'oxy_top_area_tb_bg_color'=>'#424242',
		'oxy_top_area_tb_top_border_status'=>'0',
		'oxy_top_area_tb_top_border_color'=>'#4BB8E2',
		'oxy_top_area_tb_bottom_border_status'=>'0',
		'oxy_top_area_tb_bottom_border_color'=>'#525252',
		'oxy_top_area_tb_text_color'=>'#CCCCCC',
		'oxy_top_area_tb_link_color'=>'#4BB8E2',
		'oxy_top_area_tb_link_color_hover'=>'#ED5053',
		'oxy_top_area_tb_separator_color'=>'#525252',
		'oxy_top_area_tb_dropdown_bg_color'=>'#FFFFFF',
		'oxy_top_area_tb_dropdown_bg_color_hover'=>'#4BB8E2',
		'oxy_top_area_tb_dropdown_link_color'=>'#464646',
		'oxy_top_area_tb_dropdown_link_color_hover'=>'#FFFFFF',
		'oxy_top_area_search_bg_color'=>'#F3F3F3',
		'oxy_top_area_search_border_color'=>'#DFDFDF',
		'oxy_top_area_search_border_color_hover'=>'#CCCCCC',
		'oxy_top_area_search_text_color'=>'#464646',
		'oxy_top_area_cart_text_color'=>'#B6B6B6',
		'oxy_top_area_cart_link_color'=>'#4BB8E2',
		'oxy_top_area_cart_link_color_hover'=>'#ED5053',
		'oxy_top_area_cart_separator_color'=>'#EDEDED',
		'oxy_top_area_cart_icon_style'=>'1',
		
		'oxy_mm_bg_color_status'=>'1',
		'oxy_mm_bg_color'=>'#424242',
		'oxy_mm_separator_status'=>'0',
		'oxy_mm_separator_size'=>'1',
		'oxy_mm_separator_style'=>'solid',
		'oxy_mm_separator_color'=>'#4F4F4F',
		'oxy_mm_border_top_status'=>'0',
		'oxy_mm_border_top_size'=>'5',
		'oxy_mm_border_top_style'=>'solid',
		'oxy_mm_border_top_color'=>'#EEEEEE',
		'oxy_mm_border_bottom_status'=>'0',
		'oxy_mm_border_bottom_size'=>'5',
		'oxy_mm_border_bottom_style'=>'solid',
		'oxy_mm_border_bottom_color'=>'#EEEEEE',
		
		'oxy_mm1_bg_color_status'=>'1',
		'oxy_mm1_bg_color'=>'#4BB8E2',
		'oxy_mm1_bg_hover_color'=>'#ED5053',
		'oxy_mm1_link_color'=>'#FFFFFF',
		'oxy_mm1_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm2_bg_color_status'=>'1',
		'oxy_mm2_bg_color'=>'#ED5053',
		'oxy_mm2_bg_hover_color'=>'#4BB8E2',
		'oxy_mm2_link_color'=>'#FFFFFF',
		'oxy_mm2_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm3_bg_color_status'=>'0',
		'oxy_mm3_bg_color'=>'#424242',
		'oxy_mm3_bg_hover_color'=>'#4BB8E2',
		'oxy_mm3_link_color'=>'#FFFFFF',
		'oxy_mm3_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm4_bg_color_status'=>'0',
		'oxy_mm4_bg_color'=>'#424242',
		'oxy_mm4_bg_hover_color'=>'#4BB8E2',
		'oxy_mm4_link_color'=>'#FFFFFF',
		'oxy_mm4_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm6_bg_color_status'=>'0',
		'oxy_mm6_bg_color'=>'#424242',
		'oxy_mm6_bg_hover_color'=>'#4BB8E2',
		'oxy_mm6_link_color'=>'#FFFFFF',
		'oxy_mm6_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm8_bg_color_status'=>'0',
		'oxy_mm8_bg_color'=>'#424242',
		'oxy_mm8_bg_hover_color'=>'#4BB8E2',
		'oxy_mm8_link_color'=>'#FFFFFF',
		'oxy_mm8_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm5_bg_color_status'=>'0',
		'oxy_mm5_bg_color'=>'#424242',
		'oxy_mm5_bg_hover_color'=>'#4BB8E2',
		'oxy_mm5_link_color'=>'#FFFFFF',
		'oxy_mm5_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm7_bg_color_status'=>'0',
		'oxy_mm7_bg_color'=>'#424242',
		'oxy_mm7_bg_hover_color'=>'#4BB8E2',
		'oxy_mm7_link_color'=>'#FFFFFF',
		'oxy_mm7_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm_sub_bg_color'=>'#FFFFFF',
		'oxy_mm_sub_bg_hover_color'=>'#4BB8E2',
		'oxy_mm_sub_titles_bg_color'=>'#F5F5F5',
		'oxy_mm_sub_text_color'=>'#464646',
		'oxy_mm_sub_link_color'=>'#464646',
		'oxy_mm_sub_link_hover_color'=>'#FFFFFF',
		'oxy_mm_sub_separator_style'=>'solid',
		'oxy_mm_sub_separator_color'=>'#F1F1F1',
		'oxy_mm_sub_box_shadow'=>'1',
		
		'oxy_mm_mobile_bg_color'=>'#424242',
		'oxy_mm_mobile_bg_hover_color'=>'#ED5053',
		'oxy_mm_mobile_text_color'=>'#FFFFFF',
		
		'oxy_mid_prod_box_bg_hover_color'=>'#FFFFFF',
		'oxy_mid_prod_box_shadow_hover'=>'1',
		'oxy_mid_prod_box_sale_icon_color'=>'#ED5053',
		'oxy_mid_prod_stars_color'=>'1',
		'oxy_mid_prod_page_tabs_bg_color'=>'#424242',
		'oxy_mid_prod_page_tabs_selected_bg_color'=>'#4BB8E2',
		'oxy_mid_prod_page_tabs_text_color'=>'#FFFFFF',
		'oxy_mid_prod_slider_bg_color'=>'#FFFFFF',
		'oxy_mid_prod_slider_name_color'=>'#464646',
		'oxy_mid_prod_slider_desc_color'=>'#A3A3A3',
		'oxy_mid_prod_slider_price_color'=>'#ED5053',
		'oxy_mid_prod_slider_links_color_hover'=>'#4BB8E2',
		'oxy_mid_prod_slider_bottom_bar_bg_color'=>'#E8E8E8',
		'oxy_mid_prod_slider_bottom_bar_bg_color_hover'=>'#ED5053',
		'oxy_mid_prod_slider_bottom_bar_bg_color_active'=>'#4BB8E2',
		
		'oxy_fp_bg_color'=>'#F6F6F6',
		'oxy_fp_title_color'=>'#464646',
		'oxy_fp_title_color_hover'=>'#ED5053',
		'oxy_fp_subtitle_color'=>'#B6B6B6',
		
		'oxy_f1_bg_color'=>'#373737',
		'oxy_f1_titles_color'=>'#FFFFFF',
		'oxy_f1_titles_border_bottom_size'=>'1',
		'oxy_f1_titles_border_bottom_style'=>'solid',
		'oxy_f1_titles_border_bottom_color'=>'#464646',
		'oxy_f1_text_color'=>'#8C8C8C',
		'oxy_f1_link_color'=>'#4BB8E2',
		'oxy_f1_link_hover_color'=>'#FFFFFF',
		'oxy_f1_icon_color'=>'#525252',
		'oxy_f1_border_top_status'=>'0',
		'oxy_f1_border_top_size'=>'3',
		'oxy_f1_border_top_style'=>'solid',
		'oxy_f1_border_top_color'=>'#000000',
		
		'oxy_f2_bg_color'=>'#2F2F2F',
		'oxy_f2_titles_color'=>'#FFFFFF',
		'oxy_f2_titles_border_bottom_size'=>'1',
		'oxy_f2_titles_border_bottom_style'=>'solid',
		'oxy_f2_titles_border_bottom_color'=>'#464646',
		'oxy_f2_link_color'=>'#8C8C8C',
		'oxy_f2_link_hover_color'=>'#FFFFFF',
		'oxy_f2_border_top_status'=>'0',
		'oxy_f2_border_top_size'=>'1',
		'oxy_f2_border_top_style'=>'solid',
		'oxy_f2_border_top_color'=>'#464646',
		
		'oxy_f4_bg_color'=>'#2F2F2F',
		'oxy_f4_text_color'=>'#8C8C8C',
		'oxy_f4_link_color'=>'#4BB8E2',
		'oxy_f4_link_hover_color'=>'#FFFFFF',
		'oxy_f4_border_top_status'=>'1',
		'oxy_f4_border_top_size'=>'1',
		'oxy_f4_border_top_style'=>'solid',
		'oxy_f4_border_top_color'=>'#464646',
		
		'oxy_f5_bg_color'=>'#2F2F2F',
		'oxy_f5_text_color'=>'#8C8C8C',
		'oxy_f5_link_color'=>'#4BB8E2',
		'oxy_f5_link_hover_color'=>'#FFFFFF',
		'oxy_f5_border_top_status'=>'1',
		'oxy_f5_border_top_size'=>'1',
		'oxy_f5_border_top_style'=>'solid',
		'oxy_f5_border_top_color'=>'#464646',
		
		'oxy_pattern_oxy'=>'',
		'oxy_bg_image_custom'=>'',
		'oxy_bg_image_position'=>'top center',
		'oxy_bg_image_repeat'=>'no-repeat',
		'oxy_bg_image_attachment'=>'scroll',
		
		'oxy_pattern_oxy_mc'=>'',
		'oxy_bg_image_mc_custom'=>'',
		'oxy_bg_image_mc_position'=>'top center',
		'oxy_bg_image_mc_repeat'=>'repeat',
		'oxy_bg_image_mc_attachment'=>'scroll',
		
		'oxy_pattern_oxy_ta'=>'',
		'oxy_bg_image_ta_custom'=>'',
		'oxy_bg_image_ta_position'=>'top center',
		'oxy_bg_image_ta_repeat'=>'repeat',
		'oxy_bg_image_ta_attachment'=>'scroll',
		
		'oxy_pattern_oxy_mm'=>'',
		'oxy_bg_image_mm_custom'=>'',
		'oxy_bg_image_mm_repeat'=>'repeat',	
			
		'oxy_pattern_oxy_f1'=>'',
		'oxy_bg_image_f1_custom'=>'',
		'oxy_bg_image_f1_position'=>'top center',
		'oxy_bg_image_f1_repeat'=>'repeat',		
		'oxy_pattern_oxy_f2'=>'',
		'oxy_bg_image_f2_custom'=>'',
		'oxy_bg_image_f2_position'=>'top center',
		'oxy_bg_image_f2_repeat'=>'repeat',		
		'oxy_pattern_oxy_f4'=>'',
		'oxy_bg_image_f4_custom'=>'',
		'oxy_bg_image_f4_position'=>'top center',
		'oxy_bg_image_f4_repeat'=>'repeat',		
		'oxy_pattern_oxy_f5'=>'',
		'oxy_bg_image_f5_custom'=>'',
		'oxy_bg_image_f5_position'=>'top center',
		'oxy_bg_image_f5_repeat'=>'repeat',
		
		'oxy_body_font'=>'',
		
		'oxy_title_font'=>'',
		'oxy_title_font_weight'=>'normal',
		'oxy_title_font_uppercase'=>'1',
		
		'oxy_price_font'=>'',
		'oxy_price_font_weight'=>'normal',
		
		'oxy_button_font'=>'',
		'oxy_button_font_weight'=>'normal',
		'oxy_button_font_uppercase'=>'1',
		
		'oxy_search_font'=>'',
		'oxy_search_font_weight'=>'normal',
		'oxy_search_font_size'=>'13',
		'oxy_search_font_uppercase'=>'1',
		
		'oxy_cart_font'=>'',
		'oxy_cart_font_weight'=>'normal',
		'oxy_cart_font_size'=>'17',
		'oxy_cart_font_uppercase'=>'0',
		
		'oxy_main_menu_font'=>'',
		'oxy_mm_font_weight'=>'normal',
		'oxy_mm_font_size'=>'16',
		'oxy_mm_font_uppercase'=>'1',
		
		'oxy_fp_fb1_bg_color'=>'#4BB8E2',
		'oxy_fp_fb1_bg_color_hover'=>'#4BB8E2',
		'oxy_fp_fb2_bg_color'=>'#ED5053',
		'oxy_fp_fb2_bg_color_hover'=>'#ED5053',
		'oxy_fp_fb3_bg_color'=>'#FFCA00',
		'oxy_fp_fb3_bg_color_hover'=>'#FFCA00',
		'oxy_fp_fb4_bg_color'=>'#9AE24B',
		'oxy_fp_fb4_bg_color_hover'=>'#9AE24B',
		
		'oxy_video_box_bg'=>'#ED5053',
		'oxy_custom_box_bg'=>'#FFCA00'
		),
		
		'1'=>array(
		'skin_name'=>'Fashion',
		'oxy_layout_style'=>'2',
		'oxy_search_bar_position'=>'center',
		
		'oxy_body_bg_color'=>'#F6F6F6',
		'oxy_headings_color'=>'#000000',
		'oxy_body_text_color'=>'#000000',
		'oxy_light_text_color'=>'#B6B6B6',
		'oxy_other_links_color'=>'#A98D54',
		'oxy_links_hover_color'=>'#A98D54',
		'oxy_general_icons_style'=>'1',
		
		'oxy_main_column_status'=>'1',
		'oxy_main_column_bg_color'=>'#FFFFFF',
		'oxy_main_column_border_status'=>'0',
		'oxy_main_column_border_size'=>'1',
		'oxy_main_column_border_style'=>'solid',
		'oxy_main_column_border_color'=>'#CCCCCC',
		'oxy_main_column_shadow'=>'1',
		
		'oxy_content_column_hli_bg_color'=>'#F6F6F6',
		'oxy_content_column_head_border_status'=>'1',
		'oxy_content_column_head_border_size'=>'1',
		'oxy_content_column_head_border_style'=>'solid',
		'oxy_content_column_head_border_color'=>'#EAEAEA',
		'oxy_content_column_separator_size'=>'1',
		'oxy_content_column_separator_style'=>'solid',
		'oxy_content_column_separator_color'=>'#EAEAEA',
		
		'oxy_left_column_head_status'=>'1',
		'oxy_left_column_head_bg_color'=>'#000000',
		'oxy_left_column_head_custom'=>'',
		'oxy_left_column_head_title_color'=>'#FFFFFF',
		'oxy_left_column_head_border_status'=>'0',
		'oxy_left_column_head_border_size'=>'1',
		'oxy_left_column_head_border_style'=>'solid',
		'oxy_left_column_head_border_color'=>'#EAEAEA',
		'oxy_left_column_box_status'=>'1',
		'oxy_left_column_box_bg_color'=>'#F6F6F6',
		'oxy_left_column_box_links_color'=>'#000000',
		'oxy_left_column_box_links_color_hover'=>'#A98D54',
		
		'oxy_right_column_head_status'=>'1',
		'oxy_right_column_head_bg_color'=>'#000000',
		'oxy_right_column_head_custom'=>'',
		'oxy_right_column_head_title_color'=>'#FFFFFF',
		'oxy_right_column_head_border_status'=>'0',
		'oxy_right_column_head_border_size'=>'1',
		'oxy_right_column_head_border_style'=>'solid',
		'oxy_right_column_head_border_color'=>'#EAEAEA',
		'oxy_right_column_box_status'=>'1',
		'oxy_right_column_box_bg_color'=>'#F6F6F6',
		'oxy_right_column_box_links_color'=>'#000000',
		'oxy_right_column_box_links_color_hover'=>'#A98D54',
		
		'oxy_category_box_head_status'=>'1',
		'oxy_category_box_head_bg_color'=>'#A98D54',
		'oxy_category_box_head_custom'=>'',
		'oxy_category_box_head_title_color'=>'#FFFFFF',
		'oxy_category_box_head_border_status'=>'0',
		'oxy_category_box_head_border_size'=>'1',
		'oxy_category_box_head_border_style'=>'solid',
		'oxy_category_box_head_border_color'=>'#EAEAEA',
		'oxy_category_box_box_status'=>'1',
		'oxy_category_box_box_bg_color'=>'#F6F6F6',
		'oxy_category_box_box_bg_color_hover'=>'#F0F0F0',
		'oxy_category_box_box_links_color'=>'#000000',
		'oxy_category_box_box_links_color_hover'=>'#A98D54',
		'oxy_category_box_box_separator_size'=>'1',
		'oxy_category_box_box_separator_style'=>'solid',
		'oxy_category_box_box_separator_color'=>'#FFFFFF',
		
		'oxy_filter_box_head_status'=>'1',
		'oxy_filter_box_head_bg_color'=>'#000000',
		'oxy_filter_box_head_custom'=>'',
		'oxy_filter_box_head_title_color'=>'#FFFFFF',
		'oxy_filter_box_head_border_status'=>'1',
		'oxy_filter_box_head_border_size'=>'1',
		'oxy_filter_box_head_border_style'=>'solid',
		'oxy_filter_box_head_border_color'=>'#191919',
		'oxy_filter_box_box_status'=>'1',
		'oxy_filter_box_box_bg_color'=>'#000000',
		'oxy_filter_box_box_links_color'=>'#FFFFFF',
		'oxy_filter_box_box_links_color_hover'=>'#BDA97F',
		
		'oxy_price_color'=>'#5C5C5C',
		'oxy_price_old_color'=>'#B6B6B6',
		'oxy_price_new_color'=>'#A98D54',
		'oxy_price_tax_color'=>'#B6B6B6',
		
		'oxy_button_border_radius'=>'0',
		'oxy_button_bg_color'=>'#000000',
		'oxy_button_bg_hover_color'=>'#A98D54',
		'oxy_button_text_color'=>'#FFFFFF',
		'oxy_button_text_hover_color'=>'#FFFFFF',
		'oxy_button_exclusive_bg_color'=>'#A98D54',
		'oxy_button_exclusive_bg_hover_color'=>'#000000',
		'oxy_button_exclusive_text_color'=>'#FFFFFF',
		'oxy_button_exclusive_text_hover_color'=>'#FFFFFF',
		'oxy_button_light_bg_color'=>'#EFEFEF',
		'oxy_button_light_bg_hover_color'=>'#A98D54',
		'oxy_button_light_text_color'=>'#000000',
		'oxy_button_light_text_hover_color'=>'#FFFFFF',
		'oxy_button_slider_bg_color'=>'#EEEEEE',
		'oxy_button_slider_bg_hover_color'=>'#A98D54',
		
		'oxy_top_area_status'=>'1',
		'oxy_top_area_bg_color'=>'#000000',
		'oxy_top_area_mini_bg_color'=>'#000000',
		'oxy_top_area_tb_bg_status'=>'1',
		'oxy_top_area_tb_bg_color'=>'#1F1F1F',
		'oxy_top_area_tb_top_border_status'=>'0',
		'oxy_top_area_tb_top_border_color'=>'#BDA97F',
		'oxy_top_area_tb_bottom_border_status'=>'0',
		'oxy_top_area_tb_bottom_border_color'=>'#525252',
		'oxy_top_area_tb_text_color'=>'#FFFFFF',
		'oxy_top_area_tb_link_color'=>'#BDA97F',
		'oxy_top_area_tb_link_color_hover'=>'#FFFFFF',
		'oxy_top_area_tb_separator_color'=>'#333333',
		'oxy_top_area_tb_dropdown_bg_color'=>'#FFFFFF',
		'oxy_top_area_tb_dropdown_bg_color_hover'=>'#BDA97F',
		'oxy_top_area_tb_dropdown_link_color'=>'#464646',
		'oxy_top_area_tb_dropdown_link_color_hover'=>'#FFFFFF',
		'oxy_top_area_search_bg_color'=>'#000000',
		'oxy_top_area_search_border_color'=>'#333333',
		'oxy_top_area_search_border_color_hover'=>'#CCCCCC',
		'oxy_top_area_search_text_color'=>'#FFFFFF',
		'oxy_top_area_cart_text_color'=>'#FFFFFF',
		'oxy_top_area_cart_link_color'=>'#BDA97F',
		'oxy_top_area_cart_link_color_hover'=>'#FFFFFF',
		'oxy_top_area_cart_separator_color'=>'#333333',
		'oxy_top_area_cart_icon_style'=>'1',
		
		'oxy_mm_bg_color_status'=>'1',
		'oxy_mm_bg_color'=>'#1F1F1F',
		'oxy_mm_separator_status'=>'0',
		'oxy_mm_separator_size'=>'1',
		'oxy_mm_separator_style'=>'solid',
		'oxy_mm_separator_color'=>'#4F4F4F',
		'oxy_mm_border_top_status'=>'0',
		'oxy_mm_border_top_size'=>'1',
		'oxy_mm_border_top_style'=>'solid',
		'oxy_mm_border_top_color'=>'#EEEEEE',
		'oxy_mm_border_bottom_status'=>'0',
		'oxy_mm_border_bottom_size'=>'1',
		'oxy_mm_border_bottom_style'=>'solid',
		'oxy_mm_border_bottom_color'=>'#EEEEEE',
		
		'oxy_mm1_bg_color_status'=>'0',
		'oxy_mm1_bg_color'=>'#424242',
		'oxy_mm1_bg_hover_color'=>'#A98D54',
		'oxy_mm1_link_color'=>'#FFFFFF',
		'oxy_mm1_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm2_bg_color_status'=>'0',
		'oxy_mm2_bg_color'=>'#424242',
		'oxy_mm2_bg_hover_color'=>'#A98D54',
		'oxy_mm2_link_color'=>'#FFFFFF',
		'oxy_mm2_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm3_bg_color_status'=>'0',
		'oxy_mm3_bg_color'=>'#424242',
		'oxy_mm3_bg_hover_color'=>'#A98D54',
		'oxy_mm3_link_color'=>'#FFFFFF',
		'oxy_mm3_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm4_bg_color_status'=>'0',
		'oxy_mm4_bg_color'=>'#424242',
		'oxy_mm4_bg_hover_color'=>'#A98D54',
		'oxy_mm4_link_color'=>'#FFFFFF',
		'oxy_mm4_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm6_bg_color_status'=>'0',
		'oxy_mm6_bg_color'=>'#424242',
		'oxy_mm6_bg_hover_color'=>'#A98D54',
		'oxy_mm6_link_color'=>'#FFFFFF',
		'oxy_mm6_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm8_bg_color_status'=>'0',
		'oxy_mm8_bg_color'=>'#424242',
		'oxy_mm8_bg_hover_color'=>'#A98D54',
		'oxy_mm8_link_color'=>'#FFFFFF',
		'oxy_mm8_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm5_bg_color_status'=>'0',
		'oxy_mm5_bg_color'=>'#424242',
		'oxy_mm5_bg_hover_color'=>'#A98D54',
		'oxy_mm5_link_color'=>'#FFFFFF',
		'oxy_mm5_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm7_bg_color_status'=>'0',
		'oxy_mm7_bg_color'=>'#424242',
		'oxy_mm7_bg_hover_color'=>'#A98D54',
		'oxy_mm7_link_color'=>'#FFFFFF',
		'oxy_mm7_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm_sub_bg_color'=>'#FFFFFF',
		'oxy_mm_sub_bg_hover_color'=>'#A98D54',
		'oxy_mm_sub_titles_bg_color'=>'#F5F5F5',
		'oxy_mm_sub_text_color'=>'#000000',
		'oxy_mm_sub_link_color'=>'#000000',
		'oxy_mm_sub_link_hover_color'=>'#FFFFFF',
		'oxy_mm_sub_separator_style'=>'solid',
		'oxy_mm_sub_separator_color'=>'#F1F1F1',
		'oxy_mm_sub_box_shadow'=>'1',
		
		'oxy_mm_mobile_bg_color'=>'#424242',
		'oxy_mm_mobile_bg_hover_color'=>'#A98D54',
		'oxy_mm_mobile_text_color'=>'#FFFFFF',
		
		'oxy_mid_prod_box_bg_hover_color'=>'#FFFFFF',
		'oxy_mid_prod_box_shadow_hover'=>'1',
		'oxy_mid_prod_box_sale_icon_color'=>'#A98D54',
		'oxy_mid_prod_stars_color'=>'8',
		'oxy_mid_prod_page_tabs_bg_color'=>'#000000',
		'oxy_mid_prod_page_tabs_selected_bg_color'=>'#A98D54',
		'oxy_mid_prod_page_tabs_text_color'=>'#FFFFFF',
		'oxy_mid_prod_slider_bg_color'=>'#FFFFFF',
		'oxy_mid_prod_slider_name_color'=>'#000000',
		'oxy_mid_prod_slider_desc_color'=>'#A3A3A3',
		'oxy_mid_prod_slider_price_color'=>'#A98D54',
		'oxy_mid_prod_slider_links_color_hover'=>'#000000',
		'oxy_mid_prod_slider_bottom_bar_bg_color'=>'#E8E8E8',
		'oxy_mid_prod_slider_bottom_bar_bg_color_hover'=>'#A98D54',
		'oxy_mid_prod_slider_bottom_bar_bg_color_active'=>'#000000',
		
		'oxy_fp_bg_color'=>'#F6F6F6',
		'oxy_fp_title_color'=>'#000000',
		'oxy_fp_title_color_hover'=>'#A98D54',
		'oxy_fp_subtitle_color'=>'#B6B6B6',
		
		'oxy_f1_bg_color'=>'#000000',
		'oxy_f1_titles_color'=>'#FFFFFF',
		'oxy_f1_titles_border_bottom_size'=>'2',
		'oxy_f1_titles_border_bottom_style'=>'solid',
		'oxy_f1_titles_border_bottom_color'=>'#464646',
		'oxy_f1_text_color'=>'#FFFFFF',
		'oxy_f1_link_color'=>'#BDA97F',
		'oxy_f1_link_hover_color'=>'#FFFFFF',
		'oxy_f1_icon_color'=>'#464646',
		'oxy_f1_border_top_status'=>'0',
		'oxy_f1_border_top_size'=>'3',
		'oxy_f1_border_top_style'=>'solid',
		'oxy_f1_border_top_color'=>'#000000',
		
		'oxy_f2_bg_color'=>'#000000',
		'oxy_f2_titles_color'=>'#FFFFFF',
		'oxy_f2_titles_border_bottom_size'=>'2',
		'oxy_f2_titles_border_bottom_style'=>'solid',
		'oxy_f2_titles_border_bottom_color'=>'#464646',
		'oxy_f2_link_color'=>'#FFFFFF',
		'oxy_f2_link_hover_color'=>'#BDA97F',
		'oxy_f2_border_top_status'=>'1',
		'oxy_f2_border_top_size'=>'1',
		'oxy_f2_border_top_style'=>'solid',
		'oxy_f2_border_top_color'=>'#292929',
		
		'oxy_f4_bg_color'=>'#000000',
		'oxy_f4_text_color'=>'#FFFFFF',
		'oxy_f4_link_color'=>'#BDA97F',
		'oxy_f4_link_hover_color'=>'#FFFFFF',
		'oxy_f4_border_top_status'=>'1',
		'oxy_f4_border_top_size'=>'1',
		'oxy_f4_border_top_style'=>'solid',
		'oxy_f4_border_top_color'=>'#292929',
		
		'oxy_f5_bg_color'=>'#000000',
		'oxy_f5_text_color'=>'#8C8C8C',
		'oxy_f5_link_color'=>'#BDA97F',
		'oxy_f5_link_hover_color'=>'#FFFFFF',
		'oxy_f5_border_top_status'=>'1',
		'oxy_f5_border_top_size'=>'1',
		'oxy_f5_border_top_style'=>'solid',
		'oxy_f5_border_top_color'=>'#292929',
		
		'oxy_pattern_oxy'=>'',
		'oxy_bg_image_custom'=>'',
		'oxy_bg_image_position'=>'top center',
		'oxy_bg_image_repeat'=>'no-repeat',
		'oxy_bg_image_attachment'=>'scroll',
		
		'oxy_pattern_oxy_mc'=>'',
		'oxy_bg_image_mc_custom'=>'',
		'oxy_bg_image_mc_position'=>'top center',
		'oxy_bg_image_mc_repeat'=>'repeat',
		'oxy_bg_image_mc_attachment'=>'scroll',
		
		'oxy_pattern_oxy_ta'=>'',
		'oxy_bg_image_ta_custom'=>'',
		'oxy_bg_image_ta_position'=>'top center',
		'oxy_bg_image_ta_repeat'=>'repeat',
		'oxy_bg_image_ta_attachment'=>'scroll',
		
		'oxy_pattern_oxy_mm'=>'',
		'oxy_bg_image_mm_custom'=>'',
		'oxy_bg_image_mm_repeat'=>'repeat',	
			
		'oxy_pattern_oxy_f1'=>'',
		'oxy_bg_image_f1_custom'=>'',
		'oxy_bg_image_f1_position'=>'top center',
		'oxy_bg_image_f1_repeat'=>'repeat',		
		'oxy_pattern_oxy_f2'=>'',
		'oxy_bg_image_f2_custom'=>'',
		'oxy_bg_image_f2_position'=>'top center',
		'oxy_bg_image_f2_repeat'=>'repeat',		
		'oxy_pattern_oxy_f4'=>'',
		'oxy_bg_image_f4_custom'=>'',
		'oxy_bg_image_f4_position'=>'top center',
		'oxy_bg_image_f4_repeat'=>'repeat',		
		'oxy_pattern_oxy_f5'=>'',
		'oxy_bg_image_f5_custom'=>'',
		'oxy_bg_image_f5_position'=>'top center',
		'oxy_bg_image_f5_repeat'=>'repeat',
		
		'oxy_body_font'=>'',
		
		'oxy_title_font'=>'',
		'oxy_title_font_weight'=>'normal',
		'oxy_title_font_uppercase'=>'1',
		
		'oxy_price_font'=>'',
		'oxy_price_font_weight'=>'normal',
		
		'oxy_button_font'=>'',
		'oxy_button_font_weight'=>'normal',
		'oxy_button_font_uppercase'=>'1',
		
		'oxy_search_font'=>'',
		'oxy_search_font_weight'=>'normal',
		'oxy_search_font_size'=>'13',
		'oxy_search_font_uppercase'=>'1',
		
		'oxy_cart_font'=>'',
		'oxy_cart_font_weight'=>'normal',
		'oxy_cart_font_size'=>'18',
		'oxy_cart_font_uppercase'=>'0',
		
		'oxy_main_menu_font'=>'',
		'oxy_mm_font_weight'=>'normal',
		'oxy_mm_font_size'=>'16',
		'oxy_mm_font_uppercase'=>'1',
		
		'oxy_fp_fb1_bg_color'=>'#D1D1D1',
		'oxy_fp_fb1_bg_color_hover'=>'#A98D54',
		'oxy_fp_fb2_bg_color'=>'#D1D1D1',
		'oxy_fp_fb2_bg_color_hover'=>'#A98D54',
		'oxy_fp_fb3_bg_color'=>'#D1D1D1',
		'oxy_fp_fb3_bg_color_hover'=>'#A98D54',
		'oxy_fp_fb4_bg_color'=>'#D1D1D1',
		'oxy_fp_fb4_bg_color_hover'=>'#A98D54',
		
		'oxy_video_box_bg'=>'#A98D54',
		'oxy_custom_box_bg'=>'#464646'
		),
		
		'2'=>array(
		'skin_name'=>'Food',
		'oxy_layout_style'=>'2',
		'oxy_search_bar_position'=>'center',
		
		'oxy_body_bg_color'=>'#52453C',
		'oxy_headings_color'=>'#F3F1DC',
		'oxy_body_text_color'=>'#F3F1DC',
		'oxy_light_text_color'=>'#D4D0B0',
		'oxy_other_links_color'=>'#FFD666',
		'oxy_links_hover_color'=>'#FFFFFF',
		'oxy_general_icons_style'=>'2',
		
		'oxy_main_column_status'=>'0',
		'oxy_main_column_bg_color'=>'#FFFFFF',
		'oxy_main_column_border_status'=>'0',
		'oxy_main_column_border_size'=>'1',
		'oxy_main_column_border_style'=>'solid',
		'oxy_main_column_border_color'=>'#CCCCCC',
		'oxy_main_column_shadow'=>'0',
		
		'oxy_content_column_hli_bg_color'=>'#3E342D',
		'oxy_content_column_head_border_status'=>'1',
		'oxy_content_column_head_border_size'=>'1',
		'oxy_content_column_head_border_style'=>'dotted',
		'oxy_content_column_head_border_color'=>'#A49572',
		'oxy_content_column_separator_size'=>'1',
		'oxy_content_column_separator_style'=>'dotted',
		'oxy_content_column_separator_color'=>'#A49572',
		
		'oxy_left_column_head_status'=>'1',
		'oxy_left_column_head_bg_color'=>'#FFD666',
		'oxy_left_column_head_custom'=>'',
		'oxy_left_column_head_title_color'=>'#52453C',
		'oxy_left_column_head_border_status'=>'0',
		'oxy_left_column_head_border_size'=>'1',
		'oxy_left_column_head_border_style'=>'solid',
		'oxy_left_column_head_border_color'=>'#EAEAEA',
		'oxy_left_column_box_status'=>'1',
		'oxy_left_column_box_bg_color'=>'#3E342D',
		'oxy_left_column_box_links_color'=>'#F3F1DC',
		'oxy_left_column_box_links_color_hover'=>'#FFD666',
		
		'oxy_right_column_head_status'=>'1',
		'oxy_right_column_head_bg_color'=>'#FFD666',
		'oxy_right_column_head_custom'=>'',
		'oxy_right_column_head_title_color'=>'#52453C',
		'oxy_right_column_head_border_status'=>'0',
		'oxy_right_column_head_border_size'=>'1',
		'oxy_right_column_head_border_style'=>'solid',
		'oxy_right_column_head_border_color'=>'#EAEAEA',
		'oxy_right_column_box_status'=>'1',
		'oxy_right_column_box_bg_color'=>'#3E342D',
		'oxy_right_column_box_links_color'=>'#F3F1DC',
		'oxy_right_column_box_links_color_hover'=>'#FFD666',
		
		'oxy_category_box_head_status'=>'1',
		'oxy_category_box_head_bg_color'=>'#DB6440',
		'oxy_category_box_head_custom'=>'',
		'oxy_category_box_head_title_color'=>'#FFFFFF',
		'oxy_category_box_head_border_status'=>'0',
		'oxy_category_box_head_border_size'=>'1',
		'oxy_category_box_head_border_style'=>'solid',
		'oxy_category_box_head_border_color'=>'#EAEAEA',
		'oxy_category_box_box_status'=>'1',
		'oxy_category_box_box_bg_color'=>'#3E342D',
		'oxy_category_box_box_bg_color_hover'=>'#5E4F44',
		'oxy_category_box_box_links_color'=>'#F3F1DC',
		'oxy_category_box_box_links_color_hover'=>'#FFD666',
		'oxy_category_box_box_separator_size'=>'1',
		'oxy_category_box_box_separator_style'=>'dotted',
		'oxy_category_box_box_separator_color'=>'#5E4F44',
		
		'oxy_filter_box_head_status'=>'1',
		'oxy_filter_box_head_bg_color'=>'#3E342D',
		'oxy_filter_box_head_custom'=>'',
		'oxy_filter_box_head_title_color'=>'#FFD666',
		'oxy_filter_box_head_border_status'=>'1',
		'oxy_filter_box_head_border_size'=>'1',
		'oxy_filter_box_head_border_style'=>'dotted',
		'oxy_filter_box_head_border_color'=>'#5E4F44',
		'oxy_filter_box_box_status'=>'1',
		'oxy_filter_box_box_bg_color'=>'#3E342D',
		'oxy_filter_box_box_links_color'=>'#F3F1DC',
		'oxy_filter_box_box_links_color_hover'=>'#FFD666',
		
		'oxy_price_color'=>'#FFFFFF',
		'oxy_price_old_color'=>'#F3F1DC',
		'oxy_price_new_color'=>'#FFD666',
		'oxy_price_tax_color'=>'#F3F1DC',
		
		'oxy_button_border_radius'=>'0',
		'oxy_button_bg_color'=>'#FFD666',
		'oxy_button_bg_hover_color'=>'#DB6440',
		'oxy_button_text_color'=>'#3E342D',
		'oxy_button_text_hover_color'=>'#FFFFFF',
		'oxy_button_exclusive_bg_color'=>'#DB6440',
		'oxy_button_exclusive_bg_hover_color'=>'#FFD666',
		'oxy_button_exclusive_text_color'=>'#FFFFFF',
		'oxy_button_exclusive_text_hover_color'=>'#3E342D',
		'oxy_button_light_bg_color'=>'#DB6440',
		'oxy_button_light_bg_hover_color'=>'#FFD666',
		'oxy_button_light_text_color'=>'#FFFFFF',
		'oxy_button_light_text_hover_color'=>'#3E342D',
		'oxy_button_slider_bg_color'=>'#F3F1DC',
		'oxy_button_slider_bg_hover_color'=>'#DB6440',
		
		'oxy_top_area_status'=>'1',
		'oxy_top_area_bg_color'=>'#3E342D',
		'oxy_top_area_mini_bg_color'=>'#463D37',
		'oxy_top_area_tb_bg_status'=>'1',
		'oxy_top_area_tb_bg_color'=>'#3E342D',
		'oxy_top_area_tb_top_border_status'=>'0',
		'oxy_top_area_tb_top_border_color'=>'#FFD666',
		'oxy_top_area_tb_bottom_border_status'=>'0',
		'oxy_top_area_tb_bottom_border_color'=>'#525252',
		'oxy_top_area_tb_text_color'=>'#F3F1DC',
		'oxy_top_area_tb_link_color'=>'#FFD666',
		'oxy_top_area_tb_link_color_hover'=>'#DB6440',
		'oxy_top_area_tb_separator_color'=>'#594B42',
		'oxy_top_area_tb_dropdown_bg_color'=>'#3E342D',
		'oxy_top_area_tb_dropdown_bg_color_hover'=>'#DB6440',
		'oxy_top_area_tb_dropdown_link_color'=>'#F3F1DC',
		'oxy_top_area_tb_dropdown_link_color_hover'=>'#F3F1DC',
		'oxy_top_area_search_bg_color'=>'#F3F1DC',
		'oxy_top_area_search_border_color'=>'#3E342D',
		'oxy_top_area_search_border_color_hover'=>'#3E342D',
		'oxy_top_area_search_text_color'=>'#3E342D',
		'oxy_top_area_cart_text_color'=>'#FFFFFF',
		'oxy_top_area_cart_link_color'=>'#FFD666',
		'oxy_top_area_cart_link_color_hover'=>'#FFD666',
		'oxy_top_area_cart_separator_color'=>'#615248',
		'oxy_top_area_cart_icon_style'=>'1',
		
		'oxy_mm_bg_color_status'=>'1',
		'oxy_mm_bg_color'=>'#3E342D',
		'oxy_mm_separator_status'=>'0',
		'oxy_mm_separator_size'=>'1',
		'oxy_mm_separator_style'=>'dotted',
		'oxy_mm_separator_color'=>'#594B42',
		'oxy_mm_border_top_status'=>'0',
		'oxy_mm_border_top_size'=>'1',
		'oxy_mm_border_top_style'=>'dotted',
		'oxy_mm_border_top_color'=>'#5E4F44',
		'oxy_mm_border_bottom_status'=>'0',
		'oxy_mm_border_bottom_size'=>'1',
		'oxy_mm_border_bottom_style'=>'solid',
		'oxy_mm_border_bottom_color'=>'#EEEEEE',
		
		'oxy_mm1_bg_color_status'=>'1',
		'oxy_mm1_bg_color'=>'#DB6440',
		'oxy_mm1_bg_hover_color'=>'#3E342D',
		'oxy_mm1_link_color'=>'#FFFFFF',
		'oxy_mm1_link_hover_color'=>'#FFD666',
		
		'oxy_mm2_bg_color_status'=>'0',
		'oxy_mm2_bg_color'=>'#ED5053',
		'oxy_mm2_bg_hover_color'=>'#3E342D',
		'oxy_mm2_link_color'=>'#F3F1DC',
		'oxy_mm2_link_hover_color'=>'#FFD666',
		
		'oxy_mm3_bg_color_status'=>'0',
		'oxy_mm3_bg_color'=>'#424242',
		'oxy_mm3_bg_hover_color'=>'#3E342D',
		'oxy_mm3_link_color'=>'#F3F1DC',
		'oxy_mm3_link_hover_color'=>'#FFD666',
		
		'oxy_mm4_bg_color_status'=>'0',
		'oxy_mm4_bg_color'=>'#424242',
		'oxy_mm4_bg_hover_color'=>'#3E342D',
		'oxy_mm4_link_color'=>'#F3F1DC',
		'oxy_mm4_link_hover_color'=>'#FFD666',
		
		'oxy_mm6_bg_color_status'=>'0',
		'oxy_mm6_bg_color'=>'#424242',
		'oxy_mm6_bg_hover_color'=>'#3E342D',
		'oxy_mm6_link_color'=>'#F3F1DC',
		'oxy_mm6_link_hover_color'=>'#FFD666',
		
		'oxy_mm8_bg_color_status'=>'0',
		'oxy_mm8_bg_color'=>'#424242',
		'oxy_mm8_bg_hover_color'=>'#3E342D',
		'oxy_mm8_link_color'=>'#F3F1DC',
		'oxy_mm8_link_hover_color'=>'#FFD666',
		
		'oxy_mm5_bg_color_status'=>'0',
		'oxy_mm5_bg_color'=>'#424242',
		'oxy_mm5_bg_hover_color'=>'#3E342D',
		'oxy_mm5_link_color'=>'#F3F1DC',
		'oxy_mm5_link_hover_color'=>'#FFD666',
		
		'oxy_mm7_bg_color_status'=>'0',
		'oxy_mm7_bg_color'=>'#424242',
		'oxy_mm7_bg_hover_color'=>'#3E342D',
		'oxy_mm7_link_color'=>'#F3F1DC',
		'oxy_mm7_link_hover_color'=>'#FFD666',
		
		'oxy_mm_sub_bg_color'=>'#3E342D',
		'oxy_mm_sub_bg_hover_color'=>'#DB6440',
		'oxy_mm_sub_titles_bg_color'=>'#52453C',
		'oxy_mm_sub_text_color'=>'#F3F1DC',
		'oxy_mm_sub_link_color'=>'#F3F1DC',
		'oxy_mm_sub_link_hover_color'=>'#FFFFFF',
		'oxy_mm_sub_separator_style'=>'dotted',
		'oxy_mm_sub_separator_color'=>'#6E5C51',
		'oxy_mm_sub_box_shadow'=>'1',
		
		'oxy_mm_mobile_bg_color'=>'#3E342D',
		'oxy_mm_mobile_bg_hover_color'=>'#DB6440',
		'oxy_mm_mobile_text_color'=>'#F3F1DC',
		
		'oxy_mid_prod_box_bg_hover_color'=>'#978667',
		'oxy_mid_prod_box_shadow_hover'=>'1',
		'oxy_mid_prod_box_sale_icon_color'=>'#DB6440',
		'oxy_mid_prod_stars_color'=>'3',
		'oxy_mid_prod_page_tabs_bg_color'=>'#3E342D',
		'oxy_mid_prod_page_tabs_selected_bg_color'=>'#DB6440',
		'oxy_mid_prod_page_tabs_text_color'=>'#FFFFFF',
		'oxy_mid_prod_slider_bg_color'=>'#FFFFFF',
		'oxy_mid_prod_slider_name_color'=>'#52453C',
		'oxy_mid_prod_slider_desc_color'=>'#786557',
		'oxy_mid_prod_slider_price_color'=>'#DB6440',
		'oxy_mid_prod_slider_links_color_hover'=>'#DB6440',
		'oxy_mid_prod_slider_bottom_bar_bg_color'=>'#3E342D',
		'oxy_mid_prod_slider_bottom_bar_bg_color_hover'=>'#FFD666',
		'oxy_mid_prod_slider_bottom_bar_bg_color_active'=>'#DB6440',
		
		'oxy_fp_bg_color'=>'#52453C',
		'oxy_fp_title_color'=>'#FFFFFF',
		'oxy_fp_title_color_hover'=>'#FFD666',
		'oxy_fp_subtitle_color'=>'#F3F1DC',
		
		'oxy_f1_bg_color'=>'#26201C',
		'oxy_f1_titles_color'=>'#FFD666',
		'oxy_f1_titles_border_bottom_size'=>'1',
		'oxy_f1_titles_border_bottom_style'=>'dotted',
		'oxy_f1_titles_border_bottom_color'=>'#A49572',
		'oxy_f1_text_color'=>'#F3F1DC',
		'oxy_f1_link_color'=>'#FFD666',
		'oxy_f1_link_hover_color'=>'#FFFFFF',
		'oxy_f1_icon_color'=>'#52453C',
		'oxy_f1_border_top_status'=>'0',
		'oxy_f1_border_top_size'=>'1',
		'oxy_f1_border_top_style'=>'solid',
		'oxy_f1_border_top_color'=>'#000000',
		
		'oxy_f2_bg_color'=>'#26201C',
		'oxy_f2_titles_color'=>'#FFD666',
		'oxy_f2_titles_border_bottom_size'=>'1',
		'oxy_f2_titles_border_bottom_style'=>'dotted',
		'oxy_f2_titles_border_bottom_color'=>'#A49572',
		'oxy_f2_link_color'=>'#FFFFFF',
		'oxy_f2_link_hover_color'=>'#FFD666',
		'oxy_f2_border_top_status'=>'1',
		'oxy_f2_border_top_size'=>'1',
		'oxy_f2_border_top_style'=>'dotted',
		'oxy_f2_border_top_color'=>'#A49572',
		
		'oxy_f4_bg_color'=>'#52453C',
		'oxy_f4_text_color'=>'#F3F1DC',
		'oxy_f4_link_color'=>'#FFD666',
		'oxy_f4_link_hover_color'=>'#FFFFFF',
		'oxy_f4_border_top_status'=>'1',
		'oxy_f4_border_top_size'=>'1',
		'oxy_f4_border_top_style'=>'dotted',
		'oxy_f4_border_top_color'=>'#A49572',
		
		'oxy_f5_bg_color'=>'#52453C',
		'oxy_f5_text_color'=>'#F3F1DC',
		'oxy_f5_link_color'=>'#FFD666',
		'oxy_f5_link_hover_color'=>'#FFFFFF',
		'oxy_f5_border_top_status'=>'1',
		'oxy_f5_border_top_size'=>'1',
		'oxy_f5_border_top_style'=>'dotted',
		'oxy_f5_border_top_color'=>'#A49572',
		
		'oxy_pattern_oxy'=>'69',
		'oxy_bg_image_custom'=>'',
		'oxy_bg_image_position'=>'top center',
		'oxy_bg_image_repeat'=>'repeat',
		'oxy_bg_image_attachment'=>'scroll',
		
		'oxy_pattern_oxy_mc'=>'',
		'oxy_bg_image_mc_custom'=>'',
		'oxy_bg_image_mc_position'=>'top center',
		'oxy_bg_image_mc_repeat'=>'repeat',
		'oxy_bg_image_mc_attachment'=>'scroll',
		
		'oxy_pattern_oxy_ta'=>'69',
		'oxy_bg_image_ta_custom'=>'',
		'oxy_bg_image_ta_position'=>'top center',
		'oxy_bg_image_ta_repeat'=>'repeat',
		'oxy_bg_image_ta_attachment'=>'scroll',
		
		'oxy_pattern_oxy_mm'=>'',
		'oxy_bg_image_mm_custom'=>'',
		'oxy_bg_image_mm_repeat'=>'repeat',	
			
		'oxy_pattern_oxy_f1'=>'69',
		'oxy_bg_image_f1_custom'=>'',
		'oxy_bg_image_f1_position'=>'top center',
		'oxy_bg_image_f1_repeat'=>'repeat',		
		'oxy_pattern_oxy_f2'=>'69',
		'oxy_bg_image_f2_custom'=>'',
		'oxy_bg_image_f2_position'=>'top center',
		'oxy_bg_image_f2_repeat'=>'repeat',		
		'oxy_pattern_oxy_f4'=>'69',
		'oxy_bg_image_f4_custom'=>'',
		'oxy_bg_image_f4_position'=>'top center',
		'oxy_bg_image_f4_repeat'=>'repeat',		
		'oxy_pattern_oxy_f5'=>'69',
		'oxy_bg_image_f5_custom'=>'',
		'oxy_bg_image_f5_position'=>'top center',
		'oxy_bg_image_f5_repeat'=>'repeat',
		
		'oxy_body_font'=>'Donegal+One',
		
		'oxy_title_font'=>'Donegal+One',
		'oxy_title_font_weight'=>'normal',
		'oxy_title_font_uppercase'=>'1',
		
		'oxy_price_font'=>'Donegal+One',
		'oxy_price_font_weight'=>'normal',
		
		'oxy_button_font'=>'Donegal+One',
		'oxy_button_font_weight'=>'normal',
		'oxy_button_font_uppercase'=>'1',
		
		'oxy_search_font'=>'',
		'oxy_search_font_weight'=>'normal',
		'oxy_search_font_size'=>'13',
		'oxy_search_font_uppercase'=>'1',
		
		'oxy_cart_font'=>'',
		'oxy_cart_font_weight'=>'normal',
		'oxy_cart_font_size'=>'16',
		'oxy_cart_font_uppercase'=>'0',
		
		'oxy_main_menu_font'=>'Donegal+One',
		'oxy_mm_font_weight'=>'normal',
		'oxy_mm_font_size'=>'15',
		'oxy_mm_font_uppercase'=>'1',
		
		'oxy_fp_fb1_bg_color'=>'#A49572',
		'oxy_fp_fb1_bg_color_hover'=>'#3E342D',
		'oxy_fp_fb2_bg_color'=>'#A49572',
		'oxy_fp_fb2_bg_color_hover'=>'#3E342D',
		'oxy_fp_fb3_bg_color'=>'#A49572',
		'oxy_fp_fb3_bg_color_hover'=>'#3E342D',
		'oxy_fp_fb4_bg_color'=>'#A49572',
		'oxy_fp_fb4_bg_color_hover'=>'#3E342D',
		
		'oxy_video_box_bg'=>'#DB6440',
		'oxy_custom_box_bg'=>'#FFD666'
		),
		
		'3'=>array(
		'skin_name'=>'Kids',
		'oxy_layout_style'=>'2',
		'oxy_search_bar_position'=>'right',
		
		'oxy_body_bg_color'=>'#F8F2BE',
		'oxy_headings_color'=>'#4C665A',
		'oxy_body_text_color'=>'#4C665A',
		'oxy_light_text_color'=>'#AFB494',
		'oxy_other_links_color'=>'#8FAD50',
		'oxy_links_hover_color'=>'#DE665E',
		'oxy_general_icons_style'=>'2',
		
		'oxy_main_column_status'=>'0',
		'oxy_main_column_bg_color'=>'#FFFFFF',
		'oxy_main_column_border_status'=>'0',
		'oxy_main_column_border_size'=>'1',
		'oxy_main_column_border_style'=>'solid',
		'oxy_main_column_border_color'=>'#CCCCCC',
		'oxy_main_column_shadow'=>'0',
		
		'oxy_content_column_hli_bg_color'=>'#FFFFFF',
		'oxy_content_column_head_border_status'=>'1',
		'oxy_content_column_head_border_size'=>'1',
		'oxy_content_column_head_border_style'=>'dotted',
		'oxy_content_column_head_border_color'=>'#E1DBB2',
		'oxy_content_column_separator_size'=>'1',
		'oxy_content_column_separator_style'=>'dotted',
		'oxy_content_column_separator_color'=>'#E1DBB2',
		
		'oxy_left_column_head_status'=>'1',
		'oxy_left_column_head_bg_color'=>'#9DBF58',
		'oxy_left_column_head_custom'=>'',
		'oxy_left_column_head_title_color'=>'#FFFFFF',
		'oxy_left_column_head_border_status'=>'0',
		'oxy_left_column_head_border_size'=>'1',
		'oxy_left_column_head_border_style'=>'solid',
		'oxy_left_column_head_border_color'=>'#EAEAEA',
		'oxy_left_column_box_status'=>'1',
		'oxy_left_column_box_bg_color'=>'#FFFFFF',
		'oxy_left_column_box_links_color'=>'#4C665A',
		'oxy_left_column_box_links_color_hover'=>'#DE665E',
		
		'oxy_right_column_head_status'=>'1',
		'oxy_right_column_head_bg_color'=>'#9DBF58',
		'oxy_right_column_head_custom'=>'',
		'oxy_right_column_head_title_color'=>'#FFFFFF',
		'oxy_right_column_head_border_status'=>'0',
		'oxy_right_column_head_border_size'=>'1',
		'oxy_right_column_head_border_style'=>'solid',
		'oxy_right_column_head_border_color'=>'#EAEAEA',
		'oxy_right_column_box_status'=>'1',
		'oxy_right_column_box_bg_color'=>'#FFFFFF',
		'oxy_right_column_box_links_color'=>'#4C665A',
		'oxy_right_column_box_links_color_hover'=>'#DE665E',
		
		'oxy_category_box_head_status'=>'1',
		'oxy_category_box_head_bg_color'=>'#86B9D4',
		'oxy_category_box_head_custom'=>'',
		'oxy_category_box_head_title_color'=>'#FFFFFF',
		'oxy_category_box_head_border_status'=>'0',
		'oxy_category_box_head_border_size'=>'1',
		'oxy_category_box_head_border_style'=>'solid',
		'oxy_category_box_head_border_color'=>'#EAEAEA',
		'oxy_category_box_box_status'=>'1',
		'oxy_category_box_box_bg_color'=>'#FFFFFF',
		'oxy_category_box_box_bg_color_hover'=>'#FFFBD7',
		'oxy_category_box_box_links_color'=>'#4C665A',
		'oxy_category_box_box_links_color_hover'=>'#4C665A',
		'oxy_category_box_box_separator_size'=>'1',
		'oxy_category_box_box_separator_style'=>'solid',
		'oxy_category_box_box_separator_color'=>'#F2F0E9',
		
		'oxy_filter_box_head_status'=>'1',
		'oxy_filter_box_head_bg_color'=>'#B97EC5',
		'oxy_filter_box_head_custom'=>'',
		'oxy_filter_box_head_title_color'=>'#FFFFFF',
		'oxy_filter_box_head_border_status'=>'0',
		'oxy_filter_box_head_border_size'=>'1',
		'oxy_filter_box_head_border_style'=>'solid',
		'oxy_filter_box_head_border_color'=>'#EAEAEA',
		'oxy_filter_box_box_status'=>'1',
		'oxy_filter_box_box_bg_color'=>'#FFFFFF',
		'oxy_filter_box_box_links_color'=>'#4C665A',
		'oxy_filter_box_box_links_color_hover'=>'#DE665E',
		
		'oxy_price_color'=>'#8FAD50',
		'oxy_price_old_color'=>'#AFB494',
		'oxy_price_new_color'=>'#DE665E',
		'oxy_price_tax_color'=>'#AFB494',
		
		'oxy_button_border_radius'=>'0',
		'oxy_button_bg_color'=>'#86B9D4',
		'oxy_button_bg_hover_color'=>'#DE665E',
		'oxy_button_text_color'=>'#FFFFFF',
		'oxy_button_text_hover_color'=>'#FFFFFF',
		'oxy_button_exclusive_bg_color'=>'#DE665E',
		'oxy_button_exclusive_bg_hover_color'=>'#86B9D4',
		'oxy_button_exclusive_text_color'=>'#FFFFFF',
		'oxy_button_exclusive_text_hover_color'=>'#FFFFFF',
		'oxy_button_light_bg_color'=>'#86B9D4',
		'oxy_button_light_bg_hover_color'=>'#DE665E',
		'oxy_button_light_text_color'=>'#FFFFFF',
		'oxy_button_light_text_hover_color'=>'#FFFFFF',
		'oxy_button_slider_bg_color'=>'#FFFFFF',
		'oxy_button_slider_bg_hover_color'=>'#DE665E',
		
		'oxy_top_area_status'=>'0',
		'oxy_top_area_bg_color'=>'#F8F8F8',
		'oxy_top_area_mini_bg_color'=>'#CFECDF',
		'oxy_top_area_tb_bg_status'=>'1',
		'oxy_top_area_tb_bg_color'=>'#86B9D4',
		'oxy_top_area_tb_top_border_status'=>'0',
		'oxy_top_area_tb_top_border_color'=>'#4BB8E2',
		'oxy_top_area_tb_bottom_border_status'=>'0',
		'oxy_top_area_tb_bottom_border_color'=>'#525252',
		'oxy_top_area_tb_text_color'=>'#FFFFFF',
		'oxy_top_area_tb_link_color'=>'#F8F2BE',
		'oxy_top_area_tb_link_color_hover'=>'#DE665E',
		'oxy_top_area_tb_separator_color'=>'#79AFCC',
		'oxy_top_area_tb_dropdown_bg_color'=>'#86B9D4',
		'oxy_top_area_tb_dropdown_bg_color_hover'=>'#9DBF58',
		'oxy_top_area_tb_dropdown_link_color'=>'#FFFFFF',
		'oxy_top_area_tb_dropdown_link_color_hover'=>'#FFFFFF',
		'oxy_top_area_search_bg_color'=>'#FFFFFF',
		'oxy_top_area_search_border_color'=>'#FFFFFF',
		'oxy_top_area_search_border_color_hover'=>'#FFFFFF',
		'oxy_top_area_search_text_color'=>'#4C665A',
		'oxy_top_area_cart_text_color'=>'#FFFFFF',
		'oxy_top_area_cart_link_color'=>'#5A7B82',
		'oxy_top_area_cart_link_color_hover'=>'#6BA2BF',
		'oxy_top_area_cart_separator_color'=>'#C4D7D4',
		'oxy_top_area_cart_icon_style'=>'1',
		
		'oxy_mm_bg_color_status'=>'1',
		'oxy_mm_bg_color'=>'#E86B62',
		'oxy_mm_separator_status'=>'0',
		'oxy_mm_separator_size'=>'1',
		'oxy_mm_separator_style'=>'solid',
		'oxy_mm_separator_color'=>'#FC8E86',
		'oxy_mm_border_top_status'=>'0',
		'oxy_mm_border_top_size'=>'1',
		'oxy_mm_border_top_style'=>'solid',
		'oxy_mm_border_top_color'=>'#EEEEEE',
		'oxy_mm_border_bottom_status'=>'0',
		'oxy_mm_border_bottom_size'=>'1',
		'oxy_mm_border_bottom_style'=>'solid',
		'oxy_mm_border_bottom_color'=>'#EEEEEE',
		
		'oxy_mm1_bg_color_status'=>'1',
		'oxy_mm1_bg_color'=>'#9DBF58',
		'oxy_mm1_bg_hover_color'=>'#86B9D4',
		'oxy_mm1_link_color'=>'#FFFFFF',
		'oxy_mm1_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm2_bg_color_status'=>'1',
		'oxy_mm2_bg_color'=>'#EAD44F',
		'oxy_mm2_bg_hover_color'=>'#86B9D4',
		'oxy_mm2_link_color'=>'#FFFFFF',
		'oxy_mm2_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm3_bg_color_status'=>'0',
		'oxy_mm3_bg_color'=>'#424242',
		'oxy_mm3_bg_hover_color'=>'#86B9D4',
		'oxy_mm3_link_color'=>'#FFFFFF',
		'oxy_mm3_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm4_bg_color_status'=>'0',
		'oxy_mm4_bg_color'=>'#424242',
		'oxy_mm4_bg_hover_color'=>'#86B9D4',
		'oxy_mm4_link_color'=>'#FFFFFF',
		'oxy_mm4_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm6_bg_color_status'=>'0',
		'oxy_mm6_bg_color'=>'#424242',
		'oxy_mm6_bg_hover_color'=>'#86B9D4',
		'oxy_mm6_link_color'=>'#FFFFFF',
		'oxy_mm6_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm8_bg_color_status'=>'0',
		'oxy_mm8_bg_color'=>'#424242',
		'oxy_mm8_bg_hover_color'=>'#86B9D4',
		'oxy_mm8_link_color'=>'#FFFFFF',
		'oxy_mm8_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm5_bg_color_status'=>'0',
		'oxy_mm5_bg_color'=>'#424242',
		'oxy_mm5_bg_hover_color'=>'#86B9D4',
		'oxy_mm5_link_color'=>'#FFFFFF',
		'oxy_mm5_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm7_bg_color_status'=>'0',
		'oxy_mm7_bg_color'=>'#424242',
		'oxy_mm7_bg_hover_color'=>'#86B9D4',
		'oxy_mm7_link_color'=>'#FFFFFF',
		'oxy_mm7_link_hover_color'=>'#FFFFFF',
		
		'oxy_mm_sub_bg_color'=>'#FFFFFF',
		'oxy_mm_sub_bg_hover_color'=>'#86B9D4',
		'oxy_mm_sub_titles_bg_color'=>'#F5F5F5',
		'oxy_mm_sub_text_color'=>'#71827A',
		'oxy_mm_sub_link_color'=>'#71827A',
		'oxy_mm_sub_link_hover_color'=>'#FFFFFF',
		'oxy_mm_sub_separator_style'=>'solid',
		'oxy_mm_sub_separator_color'=>'#F1F1F1',
		'oxy_mm_sub_box_shadow'=>'1',
		
		'oxy_mm_mobile_bg_color'=>'#E86B62',
		'oxy_mm_mobile_bg_hover_color'=>'#9DBF58',
		'oxy_mm_mobile_text_color'=>'#FFFFFF',
		
		'oxy_mid_prod_box_bg_hover_color'=>'#FFFFFF',
		'oxy_mid_prod_box_shadow_hover'=>'1',
		'oxy_mid_prod_box_sale_icon_color'=>'#DE665E',
		'oxy_mid_prod_stars_color'=>'3',
		'oxy_mid_prod_page_tabs_bg_color'=>'#9DBF58',
		'oxy_mid_prod_page_tabs_selected_bg_color'=>'#DE665E',
		'oxy_mid_prod_page_tabs_text_color'=>'#FFFFFF',
		'oxy_mid_prod_slider_bg_color'=>'#FFFFFF',
		'oxy_mid_prod_slider_name_color'=>'#4C665A',
		'oxy_mid_prod_slider_desc_color'=>'#AFB494',
		'oxy_mid_prod_slider_price_color'=>'#DE665E',
		'oxy_mid_prod_slider_links_color_hover'=>'#DE665E',
		'oxy_mid_prod_slider_bottom_bar_bg_color'=>'#E8E8E8',
		'oxy_mid_prod_slider_bottom_bar_bg_color_hover'=>'#DE665E',
		'oxy_mid_prod_slider_bottom_bar_bg_color_active'=>'#86B9D4',
		
		'oxy_fp_bg_color'=>'#5C4D43',
		'oxy_fp_title_color'=>'#FFFFFF',
		'oxy_fp_title_color_hover'=>'#FFFFFF',
		'oxy_fp_subtitle_color'=>'#BAAFA8',
		
		'oxy_f1_bg_color'=>'#453932',
		'oxy_f1_titles_color'=>'#CE9B59',
		'oxy_f1_titles_border_bottom_size'=>'1',
		'oxy_f1_titles_border_bottom_style'=>'dotted',
		'oxy_f1_titles_border_bottom_color'=>'#615147',
		'oxy_f1_text_color'=>'#BAAFA8',
		'oxy_f1_link_color'=>'#CE9B59',
		'oxy_f1_link_hover_color'=>'#FFFFFF',
		'oxy_f1_icon_color'=>'#5C4D43',
		'oxy_f1_border_top_status'=>'0',
		'oxy_f1_border_top_size'=>'1',
		'oxy_f1_border_top_style'=>'solid',
		'oxy_f1_border_top_color'=>'#000000',
		
		'oxy_f2_bg_color'=>'#453932',
		'oxy_f2_titles_color'=>'#CE9B59',
		'oxy_f2_titles_border_bottom_size'=>'1',
		'oxy_f2_titles_border_bottom_style'=>'dotted',
		'oxy_f2_titles_border_bottom_color'=>'#615147',
		'oxy_f2_link_color'=>'#BAAFA8',
		'oxy_f2_link_hover_color'=>'#FFFFFF',
		'oxy_f2_border_top_status'=>'1',
		'oxy_f2_border_top_size'=>'1',
		'oxy_f2_border_top_style'=>'dotted',
		'oxy_f2_border_top_color'=>'#615147',
		
		'oxy_f4_bg_color'=>'#453932',
		'oxy_f4_text_color'=>'#BAAFA8',
		'oxy_f4_link_color'=>'#CE9B59',
		'oxy_f4_link_hover_color'=>'#FFFFFF',
		'oxy_f4_border_top_status'=>'1',
		'oxy_f4_border_top_size'=>'1',
		'oxy_f4_border_top_style'=>'dotted',
		'oxy_f4_border_top_color'=>'#615147',
		
		'oxy_f5_bg_color'=>'#453932',
		'oxy_f5_text_color'=>'#BAAFA8',
		'oxy_f5_link_color'=>'#CE9B59',
		'oxy_f5_link_hover_color'=>'#FFFFFF',
		'oxy_f5_border_top_status'=>'1',
		'oxy_f5_border_top_size'=>'1',
		'oxy_f5_border_top_style'=>'dotted',
		'oxy_f5_border_top_color'=>'#615147',
		
		'oxy_pattern_oxy'=>'',
		'oxy_bg_image_custom'=>'data/bg_kids.png',
		'oxy_bg_image_position'=>'top center',
		'oxy_bg_image_repeat'=>'repeat-x',
		'oxy_bg_image_attachment'=>'scroll',
		
		'oxy_pattern_oxy_mc'=>'',
		'oxy_bg_image_mc_custom'=>'',
		'oxy_bg_image_mc_position'=>'top center',
		'oxy_bg_image_mc_repeat'=>'repeat',
		'oxy_bg_image_mc_attachment'=>'scroll',
		
		'oxy_pattern_oxy_ta'=>'',
		'oxy_bg_image_ta_custom'=>'data/header_kids.png',
		'oxy_bg_image_ta_position'=>'top center',
		'oxy_bg_image_ta_repeat'=>'no-repeat',
		'oxy_bg_image_ta_attachment'=>'scroll',
		
		'oxy_pattern_oxy_mm'=>'',
		'oxy_bg_image_mm_custom'=>'',
		'oxy_bg_image_mm_repeat'=>'repeat',	
			
		'oxy_pattern_oxy_f1'=>'',
		'oxy_bg_image_f1_custom'=>'',
		'oxy_bg_image_f1_position'=>'top center',
		'oxy_bg_image_f1_repeat'=>'repeat',		
		'oxy_pattern_oxy_f2'=>'',
		'oxy_bg_image_f2_custom'=>'',
		'oxy_bg_image_f2_position'=>'top center',
		'oxy_bg_image_f2_repeat'=>'repeat',		
		'oxy_pattern_oxy_f4'=>'',
		'oxy_bg_image_f4_custom'=>'',
		'oxy_bg_image_f4_position'=>'top center',
		'oxy_bg_image_f4_repeat'=>'repeat',		
		'oxy_pattern_oxy_f5'=>'',
		'oxy_bg_image_f5_custom'=>'',
		'oxy_bg_image_f5_position'=>'top center',
		'oxy_bg_image_f5_repeat'=>'repeat',
		
		'oxy_body_font'=>'',
		
		'oxy_title_font'=>'',
		'oxy_title_font_weight'=>'normal',
		'oxy_title_font_uppercase'=>'1',
		
		'oxy_price_font'=>'',
		'oxy_price_font_weight'=>'normal',
		
		'oxy_button_font'=>'',
		'oxy_button_font_weight'=>'normal',
		'oxy_button_font_uppercase'=>'1',
		
		'oxy_search_font'=>'',
		'oxy_search_font_weight'=>'normal',
		'oxy_search_font_size'=>'13',
		'oxy_search_font_uppercase'=>'1',
		
		'oxy_cart_font'=>'',
		'oxy_cart_font_weight'=>'normal',
		'oxy_cart_font_size'=>'18',
		'oxy_cart_font_uppercase'=>'0',
		
		'oxy_main_menu_font'=>'',
		'oxy_mm_font_weight'=>'normal',
		'oxy_mm_font_size'=>'16',
		'oxy_mm_font_uppercase'=>'1',
		
		'oxy_fp_fb1_bg_color'=>'#9DBF58',
		'oxy_fp_fb1_bg_color_hover'=>'#9DBF58',
		'oxy_fp_fb2_bg_color'=>'#DE665E',
		'oxy_fp_fb2_bg_color_hover'=>'#DE665E',
		'oxy_fp_fb3_bg_color'=>'#86B9D4',
		'oxy_fp_fb3_bg_color_hover'=>'#86B9D4',
		'oxy_fp_fb4_bg_color'=>'#EAD44F',
		'oxy_fp_fb4_bg_color_hover'=>'#EAD44F',
		
		'oxy_video_box_bg'=>'#E86B62',
		'oxy_custom_box_bg'=>'#EAD44F'
		),
		
		'4'=>array(
		'skin_name'=>'Sport',
		'oxy_layout_style'=>'2',
		'oxy_search_bar_position'=>'center',
		
		'oxy_body_bg_color'=>'#0F0F0F',
		'oxy_headings_color'=>'#FFFFFF',
		'oxy_body_text_color'=>'#FFFFFF',
		'oxy_light_text_color'=>'#9E9E9E',
		'oxy_other_links_color'=>'#FEFB00',
		'oxy_links_hover_color'=>'#53A3DF',
		'oxy_general_icons_style'=>'2',
		
		'oxy_main_column_status'=>'0',
		'oxy_main_column_bg_color'=>'#FFFFFF',
		'oxy_main_column_border_status'=>'0',
		'oxy_main_column_border_size'=>'1',
		'oxy_main_column_border_style'=>'solid',
		'oxy_main_column_border_color'=>'#CCCCCC',
		'oxy_main_column_shadow'=>'0',
		
		'oxy_content_column_hli_bg_color'=>'#464646',
		'oxy_content_column_head_border_status'=>'1',
		'oxy_content_column_head_border_size'=>'1',
		'oxy_content_column_head_border_style'=>'solid',
		'oxy_content_column_head_border_color'=>'#464646',
		'oxy_content_column_separator_size'=>'1',
		'oxy_content_column_separator_style'=>'solid',
		'oxy_content_column_separator_color'=>'#575757',
		
		'oxy_left_column_head_status'=>'1',
		'oxy_left_column_head_bg_color'=>'#383838',
		'oxy_left_column_head_custom'=>'',
		'oxy_left_column_head_title_color'=>'#FFFFFF',
		'oxy_left_column_head_border_status'=>'0',
		'oxy_left_column_head_border_size'=>'1',
		'oxy_left_column_head_border_style'=>'solid',
		'oxy_left_column_head_border_color'=>'#EAEAEA',
		'oxy_left_column_box_status'=>'1',
		'oxy_left_column_box_bg_color'=>'#424242',
		'oxy_left_column_box_links_color'=>'#FFFFFF',
		'oxy_left_column_box_links_color_hover'=>'#FEFB00',
		
		'oxy_right_column_head_status'=>'1',
		'oxy_right_column_head_bg_color'=>'#383838',
		'oxy_right_column_head_custom'=>'',
		'oxy_right_column_head_title_color'=>'#FFFFFF',
		'oxy_right_column_head_border_status'=>'0',
		'oxy_right_column_head_border_size'=>'1',
		'oxy_right_column_head_border_style'=>'solid',
		'oxy_right_column_head_border_color'=>'#EAEAEA',
		'oxy_right_column_box_status'=>'1',
		'oxy_right_column_box_bg_color'=>'#424242',
		'oxy_right_column_box_links_color'=>'#FFFFFF',
		'oxy_right_column_box_links_color_hover'=>'#FEFB00',
		
		'oxy_category_box_head_status'=>'1',
		'oxy_category_box_head_bg_color'=>'#FEFB00',
		'oxy_category_box_head_custom'=>'',
		'oxy_category_box_head_title_color'=>'#000000',
		'oxy_category_box_head_border_status'=>'0',
		'oxy_category_box_head_border_size'=>'1',
		'oxy_category_box_head_border_style'=>'solid',
		'oxy_category_box_head_border_color'=>'#EAEAEA',
		'oxy_category_box_box_status'=>'1',
		'oxy_category_box_box_bg_color'=>'#424242',
		'oxy_category_box_box_bg_color_hover'=>'#525252',
		'oxy_category_box_box_links_color'=>'#FFFFFF',
		'oxy_category_box_box_links_color_hover'=>'#FEFB00',
		'oxy_category_box_box_separator_size'=>'1',
		'oxy_category_box_box_separator_style'=>'solid',
		'oxy_category_box_box_separator_color'=>'#525252',
		
		'oxy_filter_box_head_status'=>'1',
		'oxy_filter_box_head_bg_color'=>'#53A3DF',
		'oxy_filter_box_head_custom'=>'',
		'oxy_filter_box_head_title_color'=>'#FFFFFF',
		'oxy_filter_box_head_border_status'=>'0',
		'oxy_filter_box_head_border_size'=>'1',
		'oxy_filter_box_head_border_style'=>'solid',
		'oxy_filter_box_head_border_color'=>'#EAEAEA',
		'oxy_filter_box_box_status'=>'1',
		'oxy_filter_box_box_bg_color'=>'#424242',
		'oxy_filter_box_box_links_color'=>'#FFFFFF',
		'oxy_filter_box_box_links_color_hover'=>'#FEFB00',
		
		'oxy_price_color'=>'#FFFFFF',
		'oxy_price_old_color'=>'#B6B6B6',
		'oxy_price_new_color'=>'#FEFB00',
		'oxy_price_tax_color'=>'#B6B6B6',
		
		'oxy_button_border_radius'=>'0',
		'oxy_button_bg_color'=>'#FEFB00',
		'oxy_button_bg_hover_color'=>'#53A3DF',
		'oxy_button_text_color'=>'#000000',
		'oxy_button_text_hover_color'=>'#FFFFFF',
		'oxy_button_exclusive_bg_color'=>'#FEFB00',
		'oxy_button_exclusive_bg_hover_color'=>'#53A3DF',
		'oxy_button_exclusive_text_color'=>'#000000',
		'oxy_button_exclusive_text_hover_color'=>'#FFFFFF',
		'oxy_button_light_bg_color'=>'#FEFB00',
		'oxy_button_light_bg_hover_color'=>'#53A3DF',
		'oxy_button_light_text_color'=>'#000000',
		'oxy_button_light_text_hover_color'=>'#FFFFFF',
		'oxy_button_slider_bg_color'=>'#FFFFFF',
		'oxy_button_slider_bg_hover_color'=>'#53A3DF',
		
		'oxy_top_area_status'=>'0',
		'oxy_top_area_bg_color'=>'#F8F8F8',
		'oxy_top_area_mini_bg_color'=>'#000000',
		'oxy_top_area_tb_bg_status'=>'1',
		'oxy_top_area_tb_bg_color'=>'#424242',
		'oxy_top_area_tb_top_border_status'=>'0',
		'oxy_top_area_tb_top_border_color'=>'#FEFB00',
		'oxy_top_area_tb_bottom_border_status'=>'0',
		'oxy_top_area_tb_bottom_border_color'=>'#525252',
		'oxy_top_area_tb_text_color'=>'#CCCCCC',
		'oxy_top_area_tb_link_color'=>'#FFFFFF',
		'oxy_top_area_tb_link_color_hover'=>'#FEFB00',
		'oxy_top_area_tb_separator_color'=>'#525252',
		'oxy_top_area_tb_dropdown_bg_color'=>'#404040',
		'oxy_top_area_tb_dropdown_bg_color_hover'=>'#525252',
		'oxy_top_area_tb_dropdown_link_color'=>'#FFFFFF',
		'oxy_top_area_tb_dropdown_link_color_hover'=>'#FEFB00',
		'oxy_top_area_search_bg_color'=>'#F3F3F3',
		'oxy_top_area_search_border_color'=>'#DFDFDF',
		'oxy_top_area_search_border_color_hover'=>'#CCCCCC',
		'oxy_top_area_search_text_color'=>'#464646',
		'oxy_top_area_cart_text_color'=>'#FFFFFF',
		'oxy_top_area_cart_link_color'=>'#FEFB00',
		'oxy_top_area_cart_link_color_hover'=>'#FEFB00',
		'oxy_top_area_cart_separator_color'=>'#464646',
		'oxy_top_area_cart_icon_style'=>'5',
		
		'oxy_mm_bg_color_status'=>'1',
		'oxy_mm_bg_color'=>'#3D3D3D',
		'oxy_mm_separator_status'=>'0',
		'oxy_mm_separator_size'=>'1',
		'oxy_mm_separator_style'=>'solid',
		'oxy_mm_separator_color'=>'#575757',
		'oxy_mm_border_top_status'=>'0',
		'oxy_mm_border_top_size'=>'3',
		'oxy_mm_border_top_style'=>'solid',
		'oxy_mm_border_top_color'=>'#FEFB00',
		'oxy_mm_border_bottom_status'=>'1',
		'oxy_mm_border_bottom_size'=>'3',
		'oxy_mm_border_bottom_style'=>'solid',
		'oxy_mm_border_bottom_color'=>'#FEFB00',
		
		'oxy_mm1_bg_color_status'=>'1',
		'oxy_mm1_bg_color'=>'#FEFB00',
		'oxy_mm1_bg_hover_color'=>'#FEFB00',
		'oxy_mm1_link_color'=>'#000000',
		'oxy_mm1_link_hover_color'=>'#000000',
		
		'oxy_mm2_bg_color_status'=>'0',
		'oxy_mm2_bg_color'=>'#1C1B1C',
		'oxy_mm2_bg_hover_color'=>'#FEFB00',
		'oxy_mm2_link_color'=>'#FFFFFF',
		'oxy_mm2_link_hover_color'=>'#000000',
		
		'oxy_mm3_bg_color_status'=>'0',
		'oxy_mm3_bg_color'=>'#1C1B1C',
		'oxy_mm3_bg_hover_color'=>'#FEFB00',
		'oxy_mm3_link_color'=>'#FFFFFF',
		'oxy_mm3_link_hover_color'=>'#000000',
		
		'oxy_mm4_bg_color_status'=>'0',
		'oxy_mm4_bg_color'=>'#1C1B1C',
		'oxy_mm4_bg_hover_color'=>'#FEFB00',
		'oxy_mm4_link_color'=>'#FFFFFF',
		'oxy_mm4_link_hover_color'=>'#000000',
		
		'oxy_mm6_bg_color_status'=>'0',
		'oxy_mm6_bg_color'=>'#1C1B1C',
		'oxy_mm6_bg_hover_color'=>'#FEFB00',
		'oxy_mm6_link_color'=>'#FFFFFF',
		'oxy_mm6_link_hover_color'=>'#000000',
		
		'oxy_mm8_bg_color_status'=>'0',
		'oxy_mm8_bg_color'=>'#1C1B1C',
		'oxy_mm8_bg_hover_color'=>'#FEFB00',
		'oxy_mm8_link_color'=>'#FFFFFF',
		'oxy_mm8_link_hover_color'=>'#000000',
		
		'oxy_mm5_bg_color_status'=>'0',
		'oxy_mm5_bg_color'=>'#1C1B1C',
		'oxy_mm5_bg_hover_color'=>'#FEFB00',
		'oxy_mm5_link_color'=>'#FFFFFF',
		'oxy_mm5_link_hover_color'=>'#000000',
		
		'oxy_mm7_bg_color_status'=>'0',
		'oxy_mm7_bg_color'=>'#1C1B1C',
		'oxy_mm7_bg_hover_color'=>'#FEFB00',
		'oxy_mm7_link_color'=>'#FFFFFF',
		'oxy_mm7_link_hover_color'=>'#000000',
		
		'oxy_mm_sub_bg_color'=>'#404040',
		'oxy_mm_sub_bg_hover_color'=>'#525252',
		'oxy_mm_sub_titles_bg_color'=>'#525252',
		'oxy_mm_sub_text_color'=>'#FFFFFF',
		'oxy_mm_sub_link_color'=>'#FFFFFF',
		'oxy_mm_sub_link_hover_color'=>'#FEFB00',
		'oxy_mm_sub_separator_style'=>'solid',
		'oxy_mm_sub_separator_color'=>'#525252',
		'oxy_mm_sub_box_shadow'=>'1',
		
		'oxy_mm_mobile_bg_color'=>'#424242',
		'oxy_mm_mobile_bg_hover_color'=>'#53A3DF',
		'oxy_mm_mobile_text_color'=>'#FFFFFF',
		
		'oxy_mid_prod_box_bg_hover_color'=>'#424242',
		'oxy_mid_prod_box_shadow_hover'=>'0',
		'oxy_mid_prod_box_sale_icon_color'=>'#53A3DF',
		'oxy_mid_prod_stars_color'=>'1',
		'oxy_mid_prod_page_tabs_bg_color'=>'#424242',
		'oxy_mid_prod_page_tabs_selected_bg_color'=>'#53A3DF',
		'oxy_mid_prod_page_tabs_text_color'=>'#FFFFFF',
		'oxy_mid_prod_slider_bg_color'=>'#FFFFFF',
		'oxy_mid_prod_slider_name_color'=>'#464646',
		'oxy_mid_prod_slider_desc_color'=>'#A3A3A3',
		'oxy_mid_prod_slider_price_color'=>'#A3A3A3',
		'oxy_mid_prod_slider_links_color_hover'=>'#53A3DF',
		'oxy_mid_prod_slider_bottom_bar_bg_color'=>'#464646',
		'oxy_mid_prod_slider_bottom_bar_bg_color_hover'=>'#A3A3A3',
		'oxy_mid_prod_slider_bottom_bar_bg_color_active'=>'#53A3DF',
		
		'oxy_fp_bg_color'=>'#F6F6F6',
		'oxy_fp_title_color'=>'#464646',
		'oxy_fp_title_color_hover'=>'#53A3DF',
		'oxy_fp_subtitle_color'=>'#B6B6B6',
		
		'oxy_f1_bg_color'=>'#1C1B1C',
		'oxy_f1_titles_color'=>'#FFFFFF',
		'oxy_f1_titles_border_bottom_size'=>'1',
		'oxy_f1_titles_border_bottom_style'=>'solid',
		'oxy_f1_titles_border_bottom_color'=>'#464646',
		'oxy_f1_text_color'=>'#8C8C8C',
		'oxy_f1_link_color'=>'#FEFB00',
		'oxy_f1_link_hover_color'=>'#FFFFFF',
		'oxy_f1_icon_color'=>'#525252',
		'oxy_f1_border_top_status'=>'0',
		'oxy_f1_border_top_size'=>'3',
		'oxy_f1_border_top_style'=>'solid',
		'oxy_f1_border_top_color'=>'#000000',
		
		'oxy_f2_bg_color'=>'#1C1B1C',
		'oxy_f2_titles_color'=>'#FFFFFF',
		'oxy_f2_titles_border_bottom_size'=>'1',
		'oxy_f2_titles_border_bottom_style'=>'solid',
		'oxy_f2_titles_border_bottom_color'=>'#464646',
		'oxy_f2_link_color'=>'#8C8C8C',
		'oxy_f2_link_hover_color'=>'#FFFFFF',
		'oxy_f2_border_top_status'=>'1',
		'oxy_f2_border_top_size'=>'1',
		'oxy_f2_border_top_style'=>'solid',
		'oxy_f2_border_top_color'=>'#464646',
		
		'oxy_f4_bg_color'=>'#2F2F2F',
		'oxy_f4_text_color'=>'#8C8C8C',
		'oxy_f4_link_color'=>'#FFFFFF',
		'oxy_f4_link_hover_color'=>'#FEFB00',
		'oxy_f4_border_top_status'=>'1',
		'oxy_f4_border_top_size'=>'1',
		'oxy_f4_border_top_style'=>'solid',
		'oxy_f4_border_top_color'=>'#464646',
		
		'oxy_f5_bg_color'=>'#2F2F2F',
		'oxy_f5_text_color'=>'#8C8C8C',
		'oxy_f5_link_color'=>'#FEFB00',
		'oxy_f5_link_hover_color'=>'#FFFFFF',
		'oxy_f5_border_top_status'=>'1',
		'oxy_f5_border_top_size'=>'1',
		'oxy_f5_border_top_style'=>'solid',
		'oxy_f5_border_top_color'=>'#464646',
		
		'oxy_pattern_oxy'=>'',
		'oxy_bg_image_custom'=>'',
		'oxy_bg_image_position'=>'top center',
		'oxy_bg_image_repeat'=>'no-repeat',
		'oxy_bg_image_attachment'=>'scroll',
		
		'oxy_pattern_oxy_mc'=>'153',
		'oxy_bg_image_mc_custom'=>'',
		'oxy_bg_image_mc_position'=>'top center',
		'oxy_bg_image_mc_repeat'=>'repeat',
		'oxy_bg_image_mc_attachment'=>'scroll',
		
		'oxy_pattern_oxy_ta'=>'',
		'oxy_bg_image_ta_custom'=>'',
		'oxy_bg_image_ta_position'=>'top center',
		'oxy_bg_image_ta_repeat'=>'repeat',
		'oxy_bg_image_ta_attachment'=>'scroll',
		
		'oxy_pattern_oxy_mm'=>'',
		'oxy_bg_image_mm_custom'=>'',
		'oxy_bg_image_mm_repeat'=>'repeat',	
			
		'oxy_pattern_oxy_f1'=>'153',
		'oxy_bg_image_f1_custom'=>'',
		'oxy_bg_image_f1_position'=>'top center',
		'oxy_bg_image_f1_repeat'=>'repeat',		
		'oxy_pattern_oxy_f2'=>'153',
		'oxy_bg_image_f2_custom'=>'',
		'oxy_bg_image_f2_position'=>'top center',
		'oxy_bg_image_f2_repeat'=>'repeat',		
		'oxy_pattern_oxy_f4'=>'',
		'oxy_bg_image_f4_custom'=>'',
		'oxy_bg_image_f4_position'=>'top center',
		'oxy_bg_image_f4_repeat'=>'repeat',		
		'oxy_pattern_oxy_f5'=>'',
		'oxy_bg_image_f5_custom'=>'',
		'oxy_bg_image_f5_position'=>'top center',
		'oxy_bg_image_f5_repeat'=>'repeat',
		
		'oxy_body_font'=>'Armata',
		
		'oxy_title_font'=>'Armata',
		'oxy_title_font_weight'=>'normal',
		'oxy_title_font_uppercase'=>'1',
		
		'oxy_price_font'=>'Armata',
		'oxy_price_font_weight'=>'normal',
		
		'oxy_button_font'=>'Armata',
		'oxy_button_font_weight'=>'normal',
		'oxy_button_font_uppercase'=>'1',
		
		'oxy_search_font'=>'Armata',
		'oxy_search_font_weight'=>'normal',
		'oxy_search_font_size'=>'13',
		'oxy_search_font_uppercase'=>'1',
		
		'oxy_cart_font'=>'Armata',
		'oxy_cart_font_weight'=>'normal',
		'oxy_cart_font_size'=>'15',
		'oxy_cart_font_uppercase'=>'1',
		
		'oxy_main_menu_font'=>'Armata',
		'oxy_mm_font_weight'=>'normal',
		'oxy_mm_font_size'=>'15',
		'oxy_mm_font_uppercase'=>'1',
		
		'oxy_fp_fb1_bg_color'=>'#53A3DF',
		'oxy_fp_fb1_bg_color_hover'=>'#FEFB00',
		'oxy_fp_fb2_bg_color'=>'#53A3DF',
		'oxy_fp_fb2_bg_color_hover'=>'#FEFB00',
		'oxy_fp_fb3_bg_color'=>'#53A3DF',
		'oxy_fp_fb3_bg_color_hover'=>'#FEFB00',
		'oxy_fp_fb4_bg_color'=>'#53A3DF',
		'oxy_fp_fb4_bg_color_hover'=>'#FEFB00',
		
		'oxy_video_box_bg'=>'#3D3D3D',
		'oxy_custom_box_bg'=>'#3D3D3D'
		)

		);
		
		
		$options_jsonn = json_encode($color_schema);
		
		$this->model_setting_setting->editSetting('color_schema',array('color_schema'=>$options_jsonn ));		

		$color_schema  = $this->config->get('color_schema');
		
		$this->data['color_schema'] = json_decode($color_schema, true);
		

		endif;
		
		
		
		
		$this->response->setOutput($this->render());
	}
		
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/oxy')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>