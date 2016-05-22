<?php echo $header; ?>

<style type="text/css">
.color {border:1px solid #CCC;}
.oxy_help {color:#999999;font-size:12px;padding-left:5px;}
span.oxy_help_tip {margin-left:10px;padding:4px 7px 3px;border-radius:100%;background-color:#add472;}
span.oxy_help_tip a {color:#FFF;font-size:12px;font-weight:bold;text-decoration:none;}
.oxy_sep {background-color:#F7F7F7;}
.ptn {position:relative;width:40px;height:40px;float:left;margin-right:5px;margin-bottom:5px;}
.ptn_nr {position:absolute;bottom:0px;right:3px;}
.prod_l {position:relative;width:81px;height:63px;float:left;margin-right:25px;margin-bottom:20px;}
.prod_l_nr {position:absolute;bottom:-17px;right:0px;}
table.form {margin-bottom:0;}
table.form div {padding-top:5px;text-align:left}
table.form b {color:#003A88;font-size:13px}
table.form > tbody > tr > td:first-child {text-align:right}
a.link {text-decoration:none; margin-left:15px; margin-right:15px;}
.htabs {margin-top:15px;}
a.button-oxy {background:#4BB8E2;color:#FFFFFF;padding:4px 12px;margin-left:5px;text-decoration:none;}
a.button-oxy:hover {background:#ED5053;}
</style>                        
<?php 

if(empty($oxy_body_bg_color)) $oxy_body_bg_color ="F6F6F6";
if(empty($oxy_headings_color)) $oxy_headings_color ="464646";
if(empty($oxy_body_text_color)) $oxy_body_text_color ="464646";
if(empty($oxy_light_text_color)) $oxy_light_text_color ="B6B6B6";
if(empty($oxy_other_links_color)) $oxy_other_links_color ="4BB8E2";
if(empty($oxy_links_hover_color)) $oxy_links_hover_color ="ED5053";
if(empty($oxy_main_column_bg_color)) $oxy_main_column_bg_color ="FFFFFF";
if(empty($oxy_main_column_border_color)) $oxy_main_column_border_color ="CCCCCC";
if(empty($oxy_content_column_hli_bg_color)) $oxy_content_column_hli_bg_color ="F6F6F6";
if(empty($oxy_content_column_head_border_color)) $oxy_content_column_head_border_color ="EAEAEA";
if(empty($oxy_content_column_separator_color)) $oxy_content_column_separator_color ="EAEAEA";
if(empty($oxy_left_column_head_bg_color)) $oxy_left_column_head_bg_color ="4BB8E2";
if(empty($oxy_left_column_head_title_color)) $oxy_left_column_head_title_color ="FFFFFF";
if(empty($oxy_left_column_head_border_color)) $oxy_left_column_head_border_color ="EAEAEA";
if(empty($oxy_left_column_box_bg_color)) $oxy_left_column_box_bg_color ="F6F6F6";
if(empty($oxy_left_column_box_links_color)) $oxy_left_column_box_links_color ="464646";
if(empty($oxy_left_column_box_links_color_hover)) $oxy_left_column_box_links_color_hover ="ED5053";
if(empty($oxy_right_column_head_bg_color)) $oxy_right_column_head_bg_color ="4BB8E2";
if(empty($oxy_right_column_head_title_color)) $oxy_right_column_head_title_color ="FFFFFF";
if(empty($oxy_right_column_head_border_color)) $oxy_right_column_head_border_color ="EAEAEA";
if(empty($oxy_right_column_box_bg_color)) $oxy_right_column_box_bg_color ="F6F6F6";
if(empty($oxy_right_column_box_links_color)) $oxy_right_column_box_links_color ="464646";
if(empty($oxy_right_column_box_links_color_hover)) $oxy_right_column_box_links_color_hover ="ED5053";
if(empty($oxy_category_box_head_bg_color)) $oxy_category_box_head_bg_color ="ED5053";
if(empty($oxy_category_box_head_title_color)) $oxy_category_box_head_title_color ="FFFFFF";
if(empty($oxy_category_box_head_border_color)) $oxy_category_box_head_border_color ="EAEAEA";
if(empty($oxy_category_box_box_bg_color)) $oxy_category_box_box_bg_color ="F6F6F6";
if(empty($oxy_category_box_box_bg_color_hover)) $oxy_category_box_box_bg_color_hover ="F0F0F0";
if(empty($oxy_category_box_box_links_color)) $oxy_category_box_box_links_color ="464646";
if(empty($oxy_category_box_box_links_color_hover)) $oxy_category_box_box_links_color_hover ="4BB8E2";
if(empty($oxy_category_box_box_separator_color)) $oxy_category_box_box_separator_color ="FFFFFF";
if(empty($oxy_filter_box_head_bg_color)) $oxy_filter_box_head_bg_color ="424242";
if(empty($oxy_filter_box_head_title_color)) $oxy_filter_box_head_title_color ="FFFFFF";
if(empty($oxy_filter_box_head_border_color)) $oxy_filter_box_head_border_color ="EAEAEA";
if(empty($oxy_filter_box_box_bg_color)) $oxy_filter_box_box_bg_color ="F6F6F6";
if(empty($oxy_filter_box_box_links_color)) $oxy_filter_box_box_links_color ="464646";
if(empty($oxy_filter_box_box_links_color_hover)) $oxy_filter_box_box_links_color_hover ="ED5053";

if(empty($oxy_price_color)) $oxy_price_color ="4BB8E2";
if(empty($oxy_price_old_color)) $oxy_price_old_color ="B6B6B6";
if(empty($oxy_price_new_color)) $oxy_price_new_color ="ED5053";
if(empty($oxy_price_tax_color)) $oxy_price_tax_color ="B6B6B6";

if(empty($oxy_button_bg_color)) $oxy_button_bg_color ="4BB8E2";
if(empty($oxy_button_bg_hover_color)) $oxy_button_bg_hover_color ="ED5053";
if(empty($oxy_button_text_color)) $oxy_button_text_color ="FFFFFF";
if(empty($oxy_button_text_hover_color)) $oxy_button_text_hover_color ="FFFFFF";
if(empty($oxy_button_exclusive_bg_color)) $oxy_button_exclusive_bg_color ="ED5053";
if(empty($oxy_button_exclusive_bg_hover_color)) $oxy_button_exclusive_bg_hover_color ="4BB8E2";
if(empty($oxy_button_exclusive_text_color)) $oxy_button_exclusive_text_color ="FFFFFF";
if(empty($oxy_button_exclusive_text_hover_color)) $oxy_button_exclusive_text_hover_color ="FFFFFF";
if(empty($oxy_button_light_bg_color)) $oxy_button_light_bg_color ="EFEFEF";
if(empty($oxy_button_light_bg_hover_color)) $oxy_button_light_bg_hover_color ="4BB8E2";
if(empty($oxy_button_light_text_color)) $oxy_button_light_text_color ="464646";
if(empty($oxy_button_light_text_hover_color)) $oxy_button_light_text_hover_color ="FFFFFF";
if(empty($oxy_button_slider_bg_color)) $oxy_button_slider_bg_color ="EEEEEE";
if(empty($oxy_button_slider_bg_hover_color)) $oxy_button_slider_bg_hover_color ="4BB8E2";

if(empty($oxy_top_area_bg_color)) $oxy_top_area_bg_color ="F8F8F8";
if(empty($oxy_top_area_mini_bg_color)) $oxy_top_area_mini_bg_color ="FFFFFF";
if(empty($oxy_top_area_tb_bg_color)) $oxy_top_area_tb_bg_color ="424242";
if(empty($oxy_top_area_tb_top_border_color)) $oxy_top_area_tb_top_border_color ="4BB8E2";
if(empty($oxy_top_area_tb_bottom_border_color)) $oxy_top_area_tb_bottom_border_color ="525252";
if(empty($oxy_top_area_tb_text_color)) $oxy_top_area_tb_text_color ="CCCCCC";
if(empty($oxy_top_area_tb_link_color)) $oxy_top_area_tb_link_color ="4BB8E2";
if(empty($oxy_top_area_tb_link_color_hover)) $oxy_top_area_tb_link_color_hover ="ED5053";
if(empty($oxy_top_area_tb_separator_color)) $oxy_top_area_tb_separator_color ="525252";
if(empty($oxy_top_area_tb_dropdown_bg_color)) $oxy_top_area_tb_dropdown_bg_color ="FFFFFF";
if(empty($oxy_top_area_tb_dropdown_bg_color_hover)) $oxy_top_area_tb_dropdown_bg_color_hover ="4BB8E2";
if(empty($oxy_top_area_tb_dropdown_link_color)) $oxy_top_area_tb_dropdown_link_color ="464646";
if(empty($oxy_top_area_tb_dropdown_link_color_hover)) $oxy_top_area_tb_dropdown_link_color_hover ="FFFFFF";

if(empty($oxy_top_area_search_bg_color)) $oxy_top_area_search_bg_color ="F3F3F3";
if(empty($oxy_top_area_search_border_color)) $oxy_top_area_search_border_color ="DFDFDF";
if(empty($oxy_top_area_search_border_color_hover)) $oxy_top_area_search_border_color_hover ="CCCCCC";
if(empty($oxy_top_area_search_text_color)) $oxy_top_area_search_text_color ="464646";

if(empty($oxy_top_area_cart_text_color)) $oxy_top_area_cart_text_color ="B6B6B6";
if(empty($oxy_top_area_cart_link_color)) $oxy_top_area_cart_link_color ="4BB8E2";
if(empty($oxy_top_area_cart_link_color_hover)) $oxy_top_area_cart_link_color_hover ="ED5053";
if(empty($oxy_top_area_cart_separator_color)) $oxy_top_area_cart_separator_color ="EDEDED";

if(empty($oxy_mm_bg_color)) $oxy_mm_bg_color ="424242";
if(empty($oxy_mm_separator_color)) $oxy_mm_separator_color ="4F4F4F";
if(empty($oxy_mm_border_top_color)) $oxy_mm_border_top_color ="EEEEEE";
if(empty($oxy_mm_border_bottom_color)) $oxy_mm_border_bottom_color ="EEEEEE";

if(empty($oxy_mm1_bg_color)) $oxy_mm1_bg_color ="4BB8E2";
if(empty($oxy_mm1_bg_hover_color)) $oxy_mm1_bg_hover_color ="ED5053";
if(empty($oxy_mm1_link_color)) $oxy_mm1_link_color ="FFFFFF";
if(empty($oxy_mm1_link_hover_color)) $oxy_mm1_link_hover_color ="FFFFFF";

if(empty($oxy_mm2_bg_color)) $oxy_mm2_bg_color ="ED5053";
if(empty($oxy_mm2_bg_hover_color)) $oxy_mm2_bg_hover_color ="4BB8E2";
if(empty($oxy_mm2_link_color)) $oxy_mm2_link_color ="FFFFFF";
if(empty($oxy_mm2_link_hover_color)) $oxy_mm2_link_hover_color ="FFFFFF";

if(empty($oxy_mm3_bg_color)) $oxy_mm3_bg_color ="424242";
if(empty($oxy_mm3_bg_hover_color)) $oxy_mm3_bg_hover_color ="4BB8E2";
if(empty($oxy_mm3_link_color)) $oxy_mm3_link_color ="FFFFFF";
if(empty($oxy_mm3_link_hover_color)) $oxy_mm3_link_hover_color ="FFFFFF";

if(empty($oxy_mm4_bg_color)) $oxy_mm4_bg_color ="424242";
if(empty($oxy_mm4_bg_hover_color)) $oxy_mm4_bg_hover_color ="4BB8E2";
if(empty($oxy_mm4_link_color)) $oxy_mm4_link_color ="FFFFFF";
if(empty($oxy_mm4_link_hover_color)) $oxy_mm4_link_hover_color ="FFFFFF";

if(empty($oxy_mm5_bg_color)) $oxy_mm5_bg_color ="424242";
if(empty($oxy_mm5_bg_hover_color)) $oxy_mm5_bg_hover_color ="4BB8E2";
if(empty($oxy_mm5_link_color)) $oxy_mm5_link_color ="FFFFFF";
if(empty($oxy_mm5_link_hover_color)) $oxy_mm5_link_hover_color ="FFFFFF";

if(empty($oxy_mm6_bg_color)) $oxy_mm6_bg_color ="424242";
if(empty($oxy_mm6_bg_hover_color)) $oxy_mm6_bg_hover_color ="4BB8E2";
if(empty($oxy_mm6_link_color)) $oxy_mm6_link_color ="FFFFFF";
if(empty($oxy_mm6_link_hover_color)) $oxy_mm6_link_hover_color ="FFFFFF";

if(empty($oxy_mm7_bg_color)) $oxy_mm7_bg_color ="424242";
if(empty($oxy_mm7_bg_hover_color)) $oxy_mm7_bg_hover_color ="4BB8E2";
if(empty($oxy_mm7_link_color)) $oxy_mm7_link_color ="FFFFFF";
if(empty($oxy_mm7_link_hover_color)) $oxy_mm7_link_hover_color ="FFFFFF";

if(empty($oxy_mm8_bg_color)) $oxy_mm8_bg_color ="424242";
if(empty($oxy_mm8_bg_hover_color)) $oxy_mm8_bg_hover_color ="4BB8E2";
if(empty($oxy_mm8_link_color)) $oxy_mm8_link_color ="FFFFFF";
if(empty($oxy_mm8_link_hover_color)) $oxy_mm8_link_hover_color ="FFFFFF";

if(empty($oxy_mm_sub_bg_color)) $oxy_mm_sub_bg_color ="FFFFFF";
if(empty($oxy_mm_sub_bg_hover_color)) $oxy_mm_sub_bg_hover_color ="4BB8E2";
if(empty($oxy_mm_sub_titles_bg_color)) $oxy_mm_sub_titles_bg_color ="F5F5F5";
if(empty($oxy_mm_sub_text_color)) $oxy_mm_sub_text_color ="464646";
if(empty($oxy_mm_sub_link_color)) $oxy_mm_sub_link_color ="464646";
if(empty($oxy_mm_sub_link_hover_color)) $oxy_mm_sub_link_hover_color ="FFFFFF";
if(empty($oxy_mm_sub_separator_color)) $oxy_mm_sub_separator_color ="F1F1F1";

if(empty($oxy_mm_mobile_bg_color)) $oxy_mm_mobile_bg_color ="424242";
if(empty($oxy_mm_mobile_bg_hover_color)) $oxy_mm_mobile_bg_hover_color ="ED5053";
if(empty($oxy_mm_mobile_text_color)) $oxy_mm_mobile_text_color ="FFFFFF";

if(empty($oxy_mid_prod_slider_bg_color)) $oxy_mid_prod_slider_bg_color ="FFFFFF";
if(empty($oxy_mid_prod_slider_name_color)) $oxy_mid_prod_slider_name_color ="464646";
if(empty($oxy_mid_prod_slider_desc_color)) $oxy_mid_prod_slider_desc_color ="A3A3A3";
if(empty($oxy_mid_prod_slider_price_color)) $oxy_mid_prod_slider_price_color ="ED5053";
if(empty($oxy_mid_prod_slider_links_color_hover)) $oxy_mid_prod_slider_links_color_hover ="4BB8E2";
if(empty($oxy_mid_prod_slider_bottom_bar_bg_color)) $oxy_mid_prod_slider_bottom_bar_bg_color ="E8E8E8";
if(empty($oxy_mid_prod_slider_bottom_bar_bg_color_hover)) $oxy_mid_prod_slider_bottom_bar_bg_color_hover ="ED5053";
if(empty($oxy_mid_prod_slider_bottom_bar_bg_color_active)) $oxy_mid_prod_slider_bottom_bar_bg_color_active ="4BB8E2";

if(empty($oxy_mid_prod_box_bg_hover_color)) $oxy_mid_prod_box_bg_hover_color ="FFFFFF";
if(empty($oxy_mid_prod_box_sale_icon_color)) $oxy_mid_prod_box_sale_icon_color ="ED5053";

if(empty($oxy_mid_prod_page_tabs_bg_color)) $oxy_mid_prod_page_tabs_bg_color ="424242";
if(empty($oxy_mid_prod_page_tabs_selected_bg_color)) $oxy_mid_prod_page_tabs_selected_bg_color ="4BB8E2";
if(empty($oxy_mid_prod_page_tabs_text_color)) $oxy_mid_prod_page_tabs_text_color ="FFFFFF";

if(empty($oxy_fp_bg_color)) $oxy_fp_bg_color ="F6F6F6";
if(empty($oxy_fp_title_color)) $oxy_fp_title_color ="464646";
if(empty($oxy_fp_title_color_hover)) $oxy_fp_title_color_hover ="ED5053";
if(empty($oxy_fp_subtitle_color)) $oxy_fp_subtitle_color ="B6B6B6";
if(empty($oxy_fp_fb1_bg_color)) $oxy_fp_fb1_bg_color ="4BB8E2";
if(empty($oxy_fp_fb1_bg_color_hover)) $oxy_fp_fb1_bg_color_hover ="4BB8E2";
if(empty($oxy_fp_fb2_bg_color)) $oxy_fp_fb2_bg_color ="ED5053";
if(empty($oxy_fp_fb2_bg_color_hover)) $oxy_fp_fb2_bg_color_hover ="ED5053";
if(empty($oxy_fp_fb3_bg_color)) $oxy_fp_fb3_bg_color ="FFCA00";
if(empty($oxy_fp_fb3_bg_color_hover)) $oxy_fp_fb3_bg_color_hover ="FFCA00";
if(empty($oxy_fp_fb4_bg_color)) $oxy_fp_fb4_bg_color ="9AE24B";
if(empty($oxy_fp_fb4_bg_color_hover)) $oxy_fp_fb4_bg_color_hover ="9AE24B";

if(empty($oxy_f1_bg_color)) $oxy_f1_bg_color ="373737";
if(empty($oxy_f1_titles_color)) $oxy_f1_titles_color ="FFFFFF";
if(empty($oxy_f1_titles_border_bottom_color)) $oxy_f1_titles_border_bottom_color ="464646";
if(empty($oxy_f1_text_color)) $oxy_f1_text_color ="8C8C8C";
if(empty($oxy_f1_link_color)) $oxy_f1_link_color ="4BB8E2";
if(empty($oxy_f1_link_hover_color)) $oxy_f1_link_hover_color ="FFFFFF";
if(empty($oxy_f1_icon_color)) $oxy_f1_icon_color ="525252";
if(empty($oxy_f1_border_top_color)) $oxy_f1_border_top_color ="000000";

if(empty($oxy_f2_bg_color)) $oxy_f2_bg_color ="2F2F2F";
if(empty($oxy_f2_titles_color)) $oxy_f2_titles_color ="FFFFFF";
if(empty($oxy_f2_titles_border_bottom_color)) $oxy_f2_titles_border_bottom_color ="464646";
if(empty($oxy_f2_link_color)) $oxy_f2_link_color ="8C8C8C";
if(empty($oxy_f2_link_hover_color)) $oxy_f2_link_hover_color ="FFFFFF";
if(empty($oxy_f2_border_top_color)) $oxy_f2_border_top_color ="464646";

if(empty($oxy_f4_bg_color)) $oxy_f4_bg_color ="2F2F2F";
if(empty($oxy_f4_text_color)) $oxy_f4_text_color ="8C8C8C";
if(empty($oxy_f4_link_color)) $oxy_f4_link_color ="4BB8E2";
if(empty($oxy_f4_link_hover_color)) $oxy_f4_link_hover_color ="FFFFFF";
if(empty($oxy_f4_border_top_color)) $oxy_f4_border_top_color ="464646";

if(empty($oxy_f5_bg_color)) $oxy_f5_bg_color ="2F2F2F";
if(empty($oxy_f5_text_color)) $oxy_f5_text_color ="8C8C8C";
if(empty($oxy_f5_link_color)) $oxy_f5_link_color ="4BB8E2";
if(empty($oxy_f5_link_hover_color)) $oxy_f5_link_hover_color ="FFFFFF";
if(empty($oxy_f5_border_top_color)) $oxy_f5_border_top_color ="464646";

if(empty($oxy_video_box_bg)) $oxy_video_box_bg ="ED5053";
if(empty($oxy_custom_box_bg)) $oxy_custom_box_bg ="FFCA00";

$bgp = array(
	''    => 'none',
	'1'   => '1',
	'2'   => '2',
	'3'   => '3',
	'4'   => '4',
	'5'   => '5',
	'6'   => '6',
	'7'   => '7',
	'8'   => '8',  
	'9'   => '9',
	'10'  => '10',
	'11'  => '11',
	'12'  => '12', 
	'13'  => '13',
	'14'  => '14',
	'15'  => '15',
	'16'  => '16',
	'17'  => '17',
	'18'  => '18',  
	'19'  => '19',
	'20'  => '20',
	'21'  => '21',
	'22'  => '22', 
	'23'  => '23',
	'24'  => '24',
	'25'  => '25',
	'26'  => '26',
	'27'  => '27',
	'28'  => '28',  
	'29'  => '29',
	'30'  => '30',
	'31'  => '31',
	'32'  => '32', 
	'33'  => '33',
	'34'  => '34',
	'35'  => '35',
	'36'  => '36',
	'37'  => '37',
	'38'  => '38',  
	'39'  => '39',
	'40'  => '40',
	'41'  => '41',
	'42'  => '42', 
	'43'  => '43',
	'44'  => '44',
	'45'  => '45',
	'46'  => '46',
	'47'  => '47',
	'48'  => '48',  
	'49'  => '49',  
	'50'  => '50',
	'51'  => '51',
	'52'  => '52', 
	'53'  => '53',
	'54'  => '54',
	'55'  => '55',
	'56'  => '56',
	'57'  => '57',
	'58'  => '58',  
	'59'  => '59',
	'60'  => '60',
	'61'  => '61',
	'62'  => '62', 
	'63'  => '63',
	'64'  => '64',
	'65'  => '65',
	'66'  => '66',
	'67'  => '67',
	'68'  => '68',  
	'69'  => '69',
	'70'  => '70',
	'71'  => '71',
	'72'  => '72', 
	'73'  => '73',
	'74'  => '74',
	'75'  => '75',                            
	'101' => '101',
    '102' => '102',
    '103' => '103',
    '104' => '104',
    '105' => '105',
    '106' => '106',
    '107' => '107',
    '108' => '108',
    '109' => '109',
    '110' => '110',
	'111' => '111',
    '112' => '112',
    '113' => '113',
    '114' => '114',
    '115' => '115',
    '116' => '116',
    '117' => '117',
    '118' => '118',
    '119' => '119',
    '120' => '120',
	'121' => '121',
    '122' => '122',
    '123' => '123',
    '124' => '124',
    '125' => '125',
    '126' => '126',
    '127' => '127',
    '128' => '128',
    '129' => '129',
    '130' => '130', 
	'131' => '131',
    '132' => '132',
    '133' => '133',
    '134' => '134',
    '135' => '135',
    '136' => '136',
    '137' => '137',
    '138' => '138',
    '139' => '139',
    '140' => '140',
	'141' => '141',
    '142' => '142',
    '143' => '143',
    '144' => '144',
    '145' => '145',
    '146' => '146',
    '147' => '147',
    '148' => '148',
    '149' => '149',
    '150' => '150', 
	'151' => '151',
    '152' => '152',
    '153' => '153',
    '154' => '154',
    '155' => '155',
    '156' => '156',
    '157' => '157',
    '158' => '158',
    '159' => '159',
    '160' => '160',
	'161' => '161',
    '162' => '162',
    '163' => '163',
    '164' => '164',
    '165' => '165',
    '166' => '166',
    '167' => '167',
    '168' => '168',
    '169' => '169',
    '170' => '170',
	'171' => '171',
    '172' => '172',
    '173' => '173',
    '174' => '174',
    '175' => '175',
    '176' => '176',
    '177' => '177',
    '178' => '178',
    '179' => '179',
    '180' => '180',  
	'181' => '181',
    '182' => '182',
    '183' => '183',
    '184' => '184',
    '185' => '185',
    '186' => '186',
    '187' => '187',
    '188' => '188',
    '189' => '189',
    '190' => '190',
	'191' => '191',
    '192' => '192',
    '193' => '193',
    '194' => '194',
    '195' => '195',
    '196' => '196',
    '197' => '197',
    '198' => '198',
    '199' => '199',
    '200' => '200',
	'201' => '201',
    '202' => '202',
    '203' => '203',
    '204' => '204',
    '205' => '205',
    '206' => '206',
    '207' => '207',
    '208' => '208',
    '209' => '209',
    '210' => '210',
	'211' => '211',
    '212' => '212',
    '213' => '213',
    '214' => '214',
    '215' => '215',
    '216' => '216',
    '217' => '217',
    '218' => '218',
    '219' => '219',
    '220' => '220',
	'221' => '221',
    '222' => '222',
    '223' => '223',
    '224' => '224',
    '225' => '225',
    '226' => '226',
    '227' => '227',
    '228' => '228',
    '229' => '229',
    '230' => '230', 
	'231' => '231',
    '232' => '232',
    '233' => '233',
    '234' => '234',
    '235' => '235',
    '236' => '236',
    '237' => '237',
    '238' => '238',
    '239' => '239',
    '240' => '240',
	'241' => '241',
    '242' => '242',
    '243' => '243',
    '244' => '244',
    '245' => '245',
    '246' => '246',
    '247' => '247',
    '248' => '248',
    '249' => '249',
    '250' => '250', 
	'251' => '251',
    '252' => '252',
    '253' => '253',
    '254' => '254',
    '255' => '255',
    '256' => '256',
    '257' => '257',
    '258' => '258',
    '259' => '259',
    '260' => '260',
	'261' => '261',
    '262' => '262',
    '263' => '263',
    '264' => '264',
    '265' => '265',
    '266' => '266',
    '267' => '267',
    '268' => '268',
    '269' => '269',
    '270' => '270',
	'271' => '271',
    '272' => '272',
    '273' => '273',
    '274' => '274',
    '275' => '275',
    '276' => '276',
    '277' => '277',
    '278' => '278',
    '279' => '279',
    '280' => '280',  
	'281' => '281',
    '282' => '282',
    '283' => '283',
    '284' => '284',
    '285' => '285',
    '286' => '286',
    '287' => '287',
    '288' => '288',
    '289' => '289',
    '290' => '290',
	'291' => '291',
    '292' => '292',
    '293' => '293',
    '294' => '294',
    '295' => '295',
    '296' => '296',
    '297' => '297',
    '298' => '298',
    '299' => '299',
    '300' => '300',
	'301' => '301',
    '302' => '302',
    '303' => '303',
    '304' => '304',
    '305' => '305',
    '306' => '306',
    '307' => '307',
    '308' => '308',
    '309' => '309',
    '310' => '310',
	'311' => '311',
    '312' => '312',
    '313' => '313',
    '314' => '314',
    '315' => '315',
    '316' => '316',
    '317' => '317',
    '318' => '318',
    '319' => '319',
    '320' => '320',
	'321' => '321',
    '322' => '322',
    '323' => '323',
    '324' => '324',
    '325' => '325',
    '326' => '326',
    '327' => '327',
    '328' => '328',
    '329' => '329',
    '330' => '330', 
	'331' => '331',
    '332' => '332',
    '333' => '333',
    '334' => '334',
    '335' => '335',
    '336' => '336',
    '337' => '337',
    '338' => '338',
    '339' => '339',
    '340' => '340',
	'341' => '341',
    '342' => '342',
    '343' => '343',
    '344' => '344',
    '345' => '345',
    '346' => '346',
    '347' => '347',
    '348' => '348',
    '349' => '349',
    '350' => '350', 
	'351' => '351',
    '352' => '352',
    '353' => '353',
    '354' => '354',
    '355' => '355',
    '356' => '356',
    '357' => '357',
    '358' => '358',
    '359' => '359',
    '360' => '360',
	'361' => '361',
    '362' => '362',
    '363' => '363',
    '364' => '364',
    '365' => '365',
    '366' => '366',
    '367' => '367',
    '368' => '368',
    '369' => '369',
    '370' => '370',
	'371' => '371',
    '372' => '372',
    '373' => '373', 
    '374' => '374',
    '375' => '375',
    '376' => '376',
    '377' => '377',
    '378' => '378',
    '379' => '379',                                                   
)
;
	
$googlefonts = array(
	''                         => '--- Default ---',
	'Arial'                    => 'Arial',
	'Georgia'                  => 'Georgia',
	'Helvetica'                => 'Helvetica',
	'Lucida Grande'            => 'Lucida Grande',    
	'Lucida Sans Unicode'      => 'Lucida Sans Unicode',
 	'Segoe UI'                 => 'Segoe UI',   
	'Tahoma'                   => 'Tahoma',
	'Times New Roman'          => 'Times New Roman',
	'Trebuchet MS'             => 'Trebuchet MS',    
	'Verdana'                  => 'Verdana', 
    'ABeeZee'                  => 'ABeeZee',  
	'Abel'                     => 'Abel',
	'Abril+Fatface'            => 'Abril Fatface',
	'Aclonica'                 => 'Aclonica',
	'Acme'                     => 'Acme',
	'Actor'                    => 'Actor',
	'Adamina'                  => 'Adamina',
	'Advent+Pro'               => 'Advent Pro',
	'Aguafina+Script'          => 'Aguafina Script',    
    'Akronim'                  => 'Akronim',
	'Aladin'                   => 'Aladin',
	'Aldrich'                  => 'Aldrich',
	'Alegreya'                 => 'Alegreya',
	'Alegreya+SC'              => 'Alegreya SC',
	'Alex+Brush'               => 'Alex Brush',
	'Alfa+Slab+One'            => 'Alfa Slab One',
	'Alice'                    => 'Alice',
	'Alike'                    => 'Alike',
	'Alike+Angular'            => 'Alike Angular',
	'Allan'                    => 'Allan',
	'Allerta'                  => 'Allerta',
	'Allerta+Stencil'          => 'Allerta Stencil',
	'Allura'                   => 'Allura',
	'Almendra'                 => 'Almendra',
	'Almendra+Display'         => 'Almendra Display',    
	'Almendra+SC'              => 'Almendra SC',
    'Amarante'                 => 'Amarante',
	'Amaranth'                 => 'Amaranth',
	'Amatic+SC'                => 'Amatic SC',
	'Amethysta'                => 'Amethysta',
    'Anaheim'                  => 'Anaheim',
	'Andada'                   => 'Andada',
	'Andika'                   => 'Andika',
	'Angkor'                   => 'Angkor',    
	'Annie+Use+Your+Telescope' => 'Annie Use Your Telescope',
	'Anonymous+Pro'            => 'Anonymous Pro',
	'Antic'                    => 'Antic',
	'Antic+Didone'             => 'Antic Didone',
	'Antic+Slab'               => 'Antic Slab',        
	'Anton'                    => 'Anton',
	'Arapey'                   => 'Arapey',
	'Arbutus'                  => 'Arbutus',  
    'Arbutus+Slab'             => 'Arbutus Slab',    
	'Architects+Daughter'      => 'Architects Daughter',
    'Archivo+Black'            => 'Archivo Black',
    'Archivo+Narrow'           => 'Archivo Narrow',
	'Arimo'                    => 'Arimo',
	'Arizonia'                 => 'Arizonia',    
	'Armata'                   => 'Armata',
	'Artifika'                 => 'Artifika',
	'Arvo'                     => 'Arvo',
	'Asap'                     => 'Asap',
	'Asset'                    => 'Asset',
	'Astloch'                  => 'Astloch',
	'Asul'                     => 'Asul',
	'Atomic+Age'               => 'Atomic Age',
	'Aubrey'                   => 'Aubrey',
	'Audiowide'                => 'Audiowide', 
    'Autour+One'               => 'Autour One',
	'Average'                  => 'Average',
    'Average+Sans'             => 'Average Sans',
	'Averia+Gruesa+Libre'      => 'Averia Gruesa Libre',
	'Averia+Libre'             => 'Averia Libre',
	'Averia+Sans+Libre'        => 'Averia Sans Libre',
	'Averia+Serif+Libre'       => 'Averia Serif Libre',                       
	'Bad+Script'               => 'Bad Script',
	'Balthazar'                => 'Balthazar',
	'Bangers'                  => 'Bangers',
	'Basic'                    => 'Basic',
	'Battambang'               => 'Battambang',
	'Baumans'                  => 'Baumans',
	'Bayon'                    => 'Bayon',
	'Belgrano'                 => 'Belgrano',
	'Belleza'                  => 'Belleza',  
    'BenchNine'                => 'BenchNine',  
	'Bentham'                  => 'Bentham',
	'Berkshire+Swash'          => 'Berkshire Swash',    
	'Bevan'                    => 'Bevan',
	'Bigelow+Rules'            => 'Bigelow Rules',    
	'Bigshot+One'              => 'Bigshot One',
	'Bilbo'                    => 'Bilbo',
	'Bilbo+Swash+Caps'         => 'Bilbo Swash Caps',
	'Bitter'                   => 'Bitter',
	'Black+Ops+One'            => 'Black Ops One',
	'Bokor'                    => 'Bokor',
	'Bonbon'                   => 'Bonbon',
	'Boogaloo'                 => 'Boogaloo',
	'Bowlby+One'               => 'Bowlby One',
	'Bowlby+One+SC'            => 'Bowlby One SC',
	'Brawler'                  => 'Brawler',
	'Bree+Serif'               => 'Bree Serif',
	'Bubblegum+Sans'           => 'Bubblegum Sans',
    'Bubbler+One'              => 'Bubbler One',
	'Buda'                     => 'Buda',
	'Buenard'                  => 'Buenard',
	'Butcherman'               => 'Butcherman',
	'Butterfly+Kids'           => 'Butterfly Kids',
	'Cabin'                    => 'Cabin',
	'Cabin+Condensed'          => 'Cabin Condensed',
	'Cabin+Sketch'             => 'Cabin Sketch',
	'Caesar+Dressing'          => 'Caesar Dressing',
	'Cagliostro'               => 'Cagliostro',
	'Calligraffitti'           => 'Calligraffitti',
	'Cambo'                    => 'Cambo',
	'Candal'                   => 'Candal',
	'Cantarell'                => 'Cantarell',
	'Cantata+One'              => 'Cantata One',
    'Cantora+One'              => 'Cantora One',
    'Capriola'                 => 'Capriola',
	'Cardo'                    => 'Cardo',
	'Carme'                    => 'Carme',
    'Carrois+Gothic'           => 'Carrois Gothic',
    'Carrois+Gothic+SC'        => 'Carrois Gothic SC',
	'Carter+One'               => 'Carter One',
	'Caudex'                   => 'Caudex',    
	'Cedarville Cursive'       => 'Cedarville Cursive',
	'Ceviche+One'              => 'Ceviche One',    
	'Changa+One'               => 'Changa One',
	'Chango'                   => 'Chango',
	'Chau+Philomene+One'       => 'Chau Philomene One',    
    'Chela+One'                => 'Chela One',
	'Chelsea+Market'           => 'Chelsea Market',
	'Chenla'                   => 'Chenla',    
	'Cherry+Cream+Soda'        => 'Cherry Cream Soda',
    'Cherry+Swash'             => 'Cherry Swash',
	'Chewy'                    => 'Chewy',
	'Chicle'                   => 'Chicle',
	'Chivo'                    => 'Chivo',  
    'Cinzel'                   => 'Cinzel', 
    'Cinzel+Decorative'        => 'Cinzel Decorative',     
	'Clicker+Script'           => 'Clicker Script',
	'Coda'                     => 'Coda',    
	'Coda+Caption'             => 'Coda Caption',
	'Codystar'                 => 'Codystar',
    'Combo'                    => 'Combo',
	'Comfortaa'                => 'Comfortaa',
	'Coming+Soon'              => 'Coming Soon',
	'Concert+One'              => 'Concert One',    
	'Condiment'                => 'Condiment',
	'Content'                  => 'Content',    
	'Contrail+One'             => 'Contrail One',
	'Convergence'              => 'Convergence',
	'Cookie'                   => 'Cookie',
	'Copse'                    => 'Copse',
	'Corben'                   => 'Corben',
    'Courgette'                => 'Courgette',
	'Cousine'                  => 'Cousine',
	'Coustard'                 => 'Coustard',
	'Covered+By+Your+Grace'    => 'Covered By Your Grace',
	'Crafty+Girls'             => 'Crafty Girls',
	'Creepster'                => 'Creepster',        
	'Crete+Round'              => 'Crete Round',
	'Crimson+Text'             => 'Crimson Text',
	'Croissant+One'            => 'Croissant One',    
	'Crushed'                  => 'Crushed',
	'Cuprum'                   => 'Cuprum',
	'Cutive'                   => 'Cutive', 
    'Cutive+Mono'              => 'Cutive Mono',
	'Damion'                   => 'Damion',
	'Dancing+Script'           => 'Dancing Script',
	'Dangrek'                  => 'Dangrek',
	'Dawning+Of+A+New+Day'     => 'Dawning of a New Day',
	'Days+One'                 => 'Days One',        
	'Delius'                   => 'Delius',
	'Delius+Swash+Caps'        => 'Delius Swash Caps',
	'Delius+Unicase'           => 'Delius Unicase',
	'Della+Respira'            => 'Della Respira',
    'Denk+One'                 => 'Denk One',
	'Devonshire'               => 'Devonshire',
	'Didact+Gothic'            => 'Didact Gothic',
	'Diplomata'                => 'Diplomata',
	'Diplomata+SC'             => 'Diplomata SC',
    'Domine'                   => 'Domine',
    'Donegal+One'              => 'Donegal One',
	'Doppio+One'               => 'Doppio One',
	'Dorsa'                    => 'Dorsa',
	'Dosis'                    => 'Dosis',    
	'Dr+Sugiyama'              => 'Dr Sugiyama',
	'Droid+Sans'               => 'Droid Sans',
	'Droid+Sans+Mono'          => 'Droid Sans Mono',
	'Droid+Serif'              => 'Droid Serif',
	'Duru+Sans'                => 'Duru Sans',
	'Dynalight'                => 'Dynalight',
    'Eagle+Lake'               => 'Eagle Lake',
	'Eater'                    => 'Eater',
	'EB+Garamond'              => 'EB Garamond',
	'Economica'                => 'Economica',
	'Electrolize'              => 'Electrolize',
    'Elsie'                    => 'Elsie',
    'Elsie+Swash+Caps'         => 'Elsie Swash Caps',
	'Emblema+One'              => 'Emblema One',
	'Emilys+Candy'             => 'Emilys Candy',    
	'Engagement'               => 'Engagement',
	'Englebert'                => 'Englebert',    
	'Enriqueta'                => 'Enriqueta',
	'Erica+One'                => 'Erica One',
	'Esteban'                  => 'Esteban',
	'Euphoria+Script'          => 'Euphoria Script',
	'Ewert'                    => 'Ewert',    
	'Exo'                      => 'Exo',
	'Expletus+Sans'            => 'Expletus Sans',
	'Fanwood+Text'             => 'Fanwood Text',
	'Fascinate'                => 'Fascinate',
	'Fascinate+Inline'         => 'Fascinate Inline',
    'Faster+One'               => 'Faster One',
	'Federant'                 => 'Federant',
	'Federo'                   => 'Federo',
	'Felipa'                   => 'Felipa',
    'Fenix'                    => 'Fenix',
    'Finger+Paint'             => 'Finger Paint',
	'Fjalla+One'               => 'Fjalla One',    
	'Fjord+One'                => 'Fjord One',
	'Flamenco'                 => 'Flamenco',
	'Flavors'                  => 'Flavors',
	'Fondamento'               => 'Fondamento',
	'Fontdiner+Swanky'         => 'Fontdiner Swanky',
	'Forum'                    => 'Forum',
	'Francois+One'             => 'Francois One',
    'Freckle+Face'             => 'Freckle Face',    
	'Fredericka+The+Great'     => 'Fredericka the Great',   
    'Fredoka+One'              => 'Fredoka One',
    'Freehand'                 => 'Freehand', 
	'Fresca'                   => 'Fresca',
	'Frijole'                  => 'Frijole',
	'Fruktur'                  => 'Fruktur',    
	'Fugaz+One'                => 'Fugaz One',
	'Gabriela'                 => 'Gabriela', 
    'Gafata'                   => 'Gafata',    
	'Galdeano'                 => 'Galdeano',
    'Galindo'                  => 'Galindo',
	'Gentium+Basic'            => 'Gentium Basic',
	'Gentium+Book+Basic'       => 'Gentium Book Basic',
	'Geo'                      => 'Geo',
	'Geostar'                  => 'Geostar',
	'Geostar+Fill'             => 'Geostar Fill',
	'Germania+One'             => 'Germania One',
	'GFS+Didot'                => 'GFS Didot',
	'GFS+Neohellenic'          => 'GFS Neohellenic',
	'Gilda+Display'            => 'Gilda Display',
    'Give+You+Glory'           => 'Give You Glory',
	'Glass+Antiqua'            => 'Glass Antiqua',
	'Glegoo'                   => 'Glegoo',
	'Gloria+Hallelujah'        => 'Gloria Hallelujah',
	'Goblin+One'               => 'Goblin One',
	'Gochi+Hand'               => 'Gochi Hand',
	'Gorditas'                 => 'Gorditas',
	'Goudy+Bookletter+1911'    => 'Goudy Bookletter 1911',
	'Graduate'                 => 'Graduate',
    'Grand+Hotel'              => 'Grand Hotel',
	'Gravitas+One'             => 'Gravitas One',
	'Great Vibes'              => 'Great Vibes',
    'Griffy'                   => 'Griffy',
	'Gruppo'                   => 'Gruppo',
	'Gudea'                    => 'Gudea',
	'Habibi'                   => 'Habibi',
	'Hammersmith+One'          => 'Hammersmith One',
	'Hanalei'                  => 'Hanalei',       
	'Hanalei+Fill'             => 'Hanalei Fill',    
	'Handlee'                  => 'Handlee',
	'Hanuman'                  => 'Hanuman',
	'Happy+Monkey'             => 'Happy Monkey',
    'Headland+One'             => 'Headland One',
	'Henny+Penny'              => 'Henny Penny',
	'Herr+Von+Muellerhoff'     => 'Herr Von Muellerhoff',
	'Holtwood+One+SC'          => 'Holtwood One SC',
	'Homemade+Apple'           => 'Homemade Apple',    
	'Homenaje'                 => 'Homenaje',
	'Iceberg'                  => 'Iceberg',
	'Iceland'                  => 'Iceland',
	'IM+Fell+Double+Pica'      => 'IM Fell Double Pica',
	'IM+Fell+Double+Pica+SC'   => 'IM Fell Double Pica SC',
	'IM+Fell+DW+Pica'          => 'IM Fell DW Pica',    
	'IM+Fell+DW+Pica+SC'       => 'IM Fell DW Pica SC',
	'IM+Fell+English'          => 'IM Fell English',
	'IM+Fell+English+SC'       => 'IM Fell English SC',
	'IM+Fell+French+Canon'     => 'IM Fell French Canon',
	'IM+Fell+French+Canon+SC'  => 'IM Fell French Canon SC',
	'IM+Fell+Great+Primer'     => 'IM Fell Great Primer',
	'IM+Fell+Great+Primer+SC'  => 'IM Fell Great Primer SC',
	'Imprima'                  => 'Imprima',
	'Inconsolata'              => 'Inconsolata',
	'Inder'                    => 'Inder',
	'Indie+Flower'             => 'Indie Flower',
	'Inika'                    => 'Inika',
	'Irish+Grover'             => 'Irish Grover',
	'Istok+Web'                => 'Istok Web',
	'Italiana'                 => 'Italiana',
	'Italianno'                => 'Italianno',
    'Jacques+Francois'         => 'Jacques Francois',
    'Jacques+Francois+Shadow'  => 'Jacques Francois Shadow',
	'Jim+Nightshade'           => 'Jim Nightshade',
	'Jockey+One'               => 'Jockey One',
	'Jolly Lodger'             => 'Jolly Lodger',
	'Josefin+Sans'             => 'Josefin Sans',
	'Josefin+Slab'             => 'Josefin Slab',
    'Joti+One'                 => 'Joti One',
	'Judson'                   => 'Judson',
	'Julee'                    => 'Julee',
    'Julius+Sans+One'          => 'Julius Sans One',
	'Junge'                    => 'Junge',
	'Jura'                     => 'Jura',
	'Just+Another+Hand'        => 'Just Another Hand',
	'Just+Me+Again+Down+Here'  => 'Just Me Again Down Here',
	'Kameron'                  => 'Kameron',
	'Karla'                    => 'Karla',
	'Kaushan+Script'           => 'Kaushan Script',
    'Kavoon'                   => 'Kavoon',
    'Keania+One'               => 'Keania One',
	'Kelly+Slab'               => 'Kelly Slab',
	'Kenia'                    => 'Kenia',
	'Khmer'                    => 'Khmer',
    'Kite+One'                 => 'Kite One',
	'Knewave'                  => 'Knewave',
	'Kotta+One'                => 'Kotta One',
	'Koulen'                   => 'Koulen',
	'Kranky'                   => 'Kranky',
	'Kreon'                    => 'Kreon',
	'Kristi'                   => 'Kristi',
	'Krona+One'                => 'Krona One',
	'La+Belle+Aurore'          => 'La Belle Aurore',
	'Lancelot'                 => 'Lancelot',
	'Lato'                     => 'Lato',
	'League+Script'            => 'League Script',
	'Leckerli+One'             => 'Leckerli One',
	'Ledger'                   => 'Ledger',
	'Lekton'                   => 'Lekton',
	'Lemon'                    => 'Lemon',
    'Libre+Baskerville'        => 'Libre Baskerville',
    'Life+Savers'              => 'Life Savers',
	'Lilita+One'               => 'Lilita One',
	'Limelight'                => 'Limelight',
	'Linden+Hill'              => 'Linden Hill',
	'Lobster'                  => 'Lobster',
	'Lobster+Two'              => 'Lobster Two',
	'Londrina+Outline'         => 'Londrina Outline',
	'Londrina+Shadow'          => 'Londrina Shadow',
	'Londrina+Sketch'          => 'Londrina Sketch',
	'Londrina+Solid'           => 'Londrina Solid',
	'Lora'                     => 'Lora',
	'Love+Ya+Like+A+Sister'    => 'Love Ya Like A Sister',
	'Loved+By+The+King'        => 'Loved by the King',
	'Lovers+Quarrel'           => 'Lovers Quarrel',
	'Luckiest+Guy'             => 'Luckiest Guy',
	'Lusitana'                 => 'Lusitana',
	'Lustria'                  => 'Lustria',
	'Macondo'                  => 'Macondo',
	'Macondo+Swash+Caps'       => 'Macondo Swash Caps',
	'Magra'                    => 'Magra',
	'Maiden+Orange'            => 'Maiden Orange',
	'Mako'                     => 'Mako',
    'Marcellus'                => 'Marcellus',
    'Marcellus+SC'             => 'Marcellus SC',
	'Marck+Script'             => 'Marck Script',
	'Margarine'                => 'Margarine',    
	'Marko+One'                => 'Marko One',
	'Marmelad'                 => 'Marmelad',
	'Marvel'                   => 'Marvel',
	'Mate'                     => 'Mate',
	'Mate+SC'                  => 'Mate SC',
	'Maven+Pro'                => 'Maven Pro',
    'McLaren'                  => 'McLaren',    
	'Meddon'                   => 'Meddon',
	'MedievalSharp'            => 'MedievalSharp',
	'Medula+One'               => 'Medula One',
	'Megrim'                   => 'Megrim',
    'Meie+Script'              => 'Meie Script',
    'Merienda'                 => 'Merienda',
	'Merienda+One'             => 'Merienda One',
	'Merriweather'             => 'Merriweather',
    'Merriweather+Sans'        => 'Merriweather Sans',
	'Metal'                    => 'Metal',
    'Metal Mania'              => 'Metal Mania',
	'Metamorphous'             => 'Metamorphous',
	'Metrophobic'              => 'Metrophobic',
	'Michroma'                 => 'Michroma',
	'Milonga'                  => 'Milonga',    
	'Miltonian'                => 'Miltonian',
	'Miltonian+Tattoo'         => 'Miltonian Tattoo',
	'Miniver'                  => 'Miniver',
	'Miss+Fajardose'           => 'Miss Fajardose',
	'Modern+Antiqua'           => 'Modern Antiqua',
	'Molengo'                  => 'Molengo',
    'Molle'                    => 'Molle',
	'Monda'                    => 'Monda',    
	'Monofett'                 => 'Monofett',
	'Monoton'                  => 'Monoton',
	'Monsieur+La+Doulaise'     => 'Monsieur La Doulaise',
	'Montaga'                  => 'Montaga',
	'Montez'                   => 'Montez',
	'Montserrat'               => 'Montserrat',
    'Montserrat+Alternates'    => 'Montserrat Alternates',
    'Montserrat+Subrayada'     => 'Montserrat Subrayada',
	'Moul'                     => 'Moul',
	'Moulpali'                 => 'Moulpali',
	'Mountains+of+Christmas'   => 'Mountains of Christmas',
	'Mouse+Memoirs'            => 'Mouse Memoirs',    
	'Mr+Bedfort'               => 'Mr Bedfort',
	'Mr+Dafoe'                 => 'Mr Dafoe',
	'Mr+De+Haviland'           => 'Mr De Haviland',
	'Mrs+Saint+Delafield'      => 'Mrs Saint Delafield',
	'Mrs+Sheppards'            => 'Mrs Sheppards',
	'Muli'                     => 'Muli',
	'Mystery+Quest'            => 'Mystery Quest',
	'Neucha'                   => 'Neucha',
	'Neuton'                   => 'Neuton',
    'New+Rocker'               => 'New Rocker',    
	'News+Cycle'               => 'News Cycle',
	'Niconne'                  => 'Niconne',
	'Nixie+One'                => 'Nixie One',
	'Nobile'                   => 'Nobile',
	'Nokora'                   => 'Nokora',
	'Norican'                  => 'Norican',
	'Nosifer'                  => 'Nosifer',
	'Nothing+You+Could+Do'     => 'Nothing You Could Do',
	'Noticia+Text'             => 'Noticia Text',
	'Noto+Sans'                => 'Noto Sans',
	'Noto+Serif'               => 'Noto Serif',          
	'Nova+Cut'                 => 'Nova Cut',
	'Nova+Flat'                => 'Nova Flat',
	'Nova+Mono'                => 'Nova Mono',
	'Nova+Oval'                => 'Nova Oval',
	'Nova+Round'               => 'Nova Round',
	'Nova+Script'              => 'Nova Script',
	'Nova+Slim'                => 'Nova Slim',
	'Nova+Square'              => 'Nova Square',
	'Numans'                   => 'Numans',
	'Nunito'                   => 'Nunito',
	'Odor+Mean+Chey'           => 'Odor Mean Chey',
    'Offside'                  => 'Offside',
	'Old+Standard+TT'          => 'Old Standard TT',
	'Oldenburg'                => 'Oldenburg',
	'Oleo+Script'              => 'Oleo Script',
 	'Oleo+Script+Swash+Caps'   => 'Oleo Script Swash Caps',   
	'Open+Sans'                => 'Open Sans',
	'Open+Sans+Condensed'      => 'Open Sans Condensed',
    'Oranienbaum'              => 'Oranienbaum',
	'Orbitron'                 => 'Orbitron',
    'Oregano'                  => 'Oregano',
    'Orienta'                  => 'Orienta',
	'Original+Surfer'          => 'Original Surfer',
	'Oswald'                   => 'Oswald',
	'Over+the+Rainbow'         => 'Over the Rainbow',
	'Overlock'                 => 'Overlock',
	'Overlock+SC'              => 'Overlock SC',
	'Ovo'                      => 'Ovo',
	'Oxygen'                   => 'Oxygen',
    'Oxygen+Mono'              => 'Oxygen Mono',
	'Pacifico'                 => 'Pacifico',
    'Paprika'                  => 'Paprika',
	'Parisienne'               => 'Parisienne',
	'Passero+One'              => 'Passero One',
	'Passion+One'              => 'Passion One',
	'Patrick+Hand'             => 'Patrick Hand',
    'Patrick+Hand+SC'          => 'Patrick Hand SC',
	'Patua+One'                => 'Patua One',
	'Paytone+One'              => 'Paytone One',
    'Peralta'                  => 'Peralta',
	'Permanent+Marker'         => 'Permanent Marker',
    'Petit+Formal+Script'      => 'Petit Formal Script',
	'Petrona'                  => 'Petrona',
	'Philosopher'              => 'Philosopher',
	'Piedra'                   => 'Piedra',
	'Pinyon+Script'            => 'Pinyon Script',
    'Pirata+One'               => 'Pirata One',
	'Plaster'                  => 'Plaster',
	'Play'                     => 'Play',
	'Playball'                 => 'Playball',
	'Playfair+Display'         => 'Playfair Display',
    'Playfair+Display+SC'      => 'Playfair Display SC',
	'Podkova'                  => 'Podkova',
	'Poiret+One'               => 'Poiret One',
	'Poller+One'               => 'Poller One',
	'Poly'                     => 'Poly',
	'Pompiere'                 => 'Pompiere',
	'Pontano+Sans'             => 'Pontano Sans',
	'Port+Lligat+Sans'         => 'Port Lligat Sans',
	'Port+Lligat+Slab'         => 'Port Lligat Slab',
	'Prata'                    => 'Prata',
	'Preahvihear'              => 'Preahvihear',
	'Press+Start+2P'           => 'Press Start 2P',
	'Princess+Sofia'           => 'Princess Sofia',
	'Prociono'                 => 'Prociono',
	'Prosto+One'               => 'Prosto One',
	'PT+Mono'                  => 'PT Mono',
	'PT+Sans'                  => 'PT Sans',
	'PT+Sans+Caption'          => 'PT Sans Caption',
	'PT+Sans+Narrow'           => 'PT Sans Narrow',
	'PT+Serif'                 => 'PT Serif',
	'PT+Serif+Caption'         => 'PT Serif Caption',
	'Puritan'                  => 'Puritan',
    'Purple+Purse'             => 'Purple Purse',
    'Quando'                   => 'Quando',
	'Quantico'                 => 'Quantico',
	'Quattrocento'             => 'Quattrocento',
	'Quattrocento+Sans'        => 'Quattrocento Sans',
	'Questrial'                => 'Questrial',
	'Quicksand'                => 'Quicksand',
	'Quintessential'           => 'Quintessential',    
	'Qwigley'                  => 'Qwigley',
    'Racing+Sans+One'          => 'Racing Sans One',
	'Radley'                   => 'Radley',
	'Raleway'                  => 'Raleway',
    'Raleway+Dots'             => 'Raleway Dots',
    'Rambla'                   => 'Rambla',
	'Rammetto+One'             => 'Rammetto One',
    'Ranchers'                 => 'Ranchers',
	'Rancho'                   => 'Rancho',
	'Rationale'                => 'Rationale',
	'Redressed'                => 'Redressed',
	'Reenie+Beanie'            => 'Reenie Beanie',
	'Revalia'                  => 'Revalia',
	'Ribeye'                   => 'Ribeye',
	'Ribeye+Marrow'            => 'Ribeye Marrow',
	'Righteous'                => 'Righteous',
	'Risque'                   => 'Risque',
	'Roboto'                   => 'Roboto',
    'Roboto+Condensed'         => 'Roboto Condensed',          
	'Rochester'                => 'Rochester',
	'Rock+Salt'                => 'Rock Salt',
	'Rokkitt'                  => 'Rokkitt',
    'Romanesco'                => 'Romanesco',
	'Ropa+Sans'                => 'Ropa Sans',
	'Rosario'                  => 'Rosario',
	'Rosarivo'                 => 'Rosarivo',
	'Rouge+Script'             => 'Rouge Script',
	'Ruda'                     => 'Ruda',
    'Rufina'                   => 'Rufina',
	'Ruge+Boogie'              => 'Ruge Boogie',
	'Ruluko'                   => 'Ruluko',
	'Rum+Raisin'               => 'Rum Raisin',    
	'Ruslan+Display'           => 'Ruslan Display',
	'Russo+One'                => 'Russo One',
	'Ruthie'                   => 'Ruthie',
    'Rye'                      => 'Rye',
    'Sacramento'               => 'Sacramento',
	'Sail'                     => 'Sail',
	'Salsa'                    => 'Salsa',
    'Sanchez'                  => 'Sanchez',
	'Sancreek'                 => 'Sancreek',
	'Sansita+One'              => 'Sansita One',
	'Sarina'                   => 'Sarina',
	'Satisfy'                  => 'Satisfy',
    'Scada'                    => 'Scada',
	'Schoolbell'               => 'Schoolbell',
	'Seaweed+Script'           => 'Seaweed Script',
	'Sevillana'                => 'Sevillana',
    'Seymour+One'              => 'Seymour One',
	'Shadows+Into+Light'       => 'Shadows Into Light',
	'Shadows+Into+Light+Two'   => 'Shadows Into Light Two',
	'Shanti'                   => 'Shanti',
	'Share'                    => 'Share',
    'Share+Tech'               => 'Share Tech',
    'Share+Tech+Mono'          => 'Share Tech Mono',
	'Shojumaru'                => 'Shojumaru',
	'Short+Stack'              => 'Short Stack',
	'Siemreap'                 => 'Siemreap',
	'Sigmar+One'               => 'Sigmar One',
	'Signika'                  => 'Signika',
	'Signika+Negative'         => 'Signika Negative',
	'Simonetta'                => 'Simonetta',
	'Sintony'                  => 'Sintony',    
	'Sirin+Stencil'            => 'Sirin Stencil',
	'Six+Caps'                 => 'Six Caps',
    'Skranji'                  => 'Skranji',
	'Slackey'                  => 'Slackey',
	'Smokum'                   => 'Smokum',
	'Smythe'                   => 'Smythe',
	'Sniglet'                  => 'Sniglet',
	'Snippet'                  => 'Snippet',
	'Snowburst+One'            => 'Snowburst One',  
    'Sofadi+One'               => 'Sofadi One',  
	'Sofia'                    => 'Sofia',
	'Sonsie+One'               => 'Sonsie One',
	'Sorts+Mill+Goudy'         => 'Sorts Mill Goudy',
    'Source+Code+Pro'          => 'Source Code Pro',
    'Source+Sans+Pro'          => 'Source Sans Pro',
	'Special+Elite'            => 'Special Elite',
	'Spicy+Rice'               => 'Spicy Rice',
	'Spinnaker'                => 'Spinnaker',
	'Spirax'                   => 'Spirax',
	'Squada+One'               => 'Squada One',
	'Stalemate'                => 'Stalemate',
    'Stalinist+One'            => 'Stalinist One',        
	'Stardos+Stencil'          => 'Stardos Stencil',
	'Stint+Ultra+Condensed'    => 'Stint Ultra Condensed',
	'Stint+Ultra+Expanded'     => 'Stint Ultra Expanded',
	'Stoke'                    => 'Stoke',
    'Strait'                   => 'Strait',
	'Sue+Ellen+Francisco'      => 'Sue Ellen Francisco',
	'Sunshiney'                => 'Sunshiney',
	'Supermercado+One'         => 'Supermercado One',
	'Suwannaphum'              => 'Suwannaphum',
	'Swanky+And+Moo+Moo'       => 'Swanky and Moo Moo',
	'Syncopate'                => 'Syncopate',
	'Tangerine'                => 'Tangerine',
	'Taprom'                   => 'Taprom',
	'Tauri'                    => 'Tauri',    
	'Telex'                    => 'Telex',
	'Tenor+Sans'               => 'Tenor Sans',
	'Terminal+Dosis'           => 'Terminal Dosis',
    'Text+Me+One'              => 'Text Me One',
	'The+Girl+Next+Door'       => 'The Girl Next Door',
	'Tienne'                   => 'Tienne',
	'Tinos'                    => 'Tinos',
	'Titan+One'                => 'Titan One',
    'Titillium+Web'            => 'Titillium Web',
	'Trade+Winds'              => 'Trade Winds',
	'Trocchi'                  => 'Trocchi',
	'Trochut'                  => 'Trochut',
	'Trykker'                  => 'Trykker',
	'Tulpen+One'               => 'Tulpen One',
	'Ubuntu'                   => 'Ubuntu',
	'Ubuntu+Condensed'         => 'Ubuntu Condensed',
	'Ubuntu+Mono'              => 'Ubuntu Mono',
	'Ultra'                    => 'Ultra',
	'Uncial+Antiqua'           => 'Uncial Antiqua',
    'Underdog'                 => 'Underdog',
    'Unica+One'                => 'Unica One',
	'UnifrakturCook'           => 'UnifrakturCook',
	'UnifrakturMaguntia'       => 'UnifrakturMaguntia',
	'Unkempt'                  => 'Unkempt',
	'Unlock'                   => 'Unlock',
	'Unna'                     => 'Unna',
	'Vampiro+One'              => 'Vampiro One',    
	'Varela'                   => 'Varela',
	'Varela+Round'             => 'Varela Round',
	'Vast+Shadow'              => 'Vast Shadow',
	'Vibur'                    => 'Vibur',
	'Vidaloka'                 => 'Vidaloka',
	'Viga'                     => 'Viga',
	'Voces'                    => 'Voces',
	'Volkhov'                  => 'Volkhov',
	'Vollkorn'                 => 'Vollkorn',
	'Voltaire'                 => 'Voltaire',
	'VT323'                    => 'VT323',
	'Waiting+for+the+Sunrise'  => 'Waiting for the Sunrise',
	'Wallpoet'                 => 'Wallpoet',
	'Walter+Turncoat'          => 'Walter Turncoat',
    'Warnes'                   => 'Warnes',
	'Wellfleet'                => 'Wellfleet',
	'Wendy+One'                => 'Wendy One',    
	'Wire+One'                 => 'Wire One',
	'Yanone+Kaffeesatz'        => 'Yanone Kaffeesatz',
	'Yellowtail'               => 'Yellowtail',
	'Yeseva+One'               => 'Yeseva One',
	'Yesteryear'               => 'Yesteryear',
	'Zeyada'                   => 'Zeyada',
	); 
?>






<div id="content">
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
    
<div class="box">

	<div class="heading">
		<h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
		<div class="buttons">
        <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
        <a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a>
        </div>
	</div>

	<div class="content">    
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

        <div>
		<div style="margin-top:0px; margin-bottom:20px; float:left; display:block">
			<label>Status:</label>
			<select name="oxy_status">
				<?php if ($oxy_status) { ?>
				<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				<?php } ?>
			</select> 
		</div>
        <div style="margin-top:10px; margin-bottom:20px; margin-left:170px;">
			<label><?php echo $entry_skin; ?></label>
            <select name="oxy_skin" id="oxy_skin">
            <?php foreach($color_schema as $key =>   $skin) :?> 
            <option value="<?php echo $key ;  ?>"><?php echo $skin['skin_name']; ?></option>  
            <?php endforeach; ?>                         
            </select>      
            <a id="load_skin" class="button-oxy">Load skin</a>
            <span style="margin-left:50px;">Useful links:</span> 
            <a href="http://321theme.com/oxy/documentation/" class="link" target="_blank">Documentation</a> | 
            <a href="http://321theme.com/oxy/theme_select/" class="link" target="_blank">OXY Demo</a> | 
            <a href="http://321theme.com/support/oxy/" class="link" target="_blank">OXY Support</a><span class="oxy_help_tip"><a id="oxy-help-33" title="" href="#">?</a></span>     
		</div>
        </div>
        
		<div id="settings_tabs" class="htabs">
			<a href="#tab-store-features">General Options</a>
            <a href="#tab-colors-styles">Colors and Styles</a>
            <a href="#tab-background-images">Background Images</a> 
            <a href="#tab-fonts">Fonts</a>                                                                 
			<a href="#tab-footer">Footer</a>
			<a href="#tab-widgets">Widgets</a>  
			<a href="#tab-css">Custom CSS/JavaScript</a>                                      
		</div>        

        
        <div id="tab-store-features">   
        
        <div id="store_features_tabs" class="vtabs">
             <a href="#tab-store-features-layout">Layout</a>
             <a href="#tab-store-features-sliders">Sliders</a>
             <a href="#tab-store-features-header">Header</a>
             <a href="#tab-store-features-main-menu">Main Menu</a>
             <a href="#tab-store-features-homepage">Home Page</a>
             <a href="#tab-store-features-category">Category Page</a> 
             <a href="#tab-store-features-product">Product Page</a>   
             <a href="#tab-store-features-contact">Contact Page</a>  
             <a href="#tab-store-features-lrcolumn">Left/Right Column</a> 
             <a href="#tab-store-features-others">Others</a>                                         
        </div> 
        
        <div id="tab-store-features-layout" class="vtabs-content">  
        
        <table class="form">
        
					<tr>
						<td>Layout style:</td>
						<td>                        
                        <select name="oxy_layout_style" id="oxy_layout_style">
                           <option value="1"<?php if($oxy_layout_style == '1') echo ' selected="selected"';?>><?php echo $text_boxed; ?></option>
                           <option value="2"<?php if($oxy_layout_style == '2') echo ' selected="selected"';?>><?php echo $text_full_width; ?></option>                         
                        </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_36.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
					<tr>
						<td><?php echo $entry_layout_s; ?></td>
						<td>
                        <select name="oxy_layout_s">
                            <option value="1"<?php if($oxy_layout_s == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_layout_s == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>                        
                        </td>
					</tr>
					<tr>
						<td>Maximum width:</td>
						<td>                        
                        <select name="oxy_layout_l">
                           <option value="1"<?php if($oxy_layout_l == '1') echo ' selected="selected"';?>>980px</option>
                           <option value="2"<?php if($oxy_layout_l == '2') echo ' selected="selected"';?><?php if($oxy_layout_l == '') echo ' selected="selected"';?>>1170px</option>
                           <option value="3"<?php if($oxy_layout_l == '3') echo ' selected="selected"';?>>1440px</option>                          
                        </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_35.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                                                                                                                                                
                          
		 </table>        
        
        </div>  
        
        <div id="tab-store-features-sliders" class="vtabs-content">
        
        <table class="form">

					<tr>
						<td colspan="2"><div><b>Banner Slider</b></div></td>
					</tr>
					<tr>
						<td>Banner slider type:</td>
						<td>
                        <select name="oxy_homepage_banner_slider_type">
                            <option value="1"<?php if($oxy_homepage_banner_slider_type == '1') echo ' selected="selected"';?>>Camera Slider</option>
                            <option value="2"<?php if($oxy_homepage_banner_slider_type == '2') echo ' selected="selected"';?>>Flexslider</option>
                            <option value="3"<?php if($oxy_homepage_banner_slider_type == '3') echo ' selected="selected"';?>>Nivo Slider</option>
			            </select>                     
                        </td>
					</tr>
                          
		 </table>        
         
        <table class="form oxy_sep">

					<tr>
						<td colspan="2"><div><b>Bestseller Products</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_1.jpg" target="_blank">?</a></span></div></td>
					</tr>
					<tr>
						<td>Bestseller products style:</td>
						<td>
                        <select name="oxy_homepage_bestseller_status">
                            <option value="0"<?php if($oxy_homepage_bestseller_status == '0') echo ' selected="selected"';?>><?php echo $text_grid; ?></option>    
                            <option value="1"<?php if($oxy_homepage_bestseller_status == '1') echo ' selected="selected"';?>><?php echo $text_slider; ?></option>                     
			            </select>
                        </td>
					</tr>
                          
		 </table>           
        
        <table class="form">

					<tr>
						<td colspan="2"><div><b>Featured Products</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_1.jpg" target="_blank">?</a></span></div></td>
					</tr>
					<tr>
						<td>Featured products style:</td>
						<td>
                        <select name="oxy_homepage_featured_status">
                            <option value="0"<?php if($oxy_homepage_featured_status == '0') echo ' selected="selected"';?>><?php echo $text_grid; ?></option>  
                            <option value="1"<?php if($oxy_homepage_featured_status == '1') echo ' selected="selected"';?>><?php echo $text_slider; ?></option>                       
			            </select>                        
                        </td>
					</tr>
                          
		 </table> 
         
        <table class="form oxy_sep">

					<tr>
						<td colspan="2"><div><b>Latest Products</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_1.jpg" target="_blank">?</a></span></div></td>
					</tr>
					<tr>
						<td>Latest products style:</td>
						<td>
                        <select name="oxy_homepage_latest_status">
                            <option value="0"<?php if($oxy_homepage_latest_status == '0') echo ' selected="selected"';?>><?php echo $text_grid; ?></option>  
                            <option value="1"<?php if($oxy_homepage_latest_status == '1') echo ' selected="selected"';?>><?php echo $text_slider; ?></option>                      
			            </select>
                        </td>
					</tr>
                          
		 </table> 	
         
        <table class="form">

					<tr>
						<td colspan="2"><div><b>Special Products</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_1.jpg" target="_blank">?</a></span></div></td>
					</tr>
					<tr>
						<td>Special products style:</td>
						<td>
                        <select name="oxy_homepage_specials_status">
                            <option value="0"<?php if($oxy_homepage_specials_status == '0') echo ' selected="selected"';?>><?php echo $text_grid; ?></option>  
                            <option value="1"<?php if($oxy_homepage_specials_status == '1') echo ' selected="selected"';?>><?php echo $text_slider; ?></option>                      
			            </select>
                        </td>
					</tr>
                          
		 </table>                
     			
        </div>        
        
        <div id="tab-store-features-header" class="vtabs-content">  
        
        <table class="form">
        
					<tr>
						<td>Fixed Header (Mini Header):</td>
						<td>                        
                        <select name="oxy_header_fixed_header_status">
                            <option value="1"<?php if($oxy_header_fixed_header_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_header_fixed_header_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_2.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
                    <tr>
						<td>Quick Search Auto-Suggest:</td>
						<td>                        
                        <select name="oxy_header_auto_suggest_status">
                            <option value="1"<?php if($oxy_header_auto_suggest_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_header_auto_suggest_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_3.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
                    <tr>
						<td>Logo position:</td>
						<td>                        
                        <select name="oxy_logo_position">
                           <option value="left"<?php if($oxy_logo_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>                          
                           <option value="center"<?php if($oxy_logo_position == 'center') echo ' selected="selected"';?>><?php echo $text_position_c; ?></option>                         
                        </select>
                        </td>
					</tr>                    
					<tr>
						<td>Search Bar position:</td>
						<td>                        
                        <select name="oxy_search_bar_position" id="oxy_search_bar_position">
                           <option value="right"<?php if($oxy_search_bar_position == 'right') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>
                           <option value="center"<?php if($oxy_search_bar_position == 'center') echo ' selected="selected"';?><?php if($oxy_search_bar_position == '') echo ' selected="selected"';?>><?php echo $text_position_c; ?></option>
                           <option value="left"<?php if($oxy_search_bar_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>                           
                        </select>
                        </td>
					</tr>                                                                                                                                                             
                          
		 </table>        
        
        </div>        
        
        <div id="tab-store-features-main-menu" class="vtabs-content">    
        
        <table class="form oxy_sep">
        
					<tr>
						<td colspan="2"><div><b>Home Page Link</b></div></td>
					</tr>  
					<tr>
						<td>Show home page link:</td>
						<td>			
                        <select name="oxy_menu_homepage_status">
                            <option value="1"<?php if($oxy_menu_homepage_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_menu_homepage_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>
                     <tr>
						<td>Home Page link style:</td>
						<td>
                        <select name="oxy_menu_homepage_style">    
                           <option value="1"<?php if($oxy_menu_homepage_style == '1') echo ' selected="selected"';?>><?php echo $text_icon; ?></option>      
                           <option value="2"<?php if($oxy_menu_homepage_style == '2') echo ' selected="selected"';?><?php if($oxy_menu_homepage_style == '') echo ' selected="selected"';?>><?php echo $text_text; ?></option>                               
                        </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_4.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                          
		 </table>            
        
        <table class="form">
        
					<tr>
						<td colspan="2"><div><b>Categories</b></div></td>
					</tr>
					<tr>
						<td>Show Categories:</td>
						<td>
                        <select name="oxy_menu_categories_status">
                            <option value="1"<?php if($oxy_menu_categories_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_menu_categories_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>                        
                        </td>
					</tr>
					<tr>
						<td>Categories display style:</td>
						<td>			
                        <select name="oxy_menu_categories_style">
                           <option value="1"<?php if($oxy_menu_categories_style == '1') echo ' selected="selected"';?>><?php echo $text_opencart; ?></option>
                           <option value="2"<?php if($oxy_menu_categories_style == '2') echo ' selected="selected"';?><?php if($oxy_menu_categories_style == '') echo ' selected="selected"';?>><?php echo $text_vertical; ?></option>
                           <option value="3"<?php if($oxy_menu_categories_style == '3') echo ' selected="selected"';?>><?php echo $text_horizontal; ?></option>                           
                        </select> 
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_5.jpg" target="_blank">?</a></span>        
                        </td>
					</tr>
					<tr>
						<td>Show category icons:<br /><span class="oxy_help">(only horizontal style)</span></td>
						<td>
                        <select name="oxy_mm2_main_category_icon_status">
                            <option value="1"<?php if($oxy_mm2_main_category_icon_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_mm2_main_category_icon_status == '0') echo ' selected="selected"';?><?php if($oxy_mm2_main_category_icon_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>  
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_6.jpg" target="_blank">?</a></span>                         
                        </td>
					</tr>
                    <tr>
						<td>Categories per row:<br /><span class="oxy_help">(only horizontal style)</span></td>
                        <td>
                        <select name="oxy_menu_categories_per_row">
                           <option value="3"<?php if($oxy_menu_categories_per_row == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_menu_categories_per_row == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_menu_categories_per_row == '5') echo ' selected="selected"';?><?php if($oxy_menu_categories_per_row == '') echo ' selected="selected"';?>>5</option>
                           <option value="6"<?php if($oxy_menu_categories_per_row == '6') echo ' selected="selected"';?>>6</option>                        
                        </select>
                        </td>
					</tr>      
                    <tr>
						<td>Show 3 level category:</td>
						<td>
                        <select name="oxy_menu_categories_3_level">
                            <option value="1"<?php if($oxy_menu_categories_3_level == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_menu_categories_3_level == '0') echo ' selected="selected"';?><?php if($oxy_menu_categories_3_level == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>   
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_7.jpg" target="_blank">?</a></span>                         
                        </td>
					</tr>                  
                          
		 </table>
         
        <table class="form oxy_sep">
        
					<tr>
						<td colspan="2"><div><b>Brands</b></div></td>
					</tr>
					<tr>
						<td>Show Brands:</td>
						<td>
                        <select name="oxy_menu_brands_status">
                            <option value="1"<?php if($oxy_menu_brands_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_menu_brands_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>       
                        <span class="oxy_help_tip"><a id="oxy-help-34" title="" href="#">?</a></span>                      
                        </td>
					</tr>
                                     
                    <tr>
						<td>Brands display style:</td>
                        <td>
                        <select name="oxy_menu_brands_style">
                           <option value="1"<?php if($oxy_menu_brands_style == '1') echo ' selected="selected"';?>><?php echo $text_brand_logo; ?></option>
                           <option value="2"<?php if($oxy_menu_brands_style == '2') echo ' selected="selected"';?><?php if($oxy_menu_brands_style == '') echo ' selected="selected"';?>><?php echo $text_brand_name; ?></option>
                           <option value="3"<?php if($oxy_menu_brands_style == '3') echo ' selected="selected"';?>><?php echo $text_brand_logo_name; ?></option>                           
                        </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_8.jpg" target="_blank">?</a></span> 
                        </td>
					</tr>                                             
                    
                    <tr>
						<td>Brands per row:</td>
                        <td>
                        <select name="oxy_menu_brands_per_row">
                           <option value="3"<?php if($oxy_menu_brands_per_row == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_menu_brands_per_row == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_menu_brands_per_row == '5') echo ' selected="selected"';?>>5</option>
                           <option value="6"<?php if($oxy_menu_brands_per_row == '6') echo ' selected="selected"';?><?php if($oxy_menu_brands_per_row == '') echo ' selected="selected"';?>>6</option>
                           <option value="8"<?php if($oxy_menu_brands_per_row == '8') echo ' selected="selected"';?>>8</option>
                           <option value="10"<?php if($oxy_menu_brands_per_row == '10') echo ' selected="selected"';?>>10</option>
                           <option value="12"<?php if($oxy_menu_brands_per_row == '12') echo ' selected="selected"';?>>12</option>                            
                        </select>
                        </td>
					</tr>                 
                          
		 </table>                                       
                         
        
        <table class="form">
        
					<tr>
						<td colspan="5"><div><b>Custom Links</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_9.jpg" target="_blank">?</a></span></div></td>
					</tr>
         			<tr>
						<td>Link 1:</td>
						<td width="70">
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_link_1_status"<?php if($oxy_menu_link_1_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td width="150">
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_link_1<?php echo $language['language_id']; ?>" id="oxy_menu_link_1<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_link_1' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td width="140">
                        url:<br /><input type="text" name="oxy_menu_link_1_url" value="<?php echo $oxy_menu_link_1_url; ?>" />
                        </td>  
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_link_1_target">
                            <option value="_self"<?php if($oxy_menu_link_1_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_link_1_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                        
					</tr> 

         			<tr>
						<td>Link 2:</td>
						<td>
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_link_2_status"<?php if($oxy_menu_link_2_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td>
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_link_2<?php echo $language['language_id']; ?>" id="oxy_menu_link_2<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_link_2' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td>
                        url:<br /><input type="text" name="oxy_menu_link_2_url" value="<?php echo $oxy_menu_link_2_url; ?>" />
                        </td>
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_link_2_target">
                            <option value="_self"<?php if($oxy_menu_link_2_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_link_2_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                                                   
					</tr> 
                    
         			<tr>
						<td>Link 3:</td>
						<td>
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_link_3_status"<?php if($oxy_menu_link_3_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td>
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_link_3<?php echo $language['language_id']; ?>" id="oxy_menu_link_3<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_link_3' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td>
                        url:<br /><input type="text" name="oxy_menu_link_3_url" value="<?php echo $oxy_menu_link_3_url; ?>" />
                        </td> 
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_link_3_target">
                            <option value="_self"<?php if($oxy_menu_link_3_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_link_3_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                                                  
					</tr>
                    
         			<tr>
						<td>Link 4:</td>
						<td>
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_link_4_status"<?php if($oxy_menu_link_4_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td>
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_link_4<?php echo $language['language_id']; ?>" id="oxy_menu_link_4<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_link_4' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td>
                        url:<br /><input type="text" name="oxy_menu_link_4_url" value="<?php echo $oxy_menu_link_4_url; ?>" />
                        </td>
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_link_4_target">
                            <option value="_self"<?php if($oxy_menu_link_4_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_link_4_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                                                   
					</tr>  
         
         			<tr>
						<td>Link 5:</td>
						<td>
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_link_5_status"<?php if($oxy_menu_link_5_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td>
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_link_5<?php echo $language['language_id']; ?>" id="oxy_menu_link_5<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_link_5' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td>
                        url:<br /><input type="text" name="oxy_menu_link_5_url" value="<?php echo $oxy_menu_link_5_url; ?>" />
                        </td>
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_link_5_target">
                            <option value="_self"<?php if($oxy_menu_link_5_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_link_5_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                                                   
					</tr>
                    
         			<tr>
						<td>Link 6:</td>
						<td>
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_link_6_status"<?php if($oxy_menu_link_6_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td>
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_link_6<?php echo $language['language_id']; ?>" id="oxy_menu_link_6<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_link_6' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td>
                        url:<br /><input type="text" name="oxy_menu_link_6_url" value="<?php echo $oxy_menu_link_6_url; ?>" />
                        </td>
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_link_6_target">
                            <option value="_self"<?php if($oxy_menu_link_6_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_link_6_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                                                   
					</tr> 
                    
         			<tr>
						<td>Link 7:</td>
						<td>
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_link_7_status"<?php if($oxy_menu_link_7_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td>
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_link_7<?php echo $language['language_id']; ?>" id="oxy_menu_link_7<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_link_7' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td>
                        url:<br /><input type="text" name="oxy_menu_link_7_url" value="<?php echo $oxy_menu_link_7_url; ?>" />
                        </td>
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_link_7_target">
                            <option value="_self"<?php if($oxy_menu_link_7_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_link_7_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                                                   
					</tr>     
                    
         			<tr>
						<td>Link 8:</td>
						<td>
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_link_8_status"<?php if($oxy_menu_link_8_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td>
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_link_8<?php echo $language['language_id']; ?>" id="oxy_menu_link_8<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_link_8' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td>
                        url:<br /><input type="text" name="oxy_menu_link_8_url" value="<?php echo $oxy_menu_link_8_url; ?>" />
                        </td>
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_link_8_target">
                            <option value="_self"<?php if($oxy_menu_link_8_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_link_8_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                                                   
					</tr> 
            
         			<tr>
						<td>Link 9:</td>
						<td>
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_link_9_status"<?php if($oxy_menu_link_9_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td>
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_link_9<?php echo $language['language_id']; ?>" id="oxy_menu_link_9<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_link_9' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td>
                        url:<br /><input type="text" name="oxy_menu_link_9_url" value="<?php echo $oxy_menu_link_9_url; ?>" />
                        </td>
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_link_9_target">
                            <option value="_self"<?php if($oxy_menu_link_9_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_link_9_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                                                   
					</tr>  
                    
         			<tr>
						<td>Link 10:</td>
						<td>
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_link_10_status"<?php if($oxy_menu_link_10_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td>
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_link_10<?php echo $language['language_id']; ?>" id="oxy_menu_link_10<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_link_10' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td>
                        url:<br /><input type="text" name="oxy_menu_link_10_url" value="<?php echo $oxy_menu_link_10_url; ?>" />
                        </td>
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_link_10_target">
                            <option value="_self"<?php if($oxy_menu_link_10_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_link_10_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                                                   
					</tr>                                                                                                                                                                          
                                             
		 </table>  
         
         <table class="form oxy_sep">
        
					<tr>
						<td colspan="5"><div><b>Custom Menu</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_10.jpg" target="_blank">?</a></span></div></td>
					</tr>
                    <tr>
						<td>Show Custom Menu:</td>
						<td colspan="4">
                        <select name="oxy_menu_cm_status">
                            <option value="1"<?php if($oxy_menu_cm_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_menu_cm_status == '0') echo ' selected="selected"';?><?php if($oxy_menu_cm_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>  
                        </td>
					</tr>
                    <tr>
						<td><?php echo $text_title; ?></td>
                        <td colspan="4">
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_cm_title<?php echo $language['language_id']; ?>" id="oxy_menu_cm_title<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_cm_title' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
					</tr>
         			<tr>
						<td>Link 1:</td>
						<td width="70">
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_cm_link_1_status"<?php if($oxy_menu_cm_link_1_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td width="150">
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_cm_link_1<?php echo $language['language_id']; ?>" id="oxy_menu_cm_link_1<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_cm_link_1' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td width="140">
                        url:<br /><input type="text" name="oxy_menu_cm_link_1_url" value="<?php echo $oxy_menu_cm_link_1_url; ?>" />
                        </td>  
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_cm_link_1_target">
                            <option value="_self"<?php if($oxy_menu_cm_link_1_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_cm_link_1_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                        
					</tr> 
                    
         			<tr>
						<td>Link 2:</td>
						<td>
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_cm_link_2_status"<?php if($oxy_menu_cm_link_2_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td>
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_cm_link_2<?php echo $language['language_id']; ?>" id="oxy_menu_cm_link_2<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_cm_link_2' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td>
                        url:<br /><input type="text" name="oxy_menu_cm_link_2_url" value="<?php echo $oxy_menu_cm_link_2_url; ?>" />
                        </td>
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_cm_link_2_target">
                            <option value="_self"<?php if($oxy_menu_cm_link_2_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_cm_link_2_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                                                   
					</tr> 
                    
         			<tr>
						<td>Link 3:</td>
						<td>
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_cm_link_3_status"<?php if($oxy_menu_cm_link_3_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td>
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_cm_link_3<?php echo $language['language_id']; ?>" id="oxy_menu_cm_link_3<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_cm_link_3' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td>
                        url:<br /><input type="text" name="oxy_menu_cm_link_3_url" value="<?php echo $oxy_menu_cm_link_3_url; ?>" />
                        </td> 
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_cm_link_3_target">
                            <option value="_self"<?php if($oxy_menu_cm_link_3_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_cm_link_3_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                                                  
					</tr>
                    
         			<tr>
						<td>Link 4:</td>
						<td>
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_cm_link_4_status"<?php if($oxy_menu_cm_link_4_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td>
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_cm_link_4<?php echo $language['language_id']; ?>" id="oxy_menu_cm_link_4<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_cm_link_4' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td>
                        url:<br /><input type="text" name="oxy_menu_cm_link_4_url" value="<?php echo $oxy_menu_cm_link_4_url; ?>" />
                        </td>
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_cm_link_4_target">
                            <option value="_self"<?php if($oxy_menu_cm_link_4_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_cm_link_4_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                                                   
					</tr>  
         
         			<tr>
						<td>Link 5:</td>
						<td>
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_cm_link_5_status"<?php if($oxy_menu_cm_link_5_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td>
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_cm_link_5<?php echo $language['language_id']; ?>" id="oxy_menu_cm_link_5<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_cm_link_5' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td>
                        url:<br /><input type="text" name="oxy_menu_cm_link_5_url" value="<?php echo $oxy_menu_cm_link_5_url; ?>" />
                        </td>
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_cm_link_5_target">
                            <option value="_self"<?php if($oxy_menu_cm_link_5_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_cm_link_5_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                                                   
					</tr>
                    
         			<tr>
						<td>Link 6:</td>
						<td>
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_cm_link_6_status"<?php if($oxy_menu_cm_link_6_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td>
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_cm_link_6<?php echo $language['language_id']; ?>" id="oxy_menu_cm_link_6<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_cm_link_6' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td>
                        url:<br /><input type="text" name="oxy_menu_cm_link_6_url" value="<?php echo $oxy_menu_cm_link_6_url; ?>" />
                        </td>
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_cm_link_6_target">
                            <option value="_self"<?php if($oxy_menu_cm_link_6_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_cm_link_6_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                                                   
					</tr> 
                    
         			<tr>
						<td>Link 7:</td>
						<td>
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_cm_link_7_status"<?php if($oxy_menu_cm_link_7_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td>
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_cm_link_7<?php echo $language['language_id']; ?>" id="oxy_menu_cm_link_7<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_cm_link_7' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td>
                        url:<br /><input type="text" name="oxy_menu_cm_link_7_url" value="<?php echo $oxy_menu_cm_link_7_url; ?>" />
                        </td>
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_cm_link_7_target">
                            <option value="_self"<?php if($oxy_menu_cm_link_7_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_cm_link_7_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                                                   
					</tr>     
                    
         			<tr>
						<td>Link 8:</td>
						<td>
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_cm_link_8_status"<?php if($oxy_menu_cm_link_8_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td>
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_cm_link_8<?php echo $language['language_id']; ?>" id="oxy_menu_cm_link_8<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_cm_link_8' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td>
                        url:<br /><input type="text" name="oxy_menu_cm_link_8_url" value="<?php echo $oxy_menu_cm_link_8_url; ?>" />
                        </td>
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_cm_link_8_target">
                            <option value="_self"<?php if($oxy_menu_cm_link_8_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_cm_link_8_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                                                   
					</tr> 
            
         			<tr>
						<td>Link 9:</td>
						<td>
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_cm_link_9_status"<?php if($oxy_menu_cm_link_9_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td>
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_cm_link_9<?php echo $language['language_id']; ?>" id="oxy_menu_cm_link_9<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_cm_link_9' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td>
                        url:<br /><input type="text" name="oxy_menu_cm_link_9_url" value="<?php echo $oxy_menu_cm_link_9_url; ?>" />
                        </td>
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_cm_link_9_target">
                            <option value="_self"<?php if($oxy_menu_cm_link_9_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_cm_link_9_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                                                   
					</tr>  
                    
         			<tr>
						<td>Link 10:</td>
						<td>
                        <div style="float:left">
                        <label class="s_checkbox"><input type="checkbox" value="1" name="oxy_menu_cm_link_10_status"<?php if($oxy_menu_cm_link_10_status == '1') echo ' checked="checked"';?> />
                         Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>
                        <td>
                        <?php echo $text_title; ?><br />
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_menu_cm_link_10<?php echo $language['language_id']; ?>" id="oxy_menu_cm_link_10<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_cm_link_10' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
						<td>
                        url:<br /><input type="text" name="oxy_menu_cm_link_10_url" value="<?php echo $oxy_menu_cm_link_10_url; ?>" />
                        </td>
                      	<td>
                        Open:<br />
                        <select name="oxy_menu_cm_link_10_target">
                            <option value="_self"<?php if($oxy_menu_cm_link_10_target == '_self') echo ' selected="selected"';?>><?php echo $text_tself; ?></option>
                            <option value="_blank"<?php if($oxy_menu_cm_link_10_target == '_blank') echo ' selected="selected"';?>><?php echo $text_tblank; ?></option>                        
			            </select>                          
                        </td>                                                   
					</tr>                                                                                                                                                                          
                                             
		 </table> 
         
        <table class="form">
        
					<tr>
						<td colspan="2"><div><b>Custom Block 1</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_11.jpg" target="_blank">?</a></span></div></td>
					</tr>
					<tr>
						<td>Show Custom Block:</td>
						<td>
                        <select name="oxy_menu_custom_block_1_status">
                            <option value="1"<?php if($oxy_menu_custom_block_1_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_menu_custom_block_1_status == '0') echo ' selected="selected"';?><?php if($oxy_menu_custom_block_1_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>  
                        </td>
					</tr>
                    
		 </table>                     
                    
                   <div id="menu_oxy_custom" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_menu_custom<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_menu_custom<?php echo $language['language_id']; ?>">
                   <table class="form">         
				     <tr>
						<td><?php echo $text_title; ?></td>
						<td><input type="text" name="oxy_menu_custom_block_title_1<?php echo $language['language_id']; ?>" id="oxy_menu_custom_block_title_1<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_custom_block_title_1' . $language['language_id']}; ?>" /></td>
					 </tr>                      
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_menu_custom_block_content_1<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_menu_custom_block_content_1' . $language['language_id']}) ? ${'oxy_menu_custom_block_content_1' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?>                         

         
        <table class="form">
        
					<tr>
						<td colspan="2"><div><b>Custom Block 2</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_11.jpg" target="_blank">?</a></span></div></td>
					</tr>
					<tr>
						<td>Show Custom Block:</td>
						<td>
                        <select name="oxy_menu_custom_block_2_status">
                            <option value="1"<?php if($oxy_menu_custom_block_2_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_menu_custom_block_2_status == '0') echo ' selected="selected"';?><?php if($oxy_menu_custom_block_2_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>  
                        </td>
					</tr>

		 </table>  
                    
                   <div id="menu_oxy_custom_2" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_menu_custom_2<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_menu_custom_2<?php echo $language['language_id']; ?>">
                   <table class="form">         
				     <tr>
						<td><?php echo $text_title; ?></td>
						<td><input type="text" name="oxy_menu_custom_block_title_2<?php echo $language['language_id']; ?>" id="oxy_menu_custom_block_title_2<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_custom_block_title_2' . $language['language_id']}; ?>" /></td>
					 </tr>                      
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_menu_custom_block_content_2<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_menu_custom_block_content_2' . $language['language_id']}) ? ${'oxy_menu_custom_block_content_2' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?>                    


        <table class="form">
        
					<tr>
						<td colspan="2"><div><b>Custom Block 3</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_11.jpg" target="_blank">?</a></span></div></td>
					</tr>
					<tr>
						<td>Show Custom Block:</td>
						<td>
                        <select name="oxy_menu_custom_block_3_status">
                            <option value="1"<?php if($oxy_menu_custom_block_3_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_menu_custom_block_3_status == '0') echo ' selected="selected"';?><?php if($oxy_menu_custom_block_3_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>  
                        </td>
					</tr>                        
                          
		 </table>     
         
                   <div id="menu_oxy_custom_3" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_menu_custom_3<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_menu_custom_3<?php echo $language['language_id']; ?>">
                   <table class="form">         
				     <tr>
						<td><?php echo $text_title; ?></td>
						<td><input type="text" name="oxy_menu_custom_block_title_3<?php echo $language['language_id']; ?>" id="oxy_menu_custom_block_title_3<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_menu_custom_block_title_3' . $language['language_id']}; ?>" /></td>
					 </tr>                      
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_menu_custom_block_content_3<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_menu_custom_block_content_3' . $language['language_id']}) ? ${'oxy_menu_custom_block_content_3' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?>      
                   
             
        <table class="form oxy_sep">
        
					<tr>
						<td colspan="2"><div><b>Information Pages</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_12.jpg" target="_blank">?</a></span></div></td>
					</tr>
					<tr>
						<td>Show Information Pages:</td>
						<td>
                        <select name="oxy_menu_information_pages_status">
                            <option value="1"<?php if($oxy_menu_information_pages_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_menu_information_pages_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>                           
                        </td>
					</tr>
                          
		 </table>                        
         
        <table class="form">
        
					<tr>
						<td colspan="2"><div><b>Contacts</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_13.jpg" target="_blank">?</a></span></div></td>
					</tr>
					<tr>
						<td>Show Contacts Block:</td>
						<td>
                        <select name="oxy_menu_contacts_block_status">
                            <option value="1"<?php if($oxy_menu_contacts_block_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_menu_contacts_block_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>
					<tr>
						<td>Show Contacts:</td>
						<td>
                        <select name="oxy_menu_contacts_status">
                            <option value="1"<?php if($oxy_menu_contacts_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_menu_contacts_status == '0') echo ' selected="selected"';?><?php if($oxy_menu_contacts_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr> 
                    <tr>
						<td>Show Address and Office Opening Hours:</td>
						<td>
                        <select name="oxy_menu_contacts_address_status">
                            <option value="1"<?php if($oxy_menu_contacts_address_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_menu_contacts_address_status == '0') echo ' selected="selected"';?><?php if($oxy_menu_contacts_address_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>                            
                          
		 </table> 
     			
        </div> 
           
        <div id="tab-store-features-homepage" class="vtabs-content">              
         
        <table class="form">
        
					<tr>
						<td colspan="2"><div><b>Category Wall</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_14.jpg" target="_blank">?</a></span></div></td>
					</tr>
					<tr>
						<td>Show category wall:</td>
						<td>
                        <select name="oxy_homepage_category_wall_status">
                            <option value="1"<?php if($oxy_homepage_category_wall_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_homepage_category_wall_status == '0') echo ' selected="selected"';?><?php if($oxy_homepage_category_wall_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>                        
                        </td>
					</tr>
					<tr>
						<td>Show category icons:</td>
						<td>
                        <select name="oxy_homepage_category_wall_icon_status">
                            <option value="1"<?php if($oxy_homepage_category_wall_icon_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_homepage_category_wall_icon_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>   
                        </td>
					</tr>                    
                    <tr>
						<td>Categories per row:</td>
                        <td>
                        <select name="oxy_homepage_category_wall_per_row">                         
                           <option value="three"<?php if($oxy_homepage_category_wall_per_row == 'three') echo ' selected="selected"';?>>4</option>
                           <option value="five-noc"<?php if($oxy_homepage_category_wall_per_row == 'five-noc') echo ' selected="selected"';?>>5</option>     
                           <option value="two"<?php if($oxy_homepage_category_wall_per_row == 'two') echo ' selected="selected"';?>>6</option>
                        </select>
                        </td>
					</tr>                       
                    <tr>
						<td>Subcategories per column:</td>
                        <td>
                        <select name="oxy_homepage_category_wall_sub_number">
                           <option value="2"<?php if($oxy_homepage_category_wall_sub_number == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_homepage_category_wall_sub_number == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_homepage_category_wall_sub_number == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_homepage_category_wall_sub_number == '5') echo ' selected="selected"';?><?php if($oxy_homepage_category_wall_sub_number == '') echo ' selected="selected"';?>>5</option>
                           <option value="6"<?php if($oxy_homepage_category_wall_sub_number == '6') echo ' selected="selected"';?>>6</option>
                           <option value="7"<?php if($oxy_homepage_category_wall_sub_number == '7') echo ' selected="selected"';?>>7</option>
                           <option value="8"<?php if($oxy_homepage_category_wall_sub_number == '8') echo ' selected="selected"';?>>8</option>
                           <option value="9"<?php if($oxy_homepage_category_wall_sub_number == '9') echo ' selected="selected"';?>>9</option>
                           <option value="10"<?php if($oxy_homepage_category_wall_sub_number == '10') echo ' selected="selected"';?>>10</option>
                        </select>
                        </td>
					</tr>   
                          
		 </table>
         
        <table class="form oxy_sep">
					<tr>
						<td colspan="2"><div><b>Brands Wall</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_15.jpg" target="_blank">?</a></span></div></td>
					</tr>
					<tr>
						<td>Show brands wall:</td>
						<td>
                        <select name="oxy_homepage_brands_wall_status">
                            <option value="1"<?php if($oxy_homepage_brands_wall_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_homepage_brands_wall_status == '0') echo ' selected="selected"';?><?php if($oxy_homepage_brands_wall_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>                          
                        </td>
					</tr>
                    <tr>
						<td>Brands display style:</td>
                        <td>
                        <select name="oxy_homepage_brands_wall_style">
                           <option value="1"<?php if($oxy_homepage_brands_wall_style == '1') echo ' selected="selected"';?>><?php echo $text_brand_logo; ?></option>
                           <option value="2"<?php if($oxy_homepage_brands_wall_style == '2') echo ' selected="selected"';?>><?php echo $text_brand_name; ?></option>
                           <option value="3"<?php if($oxy_homepage_brands_wall_style == '3') echo ' selected="selected"';?>><?php echo $text_brand_logo_name; ?></option>                           
                        </select>
                        </td>
					</tr>                       
                    <tr>
						<td>Brands per row:</td>
                        <td>
                        <select name="oxy_homepage_brands_wall_per_row">
                           <option value="three"<?php if($oxy_homepage_brands_wall_per_row == 'three') echo ' selected="selected"';?>>4</option>
                           <option value="five-noc"<?php if($oxy_homepage_brands_wall_per_row == 'five-noc') echo ' selected="selected"';?>>5</option>     
                           <option value="two"<?php if($oxy_homepage_brands_wall_per_row == 'two') echo ' selected="selected"';?>>6</option>
                        </select>
                        </td>
					</tr>                        
                          
		 </table>         
     			
        </div>
        
        <div id="tab-store-features-category" class="vtabs-content">
        
        <table class="form">     

					<tr>
						<td>Default products display:</td>
						<td>
                        <select name="oxy_category_prod_display">
                            <option value="grid"<?php if($oxy_category_prod_display == 'grid') echo ' selected="selected"';?>><?php echo $text_grid; ?></option>
                            <option value="list"<?php if($oxy_category_prod_display == 'list') echo ' selected="selected"';?>><?php echo $text_list; ?></option>                        
			            </select>
                        <span class="oxy_help">Clear your browser cache to see the changes.</span>   
                        </td>
					</tr>
                    
		 </table>         
        
        <table class="form oxy_sep">
      
					<tr>
						<td colspan="2"><div><b>Subcategories</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_16.jpg" target="_blank">?</a></span></div></td>
					</tr>        
        			<tr>
						<td>Show subcategories:</td>
						<td>
                        <select name="oxy_category_subcategories_status">
                            <option value="1"<?php if($oxy_category_subcategories_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_category_subcategories_status == '0') echo ' selected="selected"';?><?php if($oxy_category_subcategories_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>                          
                        </td>
					</tr>
					<tr>
						<td>Subcategories style:</td>
						<td>
                        <select name="oxy_category_subcategories_style">
                            <option value="1"<?php if($oxy_category_subcategories_style == '1') echo ' selected="selected"';?>><?php echo $text_opencart; ?></option>
                            <option value="0"<?php if($oxy_category_subcategories_style == '0') echo ' selected="selected"';?><?php if($oxy_category_subcategories_style == '') echo ' selected="selected"';?>><?php echo $text_oxy; ?></option>                        
			            </select>
                        </td>
					</tr>
                    
		 </table>   
         
        <table class="form">
      
					<tr>
						<td colspan="2"><div><b>Product Grid</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_17.jpg" target="_blank">?</a></span></div></td>
					</tr>        
					<tr>
						<td>Products in a row:</td>
						<td>                        
                        <select name="oxy_layout_pb_noc">
                           <option value="six"<?php if($oxy_layout_pb_noc == 'six') echo ' selected="selected"';?>>2</option>
                           <option value="four"<?php if($oxy_layout_pb_noc == 'four') echo ' selected="selected"';?>>3</option>
                           <option value="three"<?php if($oxy_layout_pb_noc == 'three') echo ' selected="selected"';?><?php if($oxy_layout_pb_noc == '') echo ' selected="selected"';?>>4</option>
                           <option value="five-noc"<?php if($oxy_layout_pb_noc == 'five-noc') echo ' selected="selected"';?>>5</option>     
                           <option value="two"<?php if($oxy_layout_pb_noc == 'two') echo ' selected="selected"';?>>6</option>
                           <option value="seven-noc"<?php if($oxy_layout_pb_noc == 'seven-noc') echo ' selected="selected"';?>>7</option> 
                           <option value="eight-noc"<?php if($oxy_layout_pb_noc == 'eight-noc') echo ' selected="selected"';?>>8</option>                                 
                        </select>
                        </td>
					</tr>
                    
		 </table>                
         
        <table class="form oxy_sep">
                                                                                                                                                                                                   
					<tr>
						<td colspan="2"><div><b>Product Box</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_18.jpg" target="_blank">?</a></span></div></td>
					</tr>
                    <tr>
						<td>Show sale badge:</td>
						<td>
                        <select name="oxy_category_sale_badge_status">
                            <option value="1"<?php if($oxy_category_sale_badge_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_category_sale_badge_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>                      
                    <tr>
						<td>Show product name:</td>
						<td>
                        <select name="oxy_category_prod_name_status">
                            <option value="1"<?php if($oxy_category_prod_name_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_category_prod_name_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr> 
                    <tr>
						<td>Show product brand:</td>
						<td>
                        <select name="oxy_category_prod_brand_status">
                            <option value="1"<?php if($oxy_category_prod_brand_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_category_prod_brand_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr> 
                    <tr>
						<td>Show product price:</td>
						<td>
                        <select name="oxy_category_prod_price_status">
                            <option value="1"<?php if($oxy_category_prod_price_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_category_prod_price_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>
                    <tr>
						<td>Show "Add to Cart" button:</td>
						<td>
                        <select name="oxy_category_prod_cart_status">
                            <option value="1"<?php if($oxy_category_prod_cart_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_category_prod_cart_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>  
                    <tr>
						<td>Show rating stars:</td>
						<td>
                        <select name="oxy_category_prod_ratings_status">
                            <option value="1"<?php if($oxy_category_prod_ratings_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_category_prod_ratings_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>  
                    <tr>
						<td>Show "Add to Wishlist" and "Add to Compare" links:</td>
						<td>
                        <select name="oxy_category_prod_wis_com_status">
                            <option value="1"<?php if($oxy_category_prod_wis_com_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_category_prod_wis_com_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>
                    <tr>
						<td>Show zoom image effect:</td>
						<td>
                        <select name="oxy_category_prod_zoom_status">
                            <option value="1"<?php if($oxy_category_prod_zoom_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_category_prod_zoom_status == '0') echo ' selected="selected"';?><?php if($oxy_category_prod_zoom_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>  
                    <tr>
						<td>Show swap image effect:</td>
						<td>
                        <select name="oxy_category_prod_swap_status">
                            <option value="1"<?php if($oxy_category_prod_swap_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_category_prod_swap_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>
                    <tr>
						<td>Align elements to:<br /><span class="oxy_help">(only grid view)</span></td>
						<td>
                        <select name="oxy_category_prod_align">
                            <option value="1"<?php if($oxy_category_prod_align == '1') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>
                            <option value="0"<?php if($oxy_category_prod_align == '0') echo ' selected="selected"';?>><?php echo $text_position_c; ?></option>
			            </select>
                        </td>
					</tr>                                                                                                                                                                   
                          
		 </table>                                       
     			
        </div>
        
        <div id="tab-store-features-product" class="vtabs-content">  
        
        <table class="form">
        
                     <tr>
						<td colspan="2"><div><b>Product Page Layout</b></div></td>
				     </tr> 
                     <tr>
						<td colspan="2" style="border-bottom:none;">        
                        <div style="float:left;width:100%;">
                        <?php for ($ppl = 1; $ppl <= 5; $ppl++) { ?>
                            <div class="prod_l"><img src="view/image/oxy_img/pl_<?php echo $ppl; ?>.png"><span class="oxy_help prod_l_nr"><?php echo $ppl; ?></span></div> 
						<?php } ?>	
						</div>
<br />      
                        <div style="float:left;">
                        <?php for ($ppl = 6; $ppl <= 10; $ppl++) { ?>
                            <div class="prod_l"><img src="view/image/oxy_img/pl_<?php echo $ppl; ?>.png"><span class="oxy_help prod_l_nr"><?php echo $ppl; ?></span></div> 
						<?php } ?>	
						</div>
                        </td>
					 </tr>                       
        		     <tr>
						<td>Product Page Layout:<br /><br /></td>
						<td>                        
                        <select name="oxy_layout_product_page">
                           <option value="1"<?php if($oxy_layout_product_page == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_layout_product_page == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_layout_product_page == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_layout_product_page == '4') echo ' selected="selected"';?>>4</option> 
                           <option value="5"<?php if($oxy_layout_product_page == '5') echo ' selected="selected"';?>>5</option>
                           <option value="6"<?php if($oxy_layout_product_page == '6') echo ' selected="selected"';?>>6</option>
                           <option value="7"<?php if($oxy_layout_product_page == '7') echo ' selected="selected"';?>>7</option>    
                           <option value="8"<?php if($oxy_layout_product_page == '8') echo ' selected="selected"';?>>8</option>
                           <option value="9"<?php if($oxy_layout_product_page == '9') echo ' selected="selected"';?>>9</option>
                           <option value="10"<?php if($oxy_layout_product_page == '10') echo ' selected="selected"';?><?php if($oxy_layout_product_page == '') echo ' selected="selected"';?>>10</option>                                                  
                        </select><br /><br />
                        </td>
					</tr> 
                    
		 </table>        
        
        <table class="form oxy_sep">
        
                    <tr>
						<td colspan="2"><div><b>Buy Section</b></div></td>
				    </tr> 
        			<tr>
						<td>Show manufacturer logo:</td>
						<td>
                        <select name="oxy_product_manufacturer_logo_status">
                            <option value="1"<?php if($oxy_product_manufacturer_logo_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_product_manufacturer_logo_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_19.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                    <tr>
						<td>Show Save Percent:</td>
						<td>
                        <select name="oxy_product_save_percent_status">
                            <option value="1"<?php if($oxy_product_save_percent_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_product_save_percent_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_20.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
                    <tr>
						<td>Show Tax:</td>
						<td>
                        <select name="oxy_product_tax_status">
                            <option value="1"<?php if($oxy_product_tax_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_product_tax_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_21.jpg" target="_blank">?</a></span>
                        </td>
					</tr>    
        			<tr>
						<td>Show product viewed:</td>
						<td>
                        <select name="oxy_product_viewed_status">
                            <option value="1"<?php if($oxy_product_viewed_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_product_viewed_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_22.jpg" target="_blank">?</a></span>
                        </td>
					</tr>   
        			<tr>
						<td>Show Increment/Decrement a Quantity:</td>
						<td>
                        <select name="oxy_product_i_c_status">
                            <option value="1"<?php if($oxy_product_i_c_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_product_i_c_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_23.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                         
                    
		 </table>        
        
        <table class="form">

					<tr>
						<td colspan="2"><div><b>Image Zoom</b></div></td>
					</tr>        
					<tr>
						<td>Image zoom type:</td>
						<td>
                        <select name="oxy_product_zoom_type">
                            <option value="1"<?php if($oxy_product_zoom_type == '1') echo ' selected="selected"';?>><?php echo $text_lightbox; ?></option>
                            <option value="0"<?php if($oxy_product_zoom_type == '0') echo ' selected="selected"';?><?php if($oxy_product_zoom_type == '') echo ' selected="selected"';?>><?php echo $text_cloud_zoom; ?></option>                        
			            </select>
                        </td>
					</tr>
                    
		 </table>
         
        <table class="form oxy_sep">
                      
					<tr>
						<td colspan="2"><div><b>Related Products</b><span class="oxy_help_tip"><a id="oxy-help-27" title="" href="#">?</a></span></div></td>
					</tr>         
        			<tr>
						<td>Show related products:</td>
						<td>
                        <select name="oxy_product_related_status">
                            <option value="1"<?php if($oxy_product_related_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_product_related_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>
					<tr>
						<td>Related products position:</td>
						<td>
                        <select name="oxy_product_related_position">
                            <option value="1"<?php if($oxy_product_related_position == '1') echo ' selected="selected"';?>><?php echo $text_position_b; ?></option>
                            <option value="0"<?php if($oxy_product_related_position == '0') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>                        
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_24.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
					<tr>
						<td>Related products style:<br /><span class="oxy_help">(only bottom position)</span></td>
						<td>
                        <select name="oxy_product_related_style">
                            <option value="0"<?php if($oxy_product_related_style == '0') echo ' selected="selected"';?>><?php echo $text_grid; ?></option>  
                            <option value="1"<?php if($oxy_product_related_style == '1') echo ' selected="selected"';?>><?php echo $text_slider; ?></option>                      
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_25.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                    
		 </table>
         
        <table class="form">

					<tr>
						<td colspan="2"><div><b>Custom Block</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_26.jpg" target="_blank">?</a></span></div></td>
					</tr> 
					<tr>
						<td>Show custom block:</td>
						<td>
                        <select name="oxy_product_custom_status">
                            <option value="1"<?php if($oxy_product_custom_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_product_custom_status == '0') echo ' selected="selected"';?><?php if($oxy_product_custom_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>  
                    
		 </table>                     
                    
                   <div id="product_oxy_custom" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_product_custom<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_product_custom<?php echo $language['language_id']; ?>">
                   <table class="form">                            
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_product_custom_content<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_product_custom_content' . $language['language_id']}) ? ${'oxy_product_custom_content' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?>                    
                   
        <table class="form oxy_sep">
        
					<tr>
						<td colspan="2"><div><b>Feature Box 1</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_27.jpg" target="_blank">?</a></span></div></td>
					</tr>
                    <tr>
					    <td><?php echo $text_icon_c; ?><br /><span class="oxy_help">Dimensions: 38 x 38px</span></td>
					    <td><input type="hidden" name="oxy_product_fb1_icon" value="<?php echo $oxy_product_fb1_icon; ?>" id="oxy_product_fb1_icon" />
						<img src="<?php echo $oxy_product_fb1_icon_thumb; ?>" id="oxy_product_fb1_icon_thumb" />
						<br /><a onclick="image_upload('oxy_product_fb1_icon', 'oxy_product_fb1_icon_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a onclick="$('#oxy_product_fb1_icon_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_product_fb1_icon').attr('value', '');">
                        <?php echo $text_clear; ?></a>
					    </td>
				    </tr>  
                    
		 </table>                    
                    
                   <div id="product_feature_box_1" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_prod_feature_box_1<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_prod_feature_box_1<?php echo $language['language_id']; ?>">
                   <table class="form">  
                     <tr>
						<td><?php echo $text_title; ?></td>
						<td><input type="text" name="oxy_product_fb1_title<?php echo $language['language_id']; ?>" id="oxy_product_fb1_title<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_product_fb1_title' . $language['language_id']}; ?>" /></td>
					 </tr>
                     <tr>
						<td><?php echo $text_subtitle; ?></td>
						<td><input type="text" name="oxy_product_fb1_subtitle<?php echo $language['language_id']; ?>" id="oxy_product_fb1_subtitle<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_product_fb1_subtitle' . $language['language_id']}; ?>" /></td>
					 </tr>                             
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_product_fb1_content<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_product_fb1_content' . $language['language_id']}) ? ${'oxy_product_fb1_content' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?>       
                   
        <table class="form oxy_sep">
        
					<tr>
						<td colspan="2"><div><b>Feature Box 2</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_28.jpg" target="_blank">?</a></span></div></td>
					</tr>
                    <tr>
					    <td><?php echo $text_icon_c; ?><br /><span class="oxy_help">Dimensions: 38 x 38px</span></td>
					    <td><input type="hidden" name="oxy_product_fb2_icon" value="<?php echo $oxy_product_fb2_icon; ?>" id="oxy_product_fb2_icon" />
						<img src="<?php echo $oxy_product_fb2_icon_thumb; ?>" id="oxy_product_fb2_icon_thumb" />
						<br /><a onclick="image_upload('oxy_product_fb2_icon', 'oxy_product_fb2_icon_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a onclick="$('#oxy_product_fb2_icon_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_product_fb2_icon').attr('value', '');">
                        <?php echo $text_clear; ?></a>
					    </td>
				    </tr>  
                    
		 </table>                    
                    
                   <div id="product_feature_box_2" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_prod_feature_box_2<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_prod_feature_box_2<?php echo $language['language_id']; ?>">
                   <table class="form">  
                     <tr>
						<td><?php echo $text_title; ?></td>
						<td><input type="text" name="oxy_product_fb2_title<?php echo $language['language_id']; ?>" id="oxy_product_fb2_title<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_product_fb2_title' . $language['language_id']}; ?>" /></td>
					 </tr>   
                     <tr>
						<td><?php echo $text_subtitle; ?></td>
						<td><input type="text" name="oxy_product_fb2_subtitle<?php echo $language['language_id']; ?>" id="oxy_product_fb2_subtitle<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_product_fb2_subtitle' . $language['language_id']}; ?>" /></td>
					 </tr>                            
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_product_fb2_content<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_product_fb2_content' . $language['language_id']}) ? ${'oxy_product_fb2_content' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?> 
                   
        <table class="form oxy_sep">
        
					<tr>
						<td colspan="2"><div><b>Feature Box 3</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_29.jpg" target="_blank">?</a></span></div></td>
					</tr>
                    <tr>
					    <td><?php echo $text_icon_c; ?><br /><span class="oxy_help">Dimensions: 38 x 38px</span></td>
					    <td><input type="hidden" name="oxy_product_fb3_icon" value="<?php echo $oxy_product_fb3_icon; ?>" id="oxy_product_fb3_icon" />
						<img src="<?php echo $oxy_product_fb3_icon_thumb; ?>" id="oxy_product_fb3_icon_thumb" />
						<br /><a onclick="image_upload('oxy_product_fb3_icon', 'oxy_product_fb3_icon_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a onclick="$('#oxy_product_fb3_icon_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_product_fb3_icon').attr('value', '');">
                        <?php echo $text_clear; ?></a>
					    </td>
				    </tr>  
                    
		 </table>                    
                    
                   <div id="product_feature_box_3" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_prod_feature_box_3<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_prod_feature_box_3<?php echo $language['language_id']; ?>">
                   <table class="form">  
                     <tr>
						<td><?php echo $text_title; ?></td>
						<td><input type="text" name="oxy_product_fb3_title<?php echo $language['language_id']; ?>" id="oxy_product_fb3_title<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_product_fb3_title' . $language['language_id']}; ?>" /></td>
					 </tr>
                     <tr>
						<td><?php echo $text_subtitle; ?></td>
						<td><input type="text" name="oxy_product_fb3_subtitle<?php echo $language['language_id']; ?>" id="oxy_product_fb3_subtitle<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_product_fb3_subtitle' . $language['language_id']}; ?>" /></td>
					 </tr>                               
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_product_fb3_content<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_product_fb3_content' . $language['language_id']}) ? ${'oxy_product_fb3_content' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?>                                                    

        <table class="form oxy_sep">
        
					<tr>
						<td colspan="2"><div><b>Custom Tab 1</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_30.jpg" target="_blank">?</a></span></div></td>
					</tr>
					<tr>
						<td>Show custom tab 1:</td>
						<td>
                        <select name="oxy_product_custom_tab_1_status">
                            <option value="1"<?php if($oxy_product_custom_tab_1_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_product_custom_tab_1_status == '0') echo ' selected="selected"';?><?php if($oxy_product_custom_tab_1_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>
                    
		 </table>                    
                    
                   <div id="product_oxy_custom_tab_1" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_product_custom_tab_1<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_product_custom_tab_1<?php echo $language['language_id']; ?>">
                   <table class="form">  
                   <tr>
						<td><?php echo $text_title; ?></td>
						<td><input type="text" name="oxy_product_custom_tab_1_title<?php echo $language['language_id']; ?>" id="oxy_product_custom_tab_1_title<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_product_custom_tab_1_title' . $language['language_id']}; ?>" /></td>
					 </tr>                           
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_product_custom_tab_1_content<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_product_custom_tab_1_content' . $language['language_id']}) ? ${'oxy_product_custom_tab_1_content' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?> 
 
        <table class="form oxy_sep">
        
					<tr>
						<td colspan="2"><div><b>Custom Tab 2</b></div></td>
					</tr>
					<tr>
						<td>Show custom tab 2:</td>
						<td>
                        <select name="oxy_product_custom_tab_2_status">
                            <option value="1"<?php if($oxy_product_custom_tab_2_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_product_custom_tab_2_status == '0') echo ' selected="selected"';?><?php if($oxy_product_custom_tab_2_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>
                    
		 </table>                    
                    
                   <div id="product_oxy_custom_tab_2" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_product_custom_tab_2<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_product_custom_tab_2<?php echo $language['language_id']; ?>">
                   <table class="form">  
                   <tr>
						<td><?php echo $text_title; ?></td>
						<td><input type="text" name="oxy_product_custom_tab_2_title<?php echo $language['language_id']; ?>" id="oxy_product_custom_tab_2_title<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_product_custom_tab_2_title' . $language['language_id']}; ?>" /></td>
					 </tr>                           
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_product_custom_tab_2_content<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_product_custom_tab_2_content' . $language['language_id']}) ? ${'oxy_product_custom_tab_2_content' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?>      
                   
         <table class="form oxy_sep">
        
					<tr>
						<td colspan="2"><div><b>Custom Tab 3</b></div></td>
					</tr>
					<tr>
						<td>Show custom tab 3:</td>
						<td>
                        <select name="oxy_product_custom_tab_3_status">
                            <option value="1"<?php if($oxy_product_custom_tab_3_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_product_custom_tab_3_status == '0') echo ' selected="selected"';?><?php if($oxy_product_custom_tab_3_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>
                    
		 </table>                    
                    
                   <div id="product_oxy_custom_tab_3" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_product_custom_tab_3<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_product_custom_tab_3<?php echo $language['language_id']; ?>">
                   <table class="form">  
                   <tr>
						<td><?php echo $text_title; ?></td>
						<td><input type="text" name="oxy_product_custom_tab_3_title<?php echo $language['language_id']; ?>" id="oxy_product_custom_tab_3_title<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_product_custom_tab_3_title' . $language['language_id']}; ?>" /></td>
					 </tr>                           
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_product_custom_tab_3_content<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_product_custom_tab_3_content' . $language['language_id']}) ? ${'oxy_product_custom_tab_3_content' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?>                    
     			
        </div>
        
        <div id="tab-store-features-contact" class="vtabs-content">
        
        <table class="form">
      
					<tr>
						<td colspan="2"><div><b>Custom Block</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_31.jpg" target="_blank">?</a></span></div></td>
					</tr>
					<tr>
						<td>Show custom block:</td>
						<td>
                        <select name="oxy_contact_custom_status">
                            <option value="1"<?php if($oxy_contact_custom_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_contact_custom_status == '0') echo ' selected="selected"';?><?php if($oxy_contact_custom_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>  
                    
		 </table>                    
                    
                   <div id="contact_oxy_custom" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_contact_custom<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_contact_custom<?php echo $language['language_id']; ?>">
                   <table class="form">                            
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_contact_custom_content<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_contact_custom_content' . $language['language_id']}) ? ${'oxy_contact_custom_content' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?>                       
        
        <table class="form oxy_sep">
      
					<tr>
						<td colspan="2"><div><b>Google Map</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_32.jpg" target="_blank">?</a></span></div></td>
					</tr>
					<tr>
						<td>Show Google Map:</td>
						<td>
                        <select name="oxy_contact_map_status">
                            <option value="1"<?php if($oxy_contact_map_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_contact_map_status == '0') echo ' selected="selected"';?><?php if($oxy_contact_map_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>        
                    <tr>
						<td>Latitude, Longitude:<br /><span class="oxy_help">For example:<br />53.5569238,13.258543</span></td>
						<td>
                        <input type="text" name="oxy_contact_map_ll" value="<?php echo $oxy_contact_map_ll; ?>" size="35" />
                        <a href="http://itouchmap.com/latlong.html" target="_blank" class="link">How to find Latitude and Longitude?</a>
                        </td>
					</tr> 
                    <tr>
						<td>Map type:</td>
						<td>
                        <select name="oxy_contact_map_type">
                            <option value="ROADMAP"<?php if($oxy_contact_map_type == 'ROADMAP') echo ' selected="selected"';?>>ROADMAP</option>
                            <option value="SATELLITE"<?php if($oxy_contact_map_type == 'SATELLITE') echo ' selected="selected"';?>>SATELLITE</option>
                            <option value="HYBRID"<?php if($oxy_contact_map_type == 'HYBRID') echo ' selected="selected"';?>>HYBRID</option>
                            <option value="TERRAIN"<?php if($oxy_contact_map_type == 'TERRAIN') echo ' selected="selected"';?>>TERRAIN</option>                         
			            </select>
                        </td>
					</tr>              
                         
		 </table>               
     			
        </div>     
        
        <div id="tab-store-features-lrcolumn" class="vtabs-content">
        
        <table class="form">
      
					<tr>
						<td colspan="2"><div><b>Categories</b></div></td>
					</tr>              
					<tr>
						<td>Categories type:</td>
						<td>
                        <select name="oxy_left_right_column_categories_type">
                            <option value="1"<?php if($oxy_left_right_column_categories_type == '1') echo ' selected="selected"';?>><?php echo $text_opencart; ?></option>
                            <option value="0"<?php if($oxy_left_right_column_categories_type == '0') echo ' selected="selected"';?><?php if($oxy_left_right_column_categories_type == '') echo ' selected="selected"';?>><?php echo $text_accordion; ?></option>                        
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_33.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                          
		 </table>
     			
        </div>
        
        <div id="tab-store-features-others" class="vtabs-content">
        
        <table class="form">
                 
					<tr>
						<td>Show "Scroll To Top" button:</td>
						<td>
                        <select name="oxy_others_totop">
                            <option value="1"<?php if($oxy_others_totop == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_others_totop == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/go_34.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                          
		 </table>
     			
        </div>                       
        
        </div>
  
        
        
        <div id="tab-colors-styles">
      
            <div id="colors_styles_settings_tabs" class="vtabs">
             <a href="#tab-colors-styles-general">General</a>      
             <a href="#tab-colors-styles-prices">Prices</a>
             <a href="#tab-colors-styles-buttons">Buttons</a> 
             <a href="#tab-colors-styles-top-area-header">Header</a>
             <a href="#tab-colors-styles-top-area-main-menu">Main Menu</a>
             <a href="#tab-colors-styles-midsection">Midsection</a>
             <a href="#tab-colors-styles-footer">Footer</a>    
           </div> 
           
        <div id="tab-colors-styles-general" class="vtabs-content">
        <table class="form">
                         
					<tr>
						<td>Body background color:</td>
						<td><input type="text" name="oxy_body_bg_color" id="oxy_body_bg_color" value="<?php echo $oxy_body_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_1.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
					<tr>
						<td>Headings color:</td>
						<td><input type="text" name="oxy_headings_color" id="oxy_headings_color" value="<?php echo $oxy_headings_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_2.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
					<tr>
						<td>Body text color:</td>
						<td><input type="text" name="oxy_body_text_color" id="oxy_body_text_color" value="<?php echo $oxy_body_text_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_3.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                    
					<tr>
						<td>Light text color:</td>
						<td><input type="text" name="oxy_light_text_color" id="oxy_light_text_color" value="<?php echo $oxy_light_text_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_4.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
					<tr>
						<td>Other links color:</td>
						<td><input type="text" name="oxy_other_links_color" id="oxy_other_links_color" value="<?php echo $oxy_other_links_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_5.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                                                   
					<tr>
						<td>Links color hover:</td>
						<td><input type="text" name="oxy_links_hover_color" id="oxy_links_hover_color" value="<?php echo $oxy_links_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_5b.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
					<tr>
						<td>General icons style:</td>
						<td>
                        <div>
							<span class="oxy_help">1.&nbsp;</span>
                            <img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/oxy-compare-1.png">&nbsp;
                            <img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/oxy-wishlist-1.png">&nbsp;
                            <img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/oxy-send-1.png">
                            <br /><br />       
							<span class="oxy_help">2.&nbsp;</span>
                            <img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/oxy-compare-2.png">&nbsp;
                            <img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/oxy-wishlist-2.png">&nbsp;
                            <img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/oxy-send-2.png">                                                   
						</div><br />                                          
                        <select name="oxy_general_icons_style" id="oxy_general_icons_style">
                           <option value="1"<?php if($oxy_general_icons_style == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_general_icons_style == '2') echo ' selected="selected"';?>>2</option>                                                      
                        </select>
                        </td>
					</tr>                                       
                          
		 </table>            
        
        <table class="form oxy_sep">
                                              
					<tr>
						<td colspan="2"><div><b>Main Column</b></div></td>
					</tr>                    
					<tr>
						<td><?php echo $text_show_bg_color; ?></td>
						<td>
                        <select name="oxy_main_column_status" id="oxy_main_column_status">
                            <option value="1"<?php if($oxy_main_column_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_main_column_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>                    
					<tr>
						<td><?php echo $text_bg_color; ?></td>
						<td>
                        <input type="text" name="oxy_main_column_bg_color" id="oxy_main_column_bg_color" value="<?php echo $oxy_main_column_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_8.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                   
					<tr>
						<td><?php echo $text_border; ?></td>
						<td>
                        <?php echo $text_show; ?>
                        <select name="oxy_main_column_border_status" id="oxy_main_column_border_status">
                            <option value="1"<?php if($oxy_main_column_border_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_main_column_border_status == '0') echo ' selected="selected"';?><?php if($oxy_main_column_border_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>                      
                        <br /><br />
                        <?php echo $text_size; ?>
                        <select name="oxy_main_column_border_size" id="oxy_main_column_border_size">
                           <option value="1"<?php if($oxy_main_column_border_size == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_main_column_border_size == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_main_column_border_size == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_main_column_border_size == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_main_column_border_size == '5') echo ' selected="selected"';?>>5</option>                                                       
                        </select>
                        <span class="oxy_help"><?php echo $text_px; ?></span>
                        <br /><br />                            
                        <?php echo $text_style; ?>          
                        <select name="oxy_main_column_border_style" id="oxy_main_column_border_style">
                           <option value="solid"<?php if($oxy_main_column_border_style == 'solid') echo ' selected="selected"';?>><?php echo $text_solid; ?></option>
                           <option value="dotted"<?php if($oxy_main_column_border_style == 'dotted') echo ' selected="selected"';?>><?php echo $text_dotted; ?></option>
                           <option value="dashed"<?php if($oxy_main_column_border_style == 'dashed') echo ' selected="selected"';?>><?php echo $text_dashed; ?></option>                          
                        </select>
                        <br /><br />
                        <?php echo $text_color; ?>
                        <input type="text" name="oxy_main_column_border_color" id="oxy_main_column_border_color" value="<?php echo $oxy_main_column_border_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_6.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                  
                     <tr>
						<td><?php echo $text_shadow; ?></td>
						<td>
                        <select name="oxy_main_column_shadow" id="oxy_main_column_shadow">
                            <option value="1"<?php if($oxy_main_column_shadow == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_main_column_shadow == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_7.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                          
		 </table>     
         
        <table class="form">
                             
					<tr>
						<td colspan="2"><div><b>Content Column</b></div></td>
					</tr> 
                    <tr>
						<td>Highlighted Items background color:</td>
						<td>
                        <input type="text" name="oxy_content_column_hli_bg_color" id="oxy_content_column_hli_bg_color" value="<?php echo $oxy_content_column_hli_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_9.jpg" target="_blank">?</a></span>
                        </td>
					</tr>   
                    <tr>
						<td>Headings border bottom:</td>
						<td>
                        <?php echo $text_show; ?>
                        <select name="oxy_content_column_head_border_status" id="oxy_content_column_head_border_status">
                            <option value="1"<?php if($oxy_content_column_head_border_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_content_column_head_border_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>                      
                        <br /><br />
                        <?php echo $text_size; ?>
                        <select name="oxy_content_column_head_border_size" id="oxy_content_column_head_border_size">
                           <option value="1"<?php if($oxy_content_column_head_border_size == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_content_column_head_border_size == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_content_column_head_border_size == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_content_column_head_border_size == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_content_column_head_border_size == '5') echo ' selected="selected"';?>>5</option>                                                       
                        </select>
                        <span class="oxy_help"><?php echo $text_px; ?></span>
                        <br /><br />                            
                        <?php echo $text_style; ?>          
                        <select name="oxy_content_column_head_border_style" id="oxy_content_column_head_border_style">
                           <option value="solid"<?php if($oxy_content_column_head_border_style == 'solid') echo ' selected="selected"';?>><?php echo $text_solid; ?></option>
                           <option value="dotted"<?php if($oxy_content_column_head_border_style == 'dotted') echo ' selected="selected"';?>><?php echo $text_dotted; ?></option>
                           <option value="dashed"<?php if($oxy_content_column_head_border_style == 'dashed') echo ' selected="selected"';?>><?php echo $text_dashed; ?></option>                          
                        </select>
                        <br /><br />
                        <?php echo $text_color; ?>
                        <input type="text" name="oxy_content_column_head_border_color" id="oxy_content_column_head_border_color" value="<?php echo $oxy_content_column_head_border_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_10.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                     
                    <tr>
						<td><?php echo $text_separator; ?></td>
						<td>
                        <?php echo $text_size; ?>
                        <select name="oxy_content_column_separator_size" id="oxy_content_column_separator_size">
                           <option value="1"<?php if($oxy_content_column_separator_size == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_content_column_separator_size == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_content_column_separator_size == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_content_column_separator_size == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_content_column_separator_size == '5') echo ' selected="selected"';?>>5</option>                                                       
                        </select>
                        <span class="oxy_help"><?php echo $text_px; ?></span>
                        <br /><br />                      
                        <?php echo $text_style; ?>          
                        <select name="oxy_content_column_separator_style" id="oxy_content_column_separator_style">
                           <option value="solid"<?php if($oxy_content_column_separator_style == 'solid') echo ' selected="selected"';?>><?php echo $text_solid; ?></option>
                           <option value="dotted"<?php if($oxy_content_column_separator_style == 'dotted') echo ' selected="selected"';?>><?php echo $text_dotted; ?></option>
                           <option value="dashed"<?php if($oxy_content_column_separator_style == 'dashed') echo ' selected="selected"';?>><?php echo $text_dashed; ?></option>                          
                        </select>
                        <br /><br />
                        <?php echo $text_color; ?>
                        <input type="text" name="oxy_content_column_separator_color" id="oxy_content_column_separator_color" value="<?php echo $oxy_content_column_separator_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_11.jpg" target="_blank">?</a></span>
                        </td>                        
					</tr>                                                                                                                                                                                 

		 </table>                  
        
        <table class="form oxy_sep">
        
					<tr>
						<td colspan="2"><div><b>Left Column Heading</b></div></td>
					</tr>                                         
					<tr>
						<td>Show heading background color:</td>
						<td>
                        <select name="oxy_left_column_head_status" id="oxy_left_column_head_status">
                            <option value="1"<?php if($oxy_left_column_head_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_left_column_head_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>                                         
					<tr>
						<td>Heading background color:</td>
						<td><input type="text" name="oxy_left_column_head_bg_color" id="oxy_left_column_head_bg_color" value="<?php echo $oxy_left_column_head_bg_color; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_12.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
				    <tr>
					    <td>Upload your own heading background image:</td>
					    <td><input type="hidden" name="oxy_left_column_head_custom" value="<?php echo $oxy_left_column_head_custom; ?>" id="oxy_left_column_head_custom" />
						<img src="<?php echo $oxy_left_column_head_custom_thumb; ?>" id="oxy_left_column_head_custom_thumb" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_13.jpg" target="_blank">?</a></span>
						<br /><a onclick="image_upload('oxy_left_column_head_custom', 'oxy_left_column_head_custom_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a onclick="$('#oxy_left_column_head_custom_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_left_column_head_custom').attr('value', '');">
                        <?php echo $text_clear; ?></a>
                        
					    </td>
				    </tr>                    
					<tr>
						<td>Title color:</td>
						<td>
                        <input type="text" name="oxy_left_column_head_title_color" id="oxy_left_column_head_title_color" value="<?php echo $oxy_left_column_head_title_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_14.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_border_bottom; ?></td>
						<td>
                        <?php echo $text_show; ?>
                        <select name="oxy_left_column_head_border_status" id="oxy_left_column_head_border_status">
                            <option value="1"<?php if($oxy_left_column_head_border_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_left_column_head_border_status == '0') echo ' selected="selected"';?><?php if($oxy_left_column_head_border_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>                      
                        <br /><br />
                        <?php echo $text_size; ?>
                        <select name="oxy_left_column_head_border_size" id="oxy_left_column_head_border_size">
                           <option value="1"<?php if($oxy_left_column_head_border_size == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_left_column_head_border_size == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_left_column_head_border_size == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_left_column_head_border_size == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_left_column_head_border_size == '5') echo ' selected="selected"';?>>5</option>                                                       
                        </select>
                        <span class="oxy_help"><?php echo $text_px; ?></span>
                        <br /><br />                            
                        <?php echo $text_style; ?>          
                        <select name="oxy_left_column_head_border_style" id="oxy_left_column_head_border_style">
                           <option value="solid"<?php if($oxy_left_column_head_border_style == 'solid') echo ' selected="selected"';?>><?php echo $text_solid; ?></option>
                           <option value="dotted"<?php if($oxy_left_column_head_border_style == 'dotted') echo ' selected="selected"';?>><?php echo $text_dotted; ?></option>
                           <option value="dashed"<?php if($oxy_left_column_head_border_style == 'dashed') echo ' selected="selected"';?>><?php echo $text_dashed; ?></option>                          
                        </select>
                        <br /><br />
                        <?php echo $text_color; ?>
                        <input type="text" name="oxy_left_column_head_border_color" id="oxy_left_column_head_border_color" value="<?php echo $oxy_left_column_head_border_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_15.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
					<tr>
						<td colspan="2"><div><b>Left Column Box</b></div></td>
					</tr>                                         
					<tr>
						<td>Show box background color:</td>
						<td>
                        <select name="oxy_left_column_box_status" id="oxy_left_column_box_status">
                            <option value="1"<?php if($oxy_left_column_box_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_left_column_box_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>                                         
					<tr>
						<td>Box background color:</td>
						<td><input type="text" name="oxy_left_column_box_bg_color" id="oxy_left_column_box_bg_color" value="<?php echo $oxy_left_column_box_bg_color; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_16.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
                    <tr>
						<td>Links color:</td>
						<td><input type="text" name="oxy_left_column_box_links_color" id="oxy_left_column_box_links_color" value="<?php echo $oxy_left_column_box_links_color; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_17.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
					<tr>
						<td>Links color hover:</td>
						<td><input type="text" name="oxy_left_column_box_links_color_hover" id="oxy_left_column_box_links_color_hover" value="<?php echo $oxy_left_column_box_links_color_hover; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_17b.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                                                          
                          
		 </table>   
         
        <table class="form">
        
					<tr>
						<td colspan="2"><div><b>Right Column Heading</b></div></td>
					</tr>                                         
					<tr>
						<td>Show heading background color:</td>
						<td>
                        <select name="oxy_right_column_head_status" id="oxy_right_column_head_status">
                            <option value="1"<?php if($oxy_right_column_head_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_right_column_head_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>                                         
					<tr>
						<td>Heading background color:</td>
						<td><input type="text" name="oxy_right_column_head_bg_color" id="oxy_right_column_head_bg_color" value="<?php echo $oxy_right_column_head_bg_color; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_12.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
				    <tr>
					    <td>Upload your own heading background image:</td>
					    <td><input type="hidden" name="oxy_right_column_head_custom" value="<?php echo $oxy_right_column_head_custom; ?>" id="oxy_right_column_head_custom" />
						<img src="<?php echo $oxy_right_column_head_custom_thumb; ?>" id="oxy_right_column_head_custom_thumb" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_13.jpg" target="_blank">?</a></span>
						<br /><a onClick="image_upload('oxy_right_column_head_custom', 'oxy_right_column_head_custom_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a onClick="$('#oxy_right_column_head_custom_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_right_column_head_custom').attr('value', '');">
                        <?php echo $text_clear; ?></a>
					    </td>
				    </tr>                    
					<tr>
						<td>Title color:</td>
						<td>
                        <input type="text" name="oxy_right_column_head_title_color" id="oxy_right_column_head_title_color" value="<?php echo $oxy_right_column_head_title_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_14.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                    <tr>
						<td><?php echo $text_border_bottom; ?></td>
						<td>
                        <?php echo $text_show; ?>
                        <select name="oxy_right_column_head_border_status" id="oxy_right_column_head_border_status">
                            <option value="1"<?php if($oxy_right_column_head_border_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_right_column_head_border_status == '0') echo ' selected="selected"';?><?php if($oxy_right_column_head_border_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>                      
                        <br /><br />
                        <?php echo $text_size; ?>
                        <select name="oxy_right_column_head_border_size" id="oxy_right_column_head_border_size">
                           <option value="1"<?php if($oxy_right_column_head_border_size == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_right_column_head_border_size == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_right_column_head_border_size == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_right_column_head_border_size == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_right_column_head_border_size == '5') echo ' selected="selected"';?>>5</option>                                                       
                        </select>
                        <span class="oxy_help"><?php echo $text_px; ?></span>
                        <br /><br />                            
                        <?php echo $text_style; ?>          
                        <select name="oxy_right_column_head_border_style" id="oxy_right_column_head_border_style">
                           <option value="solid"<?php if($oxy_right_column_head_border_style == 'solid') echo ' selected="selected"';?>><?php echo $text_solid; ?></option>
                           <option value="dotted"<?php if($oxy_right_column_head_border_style == 'dotted') echo ' selected="selected"';?>><?php echo $text_dotted; ?></option>
                           <option value="dashed"<?php if($oxy_right_column_head_border_style == 'dashed') echo ' selected="selected"';?>><?php echo $text_dashed; ?></option>                          
                        </select>
                        <br /><br />
                        <?php echo $text_color; ?>
                        <input type="text" name="oxy_right_column_head_border_color" id="oxy_right_column_head_border_color" value="<?php echo $oxy_right_column_head_border_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_15.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
					<tr>
						<td colspan="2"><div><b>Right Column Box</b></div></td>
					</tr>                                         
					<tr>
						<td>Show box background color:</td>
						<td>
                        <select name="oxy_right_column_box_status" id="oxy_right_column_box_status">
                            <option value="1"<?php if($oxy_right_column_box_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_right_column_box_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>                                         
					<tr>
						<td>Box background color:</td>
						<td><input type="text" name="oxy_right_column_box_bg_color" id="oxy_right_column_box_bg_color" value="<?php echo $oxy_right_column_box_bg_color; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_16.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
                    <tr>
						<td>Links color:</td>
						<td><input type="text" name="oxy_right_column_box_links_color" id="oxy_right_column_box_links_color" value="<?php echo $oxy_right_column_box_links_color; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_17.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
					<tr>
						<td>Links color hover:</td>
						<td><input type="text" name="oxy_right_column_box_links_color_hover" id="oxy_right_column_box_links_color_hover" value="<?php echo $oxy_right_column_box_links_color_hover; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_17b.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                                                            
                          
		 </table>      
         
        <table class="form oxy_sep">
        
					<tr>
						<td colspan="2"><div><b>Category Box Heading</b></div></td>
					</tr>                                         
					<tr>
						<td>Show heading background color:</td>
						<td>
                        <select name="oxy_category_box_head_status" id="oxy_category_box_head_status">
                            <option value="1"<?php if($oxy_category_box_head_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_category_box_head_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>                                         
					<tr>
						<td>Heading background color:</td>
						<td><input type="text" name="oxy_category_box_head_bg_color" id="oxy_category_box_head_bg_color" value="<?php echo $oxy_category_box_head_bg_color; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_18.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
				    <tr>
					    <td>Upload your own heading background image:</td>
					    <td><input type="hidden" name="oxy_category_box_head_custom" value="<?php echo $oxy_category_box_head_custom; ?>" id="oxy_category_box_head_custom" />
						<img src="<?php echo $oxy_category_box_head_custom_thumb; ?>" id="oxy_category_box_head_custom_thumb" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_19.jpg" target="_blank">?</a></span>
						<br /><a onClick="image_upload('oxy_category_box_head_custom', 'oxy_category_box_head_custom_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a onClick="$('#oxy_category_box_head_custom_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_category_box_head_custom').attr('value', '');">
                        <?php echo $text_clear; ?></a>
					    </td>
				    </tr>                    
					<tr>
						<td>Title color:</td>
						<td>
                        <input type="text" name="oxy_category_box_head_title_color" id="oxy_category_box_head_title_color" value="<?php echo $oxy_category_box_head_title_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_20.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                    <tr>
						<td><?php echo $text_border_bottom; ?></td>
						<td>
                        <?php echo $text_show; ?>
                        <select name="oxy_category_box_head_border_status" id="oxy_category_box_head_border_status">
                            <option value="1"<?php if($oxy_category_box_head_border_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_category_box_head_border_status == '0') echo ' selected="selected"';?><?php if($oxy_category_box_head_border_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>                      
                        <br /><br />
                        <?php echo $text_size; ?>
                        <select name="oxy_category_box_head_border_size" id="oxy_category_box_head_border_size">
                           <option value="1"<?php if($oxy_category_box_head_border_size == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_category_box_head_border_size == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_category_box_head_border_size == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_category_box_head_border_size == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_category_box_head_border_size == '5') echo ' selected="selected"';?>>5</option>                                                       
                        </select>
                        <span class="oxy_help"><?php echo $text_px; ?></span>
                        <br /><br />                            
                        <?php echo $text_style; ?>          
                        <select name="oxy_category_box_head_border_style" id="oxy_category_box_head_border_style">
                           <option value="solid"<?php if($oxy_category_box_head_border_style == 'solid') echo ' selected="selected"';?>><?php echo $text_solid; ?></option>
                           <option value="dotted"<?php if($oxy_category_box_head_border_style == 'dotted') echo ' selected="selected"';?>><?php echo $text_dotted; ?></option>
                           <option value="dashed"<?php if($oxy_category_box_head_border_style == 'dashed') echo ' selected="selected"';?>><?php echo $text_dashed; ?></option>                          
                        </select>
                        <br /><br />
                        <?php echo $text_color; ?>
                        <input type="text" name="oxy_category_box_head_border_color" id="oxy_category_box_head_border_color" value="<?php echo $oxy_category_box_head_border_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_21.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
					<tr>
						<td colspan="2"><div><b>Category Box Content</b></div></td>
					</tr>                                         
					<tr>
						<td>Show box background color:</td>
						<td>
                        <select name="oxy_category_box_box_status" id="oxy_category_box_box_status">
                            <option value="1"<?php if($oxy_category_box_box_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_category_box_box_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>                                         
					<tr>
						<td>Box background color:</td>
						<td><input type="text" name="oxy_category_box_box_bg_color" id="oxy_category_box_box_bg_color" value="<?php echo $oxy_category_box_box_bg_color; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_22.jpg" target="_blank">?</a></span>
                        </td>
					</tr>     					
                    <tr>
						<td>Box background color hover:</td>
						<td><input type="text" name="oxy_category_box_box_bg_color_hover" id="oxy_category_box_box_bg_color_hover" value="<?php echo $oxy_category_box_box_bg_color_hover; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_23.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
					<tr>
						<td>Links color:</td>
						<td><input type="text" name="oxy_category_box_box_links_color" id="oxy_category_box_box_links_color" value="<?php echo $oxy_category_box_box_links_color; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_24.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
					<tr>
						<td>Links color hover:</td>
						<td><input type="text" name="oxy_category_box_box_links_color_hover" id="oxy_category_box_box_links_color_hover" value="<?php echo $oxy_category_box_box_links_color_hover; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_25.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
					<tr>
						<td><?php echo $text_separator; ?></td>
						<td>
                        <?php echo $text_size; ?>
                        <select name="oxy_category_box_box_separator_size" id="oxy_category_box_box_separator_size">
                           <option value="1"<?php if($oxy_category_box_box_separator_size == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_category_box_box_separator_size == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_category_box_box_separator_size == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_category_box_box_separator_size == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_category_box_box_separator_size == '5') echo ' selected="selected"';?>>5</option>                                                       
                        </select>
                        <span class="oxy_help"><?php echo $text_px; ?></span>
                        <br /><br />                      
                        <?php echo $text_style; ?>          
                        <select name="oxy_category_box_box_separator_style" id="oxy_category_box_box_separator_style">
                           <option value="solid"<?php if($oxy_category_box_box_separator_style == 'solid') echo ' selected="selected"';?>><?php echo $text_solid; ?></option>
                           <option value="dotted"<?php if($oxy_category_box_box_separator_style == 'dotted') echo ' selected="selected"';?>><?php echo $text_dotted; ?></option>
                           <option value="dashed"<?php if($oxy_category_box_box_separator_style == 'dashed') echo ' selected="selected"';?>><?php echo $text_dashed; ?></option>                          
                        </select>
                        <br /><br />
                        <?php echo $text_color; ?>
                        <input type="text" name="oxy_category_box_box_separator_color" id="oxy_category_box_box_separator_color" value="<?php echo $oxy_category_box_box_separator_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_26.jpg" target="_blank">?</a></span>
                        </td>                        
					</tr>                                                                            
                          
		 </table>  
          
        <table class="form">
        
					<tr>
						<td colspan="2"><div><b>Filter Box Heading</b></div></td>
					</tr>                                         
					<tr>
						<td>Show heading background color:</td>
						<td>
                        <select name="oxy_filter_box_head_status" id="oxy_filter_box_head_status">
                            <option value="1"<?php if($oxy_filter_box_head_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_filter_box_head_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>                                         
					<tr>
						<td>Heading background color:</td>
						<td><input type="text" name="oxy_filter_box_head_bg_color" id="oxy_filter_box_head_bg_color" value="<?php echo $oxy_filter_box_head_bg_color; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_27.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
				    <tr>
					    <td>Upload your own heading background image:</td>
					    <td><input type="hidden" name="oxy_filter_box_head_custom" value="<?php echo $oxy_filter_box_head_custom; ?>" id="oxy_filter_box_head_custom" />
						<img src="<?php echo $oxy_filter_box_head_custom_thumb; ?>" id="oxy_filter_box_head_custom_thumb" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_28.jpg" target="_blank">?</a></span>
						<br /><a onClick="image_upload('oxy_filter_box_head_custom', 'oxy_filter_box_head_custom_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a onClick="$('#oxy_filter_box_head_custom_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_filter_box_head_custom').attr('value', '');">
                        <?php echo $text_clear; ?></a>
					    </td>
				    </tr>                    
					<tr>
						<td>Title color:</td>
						<td>
                        <input type="text" name="oxy_filter_box_head_title_color" id="oxy_filter_box_head_title_color" value="<?php echo $oxy_filter_box_head_title_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_29.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                    <tr>
						<td><?php echo $text_border_bottom; ?></td>
						<td>
                        <?php echo $text_show; ?>
                        <select name="oxy_filter_box_head_border_status" id="oxy_filter_box_head_border_status">
                            <option value="1"<?php if($oxy_filter_box_head_border_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_filter_box_head_border_status == '0') echo ' selected="selected"';?><?php if($oxy_filter_box_head_border_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>                      
                        <br /><br />
                        <?php echo $text_size; ?>
                        <select name="oxy_filter_box_head_border_size" id="oxy_filter_box_head_border_size">
                           <option value="1"<?php if($oxy_filter_box_head_border_size == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_filter_box_head_border_size == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_filter_box_head_border_size == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_filter_box_head_border_size == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_filter_box_head_border_size == '5') echo ' selected="selected"';?>>5</option>                                                       
                        </select>
                        <span class="oxy_help"><?php echo $text_px; ?></span>
                        <br /><br />                            
                        <?php echo $text_style; ?>          
                        <select name="oxy_filter_box_head_border_style" id="oxy_filter_box_head_border_style">
                           <option value="solid"<?php if($oxy_filter_box_head_border_style == 'solid') echo ' selected="selected"';?>><?php echo $text_solid; ?></option>
                           <option value="dotted"<?php if($oxy_filter_box_head_border_style == 'dotted') echo ' selected="selected"';?>><?php echo $text_dotted; ?></option>
                           <option value="dashed"<?php if($oxy_filter_box_head_border_style == 'dashed') echo ' selected="selected"';?>><?php echo $text_dashed; ?></option>                          
                        </select>
                        <br /><br />
                        <?php echo $text_color; ?>
                        <input type="text" name="oxy_filter_box_head_border_color" id="oxy_filter_box_head_border_color" value="<?php echo $oxy_filter_box_head_border_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_30.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
					<tr>
						<td colspan="2"><div><b>Filter Box Content</b></div></td>
					</tr>                                         
					<tr>
						<td>Show box background color:</td>
						<td>
                        <select name="oxy_filter_box_box_status" id="oxy_filter_box_box_status">
                            <option value="1"<?php if($oxy_filter_box_box_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_filter_box_box_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>                                         
					<tr>
						<td>Box background color:</td>
						<td><input type="text" name="oxy_filter_box_box_bg_color" id="oxy_filter_box_box_bg_color" value="<?php echo $oxy_filter_box_box_bg_color; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_31.jpg" target="_blank">?</a></span>
                        </td>
					</tr>     					 
					<tr>
						<td>Links color:</td>
						<td><input type="text" name="oxy_filter_box_box_links_color" id="oxy_filter_box_box_links_color" value="<?php echo $oxy_filter_box_box_links_color; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_32.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
					<tr>
						<td>Links color hover:</td>
						<td><input type="text" name="oxy_filter_box_box_links_color_hover" id="oxy_filter_box_box_links_color_hover" value="<?php echo $oxy_filter_box_box_links_color_hover; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_33.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                                                          
                          
		 </table>                                 
        </div>
        
        <div id="tab-colors-styles-prices" class="vtabs-content">
        <table class="form">     

					<tr>
						<td>Price color:</td>
						<td><input type="text" name="oxy_price_color" id="oxy_price_color" value="<?php echo $oxy_price_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td>Old price color:</td>
						<td><input type="text" name="oxy_price_old_color" id="oxy_price_old_color" value="<?php echo $oxy_price_old_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td>New price color:</td>
						<td><input type="text" name="oxy_price_new_color" id="oxy_price_new_color" value="<?php echo $oxy_price_new_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td>Tax price color:</td>
						<td><input type="text" name="oxy_price_tax_color" id="oxy_price_tax_color" value="<?php echo $oxy_price_tax_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr> 
                                                                               
		 </table>     
        </div>
        
        <div id="tab-colors-styles-buttons" class="vtabs-content">
        <table class="form">     
        
                    <tr>
						<td>Button border radius:</td>
						<td>                        
                        <select name="oxy_button_border_radius" id="oxy_button_border_radius">
                           <option value="0"<?php if($oxy_button_border_radius == '0') echo ' selected="selected"';?>>0</option>                        
                           <option value="1"<?php if($oxy_button_border_radius == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_button_border_radius == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_button_border_radius == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_button_border_radius == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_button_border_radius == '5') echo ' selected="selected"';?>>5</option> 
                           <option value="6"<?php if($oxy_button_border_radius == '6') echo ' selected="selected"';?>>6</option>
                           <option value="7"<?php if($oxy_button_border_radius == '7') echo ' selected="selected"';?>>7</option>                           
                           <option value="8"<?php if($oxy_button_border_radius == '8') echo ' selected="selected"';?>>8</option> 
                           <option value="9"<?php if($oxy_button_border_radius == '9') echo ' selected="selected"';?>>9</option>
                           <option value="10"<?php if($oxy_button_border_radius == '10') echo ' selected="selected"';?>>10</option>        
                        </select>
                        </td>
					</tr>                     
                          
		 </table>            
        
        <table class="form oxy_sep">
                            
					<tr>
						<td colspan="2"><div><b>Buttons</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_34.jpg" target="_blank">?</a></span></div></td>
					</tr>                                        
					<tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_button_bg_color" id="oxy_button_bg_color" value="<?php echo $oxy_button_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>  
					<tr>
						<td><?php echo $text_bg_color_hover; ?></td>
						<td><input type="text" name="oxy_button_bg_hover_color" id="oxy_button_bg_hover_color" value="<?php echo $oxy_button_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_text_color; ?></td>
						<td><input type="text" name="oxy_button_text_color" id="oxy_button_text_color" value="<?php echo $oxy_button_text_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
                    <tr>
						<td><?php echo $text_text_color_hover; ?></td>
						<td><input type="text" name="oxy_button_text_hover_color" id="oxy_button_text_hover_color" value="<?php echo $oxy_button_text_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
                          
		 </table>            
        
        <table class="form">
                            
					<tr>
						<td colspan="2"><div><b>Exclusive Buttons</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_35.jpg" target="_blank">?</a></span></div></td>
					</tr>                    
					<tr>
						<td><?php echo $text_bg_color; ?></td>
						<td>
                        <input type="text" name="oxy_button_exclusive_bg_color" id="oxy_button_exclusive_bg_color" value="<?php echo $oxy_button_exclusive_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>   
					<tr>
						<td><?php echo $text_bg_color_hover; ?></td>
						<td>
                        <input type="text" name="oxy_button_exclusive_bg_hover_color" id="oxy_button_exclusive_bg_hover_color" value="<?php echo $oxy_button_exclusive_bg_hover_color; ?>" class="color {required:false,hash:true}" 
                        size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_text_color; ?></td>
						<td>
                        <input type="text" name="oxy_button_exclusive_text_color" id="oxy_button_exclusive_text_color" value="<?php echo $oxy_button_exclusive_text_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
                    <tr>
						<td><?php echo $text_text_color_hover; ?></td>
						<td>
                        <input type="text" name="oxy_button_exclusive_text_hover_color" id="oxy_button_exclusive_text_hover_color" value="<?php echo $oxy_button_exclusive_text_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
                    
		 </table>   
         
        <table class="form oxy_sep">
                            
					<tr>
						<td colspan="2"><div><b>Light Buttons</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_36.jpg" target="_blank">?</a></span></div></td>
					</tr>                    
					<tr>
						<td><?php echo $text_bg_color; ?></td>
						<td>
                        <input type="text" name="oxy_button_light_bg_color" id="oxy_button_light_bg_color" value="<?php echo $oxy_button_light_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>   
					<tr>
						<td><?php echo $text_bg_color_hover; ?></td>
						<td>
                        <input type="text" name="oxy_button_light_bg_hover_color" id="oxy_button_light_bg_hover_color" value="<?php echo $oxy_button_light_bg_hover_color; ?>" class="color {required:false,hash:true}" 
                        size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_text_color; ?></td>
						<td>
                        <input type="text" name="oxy_button_light_text_color" id="oxy_button_light_text_color" value="<?php echo $oxy_button_light_text_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
                    <tr>
						<td><?php echo $text_text_color_hover; ?></td>
						<td>
                        <input type="text" name="oxy_button_light_text_hover_color" id="oxy_button_light_text_hover_color" value="<?php echo $oxy_button_light_text_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
                    
		 </table>
         
        <table class="form">
                            
					<tr>
						<td colspan="2"><div><b>Slider Buttons</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_37.jpg" target="_blank">?</a></span></div></td>
					</tr>                    
					<tr>
						<td><?php echo $text_bg_color; ?></td>
						<td>
                        <input type="text" name="oxy_button_slider_bg_color" id="oxy_button_slider_bg_color" value="<?php echo $oxy_button_slider_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>   
					<tr>
						<td><?php echo $text_bg_color_hover; ?></td>
						<td>
                        <input type="text" name="oxy_button_slider_bg_hover_color" id="oxy_button_slider_bg_hover_color" value="<?php echo $oxy_button_slider_bg_hover_color; ?>" class="color {required:false,hash:true}" 
                        size="7" />
                        </td>
					</tr>
                    
		 </table>         
                     
        </div> 
        
        <div id="tab-colors-styles-top-area-header" class="vtabs-content">
        
        <table class="form">      
          
                    <tr>
						<td><?php echo $text_show_bg_color; ?></td>
						<td>
                        <select name="oxy_top_area_status" id="oxy_top_area_status">
                            <option value="1"<?php if($oxy_top_area_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_top_area_status == '0') echo ' selected="selected"';?><?php if($oxy_top_area_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>                                         
					<tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_top_area_bg_color" id="oxy_top_area_bg_color" value="<?php echo $oxy_top_area_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_38.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                    <tr>
						<td>Fixed Header (Mini Header)<br />background color:</td>
						<td><input type="text" name="oxy_top_area_mini_bg_color" id="oxy_top_area_mini_bg_color" value="<?php echo $oxy_top_area_mini_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_39.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
		 </table>
            
        <table class="form oxy_sep">
        
					<tr>
						<td colspan="2"><div><b>Top Bar</b></div></td>
					</tr>
                    <tr>
						<td><?php echo $text_show_bg_color; ?></td>
						<td>
                        <select name="oxy_top_area_tb_bg_status" id="oxy_top_area_tb_bg_status">
                            <option value="1"<?php if($oxy_top_area_tb_bg_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_top_area_tb_bg_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>   
					<tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_top_area_tb_bg_color" id="oxy_top_area_tb_bg_color" value="<?php echo $oxy_top_area_tb_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_40.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
                    <tr>
						<td><?php echo $text_show_border_top; ?></td>
						<td>
                        <select name="oxy_top_area_tb_top_border_status" id="oxy_top_area_tb_top_border_status">
                            <option value="1"<?php if($oxy_top_area_tb_top_border_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_top_area_tb_top_border_status == '0') echo ' selected="selected"';?><?php if($oxy_top_area_tb_top_border_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>   
					<tr>
						<td><?php echo $text_border_top_color; ?></td>
						<td><input type="text" name="oxy_top_area_tb_top_border_color" id="oxy_top_area_tb_top_border_color" value="<?php echo $oxy_top_area_tb_top_border_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_41.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
                    <tr>
						<td><?php echo $text_show_border_bottom; ?></td>
						<td>
                        <select name="oxy_top_area_tb_bottom_border_status" id="oxy_top_area_tb_bottom_border_status">
                            <option value="1"<?php if($oxy_top_area_tb_bottom_border_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_top_area_tb_bottom_border_status == '0') echo ' selected="selected"';?><?php if($oxy_top_area_tb_bottom_border_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>   
					<tr>
						<td><?php echo $text_border_bottom_color; ?></td>
						<td><input type="text" name="oxy_top_area_tb_bottom_border_color" id="oxy_top_area_tb_bottom_border_color" value="<?php echo $oxy_top_area_tb_bottom_border_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_42.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
					<tr>
						<td><?php echo $text_text_color; ?></td>
						<td><input type="text" name="oxy_top_area_tb_text_color" id="oxy_top_area_tb_text_color" value="<?php echo $oxy_top_area_tb_text_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_43.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                                            
					<tr>
						<td><?php echo $text_link_color; ?></td>
						<td><input type="text" name="oxy_top_area_tb_link_color" id="oxy_top_area_tb_link_color" value="<?php echo $oxy_top_area_tb_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_44.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
                    <tr>
						<td><?php echo $text_link_color_hover; ?></td>
						<td><input type="text" name="oxy_top_area_tb_link_color_hover" id="oxy_top_area_tb_link_color_hover" value="<?php echo $oxy_top_area_tb_link_color_hover; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_45.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
                    <tr>
						<td><?php echo $text_separator_color; ?></td>
						<td><input type="text" name="oxy_top_area_tb_separator_color" id="oxy_top_area_tb_separator_color" value="<?php echo $oxy_top_area_tb_separator_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_46.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                    <tr>
						<td>Dropdowns background color:</td>
						<td><input type="text" name="oxy_top_area_tb_dropdown_bg_color" id="oxy_top_area_tb_dropdown_bg_color" value="<?php echo $oxy_top_area_tb_dropdown_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_47.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
                    <tr>
						<td>Dropdowns background color hover:</td>
						<td><input type="text" name="oxy_top_area_tb_dropdown_bg_color_hover" id="oxy_top_area_tb_dropdown_bg_color_hover" value="<?php echo $oxy_top_area_tb_dropdown_bg_color_hover; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_48.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                    <tr>
						<td>Dropdowns link color:</td>
						<td><input type="text" name="oxy_top_area_tb_dropdown_link_color" id="oxy_top_area_tb_dropdown_link_color" value="<?php echo $oxy_top_area_tb_dropdown_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_49.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
                    <tr>
						<td>Dropdowns link color hover:</td>
						<td><input type="text" name="oxy_top_area_tb_dropdown_link_color_hover" id="oxy_top_area_tb_dropdown_link_color_hover" value="<?php echo $oxy_top_area_tb_dropdown_link_color_hover; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_50.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
                          
		 </table>    
         
        <table class="form">
                                                                  
					<tr>
						<td colspan="2"><div><b>Search Bar</b></div></td>
					</tr> 
                    <tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_top_area_search_bg_color" id="oxy_top_area_search_bg_color" value="<?php echo $oxy_top_area_search_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_51.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
					<tr>
						<td><?php echo $text_border_color; ?></td>
						<td><input type="text" name="oxy_top_area_search_border_color" id="oxy_top_area_search_border_color" value="<?php echo $oxy_top_area_search_border_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_52.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_border_color_hover; ?></td>
						<td><input type="text" name="oxy_top_area_search_border_color_hover" id="oxy_top_area_search_border_color_hover" value="<?php echo $oxy_top_area_search_border_color_hover; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_53.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
                    <tr>
						<td><?php echo $text_text_color; ?></td>
						<td><input type="text" name="oxy_top_area_search_text_color" id="oxy_top_area_search_text_color" value="<?php echo $oxy_top_area_search_text_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_54.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                     
                          
		 </table>           
            
        <table class="form oxy_sep">
                                                                  
					<tr>
						<td colspan="2"><div><b>Cart Section</b></div></td>
					</tr> 
                    <tr>
						<td><?php echo $text_text_color; ?></td>
						<td><input type="text" name="oxy_top_area_cart_text_color" id="oxy_top_area_cart_text_color" value="<?php echo $oxy_top_area_cart_text_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_55.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
					<tr>
						<td><?php echo $text_link_color; ?></td>
						<td><input type="text" name="oxy_top_area_cart_link_color" id="oxy_top_area_cart_link_color" value="<?php echo $oxy_top_area_cart_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_56.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_link_color_hover; ?></td>
						<td><input type="text" name="oxy_top_area_cart_link_color_hover" id="oxy_top_area_cart_link_color_hover" value="<?php echo $oxy_top_area_cart_link_color_hover; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_57.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                    <tr>
						<td><?php echo $text_separator; ?></td>
						<td><input type="text" name="oxy_top_area_cart_separator_color" id="oxy_top_area_cart_separator_color" value="<?php echo $oxy_top_area_cart_separator_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_58.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
					<tr>
						<td>Cart icon style:</td>
						<td> 
                        <div>
							<span class="oxy_help">1.&nbsp;</span><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/icon_cart_1.png">
							<span class="oxy_help">2.&nbsp;</span><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/icon_cart_2.png">
							<span class="oxy_help">3.&nbsp;</span><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/icon_cart_3.png">
							<span class="oxy_help">4.&nbsp;</span><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/icon_cart_4.png"> 
                            <span class="oxy_help">5.&nbsp;</span><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/icon_cart_5.png">
                            <span class="oxy_help">6.&nbsp;</span><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/icon_cart_6.png"> 
                            <span class="oxy_help">7.&nbsp;</span><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/icon_cart_7.png"> 
                            <span class="oxy_help">8.&nbsp;</span><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/icon_cart_8.png">                                 
						</div><br /><br />                        
                        <select name="oxy_top_area_cart_icon_style" id="oxy_top_area_cart_icon_style">                     
                           <option value="1"<?php if($oxy_top_area_cart_icon_style == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_top_area_cart_icon_style == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_top_area_cart_icon_style == '3') echo ' selected="selected"';?>>3</option> 
                           <option value="4"<?php if($oxy_top_area_cart_icon_style == '4') echo ' selected="selected"';?>>4</option> 
                           <option value="5"<?php if($oxy_top_area_cart_icon_style == '5') echo ' selected="selected"';?>>5</option>
                           <option value="6"<?php if($oxy_top_area_cart_icon_style == '6') echo ' selected="selected"';?>>6</option>
                           <option value="7"<?php if($oxy_top_area_cart_icon_style == '7') echo ' selected="selected"';?>>7</option>
                           <option value="8"<?php if($oxy_top_area_cart_icon_style == '8') echo ' selected="selected"';?>>8</option> 
                        </select> 
                        <span class="oxy_help">Select icon number.</span>
                        </td>
					</tr>                      
                          
		 </table>                          
                  
        </div>
        
        <div id="tab-colors-styles-top-area-main-menu" class="vtabs-content">
        
         <table class="form">
        
					<tr>
						<td colspan="2"><div><b>Main Menu Bar</b></div></td>
					</tr>                      
                    <tr>
						<td><?php echo $text_show_bg_color; ?></td>
						<td>
                        <select name="oxy_mm_bg_color_status" id="oxy_mm_bg_color_status">
                            <option value="1"<?php if($oxy_mm_bg_color_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_mm_bg_color_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        </td>
					</tr>                                         
					<tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_mm_bg_color" id="oxy_mm_bg_color" value="<?php echo $oxy_mm_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_59.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                    <tr>
						<td><?php echo $text_separator; ?></td>
						<td>
                        <?php echo $text_show; ?>
                        <select name="oxy_mm_separator_status" id="oxy_mm_separator_status">
                            <option value="1"<?php if($oxy_mm_separator_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_mm_separator_status == '0') echo ' selected="selected"';?><?php if($oxy_mm_separator_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        <br /><br />                          
                        <?php echo $text_size; ?>
                        <select name="oxy_mm_separator_size" id="oxy_mm_separator_size">
                           <option value="1"<?php if($oxy_mm_separator_size == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_mm_separator_size == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_mm_separator_size == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_mm_separator_size == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_mm_separator_size == '5') echo ' selected="selected"';?>>5</option>                                                       
                        </select>
                        <span class="oxy_help"><?php echo $text_px; ?></span>
                        <br /><br />                      
                        <?php echo $text_style; ?>          
                        <select name="oxy_mm_separator_style" id="oxy_mm_separator_style">
                           <option value="solid"<?php if($oxy_mm_separator_style == 'solid') echo ' selected="selected"';?>><?php echo $text_solid; ?></option>
                           <option value="dotted"<?php if($oxy_mm_separator_style == 'dotted') echo ' selected="selected"';?>><?php echo $text_dotted; ?></option>
                           <option value="dashed"<?php if($oxy_mm_separator_style == 'dashed') echo ' selected="selected"';?>><?php echo $text_dashed; ?></option>                          
                        </select>
                        <br /><br />
                        <?php echo $text_color; ?>
                        <input type="text" name="oxy_mm_separator_color" id="oxy_mm_separator_color" value="<?php echo $oxy_mm_separator_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_60.jpg" target="_blank">?</a></span>
                        </td>                        
					</tr>
                    <tr>
						<td><?php echo $text_border_top; ?></td>
						<td>
                        <?php echo $text_show; ?>
                        <select name="oxy_mm_border_top_status" id="oxy_mm_border_top_status">
                            <option value="1"<?php if($oxy_mm_border_top_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_mm_border_top_status == '0') echo ' selected="selected"';?><?php if($oxy_mm_border_top_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        <br /><br />                          
                        <?php echo $text_size; ?>
                        <select name="oxy_mm_border_top_size" id="oxy_mm_border_top_size">
                           <option value="1"<?php if($oxy_mm_border_top_size == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_mm_border_top_size == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_mm_border_top_size == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_mm_border_top_size == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_mm_border_top_size == '5') echo ' selected="selected"';?><?php if($oxy_mm_border_top_size == '') echo ' selected="selected"';?>>5</option>                                                       
                        </select>
                        <span class="oxy_help"><?php echo $text_px; ?></span>
                        <br /><br />                   
                        <?php echo $text_style; ?>          
                        <select name="oxy_mm_border_top_style" id="oxy_mm_border_top_style">
                           <option value="solid"<?php if($oxy_mm_border_top_style == 'solid') echo ' selected="selected"';?>><?php echo $text_solid; ?></option>
                           <option value="dotted"<?php if($oxy_mm_border_top_style == 'dotted') echo ' selected="selected"';?>><?php echo $text_dotted; ?></option>
                           <option value="dashed"<?php if($oxy_mm_border_top_style == 'dashed') echo ' selected="selected"';?>><?php echo $text_dashed; ?></option>                          
                        </select>
                        <br /><br />
                        <?php echo $text_color; ?>
                        <input type="text" name="oxy_mm_border_top_color" id="oxy_mm_border_top_color" value="<?php echo $oxy_mm_border_top_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_61.jpg" target="_blank">?</a></span>
                        </td>                        
					</tr>         
                    <tr>
						<td><?php echo $text_border_bottom; ?></td>
						<td>
                        <?php echo $text_show; ?>
                        <select name="oxy_mm_border_bottom_status" id="oxy_mm_border_bottom_status">
                            <option value="1"<?php if($oxy_mm_border_bottom_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_mm_border_bottom_status == '0') echo ' selected="selected"';?><?php if($oxy_mm_border_bottom_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			            </select>
                        <br /><br />                          
                        <?php echo $text_size; ?>
                        <select name="oxy_mm_border_bottom_size" id="oxy_mm_border_bottom_size">
                           <option value="1"<?php if($oxy_mm_border_bottom_size == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_mm_border_bottom_size == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_mm_border_bottom_size == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_mm_border_bottom_size == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_mm_border_bottom_size == '5') echo ' selected="selected"';?><?php if($oxy_mm_border_bottom_size == '') echo ' selected="selected"';?>>5</option>                                                       
                        </select>
                        <span class="oxy_help"><?php echo $text_px; ?></span>
                        <br /><br />                  
                        <?php echo $text_style; ?>          
                        <select name="oxy_mm_border_bottom_style" id="oxy_mm_border_bottom_style">
                           <option value="solid"<?php if($oxy_mm_border_bottom_style == 'solid') echo ' selected="selected"';?>><?php echo $text_solid; ?></option>
                           <option value="dotted"<?php if($oxy_mm_border_bottom_style == 'dotted') echo ' selected="selected"';?>><?php echo $text_dotted; ?></option>
                           <option value="dashed"<?php if($oxy_mm_border_bottom_style == 'dashed') echo ' selected="selected"';?>><?php echo $text_dashed; ?></option>                          
                        </select>
                        <br /><br />
                        <?php echo $text_color; ?>
                        <input type="text" name="oxy_mm_border_bottom_color" id="oxy_mm_border_bottom_color" value="<?php echo $oxy_mm_border_bottom_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_62.jpg" target="_blank">?</a></span>
                        </td>                        
					</tr>                                                                         
                          
		 </table>            
        
        <table class="form oxy_sep">
                            
					<tr>
						<td colspan="2"><div><b>Home Page Link</b></div></td>
					</tr>                                          
                     <tr>
						<td><?php echo $text_show_bg_color; ?></td>
						<td>
                        <select name="oxy_mm1_bg_color_status" id="oxy_mm1_bg_color_status">
                            <option value="1"<?php if($oxy_mm1_bg_color_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_mm1_bg_color_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>                        
					<tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_mm1_bg_color" id="oxy_mm1_bg_color" value="<?php echo $oxy_mm1_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_63.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_bg_color_hover; ?></td>
						<td><input type="text" name="oxy_mm1_bg_hover_color" id="oxy_mm1_bg_hover_color" value="<?php echo $oxy_mm1_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_64.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_link_color; ?></td>
						<td><input type="text" name="oxy_mm1_link_color" id="oxy_mm1_link_color" value="<?php echo $oxy_mm1_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_65.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_link_color_hover; ?></td>
						<td><input type="text" name="oxy_mm1_link_hover_color" id="oxy_mm1_link_hover_color" value="<?php echo $oxy_mm1_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_66.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                          
		 </table>            
        
        <table class="form">
                            
					<tr>
						<td colspan="2"><div><b>Categories Section</b></div></td>
					</tr>                                            
                     <tr>
						<td><?php echo $text_show_bg_color; ?></td>
						<td>
                        <select name="oxy_mm2_bg_color_status" id="oxy_mm2_bg_color_status">
                            <option value="1"<?php if($oxy_mm2_bg_color_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_mm2_bg_color_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>                      
					<tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_mm2_bg_color" id="oxy_mm2_bg_color" value="<?php echo $oxy_mm2_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_bg_color_hover; ?></td>
						<td><input type="text" name="oxy_mm2_bg_hover_color" id="oxy_mm2_bg_hover_color" value="<?php echo $oxy_mm2_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_link_color; ?></td>
						<td><input type="text" name="oxy_mm2_link_color" id="oxy_mm2_link_color" value="<?php echo $oxy_mm2_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_link_color_hover; ?></td>
						<td><input type="text" name="oxy_mm2_link_hover_color" id="oxy_mm2_link_hover_color" value="<?php echo $oxy_mm2_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>                                   
                          
		 </table>            
        
        <table class="form oxy_sep">
                            
					<tr>
						<td colspan="2"><div><b>Brands Section</b></div></td>
					</tr>                         
                     <tr>
						<td><?php echo $text_show_bg_color; ?></td>
						<td>
                        <select name="oxy_mm3_bg_color_status" id="oxy_mm3_bg_color_status">
                            <option value="1"<?php if($oxy_mm3_bg_color_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_mm3_bg_color_status == '0') echo ' selected="selected"';?><?php if($oxy_mm3_bg_color_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>                                  
					<tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_mm3_bg_color" id="oxy_mm3_bg_color" value="<?php echo $oxy_mm3_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_bg_color_hover; ?></td>
						<td><input type="text" name="oxy_mm3_bg_hover_color" id="oxy_mm3_bg_hover_color" value="<?php echo $oxy_mm3_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_link_color; ?></td>
						<td><input type="text" name="oxy_mm3_link_color" id="oxy_mm3_link_color" value="<?php echo $oxy_mm3_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_link_color_hover; ?></td>
						<td><input type="text" name="oxy_mm3_link_hover_color" id="oxy_mm3_link_hover_color" value="<?php echo $oxy_mm3_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
                          
		 </table>            
        
        <table class="form">
                            
					<tr>
						<td colspan="2"><div><b>Custom Links Section</b></div></td>
					</tr>                         
                     <tr>
						<td><?php echo $text_show_bg_color; ?></td>
						<td>
                        <select name="oxy_mm4_bg_color_status" id="oxy_mm4_bg_color_status">
                            <option value="1"<?php if($oxy_mm4_bg_color_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_mm4_bg_color_status == '0') echo ' selected="selected"';?><?php if($oxy_mm4_bg_color_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>                     
					<tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_mm4_bg_color" id="oxy_mm4_bg_color" value="<?php echo $oxy_mm4_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_bg_color_hover; ?></td>
						<td><input type="text" name="oxy_mm4_bg_hover_color" id="oxy_mm4_bg_hover_color" value="<?php echo $oxy_mm4_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_link_color; ?></td>
						<td><input type="text" name="oxy_mm4_link_color" id="oxy_mm4_link_color" value="<?php echo $oxy_mm4_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_link_color_hover; ?></td>
						<td><input type="text" name="oxy_mm4_link_hover_color" id="oxy_mm4_link_hover_color" value="<?php echo $oxy_mm4_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
                          
		 </table>    
         
        <table class="form oxy_sep">
                            
					<tr>
						<td colspan="2"><div><b>Custom Menu Section</b></div></td>
					</tr>                         
                     <tr>
						<td><?php echo $text_show_bg_color; ?></td>
						<td>
                        <select name="oxy_mm6_bg_color_status" id="oxy_mm6_bg_color_status">
                            <option value="1"<?php if($oxy_mm6_bg_color_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_mm6_bg_color_status == '0') echo ' selected="selected"';?><?php if($oxy_mm6_bg_color_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>                     
                    <tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_mm6_bg_color" id="oxy_mm6_bg_color" value="<?php echo $oxy_mm6_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_bg_color_hover; ?></td>
						<td><input type="text" name="oxy_mm6_bg_hover_color" id="oxy_mm6_bg_hover_color" value="<?php echo $oxy_mm6_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_link_color; ?></td>
						<td><input type="text" name="oxy_mm6_link_color" id="oxy_mm6_link_color" value="<?php echo $oxy_mm6_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_link_color_hover; ?></td>
						<td><input type="text" name="oxy_mm6_link_hover_color" id="oxy_mm6_link_hover_color" value="<?php echo $oxy_mm6_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr> 
                          
		 </table>            
        
        <table class="form">
                            
					<tr>
						<td colspan="2"><div><b>Custom Blocks Section</b></div></td>
					</tr>                           
                     <tr>
						<td><?php echo $text_show_bg_color; ?></td>
						<td>
                        <select name="oxy_mm8_bg_color_status" id="oxy_mm8_bg_color_status">
                            <option value="1"<?php if($oxy_mm8_bg_color_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_mm8_bg_color_status == '0') echo ' selected="selected"';?><?php if($oxy_mm8_bg_color_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>                                      
                    <tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_mm8_bg_color" id="oxy_mm8_bg_color" value="<?php echo $oxy_mm8_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_bg_color_hover; ?></td>
						<td><input type="text" name="oxy_mm8_bg_hover_color" id="oxy_mm8_bg_hover_color" value="<?php echo $oxy_mm8_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>                   
					<tr>
						<td><?php echo $text_link_color; ?></td>
						<td><input type="text" name="oxy_mm8_link_color" id="oxy_mm8_link_color" value="<?php echo $oxy_mm8_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_link_color_hover; ?></td>
						<td><input type="text" name="oxy_mm8_link_hover_color" id="oxy_mm8_link_hover_color" value="<?php echo $oxy_mm8_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr> 
                          
		 </table>                  
        
        <table class="form oxy_sep">
                            
					<tr>

						<td colspan="2"><div><b>Information Section</b></div></td>
					</tr>                         
                     <tr>
						<td><?php echo $text_show_bg_color; ?></td>
						<td>
                        <select name="oxy_mm5_bg_color_status" id="oxy_mm5_bg_color_status">
                            <option value="1"<?php if($oxy_mm5_bg_color_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_mm5_bg_color_status == '0') echo ' selected="selected"';?><?php if($oxy_mm5_bg_color_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>                                         
					<tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_mm5_bg_color" id="oxy_mm5_bg_color" value="<?php echo $oxy_mm5_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_bg_color_hover; ?></td>
						<td><input type="text" name="oxy_mm5_bg_hover_color" id="oxy_mm5_bg_hover_color" value="<?php echo $oxy_mm5_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_link_color; ?></td>
						<td><input type="text" name="oxy_mm5_link_color" id="oxy_mm5_link_color" value="<?php echo $oxy_mm5_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_link_color_hover; ?></td>
						<td><input type="text" name="oxy_mm5_link_hover_color" id="oxy_mm5_link_hover_color" value="<?php echo $oxy_mm5_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
                          
		 </table>                    
        
        <table class="form">
                            
					<tr>
						<td colspan="2"><div><b>Contact Section</b></div></td>
					</tr>                           
                     <tr>
						<td><?php echo $text_show_bg_color; ?></td>
						<td>
                        <select name="oxy_mm7_bg_color_status" id="oxy_mm7_bg_color_status">
                            <option value="1"<?php if($oxy_mm7_bg_color_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_mm7_bg_color_status == '0') echo ' selected="selected"';?><?php if($oxy_mm7_bg_color_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>                                      
                    <tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_mm7_bg_color" id="oxy_mm7_bg_color" value="<?php echo $oxy_mm7_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_bg_color_hover; ?></td>
						<td><input type="text" name="oxy_mm7_bg_hover_color" id="oxy_mm7_bg_hover_color" value="<?php echo $oxy_mm7_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_link_color; ?></td>
						<td><input type="text" name="oxy_mm7_link_color" id="oxy_mm7_link_color" value="<?php echo $oxy_mm7_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_link_color_hover; ?></td>
						<td><input type="text" name="oxy_mm7_link_hover_color" id="oxy_mm7_link_hover_color" value="<?php echo $oxy_mm7_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr> 
                          
		 </table>                   
        
        <table class="form oxy_sep">
                            
					<tr>
						<td colspan="2"><div><b>Sub-Menu</b></div></td>
					</tr>                         
                     <tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_mm_sub_bg_color" id="oxy_mm_sub_bg_color" value="<?php echo $oxy_mm_sub_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_67.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
                     <tr>
						<td><?php echo $text_bg_color_hover; ?></td>
						<td><input type="text" name="oxy_mm_sub_bg_hover_color" id="oxy_mm_sub_bg_hover_color" value="<?php echo $oxy_mm_sub_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_68.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
                     <tr>
						<td>Heading background color:</td>
						<td><input type="text" name="oxy_mm_sub_titles_bg_color" id="oxy_mm_sub_titles_bg_color" value="<?php echo $oxy_mm_sub_titles_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_69.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                         
                     <tr>
						<td><?php echo $text_text_color; ?></td>
						<td><input type="text" name="oxy_mm_sub_text_color" id="oxy_mm_sub_text_color" value="<?php echo $oxy_mm_sub_text_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_70.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
                     <tr>
						<td><?php echo $text_link_color; ?></td>
						<td><input type="text" name="oxy_mm_sub_link_color" id="oxy_mm_sub_link_color" value="<?php echo $oxy_mm_sub_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_71.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                     
                     <tr>
						<td><?php echo $text_link_color_hover; ?></td>
						<td><input type="text" name="oxy_mm_sub_link_hover_color" id="oxy_mm_sub_link_hover_color" value="<?php echo $oxy_mm_sub_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_72.jpg" target="_blank">?</a></span>
                        </td>
					</tr>

                    <tr>
						<td><?php echo $text_separator; ?></td>
						<td>                                        
                        <?php echo $text_style; ?>          
                        <select name="oxy_mm_sub_separator_style" id="oxy_mm_sub_separator_style">
                           <option value="solid"<?php if($oxy_mm_sub_separator_style == 'solid') echo ' selected="selected"';?>><?php echo $text_solid; ?></option>
                           <option value="dotted"<?php if($oxy_mm_sub_separator_style == 'dotted') echo ' selected="selected"';?>><?php echo $text_dotted; ?></option>
                           <option value="dashed"<?php if($oxy_mm_sub_separator_style == 'dashed') echo ' selected="selected"';?>><?php echo $text_dashed; ?></option>                          
                        </select>
                        <br /><br />
                        <?php echo $text_color; ?>
                        <input type="text" name="oxy_mm_sub_separator_color" id="oxy_mm_sub_separator_color" value="<?php echo $oxy_mm_sub_separator_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_73.jpg" target="_blank">?</a></span>
                        </td>                        
					</tr>                                                              
                     <tr>
						<td><?php echo $text_shadow; ?></td>
						<td>
                        <select name="oxy_mm_sub_box_shadow" id="oxy_mm_sub_box_shadow">
                            <option value="1"<?php if($oxy_mm_sub_box_shadow == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_mm_sub_box_shadow == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_74.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                                                                                     

		 </table>  
         
        <table class="form">
                            
					<tr>
						<td colspan="2"><div><b>Mobile Main Menu Bar</b></div></td>
					</tr>                         
                     <tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_mm_mobile_bg_color" id="oxy_mm_mobile_bg_color" value="<?php echo $oxy_mm_mobile_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_75.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
                     <tr>
						<td><?php echo $text_bg_color_hover; ?></td>
						<td><input type="text" name="oxy_mm_mobile_bg_hover_color" id="oxy_mm_mobile_bg_hover_color" value="<?php echo $oxy_mm_mobile_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_76.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                         
                     <tr>
						<td>"MENU" text color</td>
						<td><input type="text" name="oxy_mm_mobile_text_color" id="oxy_mm_mobile_text_color" value="<?php echo $oxy_mm_mobile_text_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_77.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                                                                                   

		 </table>           
            
        </div>                                 
        
        <div id="tab-colors-styles-midsection" class="vtabs-content">
          
        <table class="form">
                                                                                                                                                                                                   
					<tr>
						<td colspan="2"><div><b>Product Box</b></div></td>
					</tr>                     
                     <tr>
						<td><?php echo $text_bg_color_hover; ?></td>
						<td>
                        <input type="text" name="oxy_mid_prod_box_bg_hover_color" id="oxy_mid_prod_box_bg_hover_color" value="<?php echo $oxy_mid_prod_box_bg_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_78.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
                    <tr>
						<td>Shadow hover:</td>
						<td>
                        <select name="oxy_mid_prod_box_shadow_hover" id="oxy_mid_prod_box_shadow_hover">
                            <option value="1"<?php if($oxy_mid_prod_box_shadow_hover == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_mid_prod_box_shadow_hover == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_79.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                                                                                                    
                     <tr>
						<td>Sale Badge color:</td>
						<td><input type="text" name="oxy_mid_prod_box_sale_icon_color" id="oxy_mid_prod_box_sale_icon_color" value="<?php echo $oxy_mid_prod_box_sale_icon_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_80.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                     
                          
		 </table> 
         
        <table class="form oxy_sep">
                            
					<tr>
						<td colspan="2"><div><b>Rating Stars</b></div></td>
					</tr>                                   
         			<tr>
						<td>Rating stars color:</td>
						<td>
						<span class="oxy_help">1.&nbsp;&nbsp;</span><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/stars/stars1-4.png"><br />
						<span class="oxy_help">2.&nbsp;&nbsp;</span><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/stars/stars2-4.png"><br />
                        <span class="oxy_help">3.&nbsp;&nbsp;</span><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/stars/stars3-4.png"><br />
                        <span class="oxy_help">4.&nbsp;&nbsp;</span><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/stars/stars4-4.png"><br />
                        <span class="oxy_help">5.&nbsp;&nbsp;</span><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/stars/stars5-4.png"><br />
                        <span class="oxy_help">6.&nbsp;&nbsp;</span><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/stars/stars6-4.png"><br />
                        <span class="oxy_help">7.&nbsp;&nbsp;</span><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/stars/stars7-4.png"><br />
                        <span class="oxy_help">8.&nbsp;&nbsp;</span><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/stars/stars8-4.png"><br />
                        <span class="oxy_help">9.&nbsp;&nbsp;</span><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/stars/stars9-4.png"><br />
                        <span class="oxy_help">10.&nbsp;&nbsp;</span><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/stars/stars10-4.png"><br /><br />
                        <select name="oxy_mid_prod_stars_color" id="oxy_mid_prod_stars_color">                     
                           <option value="1"<?php if($oxy_mid_prod_stars_color == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_mid_prod_stars_color == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_mid_prod_stars_color == '3') echo ' selected="selected"';?>>3</option> 
                           <option value="4"<?php if($oxy_mid_prod_stars_color == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_mid_prod_stars_color == '5') echo ' selected="selected"';?>>5</option>
                           <option value="6"<?php if($oxy_mid_prod_stars_color == '6') echo ' selected="selected"';?>>6</option>
                           <option value="7"<?php if($oxy_mid_prod_stars_color == '7') echo ' selected="selected"';?>>7</option>
                           <option value="8"<?php if($oxy_mid_prod_stars_color == '8') echo ' selected="selected"';?>>8</option>
                           <option value="9"<?php if($oxy_mid_prod_stars_color == '9') echo ' selected="selected"';?>>9</option>
                           <option value="10"<?php if($oxy_mid_prod_stars_color == '10') echo ' selected="selected"';?>>10</option>                            
                        </select>
                        <span class="oxy_help">Select a stars color number.</span>
                        </td>
					</tr>                                  
                     
		 </table>                             
         
        <table class="form">
                            
					<tr>
						<td colspan="2"><div><b>Product Page - Tabs</b></div></td>
					</tr>                    
					<tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_mid_prod_page_tabs_bg_color" id="oxy_mid_prod_page_tabs_bg_color" value="<?php echo $oxy_mid_prod_page_tabs_bg_color; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_81.jpg" target="_blank">?</a></span>
                        </td>
					</tr>   
                    <tr>
						<td>Selected tab background color:</td>
						<td><input type="text" name="oxy_mid_prod_page_tabs_selected_bg_color" id="oxy_mid_prod_page_tabs_selected_bg_color" value="<?php echo $oxy_mid_prod_page_tabs_selected_bg_color; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_82.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
                    <tr>
						<td><?php echo $text_text_color; ?></td>
						<td><input type="text" name="oxy_mid_prod_page_tabs_text_color" id="oxy_mid_prod_page_tabs_text_color" value="<?php echo $oxy_mid_prod_page_tabs_text_color; ?>" 
                        class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_83.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                       
                     
		 </table>            
         
                 <table class="form oxy_sep">

					<tr>
						<td colspan="2"><div><b>Product Slider on Home Page</b></div></td>
					</tr>
                    <tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_mid_prod_slider_bg_color" id="oxy_mid_prod_slider_bg_color" value="<?php echo $oxy_mid_prod_slider_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_117.png" target="_blank">?</a></span>
                        </td>
					</tr>
				    <tr>
					    <td>Upload your own pattern or background image:</td>
					    <td><input type="hidden" name="oxy_mid_prod_slider_custom" value="<?php echo $oxy_mid_prod_slider_custom; ?>" id="oxy_mid_prod_slider_custom" />
						<img src="<?php echo $oxy_mid_prod_slider_thumb; ?>" id="oxy_mid_prod_slider_thumb" />
						<br /><a onclick="image_upload('oxy_mid_prod_slider_custom', 'oxy_mid_prod_slider_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#oxy_mid_prod_slider_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_mid_prod_slider_custom').attr('value', '');">
                        <?php echo $text_clear; ?></a>
					    </td>
				    </tr>
  					<tr>
						<td>Position:</td>
						<td>                        
                        <select name="oxy_mid_prod_slider_custom_position">
                           <option value="top center"<?php if($oxy_mid_prod_slider_custom_position == 'top center') echo ' selected="selected"';?>><?php echo $text_position_tc; ?></option>
                           <option value="top left"<?php if($oxy_mid_prod_slider_custom_position == 'top left') echo ' selected="selected"';?>><?php echo $text_position_tl; ?></option>
                           <option value="top right"<?php if($oxy_mid_prod_slider_custom_position == 'top right') echo ' selected="selected"';?>><?php echo $text_position_tr; ?></option> 
                           <option value="center"<?php if($oxy_mid_prod_slider_custom_position == 'center') echo ' selected="selected"';?>><?php echo $text_position_c; ?></option>
                           <option value="left"<?php if($oxy_mid_prod_slider_custom_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>
                           <option value="right"<?php if($oxy_mid_prod_slider_custom_position == 'right') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>
                           <option value="bottom center"<?php if($oxy_mid_prod_slider_custom_position == 'bottom center') echo ' selected="selected"';?>><?php echo $text_position_bc; ?></option>
                           <option value="bottom left"<?php if($oxy_mid_prod_slider_custom_position == 'bottom left') echo ' selected="selected"';?>><?php echo $text_position_bl; ?></option>
                           <option value="bottom right"<?php if($oxy_mid_prod_slider_custom_position == 'bottom right') echo ' selected="selected"';?>><?php echo $text_position_br; ?></option>
                        </select>
                        </td>
					</tr> 
  					<tr>
						<td>Repeat:</td>
						<td>                        
                        <select name="oxy_mid_prod_slider_custom_repeat">
                           <option value="repeat"<?php if($oxy_mid_prod_slider_custom_repeat == 'repeat') echo ' selected="selected"';?>><?php echo $text_repeat_r; ?></option>                        
                           <option value="repeat-x"<?php if($oxy_mid_prod_slider_custom_repeat == 'repeat-x') echo ' selected="selected"';?>><?php echo $text_repeat_rx; ?></option> 
                           <option value="repeat-y"<?php if($oxy_mid_prod_slider_custom_repeat == 'repeat-y') echo ' selected="selected"';?>><?php echo $text_repeat_ry; ?></option>  
                           <option value="no-repeat"<?php if($oxy_mid_prod_slider_custom_repeat == 'no-repeat') echo ' selected="selected"';?>><?php echo $text_repeat_nr; ?></option>                     
                        </select>
                        </td>
					</tr>                                              
                    <tr>
						<td>Product name color:</td>
						<td>
                        <input type="text" name="oxy_mid_prod_slider_name_color" id="oxy_mid_prod_slider_name_color" value="<?php echo $oxy_mid_prod_slider_name_color; ?>" class="color {required:false,hash:true}" 
                        size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_118.png" target="_blank">?</a></span>
                        </td>
					</tr>     
                    <tr>
						<td>Product description color:</td>
						<td>
                        <input type="text" name="oxy_mid_prod_slider_desc_color" id="oxy_mid_prod_slider_desc_color" value="<?php echo $oxy_mid_prod_slider_desc_color; ?>" class="color {required:false,hash:true}" 
                        size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_119.png" target="_blank">?</a></span>
                        </td>
					</tr> 
                    <tr>
						<td>Product price color:</td>
						<td>
                        <input type="text" name="oxy_mid_prod_slider_price_color" id="oxy_mid_prod_slider_price_color" value="<?php echo $oxy_mid_prod_slider_price_color; ?>" class="color {required:false,hash:true}"
                        size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_120.png" target="_blank">?</a></span>
                        </td>
					</tr> 
                    <tr>
						<td>Product links color hover:</td>
						<td>
                        <input type="text" name="oxy_mid_prod_slider_links_color_hover" id="oxy_mid_prod_slider_links_color_hover" value="<?php echo $oxy_mid_prod_slider_links_color_hover; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_121.png" target="_blank">?</a></span>
                        </td>
					</tr>    
                    <tr>
						<td>Bottom bar background color:</td>
						<td>
                        <input type="text" name="oxy_mid_prod_slider_bottom_bar_bg_color" id="oxy_mid_prod_slider_bottom_bar_bg_color" value="<?php echo $oxy_mid_prod_slider_bottom_bar_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_122.png" target="_blank">?</a></span>
                        </td>
					</tr>    
                    <tr>
						<td>Bottom bar background color hover:</td>
						<td>
                        <input type="text" name="oxy_mid_prod_slider_bottom_bar_bg_color_hover" id="oxy_mid_prod_slider_bottom_bar_bg_color_hover" value="<?php echo $oxy_mid_prod_slider_bottom_bar_bg_color_hover; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_123.png" target="_blank">?</a></span>
                        </td>
					</tr> 
                    <tr>
						<td>Bottom bar background color active:</td>
						<td>
                        <input type="text" name="oxy_mid_prod_slider_bottom_bar_bg_color_active" id="oxy_mid_prod_slider_bottom_bar_bg_color_active" value="<?php echo $oxy_mid_prod_slider_bottom_bar_bg_color_active; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_124.png" target="_blank">?</a></span>
                        </td>
					</tr> 
                          
		 </table>           
              
        </div> 
        
        <div id="tab-colors-styles-footer" class="vtabs-content">     
        
        <table class="form">
        
					<tr>
						<td colspan="2"><div><b>Feature Block</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_88.jpg" target="_blank">?</a></span></div></td>
					</tr>
					<tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_fp_bg_color" id="oxy_fp_bg_color" value="<?php echo $oxy_fp_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_84.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
                    <tr>
						<td>Titles color:</td>
						<td><input type="text" name="oxy_fp_title_color" id="oxy_fp_title_color" value="<?php echo $oxy_fp_title_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_85.jpg" target="_blank">?</a></span>
                        </td>
					</tr>    
                    <tr>
						<td>Titles color hover:</td>
						<td><input type="text" name="oxy_fp_title_color_hover" id="oxy_fp_title_color_hover" value="<?php echo $oxy_fp_title_color_hover; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_86.jpg" target="_blank">?</a></span>
                        </td>
					</tr>    
                    <tr>
						<td>Subtitles color:</td>
						<td><input type="text" name="oxy_fp_subtitle_color" id="oxy_fp_subtitle_color" value="<?php echo $oxy_fp_subtitle_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_87.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                           
                    
		 </table>
        
         <table class="form oxy_sep">
        
					<tr>
						<td colspan="2"><div><b>About Us, Custom Column, Follow Us, Contact Us</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_89.jpg" target="_blank">?</a></span></div></td>
					</tr>
					<tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_f1_bg_color" id="oxy_f1_bg_color" value="<?php echo $oxy_f1_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_90.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
					<tr>
						<td><?php echo $text_titles_color; ?></td>
						<td><input type="text" name="oxy_f1_titles_color" id="oxy_f1_titles_color" value="<?php echo $oxy_f1_titles_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_91.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_titles_border_bottom; ?></td>
						<td>
                        <?php echo $text_size; ?>
                         <select name="oxy_f1_titles_border_bottom_size" id="oxy_f1_titles_border_bottom_size">
                           <option value="1"<?php if($oxy_f1_titles_border_bottom_size == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_f1_titles_border_bottom_size == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_f1_titles_border_bottom_size == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_f1_titles_border_bottom_size == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_f1_titles_border_bottom_size == '5') echo ' selected="selected"';?>>5</option>                                                       
                        </select>
                        <span class="oxy_help"><?php echo $text_px; ?></span>
                        <br /><br />                            
                        <?php echo $text_style; ?>          
                        <select name="oxy_f1_titles_border_bottom_style" id="oxy_f1_titles_border_bottom_style">
                           <option value="solid"<?php if($oxy_f1_titles_border_bottom_style == 'solid') echo ' selected="selected"';?>><?php echo $text_solid; ?></option>
                           <option value="dotted"<?php if($oxy_f1_titles_border_bottom_style == 'dotted') echo ' selected="selected"';?>><?php echo $text_dotted; ?></option>
                           <option value="dashed"<?php if($oxy_f1_titles_border_bottom_style == 'dashed') echo ' selected="selected"';?>><?php echo $text_dashed; ?></option>                          
                        </select>
                        <br /><br />
                        <?php echo $text_color; ?>
                        <input type="text" name="oxy_f1_titles_border_bottom_color" id="oxy_f1_titles_border_bottom_color" value="<?php echo $oxy_f1_titles_border_bottom_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_92.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                          
					<tr>
						<td><?php echo $text_text_color; ?></td>
						<td><input type="text" name="oxy_f1_text_color" id="oxy_f1_text_color" value="<?php echo $oxy_f1_text_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_93.jpg" target="_blank">?</a></span>
                        </td>
					</tr>   
					<tr>
						<td><?php echo $text_link_color; ?></td>
						<td><input type="text" name="oxy_f1_link_color" id="oxy_f1_link_color" value="<?php echo $oxy_f1_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_94.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
					<tr>
						<td><?php echo $text_link_color_hover; ?></td>
						<td><input type="text" name="oxy_f1_link_hover_color" id="oxy_f1_link_hover_color" value="<?php echo $oxy_f1_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_95.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
					<tr>
						<td>Icon color:</td>
						<td><input type="text" name="oxy_f1_icon_color" id="oxy_f1_icon_color" value="<?php echo $oxy_f1_icon_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_96.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                         
              		<tr>
						<td><?php echo $text_border_top; ?></td>
						<td>
                        <?php echo $text_show; ?>
                        <select name="oxy_f1_border_top_status" id="oxy_f1_border_top_status">
                            <option value="1"<?php if($oxy_f1_border_top_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_f1_border_top_status == '0') echo ' selected="selected"';?><?php if($oxy_f1_border_top_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>                
                        <br /><br />
                        <?php echo $text_size; ?>
                        <select name="oxy_f1_border_top_size" id="oxy_f1_border_top_size">
                           <option value="1"<?php if($oxy_f1_border_top_size == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_f1_border_top_size == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_f1_border_top_size == '3') echo ' selected="selected"';?><?php if($oxy_f1_border_top_size == '') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_f1_border_top_size == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_f1_border_top_size == '5') echo ' selected="selected"';?>>5</option>                                                       
                        </select>
                        <span class="oxy_help"><?php echo $text_px; ?></span>
                        <br /><br />                            
                        <?php echo $text_style; ?>          
                        <select name="oxy_f1_border_top_style" id="oxy_f1_border_top_style">
                           <option value="solid"<?php if($oxy_f1_border_top_style == 'solid') echo ' selected="selected"';?>><?php echo $text_solid; ?></option>
                           <option value="dotted"<?php if($oxy_f1_border_top_style == 'dotted') echo ' selected="selected"';?>><?php echo $text_dotted; ?></option>
                           <option value="dashed"<?php if($oxy_f1_border_top_style == 'dashed') echo ' selected="selected"';?>><?php echo $text_dashed; ?></option>                          
                        </select>
                        <br /><br />
                        <?php echo $text_color; ?>
                        <input type="text" name="oxy_f1_border_top_color" id="oxy_f1_border_top_color" value="<?php echo $oxy_f1_border_top_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_97.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                          
                    
		 </table>
         
         <table class="form">
        
					<tr>
						<td colspan="2"><div><b>Information, Customer Service, Extras, My Account</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_98.jpg" target="_blank">?</a></span></div></td>
					</tr>
					<tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_f2_bg_color" id="oxy_f2_bg_color" value="<?php echo $oxy_f2_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_99.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
					<tr>
						<td><?php echo $text_titles_color; ?></td>
						<td><input type="text" name="oxy_f2_titles_color" id="oxy_f2_titles_color" value="<?php echo $oxy_f2_titles_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_100.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_titles_border_bottom; ?></td>
						<td>
                        <?php echo $text_size; ?>
                        <select name="oxy_f2_titles_border_bottom_size" id="oxy_f2_titles_border_bottom_size">
                           <option value="1"<?php if($oxy_f2_titles_border_bottom_size == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_f2_titles_border_bottom_size == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_f2_titles_border_bottom_size == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_f2_titles_border_bottom_size == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_f2_titles_border_bottom_size == '5') echo ' selected="selected"';?>>5</option>                                                       
                        </select>
                        <span class="oxy_help"><?php echo $text_px; ?></span>
                        <br /><br />                            
                        <?php echo $text_style; ?>          
                        <select name="oxy_f2_titles_border_bottom_style" id="oxy_f2_titles_border_bottom_style">
                           <option value="solid"<?php if($oxy_f2_titles_border_bottom_style == 'solid') echo ' selected="selected"';?>><?php echo $text_solid; ?></option>
                           <option value="dotted"<?php if($oxy_f2_titles_border_bottom_style == 'dotted') echo ' selected="selected"';?>><?php echo $text_dotted; ?></option>
                           <option value="dashed"<?php if($oxy_f2_titles_border_bottom_style == 'dashed') echo ' selected="selected"';?>><?php echo $text_dashed; ?></option>                          
                        </select>
                        <br /><br />
                        <?php echo $text_color; ?>
                        <input type="text" name="oxy_f2_titles_border_bottom_color" id="oxy_f2_titles_border_bottom_color" value="<?php echo $oxy_f2_titles_border_bottom_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_101.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                                                   
					<tr>
						<td><?php echo $text_link_color; ?></td>
						<td><input type="text" name="oxy_f2_link_color" id="oxy_f2_link_color" value="<?php echo $oxy_f2_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_102.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
					<tr>
						<td><?php echo $text_link_color_hover; ?></td>
						<td><input type="text" name="oxy_f2_link_hover_color" id="oxy_f2_link_hover_color" value="<?php echo $oxy_f2_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_103.jpg" target="_blank">?</a></span>
                        </td>
					</tr>   
              		<tr>
						<td><?php echo $text_border_top; ?></td>
						<td>
                        <?php echo $text_show; ?>
                        <select name="oxy_f2_border_top_status" id="oxy_f2_border_top_status">
                            <option value="1"<?php if($oxy_f2_border_top_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_f2_border_top_status == '0') echo ' selected="selected"';?><?php if($oxy_f2_border_top_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        <br /><br />
                        <?php echo $text_size; ?>
                        <select name="oxy_f2_border_top_size" id="oxy_f2_border_top_size">
                           <option value="1"<?php if($oxy_f2_border_top_size == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_f2_border_top_size == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_f2_border_top_size == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_f2_border_top_size == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_f2_border_top_size == '5') echo ' selected="selected"';?>>5</option>                                                       
                        </select>
                        <span class="oxy_help"><?php echo $text_px; ?></span>
                        <br /><br />                            
                        <?php echo $text_style; ?>          
                        <select name="oxy_f2_border_top_style" id="oxy_f2_border_top_style">
                           <option value="solid"<?php if($oxy_f2_border_top_style == 'solid') echo ' selected="selected"';?>><?php echo $text_solid; ?></option>
                           <option value="dotted"<?php if($oxy_f2_border_top_style == 'dotted') echo ' selected="selected"';?>><?php echo $text_dotted; ?></option>
                           <option value="dashed"<?php if($oxy_f2_border_top_style == 'dashed') echo ' selected="selected"';?>><?php echo $text_dashed; ?></option>                          
                        </select>
                        <br /><br />
                        <?php echo $text_color; ?>
                        <input type="text" name="oxy_f2_border_top_color" id="oxy_f2_border_top_color" value="<?php echo $oxy_f2_border_top_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_104.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                                                                                

		 </table>
                 
         <table class="form oxy_sep">
        
					<tr>
						<td colspan="2"><div><b>Powered by, Payment Images</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_105.jpg" target="_blank">?</a></span></div></td>
					</tr>
					<tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_f4_bg_color" id="oxy_f4_bg_color" value="<?php echo $oxy_f4_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_106.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
					<tr>
						<td><?php echo $text_text_color; ?></td>
						<td><input type="text" name="oxy_f4_text_color" id="oxy_f4_text_color" value="<?php echo $oxy_f4_text_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_107.jpg" target="_blank">?</a></span>
                        </td>
					</tr>   
					<tr>
						<td><?php echo $text_link_color; ?></td>
						<td><input type="text" name="oxy_f4_link_color" id="oxy_f4_link_color" value="<?php echo $oxy_f4_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_108.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
					<tr>
						<td><?php echo $text_link_color_hover; ?></td>
						<td><input type="text" name="oxy_f4_link_hover_color" id="oxy_f4_link_hover_color" value="<?php echo $oxy_f4_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_109.jpg" target="_blank">?</a></span>
                        </td>
					</tr>    
              		<tr>
						<td><?php echo $text_border_top; ?></td>
						<td>
                        <?php echo $text_show; ?>
                        <select name="oxy_f4_border_top_status" id="oxy_f4_border_top_status">
                            <option value="1"<?php if($oxy_f4_border_top_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_f4_border_top_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        <br /><br />
                        <?php echo $text_size; ?>
                        <select name="oxy_f4_border_top_size" id="oxy_f4_border_top_size">
                           <option value="1"<?php if($oxy_f4_border_top_size == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_f4_border_top_size == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_f4_border_top_size == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_f4_border_top_size == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_f4_border_top_size == '5') echo ' selected="selected"';?>>5</option>                                                       
                        </select>
                        <span class="oxy_help"><?php echo $text_px; ?></span>
                        <br /><br />                            
                        <?php echo $text_style; ?>          
                        <select name="oxy_f4_border_top_style" id="oxy_f4_border_top_style">
                           <option value="solid"<?php if($oxy_f4_border_top_style == 'solid') echo ' selected="selected"';?>><?php echo $text_solid; ?></option>
                           <option value="dotted"<?php if($oxy_f4_border_top_style == 'dotted') echo ' selected="selected"';?>><?php echo $text_dotted; ?></option>
                           <option value="dashed"<?php if($oxy_f4_border_top_style == 'dashed') echo ' selected="selected"';?>><?php echo $text_dashed; ?></option>                          
                        </select>
                        <br /><br />
                        <?php echo $text_color; ?>
                        <input type="text" name="oxy_f4_border_top_color" id="oxy_f4_border_top_color" value="<?php echo $oxy_f4_border_top_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_110.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                                                                                      

		 </table>
         
         <table class="form">
        
					<tr>
						<td colspan="2"><div><b>Bottom Custom Block</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_111.jpg" target="_blank">?</a></span></div></td>
					</tr>
					<tr>
						<td><?php echo $text_bg_color; ?></td>
						<td><input type="text" name="oxy_f5_bg_color" id="oxy_f5_bg_color" value="<?php echo $oxy_f5_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_112.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
					<tr>
						<td><?php echo $text_text_color; ?></td>
						<td><input type="text" name="oxy_f5_text_color" id="oxy_f5_text_color" value="<?php echo $oxy_f5_text_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_113.jpg" target="_blank">?</a></span>
                        </td>
					</tr>   
					<tr>
						<td><?php echo $text_link_color; ?></td>
						<td><input type="text" name="oxy_f5_link_color" id="oxy_f5_link_color" value="<?php echo $oxy_f5_link_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_114.jpg" target="_blank">?</a></span>
                        </td>
					</tr>  
					<tr>
						<td><?php echo $text_link_color_hover; ?></td>
						<td><input type="text" name="oxy_f5_link_hover_color" id="oxy_f5_link_hover_color" value="<?php echo $oxy_f5_link_hover_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_115.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
              		<tr>
						<td><?php echo $text_border_top; ?></td>
						<td>
                        <?php echo $text_show; ?>
                        <select name="oxy_f5_border_top_status" id="oxy_f5_border_top_status">
                            <option value="1"<?php if($oxy_f5_border_top_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_f5_border_top_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>         
                        <br /><br />
                        <?php echo $text_size; ?>
                        <select name="oxy_f5_border_top_size" id="oxy_f5_border_top_size">
                           <option value="1"<?php if($oxy_f5_border_top_size == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_f5_border_top_size == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_f5_border_top_size == '3') echo ' selected="selected"';?>>3</option>
                           <option value="4"<?php if($oxy_f5_border_top_size == '4') echo ' selected="selected"';?>>4</option>
                           <option value="5"<?php if($oxy_f5_border_top_size == '5') echo ' selected="selected"';?>>5</option>                                                       
                        </select>
                        <span class="oxy_help"><?php echo $text_px; ?></span>
                        <br /><br />                            
                        <?php echo $text_style; ?>          
                        <select name="oxy_f5_border_top_style" id="oxy_f5_border_top_style">
                           <option value="solid"<?php if($oxy_f5_border_top_style == 'solid') echo ' selected="selected"';?>><?php echo $text_solid; ?></option>
                           <option value="dotted"<?php if($oxy_f5_border_top_style == 'dotted') echo ' selected="selected"';?>><?php echo $text_dotted; ?></option>
                           <option value="dashed"<?php if($oxy_f5_border_top_style == 'dashed') echo ' selected="selected"';?>><?php echo $text_dashed; ?></option>                          
                        </select>
                        <br /><br />
                        <?php echo $text_color; ?>
                        <input type="text" name="oxy_f5_border_top_color" id="oxy_f5_border_top_color" value="<?php echo $oxy_f5_border_top_color; ?>" class="color {required:false,hash:true}" size="7" />
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_116.jpg" target="_blank">?</a></span>
                        </td>
					</tr>                                                                                                    

		 </table>                                          
        </div>     
        
        </div>             


        <div id="tab-background-images">
      
            <div id="background_images_settings_tabs" class="vtabs">
             <a href="#tab-background-images-body">Body</a>
             <a href="#tab-background-images-main-column">Main Column</a>  
             <a href="#tab-background-images-top-area">Header</a>             
             <a href="#tab-background-images-main-menu">Main Menu</a>
             <a href="#tab-background-images-footer">Footer</a>                                   
           </div> 
        
        <div id="tab-background-images-body" class="vtabs-content">        
        <table class="form oxy_sep">  
                            
				    <tr>
					    <td><div><b>Body</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_1.jpg" target="_blank">?</a></span></div></td>
					    <td>
						<select name="oxy_pattern_oxy" id="oxy_pattern_oxy">
                        <?php foreach ($bgp as $bgv => $bgcr) { ?>
                        <?php ($bgv == $this->config->get('oxy_pattern_oxy'))?$bp='selected':$bp=''; ?>
                           <option value="<?php echo $bgv; ?>" <?php echo $bp; ?>><?php echo $bgcr; ?></option>	
                        <?php } ?> 
						</select>
						<span class="oxy_help">Select a pattern number.</span>
					    </td>
				    </tr>                       
				    <tr>
					    <td>Upload your own pattern or background image: </td>
					    <td><input type="hidden" name="oxy_bg_image_custom" value="<?php echo $oxy_bg_image_custom; ?>" id="oxy_bg_image_custom" />
						<img src="<?php echo $oxy_bg_image_thumb; ?>" id="oxy_bg_image_thumb" />
						<br /><a onclick="image_upload('oxy_bg_image_custom', 'oxy_bg_image_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#oxy_bg_image_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_bg_image_custom').attr('value', '');"><?php echo $text_clear; ?></a>
					    </td>
				    </tr>                    
  					<tr>
						<td><?php echo $text_position; ?></td>
						<td>                        
                        <select name="oxy_bg_image_position" id="oxy_bg_image_position">
                           <option value="top center"<?php if($oxy_bg_image_position == 'top center') echo ' selected="selected"';?>><?php echo $text_position_tc; ?></option>
                           <option value="top left"<?php if($oxy_bg_image_position == 'top left') echo ' selected="selected"';?>><?php echo $text_position_tl; ?></option>
                           <option value="top right"<?php if($oxy_bg_image_position == 'top right') echo ' selected="selected"';?>><?php echo $text_position_tr; ?></option> 
                           <option value="center"<?php if($oxy_bg_image_position == 'center') echo ' selected="selected"';?>><?php echo $text_position_c; ?></option>
                           <option value="left"<?php if($oxy_bg_image_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>
                           <option value="right"<?php if($oxy_bg_image_position == 'right') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>
                           <option value="bottom center"<?php if($oxy_bg_image_position == 'bottom center') echo ' selected="selected"';?>><?php echo $text_position_bc; ?></option>
                           <option value="bottom left"<?php if($oxy_bg_image_position == 'bottom left') echo ' selected="selected"';?>><?php echo $text_position_bl; ?></option>
                           <option value="bottom right"<?php if($oxy_bg_image_position == 'bottom right') echo ' selected="selected"';?>><?php echo $text_position_br; ?></option>                           
                        </select>
                        </td>
					</tr> 
  					<tr>
						<td><?php echo $text_repeat; ?></td>
						<td>                        
                        <select name="oxy_bg_image_repeat" id="oxy_bg_image_repeat">
                           <option value="repeat"<?php if($oxy_bg_image_repeat == 'repeat') echo ' selected="selected"';?>><?php echo $text_repeat_r; ?></option>
                           <option value="repeat-x"<?php if($oxy_bg_image_repeat == 'repeat-x') echo ' selected="selected"';?>><?php echo $text_repeat_rx; ?></option> 
                           <option value="repeat-y"<?php if($oxy_bg_image_repeat == 'repeat-y') echo ' selected="selected"';?>><?php echo $text_repeat_ry; ?></option>
                           <option value="no-repeat"<?php if($oxy_bg_image_repeat == 'no-repeat') echo ' selected="selected"';?>><?php echo $text_repeat_nr; ?></option>                      
                        </select>
                        </td>
					</tr>                       
  					<tr>
						<td><?php echo $text_attachment; ?></td>
						<td>                        
                        <select name="oxy_bg_image_attachment" id="oxy_bg_image_attachment">
                           <option value="scroll"<?php if($oxy_bg_image_attachment == 'scroll') echo ' selected="selected"';?>><?php echo $text_attachment_s; ?></option>
                           <option value="fixed"<?php if($oxy_bg_image_attachment == 'fixed') echo ' selected="selected"';?>><?php echo $text_attachment_f; ?></option>                      
                        </select>
                        </td>
					</tr>
                    
        </table> 
        </div>   
        
        <div id="tab-background-images-main-column" class="vtabs-content">        
        <table class="form oxy_sep">      
                      
				    <tr>
					    <td><div><b>Main Column</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_8.jpg" target="_blank">?</a></span></div></td>
					    <td>
						<select name="oxy_pattern_oxy_mc" id="oxy_pattern_oxy_mc">
                        <?php foreach ($bgp as $bgv => $bgcr) { ?>
                        <?php ($bgv == $this->config->get('oxy_pattern_oxy_mc'))?$bp='selected':$bp=''; ?>
                           <option value="<?php echo $bgv; ?>" <?php echo $bp; ?>> <?php echo $bgcr; ?> </option>	
                        <?php } ?> 
						</select>
						<span class="oxy_help">Select a pattern number.</span>     
					    </td>
				    </tr> 
				    <tr>
					    <td>Upload your own pattern or background image: </td>
					    <td><input type="hidden" name="oxy_bg_image_mc_custom" value="<?php echo $oxy_bg_image_mc_custom; ?>" id="oxy_bg_image_mc_custom" />
						<img src="<?php echo $oxy_bg_image_mc_thumb; ?>" id="oxy_bg_image_mc_thumb" />
						<br /><a onclick="image_upload('oxy_bg_image_mc_custom', 'oxy_bg_image_mc_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a onclick="$('#oxy_bg_image_mc_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_bg_image_mc_custom').attr('value', '');"><?php echo $text_clear; ?></a>
					    </td>
				    </tr>  
  					<tr>
						<td><?php echo $text_position; ?></td>
						<td>                        
                        <select name="oxy_bg_image_mc_position" id="oxy_bg_image_mc_position">
                           <option value="top center"<?php if($oxy_bg_image_mc_position == 'top center') echo ' selected="selected"';?>><?php echo $text_position_tc; ?></option>
                           <option value="top left"<?php if($oxy_bg_image_mc_position == 'top left') echo ' selected="selected"';?>><?php echo $text_position_tl; ?></option>
                           <option value="top right"<?php if($oxy_bg_image_mc_position == 'top right') echo ' selected="selected"';?>><?php echo $text_position_tr; ?></option> 
                           <option value="center"<?php if($oxy_bg_image_mc_position == 'center') echo ' selected="selected"';?>><?php echo $text_position_c; ?></option>
                           <option value="left"<?php if($oxy_bg_image_mc_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>
                           <option value="right"<?php if($oxy_bg_image_mc_position == 'right') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>
                           <option value="bottom center"<?php if($oxy_bg_image_mc_position == 'bottom center') echo ' selected="selected"';?>><?php echo $text_position_bc; ?></option>
                           <option value="bottom left"<?php if($oxy_bg_image_mc_position == 'bottom left') echo ' selected="selected"';?>><?php echo $text_position_bl; ?></option>
                           <option value="bottom right"<?php if($oxy_bg_image_mc_position == 'bottom right') echo ' selected="selected"';?>><?php echo $text_position_br; ?></option>
                        </select>
                        </td>
					</tr> 
  					<tr>
						<td><?php echo $text_repeat; ?></td>
						<td>                        
                        <select name="oxy_bg_image_mc_repeat" id="oxy_bg_image_mc_repeat">
                           <option value="repeat"<?php if($oxy_bg_image_mc_repeat == 'repeat') echo ' selected="selected"';?>><?php echo $text_repeat_r; ?></option>
                           <option value="repeat-x"<?php if($oxy_bg_image_mc_repeat == 'repeat-x') echo ' selected="selected"';?>><?php echo $text_repeat_rx; ?></option> 
                           <option value="repeat-y"<?php if($oxy_bg_image_mc_repeat == 'repeat-y') echo ' selected="selected"';?>><?php echo $text_repeat_ry; ?></option> 
                           <option value="no-repeat"<?php if($oxy_bg_image_mc_repeat == 'no-repeat') echo ' selected="selected"';?>><?php echo $text_repeat_nr; ?></option>                      
                        </select>
                        </td>
					</tr>                       
  					<tr>
						<td><?php echo $text_attachment; ?></td>
						<td>                        
                        <select name="oxy_bg_image_mc_attachment" id="oxy_bg_image_mc_attachment">
                           <option value="scroll"<?php if($oxy_bg_image_mc_attachment == 'scroll') echo ' selected="selected"';?>><?php echo $text_attachment_s; ?></option>
                           <option value="fixed"<?php if($oxy_bg_image_mc_attachment == 'fixed') echo ' selected="selected"';?>><?php echo $text_attachment_f; ?></option>                      
                        </select>
                        </td>
					</tr>
                    
        </table>    
        </div> 
        
        <div id="tab-background-images-top-area" class="vtabs-content">        
        <table class="form oxy_sep">      
                      
				    <tr>
					    <td><div><b>Header</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_38.jpg" target="_blank">?</a></span></div></td>
					    <td>
						<select name="oxy_pattern_oxy_ta" id="oxy_pattern_oxy_ta">
                        <?php foreach ($bgp as $bgv => $bgcr) { ?>
                        <?php ($bgv == $this->config->get('oxy_pattern_oxy_ta'))?$bp='selected':$bp=''; ?>
                           <option value="<?php echo $bgv; ?>" <?php echo $bp; ?>> <?php echo $bgcr; ?> </option>	
                        <?php } ?> 
						</select>
						<span class="oxy_help">Select a pattern number.</span>     
					    </td>
				    </tr> 
				    <tr>
					    <td>Upload your own pattern or background image: </td>
					    <td><input type="hidden" name="oxy_bg_image_ta_custom" value="<?php echo $oxy_bg_image_ta_custom; ?>" id="oxy_bg_image_ta_custom" />
						<img src="<?php echo $oxy_bg_image_ta_thumb; ?>" id="oxy_bg_image_ta_thumb" />
						<br /><a onclick="image_upload('oxy_bg_image_ta_custom', 'oxy_bg_image_ta_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a onclick="$('#oxy_bg_image_ta_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_bg_image_ta_custom').attr('value', '');"><?php echo $text_clear; ?></a>
					    </td>
				    </tr>  
  					<tr>
						<td><?php echo $text_position; ?></td>
						<td>                        
                        <select name="oxy_bg_image_ta_position" id="oxy_bg_image_ta_position">
                           <option value="top center"<?php if($oxy_bg_image_ta_position == 'top center') echo ' selected="selected"';?>><?php echo $text_position_tc; ?></option>
                           <option value="top left"<?php if($oxy_bg_image_ta_position == 'top left') echo ' selected="selected"';?>><?php echo $text_position_tl; ?></option>
                           <option value="top right"<?php if($oxy_bg_image_ta_position == 'top right') echo ' selected="selected"';?>><?php echo $text_position_tr; ?></option> 
                           <option value="center"<?php if($oxy_bg_image_ta_position == 'center') echo ' selected="selected"';?>><?php echo $text_position_c; ?></option>
                           <option value="left"<?php if($oxy_bg_image_ta_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>
                           <option value="right"<?php if($oxy_bg_image_ta_position == 'right') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>
                           <option value="bottom center"<?php if($oxy_bg_image_ta_position == 'bottom center') echo ' selected="selected"';?>><?php echo $text_position_bc; ?></option>
                           <option value="bottom left"<?php if($oxy_bg_image_ta_position == 'bottom left') echo ' selected="selected"';?>><?php echo $text_position_bl; ?></option>
                           <option value="bottom right"<?php if($oxy_bg_image_ta_position == 'bottom right') echo ' selected="selected"';?>><?php echo $text_position_br; ?></option>
                        </select>
                        </td>
					</tr> 
  					<tr>
						<td><?php echo $text_repeat; ?></td>
						<td>                        
                        <select name="oxy_bg_image_ta_repeat" id="oxy_bg_image_ta_repeat">
                           <option value="repeat"<?php if($oxy_bg_image_ta_repeat == 'repeat') echo ' selected="selected"';?>><?php echo $text_repeat_r; ?></option>
                           <option value="repeat-x"<?php if($oxy_bg_image_ta_repeat == 'repeat-x') echo ' selected="selected"';?>><?php echo $text_repeat_rx; ?></option> 
                           <option value="repeat-y"<?php if($oxy_bg_image_ta_repeat == 'repeat-y') echo ' selected="selected"';?>><?php echo $text_repeat_ry; ?></option> 
                           <option value="no-repeat"<?php if($oxy_bg_image_ta_repeat == 'no-repeat') echo ' selected="selected"';?>><?php echo $text_repeat_nr; ?></option>                      
                        </select>
                        </td>
					</tr>                       
  					<tr>
						<td><?php echo $text_attachment; ?></td>
						<td>                        
                        <select name="oxy_bg_image_ta_attachment" id="oxy_bg_image_ta_attachment">
                           <option value="scroll"<?php if($oxy_bg_image_ta_attachment == 'scroll') echo ' selected="selected"';?>><?php echo $text_attachment_s; ?></option>
                           <option value="fixed"<?php if($oxy_bg_image_ta_attachment == 'fixed') echo ' selected="selected"';?>><?php echo $text_attachment_f; ?></option>                      
                        </select>
                        </td>
					</tr>
                    
        </table>    
        </div>         
                
        <div id="tab-background-images-main-menu" class="vtabs-content">        
        <table class="form oxy_sep">  
                          
				    <tr>
					    <td><div><b>Main Menu</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_59.jpg" target="_blank">?</a></span></div></td>
					    <td>
						<select name="oxy_pattern_oxy_mm" id="oxy_pattern_oxy_mm">
                        <?php foreach ($bgp as $bgv => $bgcr) { ?>
                        <?php ($bgv == $this->config->get('oxy_pattern_oxy_mm'))?$bp='selected':$bp=''; ?>
                           <option value="<?php echo $bgv; ?>" <?php echo $bp; ?>> <?php echo $bgcr; ?> </option>	
                        <?php } ?> 
						</select>
						<span class="oxy_help">Select a pattern number.</span>     
					    </td>
				    </tr> 
				    <tr>
					    <td>Upload your own pattern or background image:</td>
					    <td><input type="hidden" name="oxy_bg_image_mm_custom" value="<?php echo $oxy_bg_image_mm_custom; ?>" id="oxy_bg_image_mm_custom" />
						<img src="<?php echo $oxy_bg_image_mm_thumb; ?>" id="oxy_bg_image_mm_thumb" />
						<br /><a onclick="image_upload('oxy_bg_image_mm_custom', 'oxy_bg_image_mm_thumb');"><?php echo $text_select; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a onclick="$('#oxy_bg_image_mm_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_bg_image_mm_custom').attr('value', '');"><?php echo $text_clear; ?></a>
					    </td>
				    </tr>
  					<tr>
						<td><?php echo $text_repeat; ?></td>
						<td>                        
                        <select name="oxy_bg_image_mm_repeat" id="oxy_bg_image_mm_repeat">
                           <option value="repeat"<?php if($oxy_bg_image_mm_repeat == 'repeat') echo ' selected="selected"';?>><?php echo $text_repeat_r; ?></option>
                           <option value="repeat-x"<?php if($oxy_bg_image_mm_repeat == 'repeat-x') echo ' selected="selected"';?>><?php echo $text_repeat_rx; ?></option> 
                           <option value="repeat-y"<?php if($oxy_bg_image_mm_repeat == 'repeat-y') echo ' selected="selected"';?>><?php echo $text_repeat_ry; ?></option>  
                           <option value="no-repeat"<?php if($oxy_bg_image_mm_repeat == 'no-repeat') echo ' selected="selected"';?>><?php echo $text_repeat_nr; ?></option>                     
                        </select>
                        </td>
					</tr>                        
                                                            
         </table>           
        </div>           
                
        <div id="tab-background-images-footer" class="vtabs-content">        
        <table class="form">  
                          
				    <tr>
					    <td><div><b>About Us, Custom Column, Follow Us, Contact Us</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_89.jpg" target="_blank">?</a></span></div></td>
					    <td>
						<select name="oxy_pattern_oxy_f1" id="oxy_pattern_oxy_f1">
                        <?php foreach ($bgp as $bgv => $bgcr) { ?>
                        <?php ($bgv == $this->config->get('oxy_pattern_oxy_f1'))?$bp='selected':$bp=''; ?>
                           <option value="<?php echo $bgv; ?>" <?php echo $bp; ?>> <?php echo $bgcr; ?> </option>	
                        <?php } ?> 
						</select>
						<span class="oxy_help">Select a pattern number.</span>     
					    </td>
				    </tr>
				    <tr>
					    <td>Upload your own pattern or background image: </td>
					    <td><input type="hidden" name="oxy_bg_image_f1_custom" id="oxy_bg_image_f1_custom" value="<?php echo $oxy_bg_image_f1_custom; ?>" id="oxy_bg_image_f1_custom" />
						<img src="<?php echo $oxy_bg_image_f1_thumb; ?>" id="oxy_bg_image_f1_thumb" />
						<br /><a onclick="image_upload('oxy_bg_image_f1_custom', 'oxy_bg_image_f1_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a onclick="$('#oxy_bg_image_f1_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_bg_image_f1_custom').attr('value', '');"><?php echo $text_clear; ?></a>
					    </td>
				    </tr>  
  					<tr>
						<td><?php echo $text_position; ?></td>
						<td>                        
                        <select name="oxy_bg_image_f1_position" id="oxy_bg_image_f1_position">
                           <option value="top center"<?php if($oxy_bg_image_f1_position == 'top center') echo ' selected="selected"';?>><?php echo $text_position_tc; ?></option>
                           <option value="top left"<?php if($oxy_bg_image_f1_position == 'top left') echo ' selected="selected"';?>><?php echo $text_position_tl; ?></option>
                           <option value="top right"<?php if($oxy_bg_image_f1_position == 'top right') echo ' selected="selected"';?>><?php echo $text_position_tr; ?></option> 
                           <option value="center"<?php if($oxy_bg_image_f1_position == 'center') echo ' selected="selected"';?>><?php echo $text_position_c; ?></option>
                           <option value="left"<?php if($oxy_bg_image_f1_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>
                           <option value="right"<?php if($oxy_bg_image_f1_position == 'right') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>
                           <option value="bottom center"<?php if($oxy_bg_image_f1_position == 'bottom center') echo ' selected="selected"';?>><?php echo $text_position_bc; ?></option>
                           <option value="bottom left"<?php if($oxy_bg_image_f1_position == 'bottom left') echo ' selected="selected"';?>><?php echo $text_position_bl; ?></option>
                           <option value="bottom right"<?php if($oxy_bg_image_f1_position == 'bottom right') echo ' selected="selected"';?>><?php echo $text_position_br; ?></option>
                        </select>
                        </td>
					</tr> 
  					<tr>
						<td><?php echo $text_repeat; ?></td>
						<td>                        
                        <select name="oxy_bg_image_f1_repeat" id="oxy_bg_image_f1_repeat">
                           <option value="repeat"<?php if($oxy_bg_image_f1_repeat == 'repeat') echo ' selected="selected"';?>><?php echo $text_repeat_r; ?></option>
                           <option value="repeat-x"<?php if($oxy_bg_image_f1_repeat == 'repeat-x') echo ' selected="selected"';?>><?php echo $text_repeat_rx; ?></option> 
                           <option value="repeat-y"<?php if($oxy_bg_image_f1_repeat == 'repeat-y') echo ' selected="selected"';?>><?php echo $text_repeat_ry; ?></option>       
                           <option value="no-repeat"<?php if($oxy_bg_image_f1_repeat == 'no-repeat') echo ' selected="selected"';?>><?php echo $text_repeat_nr; ?></option>                
                        </select>
                        </td>
					</tr>                       
                    
        </table> 
        
        <table class="form oxy_sep">   
                         
				    <tr>
					    <td><div><b>Information, Customer Service, Extras, My Account</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_98.jpg" target="_blank">?</a></span></div></td>
					    <td>
						<select name="oxy_pattern_oxy_f2" id="oxy_pattern_oxy_f2">
                        <?php foreach ($bgp as $bgv => $bgcr) { ?>
                        <?php ($bgv == $this->config->get('oxy_pattern_oxy_f2'))?$bp='selected':$bp=''; ?>
                           <option value="<?php echo $bgv; ?>" <?php echo $bp; ?>> <?php echo $bgcr; ?> </option>	
                        <?php } ?> 
						</select>
						<span class="oxy_help">Select a pattern number.</span>     
					    </td>
				    </tr>
				    <tr>
					    <td>Upload your own pattern or background image: </td>
					    <td><input type="hidden" name="oxy_bg_image_f2_custom" value="<?php echo $oxy_bg_image_f2_custom; ?>" id="oxy_bg_image_f2_custom" />
						<img src="<?php echo $oxy_bg_image_f2_thumb; ?>" id="oxy_bg_image_f2_thumb" />
						<br /><a onclick="image_upload('oxy_bg_image_f2_custom', 'oxy_bg_image_f2_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a onclick="$('#oxy_bg_image_f2_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_bg_image_f2_custom').attr('value', '');"><?php echo $text_clear; ?></a>
					    </td>
				    </tr>  
  					<tr>
						<td><?php echo $text_position; ?></td>
						<td>                        
                        <select name="oxy_bg_image_f2_position" id="oxy_bg_image_f2_position">
                           <option value="top center"<?php if($oxy_bg_image_f2_position == 'top center') echo ' selected="selected"';?>><?php echo $text_position_tc; ?></option>
                           <option value="top left"<?php if($oxy_bg_image_f2_position == 'top left') echo ' selected="selected"';?>><?php echo $text_position_tl; ?></option>
                           <option value="top right"<?php if($oxy_bg_image_f2_position == 'top right') echo ' selected="selected"';?>><?php echo $text_position_tr; ?></option> 
                           <option value="center"<?php if($oxy_bg_image_f2_position == 'center') echo ' selected="selected"';?>><?php echo $text_position_c; ?></option>
                           <option value="left"<?php if($oxy_bg_image_f2_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>
                           <option value="right"<?php if($oxy_bg_image_f2_position == 'right') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>
                           <option value="bottom center"<?php if($oxy_bg_image_f2_position == 'bottom center') echo ' selected="selected"';?>><?php echo $text_position_bc; ?></option>
                           <option value="bottom left"<?php if($oxy_bg_image_f2_position == 'bottom left') echo ' selected="selected"';?>><?php echo $text_position_bl; ?></option>
                           <option value="bottom right"<?php if($oxy_bg_image_f2_position == 'bottom right') echo ' selected="selected"';?>><?php echo $text_position_br; ?></option>                           
                        </select>
                        </td>
					</tr> 
  					<tr>
						<td><?php echo $text_repeat; ?></td>
						<td>                        
                        <select name="oxy_bg_image_f2_repeat" id="oxy_bg_image_f2_repeat">
                           <option value="repeat"<?php if($oxy_bg_image_f2_repeat == 'repeat') echo ' selected="selected"';?>><?php echo $text_repeat_r; ?></option>
                           <option value="repeat-x"<?php if($oxy_bg_image_f2_repeat == 'repeat-x') echo ' selected="selected"';?>><?php echo $text_repeat_rx; ?></option> 
                           <option value="repeat-y"<?php if($oxy_bg_image_f2_repeat == 'repeat-y') echo ' selected="selected"';?>><?php echo $text_repeat_ry; ?></option>
                           <option value="no-repeat"<?php if($oxy_bg_image_f2_repeat == 'no-repeat') echo ' selected="selected"';?>><?php echo $text_repeat_nr; ?></option>                   
                        </select>
                        </td>
					</tr>                         
                    
        </table> 
         
        <table class="form">  
                          
				    <tr>
					    <td><div><b>Powered by, Payment Images</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_105.jpg" target="_blank">?</a></span></div></td>
					    <td>
						<select name="oxy_pattern_oxy_f4" id="oxy_pattern_oxy_f4">
                        <?php foreach ($bgp as $bgv => $bgcr) { ?>
                        <?php ($bgv == $this->config->get('oxy_pattern_oxy_f4'))?$bp='selected':$bp=''; ?>
                           <option value="<?php echo $bgv; ?>" <?php echo $bp; ?>> <?php echo $bgcr; ?> </option>	
                        <?php } ?> 
						</select>
						<span class="oxy_help">Select a pattern number.</span>     
					    </td>
				    </tr> 
				    <tr>
					    <td>Upload your own pattern or background image: </td>
					    <td><input type="hidden" name="oxy_bg_image_f4_custom" value="<?php echo $oxy_bg_image_f4_custom; ?>" id="oxy_bg_image_f4_custom" />
						<img src="<?php echo $oxy_bg_image_f4_thumb; ?>" id="oxy_bg_image_f4_thumb" />
						<br /><a onclick="image_upload('oxy_bg_image_f4_custom', 'oxy_bg_image_f4_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a onclick="$('#oxy_bg_image_f4_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_bg_image_f4_custom').attr('value', '');"><?php echo $text_clear; ?></a>
					    </td>
				    </tr>  
  					<tr>
						<td><?php echo $text_position; ?></td>
						<td>                        
                        <select name="oxy_bg_image_f4_position" id="oxy_bg_image_f4_position">
                           <option value="top center"<?php if($oxy_bg_image_f4_position == 'top center') echo ' selected="selected"';?>><?php echo $text_position_tc; ?></option>
                           <option value="top left"<?php if($oxy_bg_image_f4_position == 'top left') echo ' selected="selected"';?>><?php echo $text_position_tl; ?></option>
                           <option value="top right"<?php if($oxy_bg_image_f4_position == 'top right') echo ' selected="selected"';?>><?php echo $text_position_tr; ?></option> 
                           <option value="center"<?php if($oxy_bg_image_f4_position == 'center') echo ' selected="selected"';?>><?php echo $text_position_c; ?></option>
                           <option value="left"<?php if($oxy_bg_image_f4_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>
                           <option value="right"<?php if($oxy_bg_image_f4_position == 'right') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>
                           <option value="bottom center"<?php if($oxy_bg_image_f4_position == 'bottom center') echo ' selected="selected"';?>><?php echo $text_position_bc; ?></option>
                           <option value="bottom left"<?php if($oxy_bg_image_f4_position == 'bottom left') echo ' selected="selected"';?>><?php echo $text_position_bl; ?></option>
                           <option value="bottom right"<?php if($oxy_bg_image_f4_position == 'bottom right') echo ' selected="selected"';?>><?php echo $text_position_br; ?></option>
                        </select>
                        </td>
					</tr> 
  					<tr>
						<td><?php echo $text_repeat; ?></td>
						<td>                        
                        <select name="oxy_bg_image_f4_repeat" id="oxy_bg_image_f4_repeat">
                           <option value="repeat"<?php if($oxy_bg_image_f4_repeat == 'repeat') echo ' selected="selected"';?>><?php echo $text_repeat_r; ?></option>
                           <option value="repeat-x"<?php if($oxy_bg_image_f4_repeat == 'repeat-x') echo ' selected="selected"';?>><?php echo $text_repeat_rx; ?></option> 
                           <option value="repeat-y"<?php if($oxy_bg_image_f4_repeat == 'repeat-y') echo ' selected="selected"';?>><?php echo $text_repeat_ry; ?></option> 
                           <option value="no-repeat"<?php if($oxy_bg_image_f4_repeat == 'no-repeat') echo ' selected="selected"';?>><?php echo $text_repeat_nr; ?></option>                      
                        </select>
                        </td>
					</tr>                        
                    
        </table> 
        
        <table class="form oxy_sep">    
                        
				    <tr>
					    <td><div><b>Bottom Custom Block</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/cas_111.jpg" target="_blank">?</a></span></div></td>
					    <td>
						<select name="oxy_pattern_oxy_f5" id="oxy_pattern_oxy_f5">
                        <?php foreach ($bgp as $bgv => $bgcr) { ?>
                        <?php ($bgv == $this->config->get('oxy_pattern_oxy_f5'))?$bp='selected':$bp=''; ?>
                           <option value="<?php echo $bgv; ?>" <?php echo $bp; ?>> <?php echo $bgcr; ?> </option>	
                        <?php } ?> 
						</select>
						<span class="oxy_help">Select a pattern number.</span>     
					    </td>
				    </tr> 
				    <tr>
					    <td>Upload your own pattern or background image: </td>
					    <td><input type="hidden" name="oxy_bg_image_f5_custom" value="<?php echo $oxy_bg_image_f5_custom; ?>" id="oxy_bg_image_f5_custom" />
						<img src="<?php echo $oxy_bg_image_f5_thumb; ?>" id="oxy_bg_image_f5_thumb" />
						<br /><a onclick="image_upload('oxy_bg_image_f5_custom', 'oxy_bg_image_f5_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a onclick="$('#oxy_bg_image_f5_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_bg_image_f5_custom').attr('value', '');"><?php echo $text_clear; ?></a>
					    </td>
				    </tr>  
  					<tr>
						<td><?php echo $text_position; ?></td>
						<td>                        
                        <select name="oxy_bg_image_f5_position" id="oxy_bg_image_f5_position">
                           <option value="top center"<?php if($oxy_bg_image_f5_position == 'top center') echo ' selected="selected"';?>><?php echo $text_position_tc; ?></option>
                           <option value="top left"<?php if($oxy_bg_image_f5_position == 'top left') echo ' selected="selected"';?>><?php echo $text_position_tl; ?></option>
                           <option value="top right"<?php if($oxy_bg_image_f5_position == 'top right') echo ' selected="selected"';?>><?php echo $text_position_tr; ?></option> 
                           <option value="center"<?php if($oxy_bg_image_f5_position == 'center') echo ' selected="selected"';?>><?php echo $text_position_c; ?></option>
                           <option value="left"<?php if($oxy_bg_image_f5_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>
                           <option value="right"<?php if($oxy_bg_image_f5_position == 'right') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>
                           <option value="bottom center"<?php if($oxy_bg_image_f5_position == 'bottom center') echo ' selected="selected"';?>><?php echo $text_position_bc; ?></option>
                           <option value="bottom left"<?php if($oxy_bg_image_f5_position == 'bottom left') echo ' selected="selected"';?>><?php echo $text_position_bl; ?></option>
                           <option value="bottom right"<?php if($oxy_bg_image_f5_position == 'bottom right') echo ' selected="selected"';?>><?php echo $text_position_br; ?></option>
                        </select>
                        </td>
					</tr> 
  					<tr>
						<td><?php echo $text_repeat; ?></td>
						<td>                        
                        <select name="oxy_bg_image_f5_repeat" id="oxy_bg_image_f5_repeat">
                           <option value="repeat"<?php if($oxy_bg_image_f5_repeat == 'repeat') echo ' selected="selected"';?>><?php echo $text_repeat_r; ?></option>
                           <option value="repeat-x"<?php if($oxy_bg_image_f5_repeat == 'repeat-x') echo ' selected="selected"';?>><?php echo $text_repeat_rx; ?></option> 
                           <option value="repeat-y"<?php if($oxy_bg_image_f5_repeat == 'repeat-y') echo ' selected="selected"';?>><?php echo $text_repeat_ry; ?></option>
                           <option value="no-repeat"<?php if($oxy_bg_image_f5_repeat == 'no-repeat') echo ' selected="selected"';?>><?php echo $text_repeat_nr; ?></option>         
                        </select>
                        </td>
					</tr>                        
                    
        </table> 
        </div>      
                             
        <div class="vtabs-content">            
        <table class="form">
        
					<tr>
					    <td>
                        <br /><div>Transparent patterns:</div><br />
                        
                        <div style="float:left;margin-bottom:20px">
                        <?php for ($bgp = 1; $bgp <= 75; $bgp++) { ?>
                            <div class="ptn"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/patterns/admin_thumb/p<?php echo $bgp; ?>.png"><span class="oxy_help ptn_nr"><?php echo $bgp; ?></span></div> 
						<?php } ?>	
						</div>

                        <div style="float:left;margin-bottom:20px">Non-transparent patterns:</div>   
                        
                        <div style="float:left;">
                        <?php for ($bgp = 101; $bgp <= 379; $bgp++) { ?>
                            <div class="ptn"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/patterns/admin_thumb/p<?php echo $bgp; ?>.png"><span class="oxy_help ptn_nr"><?php echo $bgp; ?></span></div> 
						<?php } ?>	
						</div> 
                            
					    </td>
					</tr>
                    
        </table>  
        </div>
        
        </div>    
        
        
        
        
        <div id="tab-fonts">
      
        <table class="form">
        
					<tr>
						<td><a href="http://www.google.com/webfonts/" target="_blank" class="link" style="margin-left:0"><?php echo $text_google_font_collection; ?></a></td>
						<td></td>
					</tr>
                    
        </table> 
      
        <table class="form">
        
					<tr>
						<td>Body font:</td>
						<td>                        
                        <select name="oxy_body_font" id="oxy_body_font">
                        <?php foreach ($googlefonts as $vlfont => $crfont) { ?>
                        <?php ($vlfont == $this->config->get('oxy_body_font'))?$cf='selected':$cf=''; ?>
                           <option value="<?php echo $vlfont; ?>" <?php echo $cf; ?>> <?php echo $crfont; ?> </option>	
                        <?php } ?>                            
                        </select>
                        </td>
					</tr>
                    
        </table> 
        
        <table class="form oxy_sep">    
                                                                          
					<tr>
						<td>Headings and Product Name font:</td>
						<td>                        
                        <select name="oxy_title_font" id="oxy_title_font">
                        <?php foreach ($googlefonts as $vlfont => $crfont) { ?>
                        <?php ($vlfont == $this->config->get('oxy_title_font'))?$cf='selected':$cf=''; ?>
                           <option value="<?php echo $vlfont; ?>" <?php echo $cf; ?>> <?php echo $crfont; ?> </option>	
                        <?php } ?>                            
                        </select>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <?php echo $text_weight; ?>&nbsp;&nbsp;
                        <select name="oxy_title_font_weight" id="oxy_title_font_weight">
                           <option value="normal"<?php if($oxy_title_font_weight == 'normal') echo ' selected="selected"';?>><?php echo $text_normal; ?></option>
                           <option value="bold"<?php if($oxy_title_font_weight == 'bold') echo ' selected="selected"';?>><?php echo $text_bold; ?></option>                         
                        </select>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <?php echo $text_uppercase; ?>&nbsp;&nbsp; 
                        <select name="oxy_title_font_uppercase" id="oxy_title_font_uppercase">
                            <option value="1"<?php if($oxy_title_font_uppercase == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_title_font_uppercase == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>
                    
        </table> 
        
        <table class="form">    
                                                                 
					<tr>
						<td>Price font:</td>
						<td>                        
                        <select name="oxy_price_font" id="oxy_price_font">
                        <?php foreach ($googlefonts as $vlfont => $crfont) { ?>
                        <?php ($vlfont == $this->config->get('oxy_price_font'))?$cf='selected':$cf=''; ?>
                           <option value="<?php echo $vlfont; ?>" <?php echo $cf; ?>> <?php echo $crfont; ?> </option>	
                        <?php } ?>                            
                        </select>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <?php echo $text_weight; ?>&nbsp;&nbsp;
                        <select name="oxy_price_font_weight" id="oxy_price_font_weight">
                           <option value="normal"<?php if($oxy_price_font_weight == 'normal') echo ' selected="selected"';?>><?php echo $text_normal; ?></option>
                           <option value="bold"<?php if($oxy_price_font_weight == 'bold') echo ' selected="selected"';?>><?php echo $text_bold; ?></option>                         
                        </select>                    
                        </td>
					</tr>                 
                    
        </table> 
        
        <table class="form oxy_sep">    
                                            
					<tr>
						<td>Button font:</td>
						<td>                        
                        <select name="oxy_button_font" id="oxy_button_font">
                        <?php foreach ($googlefonts as $vlfont => $crfont) { ?>
                        <?php ($vlfont == $this->config->get('oxy_button_font'))?$cf='selected':$cf=''; ?>
                           <option value="<?php echo $vlfont; ?>" <?php echo $cf; ?>> <?php echo $crfont; ?> </option>	
                        <?php } ?>                            
                        </select>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <?php echo $text_weight; ?>&nbsp;&nbsp;
                        <select name="oxy_button_font_weight" id="oxy_button_font_weight">
                           <option value="normal"<?php if($oxy_button_font_weight == 'normal') echo ' selected="selected"';?>><?php echo $text_normal; ?></option>
                           <option value="bold"<?php if($oxy_button_font_weight == 'bold') echo ' selected="selected"';?>><?php echo $text_bold; ?></option>                         
                        </select> 
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <?php echo $text_uppercase; ?>&nbsp;&nbsp;
                        <select name="oxy_button_font_uppercase" id="oxy_button_font_uppercase">
                            <option value="1"<?php if($oxy_button_font_uppercase == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_button_font_uppercase == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>                   
                    
        </table> 
        
        <table class="form">    
                                            
					<tr>
						<td>Search font:</td>
						<td>                        
                        <select name="oxy_search_font" id="oxy_search_font">
                        <?php foreach ($googlefonts as $vlfont => $crfont) { ?>
                        <?php ($vlfont == $this->config->get('oxy_search_font'))?$cf='selected':$cf=''; ?>
                           <option value="<?php echo $vlfont; ?>" <?php echo $cf; ?>> <?php echo $crfont; ?> </option>	
                        <?php } ?>                            
                        </select>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <?php echo $text_weight; ?>&nbsp;&nbsp;
                       <select name="oxy_search_font_weight" id="oxy_search_font_weight">
                           <option value="normal"<?php if($oxy_search_font_weight == 'normal') echo ' selected="selected"';?>><?php echo $text_normal; ?></option>
                           <option value="bold"<?php if($oxy_search_font_weight == 'bold') echo ' selected="selected"';?>><?php echo $text_bold; ?></option>                         
                        </select>   
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <?php echo $text_size; ?>&nbsp;&nbsp; 
                        <select name="oxy_search_font_size" id="oxy_search_font_size">
                           <option value="12"<?php if($oxy_search_font_size == '12') echo ' selected="selected"';?>>12px</option>
                           <option value="13"<?php if($oxy_search_font_size == '13') echo ' selected="selected"';?><?php if($oxy_search_font_size == '') echo ' selected="selected"';?>>13px</option>      
                           <option value="14"<?php if($oxy_search_font_size == '14') echo ' selected="selected"';?>>14px</option>      
                           <option value="15"<?php if($oxy_search_font_size == '15') echo ' selected="selected"';?>>15px</option>      
                           <option value="16"<?php if($oxy_search_font_size == '16') echo ' selected="selected"';?>>16px</option>
                           <option value="17"<?php if($oxy_search_font_size == '17') echo ' selected="selected"';?>>17px</option>      
                           <option value="18"<?php if($oxy_search_font_size == '18') echo ' selected="selected"';?>>18px</option>
                           <option value="19"<?php if($oxy_search_font_size == '19') echo ' selected="selected"';?>>19px</option>      
                           <option value="20"<?php if($oxy_search_font_size == '20') echo ' selected="selected"';?>>20px</option>
                           <option value="22"<?php if($oxy_search_font_size == '22') echo ' selected="selected"';?>>22px</option>      
                           <option value="24"<?php if($oxy_search_font_size == '24') echo ' selected="selected"';?>>24px</option>
                        </select>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <?php echo $text_uppercase; ?>&nbsp;&nbsp;
                        <select name="oxy_search_font_uppercase" id="oxy_search_font_uppercase">
                            <option value="1"<?php if($oxy_search_font_uppercase == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_search_font_uppercase == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>                          
                        </td>
					</tr> 
                    
        </table> 
        
        <table class="form oxy_sep">    
                                               
					<tr>
						<td>Cart font:</td>
						<td>                        
                        <select name="oxy_cart_font" id="oxy_cart_font">
                        <?php foreach ($googlefonts as $vlfont => $crfont) { ?>
                        <?php ($vlfont == $this->config->get('oxy_cart_font'))?$cf='selected':$cf=''; ?>
                           <option value="<?php echo $vlfont; ?>" <?php echo $cf; ?>> <?php echo $crfont; ?> </option>	
                        <?php } ?>                            
                        </select>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <?php echo $text_weight; ?>&nbsp;&nbsp;
                        <select name="oxy_cart_font_weight" id="oxy_cart_font_weight">
                           <option value="normal"<?php if($oxy_cart_font_weight == 'normal') echo ' selected="selected"';?>><?php echo $text_normal; ?></option>
                           <option value="bold"<?php if($oxy_cart_font_weight == 'bold') echo ' selected="selected"';?>><?php echo $text_bold; ?></option>                         
                        </select>   
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <?php echo $text_size; ?>&nbsp;&nbsp; 
                        <select name="oxy_cart_font_size" id="oxy_cart_font_size">
                           <option value="12"<?php if($oxy_cart_font_size == '12') echo ' selected="selected"';?>>12px</option>
                           <option value="13"<?php if($oxy_cart_font_size == '13') echo ' selected="selected"';?>>13px</option>      
                           <option value="14"<?php if($oxy_cart_font_size == '14') echo ' selected="selected"';?>>14px</option>      
                           <option value="15"<?php if($oxy_cart_font_size == '15') echo ' selected="selected"';?>>15px</option>      
                           <option value="16"<?php if($oxy_cart_font_size == '16') echo ' selected="selected"';?>>16px</option>
                           <option value="17"<?php if($oxy_cart_font_size == '17') echo ' selected="selected"';?><?php if($oxy_cart_font_size == '') echo ' selected="selected"';?>>17px</option>      
                           <option value="18"<?php if($oxy_cart_font_size == '18') echo ' selected="selected"';?>>18px</option>
                           <option value="19"<?php if($oxy_cart_font_size == '19') echo ' selected="selected"';?>>19px</option>      
                           <option value="20"<?php if($oxy_cart_font_size == '20') echo ' selected="selected"';?>>20px</option>
                           <option value="22"<?php if($oxy_cart_font_size == '22') echo ' selected="selected"';?>>22px</option>      
                           <option value="24"<?php if($oxy_cart_font_size == '24') echo ' selected="selected"';?>>24px</option>                           
                        </select> 
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <?php echo $text_uppercase; ?>&nbsp;&nbsp;
                        <select name="oxy_cart_font_uppercase" id="oxy_cart_font_uppercase">
                            <option value="1"<?php if($oxy_cart_font_uppercase == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_cart_font_uppercase == '0') echo ' selected="selected"';?><?php if($oxy_cart_font_uppercase == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>  
                                                                                                                                                          
        </table>           
        
        <table class="form">    
                                               
					<tr>
						<td>Main menu font:</td>
						<td>                        
                        <select name="oxy_main_menu_font" id="oxy_main_menu_font">
                        <?php foreach ($googlefonts as $vlfont => $crfont) { ?>
                        <?php ($vlfont == $this->config->get('oxy_main_menu_font'))?$cf='selected':$cf=''; ?>
                           <option value="<?php echo $vlfont; ?>" <?php echo $cf; ?>> <?php echo $crfont; ?> </option>	
                        <?php } ?>                            
                        </select>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <?php echo $text_weight; ?>&nbsp;&nbsp;
                       <select name="oxy_mm_font_weight" id="oxy_mm_font_weight">
                           <option value="normal"<?php if($oxy_mm_font_weight == 'normal') echo ' selected="selected"';?>><?php echo $text_normal; ?></option>
                           <option value="bold"<?php if($oxy_mm_font_weight == 'bold') echo ' selected="selected"';?>><?php echo $text_bold; ?></option>                         
                        </select>   
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <?php echo $text_size; ?>&nbsp;&nbsp; 
                        <select name="oxy_mm_font_size" id="oxy_mm_font_size">
                           <option value="12"<?php if($oxy_mm_font_size == '12') echo ' selected="selected"';?>>12px</option>
                           <option value="13"<?php if($oxy_mm_font_size == '13') echo ' selected="selected"';?>>13px</option>      
                           <option value="14"<?php if($oxy_mm_font_size == '14') echo ' selected="selected"';?>>14px</option>      
                           <option value="15"<?php if($oxy_mm_font_size == '15') echo ' selected="selected"';?>>15px</option>      
                           <option value="16"<?php if($oxy_mm_font_size == '16') echo ' selected="selected"';?><?php if($oxy_mm_font_size == '') echo ' selected="selected"';?>>16px</option>
                           <option value="17"<?php if($oxy_mm_font_size == '17') echo ' selected="selected"';?>>17px</option>      
                           <option value="18"<?php if($oxy_mm_font_size == '18') echo ' selected="selected"';?>>18px</option>
                           <option value="19"<?php if($oxy_mm_font_size == '19') echo ' selected="selected"';?>>19px</option>      
                           <option value="20"<?php if($oxy_mm_font_size == '20') echo ' selected="selected"';?>>20px</option>
                           <option value="22"<?php if($oxy_mm_font_size == '22') echo ' selected="selected"';?>>22px</option>      
                           <option value="24"<?php if($oxy_mm_font_size == '24') echo ' selected="selected"';?>>24px</option>
                        </select>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <?php echo $text_uppercase; ?>&nbsp;&nbsp;

                        <select name="oxy_mm_font_uppercase" id="oxy_mm_font_uppercase">
                            <option value="1"<?php if($oxy_mm_font_uppercase == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_mm_font_uppercase == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>  
                                                                                                                                                          
        </table>                                    

        </div>               
        
        <div id="tab-footer">
           <div id="footer_settings_tabs" class="vtabs">
             <a href="#tab-footer-feature-box">Feature Block</a>
             <a href="#tab-footer-custom-1">About Us</a>
             <a href="#tab-footer-custom-2">Custom Column</a>
             <a href="#tab-footer-follow-us">Follow Us</a> 
             <a href="#tab-footer-contacts">Contact Us</a>      
             <a href="#tab-footer-information-block">Information Block</a>
             <a href="#tab-footer-powered">Powered by</a>                                                                    
             <a href="#tab-footer-payment-images">Payment Images</a>           
             <a href="#tab-footer-custom-3">Bottom Custom Block</a>                                                   
           </div>
           
        <div id="tab-footer-feature-box" class="vtabs-content">
        
        <table class="form oxy_sep">
        
					<tr>
						<td colspan="2"><div><b>Feature Box 1</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/f_1.jpg" target="_blank">?</a></span></div></td>
					</tr>
                    <tr>
					    <td><?php echo $text_icon_c; ?><br /><span class="oxy_help">Dimensions: 64 x 64px</span></td>
					    <td><input type="hidden" name="oxy_fp_fb1_icon" value="<?php echo $oxy_fp_fb1_icon; ?>" id="oxy_fp_fb1_icon" />
						<img src="<?php echo $oxy_fp_fb1_icon_thumb; ?>" id="oxy_fp_fb1_icon_thumb" />
						<br /><a onclick="image_upload('oxy_fp_fb1_icon', 'oxy_fp_fb1_icon_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a onclick="$('#oxy_fp_fb1_icon_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_fp_fb1_icon').attr('value', '');">
                        <?php echo $text_clear; ?></a>
					    </td>
				    </tr>  
                    <tr>
						<td>Icon background color:</td>
						<td><input type="text" name="oxy_fp_fb1_bg_color" id="oxy_fp_fb1_bg_color" value="<?php echo $oxy_fp_fb1_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>      
                    <tr>
						<td>Icon background color hover:</td>
						<td><input type="text" name="oxy_fp_fb1_bg_color_hover" id="oxy_fp_fb1_bg_color_hover" value="<?php echo $oxy_fp_fb1_bg_color_hover; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr> 
                    
		 </table>                    
                    
                   <div id="footer_feature_box_1" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_feature_box_1<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_feature_box_1<?php echo $language['language_id']; ?>">
                   <table class="form">  
                     <tr>
						<td><?php echo $text_title; ?></td>
						<td><input type="text" name="oxy_fp_fb1_title<?php echo $language['language_id']; ?>" id="oxy_fp_fb1_title<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_fp_fb1_title' . $language['language_id']}; ?>" /></td>
					 </tr> 
                     <tr>
						<td><?php echo $text_subtitle; ?></td>
						<td><input type="text" name="oxy_fp_fb1_subtitle<?php echo $language['language_id']; ?>" id="oxy_fp_fb1_subtitle<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_fp_fb1_subtitle' . $language['language_id']}; ?>" /></td>
					 </tr>                             
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_fp_fb1_content<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_fp_fb1_content' . $language['language_id']}) ? ${'oxy_fp_fb1_content' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?>  
                   
        <table class="form oxy_sep">
        
					<tr>
						<td colspan="2"><div><b>Feature Box 2</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/f_2.jpg" target="_blank">?</a></span></div></td>
					</tr>
                    <tr>
					    <td><?php echo $text_icon_c; ?><br /><span class="oxy_help">Dimensions: 64 x 64px</span></td>
					    <td><input type="hidden" name="oxy_fp_fb2_icon" value="<?php echo $oxy_fp_fb2_icon; ?>" id="oxy_fp_fb2_icon" />
						<img src="<?php echo $oxy_fp_fb2_icon_thumb; ?>" id="oxy_fp_fb2_icon_thumb" />
						<br /><a onclick="image_upload('oxy_fp_fb2_icon', 'oxy_fp_fb2_icon_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a onclick="$('#oxy_fp_fb2_icon_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_fp_fb2_icon').attr('value', '');">
                        <?php echo $text_clear; ?></a>
					    </td>
				    </tr>  
                    <tr>
						<td>Icon background color:</td>
						<td><input type="text" name="oxy_fp_fb2_bg_color" id="oxy_fp_fb2_bg_color" value="<?php echo $oxy_fp_fb2_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>      
                    <tr>
						<td>Icon background color hover:</td>
						<td><input type="text" name="oxy_fp_fb2_bg_color_hover" id="oxy_fp_fb2_bg_color_hover" value="<?php echo $oxy_fp_fb2_bg_color_hover; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr> 
                    
		 </table>                    
                    
                   <div id="footer_feature_box_2" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_feature_box_2<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_feature_box_2<?php echo $language['language_id']; ?>">
                   <table class="form">  
                     <tr>
						<td><?php echo $text_title; ?></td>
						<td><input type="text" name="oxy_fp_fb2_title<?php echo $language['language_id']; ?>" id="oxy_fp_fb2_title<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_fp_fb2_title' . $language['language_id']}; ?>" /></td>
					 </tr> 
                     <tr>
						<td><?php echo $text_subtitle; ?></td>
						<td><input type="text" name="oxy_fp_fb2_subtitle<?php echo $language['language_id']; ?>" id="oxy_fp_fb2_subtitle<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_fp_fb2_subtitle' . $language['language_id']}; ?>" /></td>
					 </tr>                             
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_fp_fb2_content<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_fp_fb2_content' . $language['language_id']}) ? ${'oxy_fp_fb2_content' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?> 
                   
        <table class="form oxy_sep">
        
					<tr>
						<td colspan="2"><div><b>Feature Box 3</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/f_3.jpg" target="_blank">?</a></span></div></td>
					</tr>
                    <tr>
					    <td><?php echo $text_icon_c; ?><br /><span class="oxy_help">Dimensions: 64 x 64px</span></td>
					    <td><input type="hidden" name="oxy_fp_fb3_icon" value="<?php echo $oxy_fp_fb3_icon; ?>" id="oxy_fp_fb3_icon" />
						<img src="<?php echo $oxy_fp_fb3_icon_thumb; ?>" id="oxy_fp_fb3_icon_thumb" />
						<br /><a onclick="image_upload('oxy_fp_fb3_icon', 'oxy_fp_fb3_icon_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a onclick="$('#oxy_fp_fb3_icon_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_fp_fb3_icon').attr('value', '');">
                        <?php echo $text_clear; ?></a>
					    </td>
				    </tr>  
                    <tr>
						<td>Icon background color:</td>
						<td><input type="text" name="oxy_fp_fb3_bg_color" id="oxy_fp_fb3_bg_color" value="<?php echo $oxy_fp_fb3_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>      
                    <tr>
						<td>Icon background color hover:</td>
						<td><input type="text" name="oxy_fp_fb3_bg_color_hover" id="oxy_fp_fb3_bg_color_hover" value="<?php echo $oxy_fp_fb3_bg_color_hover; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr> 
                    
		 </table>                    
                    
                   <div id="footer_feature_box_3" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_feature_box_3<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_feature_box_3<?php echo $language['language_id']; ?>">
                   <table class="form">  
                     <tr>
						<td><?php echo $text_title; ?></td>
						<td><input type="text" name="oxy_fp_fb3_title<?php echo $language['language_id']; ?>" id="oxy_fp_fb3_title<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_fp_fb3_title' . $language['language_id']}; ?>" /></td>
					 </tr> 
                     <tr>
						<td><?php echo $text_subtitle; ?></td>
						<td><input type="text" name="oxy_fp_fb3_subtitle<?php echo $language['language_id']; ?>" id="oxy_fp_fb3_subtitle<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_fp_fb3_subtitle' . $language['language_id']}; ?>" /></td>
					 </tr>                             
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_fp_fb3_content<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_fp_fb3_content' . $language['language_id']}) ? ${'oxy_fp_fb3_content' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?>  
                   
        <table class="form oxy_sep">
        
					<tr>
						<td colspan="2"><div><b>Feature Box 4</b><span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/f_4.jpg" target="_blank">?</a></span></div></td>
					</tr>
                    <tr>
					    <td><?php echo $text_icon_c; ?><br /><span class="oxy_help">Dimensions: 64 x 64px</span></td>
					    <td><input type="hidden" name="oxy_fp_fb4_icon" value="<?php echo $oxy_fp_fb4_icon; ?>" id="oxy_fp_fb4_icon" />
						<img src="<?php echo $oxy_fp_fb4_icon_thumb; ?>" id="oxy_fp_fb4_icon_thumb" />
						<br /><a onclick="image_upload('oxy_fp_fb4_icon', 'oxy_fp_fb4_icon_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a onclick="$('#oxy_fp_fb4_icon_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_fp_fb4_icon').attr('value', '');">
                        <?php echo $text_clear; ?></a>
					    </td>
				    </tr>  
                    <tr>
						<td>Icon background color:</td>
						<td><input type="text" name="oxy_fp_fb4_bg_color" id="oxy_fp_fb4_bg_color" value="<?php echo $oxy_fp_fb4_bg_color; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>      
                    <tr>
						<td>Icon background color hover:</td>
						<td><input type="text" name="oxy_fp_fb4_bg_color_hover" id="oxy_fp_fb4_bg_color_hover" value="<?php echo $oxy_fp_fb4_bg_color_hover; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr> 
                    
		 </table>                    
                    
                   <div id="footer_feature_box_4" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_feature_box_4<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_feature_box_4<?php echo $language['language_id']; ?>">
                   <table class="form">  
                     <tr>
						<td><?php echo $text_title; ?></td>
						<td><input type="text" name="oxy_fp_fb4_title<?php echo $language['language_id']; ?>" id="oxy_fp_fb4_title<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_fp_fb4_title' . $language['language_id']}; ?>" /></td>
					 </tr> 
                     <tr>
						<td><?php echo $text_subtitle; ?></td>
						<td><input type="text" name="oxy_fp_fb4_subtitle<?php echo $language['language_id']; ?>" id="oxy_fp_fb4_subtitle<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_fp_fb4_subtitle' . $language['language_id']}; ?>" /></td>
					 </tr>                             
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_fp_fb4_content<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_fp_fb4_content' . $language['language_id']}) ? ${'oxy_fp_fb4_content' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?>                                                            
        
         </div>   
           
        <div id="tab-footer-custom-1" class="vtabs-content">
        
        <table class="form">

					<tr>
						<td>Show About Us:</td>
						<td>
                        <select name="oxy_custom_1_status">
                            <option value="1"<?php if($oxy_custom_1_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_custom_1_status == '0') echo ' selected="selected"';?><?php if($oxy_custom_1_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/f_5.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                        
		 </table>    
                    
                   <div id="footer_oxy_custom_1" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_custom_1<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_custom_1<?php echo $language['language_id']; ?>">
                   <table class="form">         
				     <tr>
						<td><?php echo $text_title; ?></td>
						<td><input type="text" name="oxy_custom_1_title<?php echo $language['language_id']; ?>" id="oxy_custom_1_title<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_custom_1_title' . $language['language_id']}; ?>" /></td>
					 </tr>                      
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_custom_1_content<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_custom_1_content' . $language['language_id']}) ? ${'oxy_custom_1_content' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?>                               

		 </table>  
         </div>  
         
        <div id="tab-footer-custom-2" class="vtabs-content">
        <table class="form">

					<tr>
						<td>Show Custom Column:</td>
						<td>
                        <select name="oxy_custom_2_status">
                            <option value="1"<?php if($oxy_custom_2_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_custom_2_status == '0') echo ' selected="selected"';?><?php if($oxy_custom_2_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/f_6.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                        
		 </table>    
            
                   <div id="footer_oxy_custom_2" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_custom_2<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_custom_2<?php echo $language['language_id']; ?>">
                   <table class="form">         
				     <tr>
						<td><?php echo $text_title; ?></td>
						<td><input type="text" name="oxy_custom_2_title<?php echo $language['language_id']; ?>" id="oxy_custom_2_title<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_custom_2_title' . $language['language_id']}; ?>" /></td>
					 </tr>                      
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_custom_2_content<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_custom_2_content' . $language['language_id']}) ? ${'oxy_custom_2_content' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?>                               

		 </table>  
         </div>  
         
        <div id="tab-footer-follow-us" class="vtabs-content">                       
        <table class="form">
        
					<tr>
						<td>Show follow us:</td>
						<td>
                        <select name="oxy_follow_us_status">
                            <option value="1"<?php if($oxy_follow_us_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_follow_us_status == '0') echo ' selected="selected"';?><?php if($oxy_follow_us_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/f_7.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_title; ?></td>
						<td colspan="2">
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_follow_us_title<?php echo $language['language_id']; ?>" id="oxy_follow_us_title<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_follow_us_title' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
					</tr>                      
					<tr>
						<td>Facebook:</td>
						<td><input type="text" name="oxy_facebook" value="<?php echo $oxy_facebook; ?>" /></td>
					</tr>
					<tr>
						<td>Twitter:</td>
						<td><input type="text" name="oxy_twitter" value="<?php echo $oxy_twitter; ?>" /></td>
					</tr>          
					<tr>
						<td>Google+:</td>
						<td><input type="text" name="oxy_googleplus" value="<?php echo $oxy_googleplus; ?>" /></td>
					</tr>
					<tr>
						<td>RSS:</td>
						<td><input type="text" name="oxy_rss" value="<?php echo $oxy_rss; ?>" /></td>
					</tr> 
					<tr>
						<td>Pinterest:</td>
						<td><input type="text" name="oxy_pinterest" value="<?php echo $oxy_pinterest; ?>" /></td>
					</tr> 
					<tr>
						<td>Vimeo:</td>
						<td><input type="text" name="oxy_vimeo" value="<?php echo $oxy_vimeo; ?>" /></td>
					</tr> 
					<tr>
						<td>Flickr:</td>
						<td><input type="text" name="oxy_flickr" value="<?php echo $oxy_flickr; ?>" /></td>
					</tr>                     
					<tr>
						<td>LinkedIn:</td>
						<td><input type="text" name="oxy_linkedin" value="<?php echo $oxy_linkedin; ?>" /></td>
					</tr> 
					<tr>
						<td>YouTube:</td>
						<td><input type="text" name="oxy_youtube" value="<?php echo $oxy_youtube; ?>" /></td>
					</tr> 
					<tr>
						<td>Dribbble:</td>
						<td><input type="text" name="oxy_dribbble" value="<?php echo $oxy_dribbble; ?>" /></td>
					</tr>  
                    <tr>
						<td>Instagram:</td>
						<td><input type="text" name="oxy_instagram" value="<?php echo $oxy_instagram; ?>" /></td>
					</tr>   
                    <tr>
						<td>Behance:</td>
						<td><input type="text" name="oxy_behance" value="<?php echo $oxy_behance; ?>" /></td>
					</tr>   
                    <tr>
						<td>Skype username:</td>
						<td><input type="text" name="oxy_skype" value="<?php echo $oxy_skype; ?>" /></td>
					</tr>   
                    <tr>
						<td>Forrst:</td>
						<td><input type="text" name="oxy_forrst" value="<?php echo $oxy_forrst; ?>" /></td>
					</tr>   
                    <tr>
						<td>Bing:</td>
						<td><input type="text" name="oxy_bing" value="<?php echo $oxy_bing; ?>" /></td>
					</tr>   
                    <tr>
						<td>Myspace:</td>
						<td><input type="text" name="oxy_myspace" value="<?php echo $oxy_myspace; ?>" /></td>
					</tr>   
                    <tr>
						<td>Tumblr:</td>
						<td><input type="text" name="oxy_tumblr" value="<?php echo $oxy_tumblr; ?>" /></td>
					</tr>   
                    <tr>
						<td>Reddit:</td>
						<td><input type="text" name="oxy_reddit" value="<?php echo $oxy_reddit; ?>" /></td>
					</tr>                                                                                          

		 </table>
         </div>                             
        
        <div id="tab-footer-contacts" class="vtabs-content">
        <table class="form">

					<tr>
						<td>Show contacts:</td>
						<td colspan="2">
                        <select name="oxy_contacts_status">
                            <option value="1"<?php if($oxy_contacts_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_contacts_status == '0') echo ' selected="selected"';?><?php if($oxy_contacts_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/f_8.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
					<tr>
						<td><?php echo $text_title; ?></td>
						<td colspan="2">
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_contacts_title<?php echo $language['language_id']; ?>" id="oxy_contacts_title<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_contacts_title' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
					</tr>                      
					<tr>
						<td>Mobile phone:</td>
						<td width="150">
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_contact_mphone1<?php echo $language['language_id']; ?>" id="oxy_contact_mphone1<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_contact_mphone1' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        <td>
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_contact_mphone2<?php echo $language['language_id']; ?>" id="oxy_contact_mphone2<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_contact_mphone2' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
					</tr>
					<tr>
						<td>Static phone:</td>
						<td>
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_contact_sphone1<?php echo $language['language_id']; ?>" id="oxy_contact_sphone1<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_contact_sphone1' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
                        <td>
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_contact_sphone2<?php echo $language['language_id']; ?>" id="oxy_contact_sphone2<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_contact_sphone2' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
					</tr>        
					<tr>
						<td>Fax:</td>
						<td>
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_contact_fax1<?php echo $language['language_id']; ?>" id="oxy_contact_fax1<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_contact_fax1' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
                        <td>
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_contact_fax2<?php echo $language['language_id']; ?>" id="oxy_contact_fax2<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_contact_fax2' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
					</tr>
					<tr>
						<td>E-mail:</td>
						<td>
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_contact_email1<?php echo $language['language_id']; ?>" id="oxy_contact_email1<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_contact_email1' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
                        <td>
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_contact_email2<?php echo $language['language_id']; ?>" id="oxy_contact_email2<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_contact_email2' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
					</tr>  
					<tr>
						<td>Skype:</td>
						<td>
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_contact_skype1<?php echo $language['language_id']; ?>" id="oxy_contact_skype1<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_contact_skype1' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
                        <td>
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_contact_skype2<?php echo $language['language_id']; ?>" id="oxy_contact_skype2<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_contact_skype2' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
					</tr>
					<tr>
						<td>Address:</td>
						<td>
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_contact_location1<?php echo $language['language_id']; ?>" id="oxy_contact_location1<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_contact_location1' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
                        <td>
                        <?php foreach ($languages as $language) { ?>
	                    <input type="text" name="oxy_contact_location2<?php echo $language['language_id']; ?>" id="oxy_contact_location2<?php echo $language['language_id']; ?>" value="<?php echo ${'oxy_contact_location2' . $language['language_id']}; ?>" />
	                    <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
					</tr>   
					<tr>
						<td>Office Opening Hours:</td>
						<td colspan="2">
                        <?php foreach ($languages as $language) { ?>
                        <textarea name="oxy_contact_hours<?php echo $language['language_id']; ?>" rows="5" cols="30" /><?php echo ${'oxy_contact_hours' . $language['language_id']}; ?></textarea>
                        <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php } ?>
                        </td>
					</tr>                                                                                
   
		 </table> 
         </div>  
         
        <div id="tab-footer-information-block" class="vtabs-content">   
        <table class="form">

					<tr>
						<td>Show Information Block:</td>
						<td>
                        <select name="oxy_information_block_status">
                            <option value="1"<?php if($oxy_information_block_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_information_block_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/f_9.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                    
        </table>                                       
        
        <table class="form oxy_sep">
        
                    <tr>
						<td colspan="2"><div><b>Information Column</b></div></td>
					</tr>   
					<tr>
						<td>Show Information Column:</td>
						<td>
                        <select name="oxy_information_column_1_status">
                            <option value="1"<?php if($oxy_information_column_1_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_information_column_1_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/f_10.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                    
        </table>                                       
        
        <table class="form">   
                         
                    <tr>
						<td colspan="2"><div><b>Customer Service Column</b></div></td>
					</tr>  
					<tr>
						<td>Show Customer Service Column:</td>
						<td>
                        <select name="oxy_information_column_2_status">
                            <option value="1"<?php if($oxy_information_column_2_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_information_column_2_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/f_11.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
					<tr>
						<td>Contact Us link:</td>
						<td>
                        <select name="oxy_i_c_2_1_status">
                            <option value="1"<?php if($oxy_i_c_2_1_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_i_c_2_1_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>
					<tr>
						<td>Returns link:</td>
						<td>
                        <select name="oxy_i_c_2_2_status">
                            <option value="1"<?php if($oxy_i_c_2_2_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_i_c_2_2_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr> 
					<tr>
						<td>Site Map link:</td>
						<td>
                        <select name="oxy_i_c_2_3_status">
                            <option value="1"<?php if($oxy_i_c_2_3_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_i_c_2_3_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>
                    
        </table>                                       
        
        <table class="form oxy_sep">  
                          
                    <tr>
						<td colspan="2"><div><b>Extras Column</b></div></td>
					</tr>                                                                 
                    <tr>
						<td>Show Extras Column:</td>
						<td>
                        <select name="oxy_information_column_3_status">
                            <option value="1"<?php if($oxy_information_column_3_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_information_column_3_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/f_12.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
					<tr>
						<td>Brands link:</td>
						<td>
                        <select name="oxy_i_c_3_1_status">
                            <option value="1"<?php if($oxy_i_c_3_1_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_i_c_3_1_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>
					<tr>
						<td>Gift Vouchers link:</td>
						<td>
                        <select name="oxy_i_c_3_2_status">
                            <option value="1"<?php if($oxy_i_c_3_2_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_i_c_3_2_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr> 
					<tr>
						<td>Affiliates link:</td>
						<td>
                        <select name="oxy_i_c_3_3_status">
                            <option value="1"<?php if($oxy_i_c_3_3_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_i_c_3_3_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr> 
                    <tr>
						<td>Specials link:</td>
						<td>
                        <select name="oxy_i_c_3_4_status">
                            <option value="1"<?php if($oxy_i_c_3_4_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_i_c_3_4_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>
                    
        </table>                                       
        
        <table class="form">                    
                    
                    <tr>
						<td colspan="2"><div><b>My Account Column</b></div></td>
					</tr>                      
                    <tr>
						<td>Show My Account Column:</td>
						<td>
                        <select name="oxy_information_column_4_status">
                            <option value="1"<?php if($oxy_information_column_4_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_information_column_4_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/f_13.jpg" target="_blank">?</a></span>
                        </td>
					</tr> 
                    <tr>
						<td>My Account link:</td>
						<td>
                        <select name="oxy_i_c_4_1_status">
                            <option value="1"<?php if($oxy_i_c_4_1_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_i_c_4_1_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>
					<tr>
						<td>Order History link:</td>
						<td>
                        <select name="oxy_i_c_4_2_status">
                            <option value="1"<?php if($oxy_i_c_4_2_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_i_c_4_2_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr> 
					<tr>
						<td>Wish List link:</td>
						<td>
                        <select name="oxy_i_c_4_3_status">
                            <option value="1"<?php if($oxy_i_c_4_3_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_i_c_4_3_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr> 
                    <tr>
						<td>Newsletter link:</td>
						<td>
                        <select name="oxy_i_c_4_4_status">
                            <option value="1"<?php if($oxy_i_c_4_4_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_i_c_4_4_status == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>                                                               

		 </table>
         </div>     
         
        <div id="tab-footer-powered" class="vtabs-content">
        <table class="form">

					<tr>
						<td>Show powered by:</td>
						<td>
                        <select name="oxy_powered_status">
                            <option value="1"<?php if($oxy_powered_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_powered_status == '0') echo ' selected="selected"';?><?php if($oxy_powered_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/f_14.jpg" target="_blank">?</a></span>
                        </td>
					</tr>

           	 </table>            
                    
                   <div id="footer_oxy_powered" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_powered<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_powered<?php echo $language['language_id']; ?>">
                   <table class="form">                            
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_powered_content<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_powered_content' . $language['language_id']}) ? ${'oxy_powered_content' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?>                         

         </div>                                                             
         
        <div id="tab-footer-payment-images" class="vtabs-content">          
        <table class="form">
        
					<tr>
						<td>Show payment images:</td>
						<td colspan="3">
                        <select name="oxy_payment_block_status">
                            <option value="1"<?php if($oxy_payment_block_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_payment_block_status == '0') echo ' selected="selected"';?><?php if($oxy_payment_block_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/f_15.jpg" target="_blank">?</a></span>
                        </td>
					</tr>     
				    <tr>
					    <td>Upload your payment image:</td>
						<td width="130">
                        <div style="margin-top:6px; float:left"><label class="s_checkbox">
                        <input type="checkbox" value="1" name="oxy_payment_block_custom_status"<?php if($oxy_payment_block_custom_status == '1') echo ' checked="checked"';?> /> 
                        Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        </td>                        
					    <td width="150"><input type="hidden" name="oxy_payment_block_custom" value="<?php echo $oxy_payment_block_custom; ?>" id="oxy_payment_block_custom" />
						<img src="<?php echo $oxy_payment_block_custom_thumb; ?>" id="oxy_payment_block_custom_thumb" />
						<br /><a onclick="image_upload('oxy_payment_block_custom', 'oxy_payment_block_custom_thumb');"><?php echo $text_select; ?></a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#oxy_payment_block_custom_thumb').attr('src', '<?php echo $no_image; ?>'); $('#oxy_payment_block_custom').attr('value', '');">
                        <?php echo $text_clear; ?></a>
					    </td>
						<td>
                        url:&nbsp;&nbsp;&nbsp;<input type="text" name="oxy_payment_block_custom_url" value="<?php echo $oxy_payment_block_custom_url; ?>" />
                        </td>                          
				    </tr>
                          
		 </table>      
        
        <table class="form oxy_sep">
                                             
					<tr>
						<td colspan="4"><div><b>OXY payment images:</b></div></td>
					</tr>                                              
					<tr>
						<td>PayPal:</td>
						<td width="130">
                        <div style="margin-top:6px; float:left"><label class="s_checkbox">
                        <input type="checkbox" value="1" name="oxy_payment_paypal"<?php if($oxy_payment_paypal == '1') echo ' checked="checked"';?> /> Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        <div style="margin-top:0px;"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/payment/payment_image_paypal.png"></div>
                        </td>
						<td colspan="2">
                        url:&nbsp;&nbsp;&nbsp;<input type="text" name="oxy_payment_paypal_url" value="<?php echo $oxy_payment_paypal_url; ?>" />
                        </td>                        
					</tr>

					<tr>
						<td>Visa:</td>
						<td>
                        <div style="margin-top:6px; float:left"><label class="s_checkbox">
                        <input type="checkbox" value="1" name="oxy_payment_visa"<?php if($oxy_payment_visa == '1') echo ' checked="checked"';?> /> Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        <div style="margin-top:0px;"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/payment/payment_image_visa.png"></div>
                        </td>
						<td colspan="2">
                        url:&nbsp;&nbsp;&nbsp;<input type="text" name="oxy_payment_visa_url" value="<?php echo $oxy_payment_visa_url; ?>" />
                        </td>                        
					</tr>  
                    
					<tr>
						<td>MasterCard:</td>
						<td>
                        <div style="margin-top:6px; float:left"><label class="s_checkbox">
                        <input type="checkbox" value="1" name="oxy_payment_mastercard"<?php if($oxy_payment_mastercard == '1') echo ' checked="checked"';?> /> Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        <div style="margin-top:0px;"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/payment/payment_image_mastercard.png"></div>
                        </td>
						<td colspan="2">
                        url:&nbsp;&nbsp;&nbsp;<input type="text" name="oxy_payment_mastercard_url" value="<?php echo $oxy_payment_mastercard_url; ?>" />
                        </td>                        
					</tr>
                    
					<tr>
						<td>Maestro:</td>
						<td>
                        <div style="margin-top:6px; float:left"><label class="s_checkbox">
                        <input type="checkbox" value="1" name="oxy_payment_maestro"<?php if($oxy_payment_maestro == '1') echo ' checked="checked"';?> /> Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        <div style="margin-top:0px;"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/payment/payment_image_maestro.png"></div>
                        </td>
						<td colspan="2">
                        url:&nbsp;&nbsp;&nbsp;<input type="text" name="oxy_payment_maestro_url" value="<?php echo $oxy_payment_maestro_url; ?>" />
                        </td>                        
					</tr>
                   
					<tr>
						<td>Discover:</td>
						<td>
                        <div style="margin-top:6px; float:left"><label class="s_checkbox">
                        <input type="checkbox" value="1" name="oxy_payment_discover"<?php if($oxy_payment_discover == '1') echo ' checked="checked"';?> /> Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        <div style="margin-top:0px;"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/payment/payment_image_discover.png"></div>
                        </td>
						<td colspan="2">
                        url:&nbsp;&nbsp;&nbsp;<input type="text" name="oxy_payment_discover_url" value="<?php echo $oxy_payment_discover_url; ?>" />
                        </td>                        
					</tr>                                          
                    
					<tr>
						<td>Moneybookers:</td>
						<td>
                        <div style="margin-top:6px; float:left"><label class="s_checkbox">
                        <input type="checkbox" value="1" name="oxy_payment_moneybookers"<?php if($oxy_payment_moneybookers == '1') echo ' checked="checked"';?> /> Show</label>&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                        <div style="margin-top:0px;"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/payment/payment_image_moneybookers.png"></div>
                        </td>
						<td colspan="2">
                        url:&nbsp;&nbsp;&nbsp;<input type="text" name="oxy_payment_moneybookers_url" value="<?php echo $oxy_payment_moneybookers_url; ?>" />
                        </td>                        
					</tr>   
                    
					<tr>
						<td>American Express:</td>
						<td>
                        <div style="margin-top:6px; float:left"><label class="s_checkbox">
                        <input type="checkbox" value="1" name="oxy_payment_american_express"<?php if($oxy_payment_american_express == '1') echo ' checked="checked"';?> /> Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        <div style="margin-top:0px;"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/payment/payment_image_american_express.png"></div>
                        </td>
						<td colspan="2">
                        url:&nbsp;&nbsp;&nbsp;<input type="text" name="oxy_payment_american_express_url" value="<?php echo $oxy_payment_american_express_url; ?>" />
                        </td>                        
					</tr>  
					<tr>
						<td>Cirrus:</td>
						<td>
                        <div style="margin-top:6px; float:left"><label class="s_checkbox">
                        <input type="checkbox" value="1" name="oxy_payment_cirrus"<?php if($oxy_payment_cirrus == '1') echo ' checked="checked"';?> /> Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        <div style="margin-top:0px;"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/payment/payment_image_cirrus.png"></div>
                        </td>
						<td colspan="2">
                        url:&nbsp;&nbsp;&nbsp;<input type="text" name="oxy_payment_cirrus_url" value="<?php echo $oxy_payment_cirrus_url; ?>" />
                        </td>                        
					</tr>   
					<tr>
						<td>Delta:</td>
						<td>
                        <div style="margin-top:6px; float:left"><label class="s_checkbox">
                        <input type="checkbox" value="1" name="oxy_payment_delta"<?php if($oxy_payment_delta == '1') echo ' checked="checked"';?> /> Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        <div style="margin-top:0px;"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/payment/payment_image_delta.png"></div>
                        </td>
						<td colspan="2">
                        url:&nbsp;&nbsp;&nbsp;<input type="text" name="oxy_payment_delta_url" value="<?php echo $oxy_payment_delta_url; ?>" />
                        </td>                        
					</tr>  
                    <tr>
						<td>Google Checkout:</td>
						<td>
                        <div style="margin-top:6px; float:left"><label class="s_checkbox">
                        <input type="checkbox" value="1" name="oxy_payment_google"<?php if($oxy_payment_google == '1') echo ' checked="checked"';?> /> Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        <div style="margin-top:0px;"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/payment/payment_image_google.png"></div>
                        </td>
						<td colspan="2">
                        url:&nbsp;&nbsp;&nbsp;<input type="text" name="oxy_payment_google_url" value="<?php echo $oxy_payment_google_url; ?>" />
                        </td>                        
					</tr>
                    <tr>
						<td>2CheckOut:</td>
						<td>
                        <div style="margin-top:6px; float:left"><label class="s_checkbox">
                        <input type="checkbox" value="1" name="oxy_payment_2co"<?php if($oxy_payment_2co == '1') echo ' checked="checked"';?> /> Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        <div style="margin-top:0px;"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/payment/payment_image_2co.png"></div>
                        </td>
						<td colspan="2">
                        url:&nbsp;&nbsp;&nbsp;<input type="text" name="oxy_payment_2co_url" value="<?php echo $oxy_payment_2co_url; ?>" />
                        </td>                        
					</tr>
                    <tr>
						<td>Sage:</td>
						<td>
                        <div style="margin-top:6px; float:left"><label class="s_checkbox">
                        <input type="checkbox" value="1" name="oxy_payment_sage"<?php if($oxy_payment_sage == '1') echo ' checked="checked"';?> /> Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        <div style="margin-top:0px;"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/payment/payment_image_sage.png"></div>
                        </td>
						<td colspan="2">
                        url:&nbsp;&nbsp;&nbsp;<input type="text" name="oxy_payment_sage_url" value="<?php echo $oxy_payment_sage_url; ?>" />
                        </td>                        
					</tr>   
                    <tr>
						<td>Solo:</td>
						<td>
                        <div style="margin-top:6px; float:left"><label class="s_checkbox">
                        <input type="checkbox" value="1" name="oxy_payment_solo"<?php if($oxy_payment_solo == '1') echo ' checked="checked"';?> /> Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        <div style="margin-top:0px;"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/payment/payment_image_solo.png"></div>
                        </td>
						<td colspan="2">
                        url:&nbsp;&nbsp;&nbsp;<input type="text" name="oxy_payment_solo_url" value="<?php echo $oxy_payment_solo_url; ?>" />
                        </td>                        
					</tr>
                    <tr>
						<td>Switch:</td>
						<td>
                        <div style="margin-top:6px; float:left"><label class="s_checkbox">
                        <input type="checkbox" value="1" name="oxy_payment_switch"<?php if($oxy_payment_switch == '1') echo ' checked="checked"';?> /> Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        <div style="margin-top:0px;"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/payment/payment_image_switch.png"></div>
                        </td>
						<td colspan="2">
                        url:&nbsp;&nbsp;&nbsp;<input type="text" name="oxy_payment_switch_url" value="<?php echo $oxy_payment_switch_url; ?>" />
                        </td>                        
					</tr>  
                    <tr>
						<td>Western Union:</td>
						<td>
                        <div style="margin-top:6px; float:left"><label class="s_checkbox">
                        <input type="checkbox" value="1" name="oxy_payment_western_union"<?php if($oxy_payment_western_union == '1') echo ' checked="checked"';?> /> Show</label>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                        <div style="margin-top:0px;"><img src="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/payment/payment_image_western_union.png"></div>
                        </td>
						<td colspan="2">
                        url:&nbsp;&nbsp;&nbsp;<input type="text" name="oxy_payment_western_union_url" value="<?php echo $oxy_payment_western_union_url; ?>" />
                        </td>                        
					</tr>  
                    
		 </table>
         </div>  
         
        <div id="tab-footer-custom-3" class="vtabs-content">
        <table class="form">

					<tr>
						<td>Show Bottom Custom Block:</td>
						<td>
                        <select name="oxy_custom_3_status">
                            <option value="1"<?php if($oxy_custom_3_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_custom_3_status == '0') echo ' selected="selected"';?><?php if($oxy_custom_3_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        <span class="oxy_help_tip"><a href="<?php echo HTTP_CATALOG; ?>catalog/view/theme/oxy/image/help/f_16.jpg" target="_blank">?</a></span>
                        </td>
					</tr>
                        
		 </table>                                   
                        
                   <div id="footer_oxy_custom_3" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_custom_3<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_custom_3<?php echo $language['language_id']; ?>">
                   <table class="form">                            
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_custom_3_content<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_custom_3_content' . $language['language_id']}) ? ${'oxy_custom_3_content' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?>       

         </div>                    
        
        </div>    
        
        
        
        
         <div id="tab-widgets">
           <div id="widgets_settings_tabs" class="vtabs">
             <a href="#tab-widgets-facebook">Facebook Box</a>
             <a href="#tab-widgets-twitter">Twitter Box</a>
             <a href="#tab-widgets-video-box">Video Box</a>          
             <a href="#tab-widgets-custom-box">Custom Box</a>                                         
           </div>             
           
        <div id="tab-widgets-facebook" class="vtabs-content">   
        <table class="form">

					<tr>
						<td>Show Facebook Box:</td>
						<td>
                        <select name="oxy_facebook_likebox_status">
                            <option value="1"<?php if($oxy_facebook_likebox_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_facebook_likebox_status == '0') echo ' selected="selected"';?><?php if($oxy_facebook_likebox_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>   
					<tr>
						<td>Facebook FanPage ID:</td>
						<td><input type="text" name="oxy_facebook_likebox_id" value="<?php echo $oxy_facebook_likebox_id; ?>" />
                        <a href="http://findmyfacebookid.com/" target="_blank" class="link"><?php echo $text_facebook_find_id; ?></a>
                        </td>
					</tr> 
					<tr>
						<td><?php echo $text_position; ?></td>
						<td>			
                        <select name="oxy_facebook_likebox_position">
                           <option value="right"<?php if($oxy_facebook_likebox_position == 'right') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>
                           <option value="left"<?php if($oxy_facebook_likebox_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>                     
                        </select>                        
                        </td>
					</tr>                                    

		 </table>
         </div>
         
        <div id="tab-widgets-twitter" class="vtabs-content">   
        <table class="form">

					<tr>
						<td>Show Twitter Box:</td>
						<td colspan="2">
                        <select name="oxy_twitter_block_status">
                            <option value="1"<?php if($oxy_twitter_block_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_twitter_block_status == '0') echo ' selected="selected"';?><?php if($oxy_twitter_block_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>                         
					<tr>
						<td>Twitter username:</td>
						<td><input type="text" name="oxy_twitter_block_user" value="<?php echo $oxy_twitter_block_user; ?>" /></td>
					</tr> 
                    <tr>
						<td>Widget ID:</td>
						<td><input type="text" name="oxy_twitter_block_widget_id" value="<?php echo $oxy_twitter_block_widget_id; ?>" />
                        <a href="http://321theme.com/oxy/documentation/assets/images/screen_14.png" target="_blank" class="link"><?php echo $text_twitter_find_widget_id; ?></a></td>
					</tr> 
					<tr>
                        <td>Tweet limit:</td>
                        <td>
                        <select name="oxy_twitter_block_tweets">
                           <option value="1"<?php if($oxy_twitter_block_tweets == '1') echo ' selected="selected"';?>>1</option>
                           <option value="2"<?php if($oxy_twitter_block_tweets == '2') echo ' selected="selected"';?>>2</option>
                           <option value="3"<?php if($oxy_twitter_block_tweets == '3') echo ' selected="selected"';?><?php if($oxy_twitter_block_tweets == '') echo ' selected="selected"';?>>3</option>
                        </select>
                        </td>
					</tr>                      
                    <tr>
						<td><?php echo $text_position; ?></td>
						<td>			
                        <select name="oxy_twitter_block_position">
                           <option value="right"<?php if($oxy_twitter_block_position == 'right') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>
                           <option value="left"<?php if($oxy_twitter_block_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>                     
                        </select>                        
                        </td>
					</tr>                                      

		 </table>  
         </div>         
         
        <div id="tab-widgets-video-box" class="vtabs-content">   
        <table class="form">

					<tr>
						<td>Show Video Box:</td>
						<td>
                        <select name="oxy_video_box_status">
                            <option value="1"<?php if($oxy_video_box_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_video_box_status == '0') echo ' selected="selected"';?><?php if($oxy_video_box_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>   
                    
		 </table>                    
                    
                   <div id="widget_oxy_video_box" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_video_box<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_video_box<?php echo $language['language_id']; ?>">
                   <table class="form">                            
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_video_box_content<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_video_box_content' . $language['language_id']}) ? ${'oxy_video_box_content' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?>     
                    
                    
        <table class="form">

					<tr>
						<td><?php echo $text_position; ?></td>
						<td>			
                        <select name="oxy_video_box_position">
                           <option value="right"<?php if($oxy_video_box_position == 'right') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>
                           <option value="left"<?php if($oxy_video_box_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>                     
                        </select>                        
                        </td>
					</tr>      
                    <tr>
						<td><?php echo $text_bg_color; ?></td>
						<td>
                        <input type="text" name="oxy_video_box_bg" id="oxy_video_box_bg" value="<?php echo $oxy_video_box_bg; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>                                                       

		 </table>
         </div>
         
        <div id="tab-widgets-custom-box" class="vtabs-content">   
        <table class="form">

					<tr>
						<td>Show Custom Box:</td>
						<td>
                        <select name="oxy_custom_box_status">
                            <option value="1"<?php if($oxy_custom_box_status == '1') echo ' selected="selected"';?>><?php echo $text_yes; ?></option>
                            <option value="0"<?php if($oxy_custom_box_status == '0') echo ' selected="selected"';?><?php if($oxy_custom_box_status == '') echo ' selected="selected"';?>><?php echo $text_no; ?></option>
			            </select>
                        </td>
					</tr>   
                    
		 </table>                    
                    
                   <div id="widget_oxy_custom_box" class="htabs">
                     <?php foreach ($languages as $language) { ?>
                     <a href="#language_oxy_custom_box<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                     <?php } ?>
                   </div>
                   <?php foreach ($languages as $language) { ?>
                   <div id="language_oxy_custom_box<?php echo $language['language_id']; ?>">
                   <table class="form">                            
					 <tr>
						<td><?php echo $text_content; ?></td>
						<td><textarea name="oxy_custom_box_content<?php echo $language['language_id']; ?>" ><?php echo isset(${'oxy_custom_box_content' . $language['language_id']}) ? ${'oxy_custom_box_content' . $language['language_id']} : ''; ?></textarea></td>
					 </tr>                             
                   </table>  
                   </div>
                   <?php } ?>     
                    
                    
        <table class="form">

					<tr>
						<td><?php echo $text_position; ?></td>
						<td>			
                        <select name="oxy_custom_box_position">
                           <option value="right"<?php if($oxy_custom_box_position == 'right') echo ' selected="selected"';?>><?php echo $text_position_r; ?></option>
                           <option value="left"<?php if($oxy_custom_box_position == 'left') echo ' selected="selected"';?>><?php echo $text_position_l; ?></option>                     
                        </select>                        
                        </td>
					</tr>      
                    <tr>
						<td><?php echo $text_bg_color; ?></td>
						<td>
                        <input type="text" name="oxy_custom_box_bg" id="oxy_custom_box_bg" value="<?php echo $oxy_custom_box_bg; ?>" class="color {required:false,hash:true}" size="7" />
                        </td>
					</tr>                                                       

		 </table>
         </div>                                                   
        
         </div> 
         
         <div id="tab-css">
 
        <table class="form">

					<tr>
						<td>Custom CSS:</td>
						<td colspan="2"><textarea name="oxy_custom_css" rows="10" cols="100" /><?php echo $oxy_custom_css; ?></textarea></td>
					</tr>                                    
                    <tr>
						<td>Custom JavaScript:</td>
						<td colspan="2"><textarea name="oxy_custom_js" rows="10" cols="100" /><?php echo $oxy_custom_js; ?></textarea></td>
					</tr>                                    

		 </table>
        
         </div>                 
     
    </form>
	</div>
		
</div>        

<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('oxy_menu_custom_block_content_1<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_menu_custom_block_content_2<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_menu_custom_block_content_3<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_product_custom_content<?php echo $language['language_id']; ?>', {
    filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_product_fb1_content<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_product_fb2_content<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_product_fb3_content<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_product_custom_tab_1_content<?php echo $language['language_id']; ?>', {
    filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_product_custom_tab_2_content<?php echo $language['language_id']; ?>', {
    filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_product_custom_tab_3_content<?php echo $language['language_id']; ?>', {
    filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_contact_custom_content<?php echo $language['language_id']; ?>', {
    filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_custom_1_content<?php echo $language['language_id']; ?>', {
    filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_custom_2_content<?php echo $language['language_id']; ?>', {
    filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_custom_3_content<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_powered_content<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_video_box_content<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_custom_box_content<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_fp_fb1_content<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_fp_fb2_content<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_fp_fb3_content<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('oxy_fp_fb4_content<?php echo $language['language_id']; ?>', {
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
//--></script>

<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script>  
<script type="text/javascript">
	$('#settings_tabs a').tabs();  
	$('#store_features_tabs a').tabs();	
	$('#colors_styles_settings_tabs a').tabs();
	$('#background_images_settings_tabs a').tabs();
	$('#fonts_settings_tabs a').tabs();	
	$('#footer_settings_tabs a').tabs();
	$('#widgets_settings_tabs a').tabs();
	$('#menu_oxy_custom a').tabs();
	$('#menu_oxy_custom_2 a').tabs();
	$('#menu_oxy_custom_3 a').tabs();
	$('#product_oxy_custom a').tabs();
	$('#product_feature_box_1 a').tabs();
	$('#product_feature_box_2 a').tabs();
	$('#product_feature_box_3 a').tabs();
	$('#product_oxy_custom_tab_1 a').tabs();
	$('#product_oxy_custom_tab_2 a').tabs();
	$('#product_oxy_custom_tab_3 a').tabs();	
	$('#contact_oxy_custom a').tabs();
	$('#footer_feature_box_1 a').tabs();
	$('#footer_feature_box_2 a').tabs();
	$('#footer_feature_box_3 a').tabs();
	$('#footer_feature_box_4 a').tabs();
	$('#footer_oxy_custom_1 a').tabs();
	$('#footer_oxy_custom_2 a').tabs();	
	$('#footer_oxy_custom_3 a').tabs();	
	$('#footer_oxy_powered a').tabs();
	$('#widget_oxy_video_box a').tabs();
	$('#widget_oxy_custom_box a').tabs();
</script>

<script type="text/javascript" src="view/javascript/jscolor/jscolor.js"></script>
<script type="text/javascript" src="view/javascript/poshytip/jquery.poshytip.js"></script>
<link rel="stylesheet" type="text/css" href="view/javascript/poshytip/tip-twitter/tip-twitter.css" />
	<script type="text/javascript">
		//<![CDATA[
		$(function(){

			$('#oxy-help-25').poshytip({
				content: 'Before you turn on this option, add at least one manufacturer.',
			});	
			$('#oxy-help-33').poshytip({
				content: 'If you need help, please contact us. <br>We provide support only through our OXY Support System.',
			});
			$('#oxy-help-34').poshytip({
				content: 'Before you turn on this option, add at least one manufacturer.',
			});				

		});
		$(function(){
		$("#save_skin").click(function(e){
			
			var selected_skin = $("#oxy_skin").val();
			var ajaxurl = 'index.php?route=catalog/product/saveSkin&token=<?php echo $token; ?>';	
			
        // alert("hi");
        e.preventDefault();
        var answer = confirm("Click OK to Save new color schema.")

        if (answer) {

            var clickedObject = $(this);
            var clickedID = $(this).attr("id");

            var nonce = $("#security").val();

            var schema_set = {
                skin_name: $("#skin_name").val(), //
				oxy_layout_style : $("#oxy_layout_style").val(),
				oxy_search_bar_position : $("#oxy_search_bar_position").val(),
				
				oxy_body_bg_color : $("#oxy_body_bg_color").val(),
				oxy_headings_color : $("#oxy_headings_color").val(),
				oxy_body_text_color : $("#oxy_body_text_color").val(),
				oxy_light_text_color : $("#oxy_light_text_color").val(),
				oxy_other_links_color : $("#oxy_other_links_color").val(),
				oxy_links_hover_color : $("#oxy_links_hover_color").val(),
				oxy_general_icons_style : $("#oxy_general_icons_style").val(),
				
				oxy_main_column_status : $("#oxy_main_column_status").val(),
				oxy_main_column_bg_color : $("#oxy_main_column_bg_color").val(),
				oxy_main_column_border_status : $("#oxy_main_column_border_status").val(),
				oxy_main_column_border_size : $("#oxy_main_column_border_size").val(),
				oxy_main_column_border_style : $("#oxy_main_column_border_style").val(),
				oxy_main_column_border_color : $("#oxy_main_column_border_color").val(),
				oxy_main_column_shadow : $("#oxy_main_column_shadow").val(),
				
				oxy_content_column_hli_bg_color : $("#oxy_content_column_hli_bg_color").val(),
				oxy_content_column_head_border_status : $("#oxy_content_column_head_border_status").val(),
				oxy_content_column_head_border_size : $("#oxy_content_column_head_border_size").val(),
				oxy_content_column_head_border_style : $("#oxy_content_column_head_border_style").val(),
				oxy_content_column_head_border_color : $("#oxy_content_column_head_border_color").val(),
				oxy_content_column_separator_size : $("#oxy_content_column_separator_size").val(),
				oxy_content_column_separator_style : $("#oxy_content_column_separator_style").val(),
				oxy_content_column_separator_color : $("#oxy_content_column_separator_color").val(),
				
				oxy_left_column_head_status : $("#oxy_left_column_head_status").val(),
				oxy_left_column_head_bg_color : $("#oxy_left_column_head_bg_color").val(),
				oxy_left_column_head_custom : $("#oxy_left_column_head_custom").val(),
				oxy_left_column_head_title_color : $("#oxy_left_column_head_title_color").val(),
				oxy_left_column_head_border_status : $("#oxy_left_column_head_border_status").val(),
				oxy_left_column_head_border_size : $("#oxy_left_column_head_border_size").val(),
				oxy_left_column_head_border_style : $("#oxy_left_column_head_border_style").val(),
				oxy_left_column_head_border_color : $("#oxy_left_column_head_border_color").val(),
				oxy_left_column_box_status : $("#oxy_left_column_box_status").val(),
				oxy_left_column_box_bg_color : $("#oxy_left_column_box_bg_color").val(),
				oxy_left_column_box_links_color : $("#oxy_left_column_box_links_color").val(),
				oxy_left_column_box_links_color_hover : $("#oxy_left_column_box_links_color_hover").val(),
				
				oxy_right_column_head_status : $("#oxy_right_column_head_status").val(),
				oxy_right_column_head_bg_color : $("#oxy_right_column_head_bg_color").val(),
				oxy_right_column_head_custom : $("#oxy_right_column_head_custom").val(),
				oxy_right_column_head_title_color : $("#oxy_right_column_head_title_color").val(),
				oxy_right_column_head_border_status : $("#oxy_right_column_head_border_status").val(),
				oxy_right_column_head_border_size : $("#oxy_right_column_head_border_size").val(),
				oxy_right_column_head_border_style : $("#oxy_right_column_head_border_style").val(),
				oxy_right_column_head_border_color : $("#oxy_right_column_head_border_color").val(),
				oxy_right_column_box_status : $("#oxy_right_column_box_status").val(),
				oxy_right_column_box_bg_color : $("#oxy_right_column_box_bg_color").val(),
				oxy_right_column_box_links_color : $("#oxy_right_column_box_links_color").val(),
				oxy_right_column_box_links_color_hover : $("#oxy_right_column_box_links_color_hover").val(),
				
				oxy_category_box_head_status : $("#oxy_category_box_head_status").val(),
				oxy_category_box_head_bg_color : $("#oxy_category_box_head_bg_color").val(),
				oxy_category_box_head_custom : $("#oxy_category_box_head_custom").val(),
				oxy_category_box_head_title_color : $("#oxy_category_box_head_title_color").val(),
				oxy_category_box_head_border_status : $("#oxy_category_box_head_border_status").val(),
				oxy_category_box_head_border_size : $("#oxy_category_box_head_border_size").val(),
				oxy_category_box_head_border_style : $("#oxy_category_box_head_border_style").val(),
				oxy_category_box_head_border_color : $("#oxy_category_box_head_border_color").val(),
				oxy_category_box_box_status : $("#oxy_category_box_box_status").val(),
				oxy_category_box_box_bg_color : $("#oxy_category_box_box_bg_color").val(),
				oxy_category_box_box_bg_color_hover : $("#oxy_category_box_box_bg_color_hover").val(),
				oxy_category_box_box_links_color : $("#oxy_category_box_box_links_color").val(),
				oxy_category_box_box_links_color_hover : $("#oxy_category_box_box_links_color_hover").val(),
				oxy_category_box_box_separator_size : $("#oxy_category_box_box_separator_size").val(),
				oxy_category_box_box_separator_style : $("#oxy_category_box_box_separator_style").val(),
				oxy_category_box_box_separator_color : $("#oxy_category_box_box_separator_color").val(),
				
				oxy_filter_box_head_status : $("#oxy_filter_box_head_status").val(),
				oxy_filter_box_head_bg_color : $("#oxy_filter_box_head_bg_color").val(),
				oxy_filter_box_head_custom : $("#oxy_filter_box_head_custom").val(),
				oxy_filter_box_head_title_color : $("#oxy_filter_box_head_title_color").val(),
				oxy_filter_box_head_border_status : $("#oxy_filter_box_head_border_status").val(),
				oxy_filter_box_head_border_size : $("#oxy_filter_box_head_border_size").val(),
				oxy_filter_box_head_border_style : $("#oxy_filter_box_head_border_style").val(),
				oxy_filter_box_head_border_color : $("#oxy_filter_box_head_border_color").val(),
				oxy_filter_box_box_status : $("#oxy_filter_box_box_status").val(),
				oxy_filter_box_box_bg_color : $("#oxy_filter_box_box_bg_color").val(),
				oxy_filter_box_box_links_color : $("#oxy_filter_box_box_links_color").val(),
				oxy_filter_box_box_links_color_hover : $("#oxy_filter_box_box_links_color_hover").val(),
				
				oxy_price_color : $("#oxy_price_color").val(),
				oxy_price_old_color : $("#oxy_price_old_color").val(),
				oxy_price_new_color : $("#oxy_price_new_color").val(),
				oxy_price_tax_color : $("#oxy_price_tax_color").val(),
				
				oxy_button_border_radius : $("#oxy_button_border_radius").val(),
				oxy_button_bg_color : $("#oxy_button_bg_color").val(),
				oxy_button_bg_hover_color : $("#oxy_button_bg_hover_color").val(),
				oxy_button_text_color : $("#oxy_button_text_color").val(),
				oxy_button_text_hover_color : $("#oxy_button_text_hover_color").val(),
				oxy_button_exclusive_bg_color : $("#oxy_button_exclusive_bg_color").val(),
				oxy_button_exclusive_bg_hover_color : $("#oxy_button_exclusive_bg_hover_color").val(),
				oxy_button_exclusive_text_color : $("#oxy_button_exclusive_text_color").val(),
				oxy_button_exclusive_text_hover_color : $("#oxy_button_exclusive_text_hover_color").val(),
				oxy_button_light_bg_color : $("#oxy_button_light_bg_color").val(),
				oxy_button_light_bg_hover_color : $("#oxy_button_light_bg_hover_color").val(),
				oxy_button_light_text_color : $("#oxy_button_light_text_color").val(),
				oxy_button_light_text_hover_color : $("#oxy_button_light_text_hover_color").val(),
				oxy_button_slider_bg_color : $("#oxy_button_slider_bg_color").val(),
				oxy_button_slider_bg_hover_color : $("#oxy_button_slider_bg_hover_color").val(),
				
				oxy_top_area_status : $("#oxy_top_area_status").val(),
				oxy_top_area_bg_color : $("#oxy_top_area_bg_color").val(),
				oxy_top_area_mini_bg_color : $("#oxy_top_area_mini_bg_color").val(),
				oxy_top_area_tb_bg_status : $("#oxy_top_area_tb_bg_status").val(),
				oxy_top_area_tb_bg_color : $("#oxy_top_area_tb_bg_color").val(),
				oxy_top_area_tb_top_border_status : $("#oxy_top_area_tb_top_border_status").val(),
				oxy_top_area_tb_top_border_color : $("#oxy_top_area_tb_top_border_color").val(),
				oxy_top_area_tb_bottom_border_status : $("#oxy_top_area_tb_bottom_border_status").val(),
				oxy_top_area_tb_bottom_border_color : $("#oxy_top_area_tb_bottom_border_color").val(),
				oxy_top_area_tb_text_color : $("#oxy_top_area_tb_text_color").val(),
				oxy_top_area_tb_link_color : $("#oxy_top_area_tb_link_color").val(),
				oxy_top_area_tb_link_color_hover : $("#oxy_top_area_tb_link_color_hover").val(),
				oxy_top_area_tb_separator_color : $("#oxy_top_area_tb_separator_color").val(),
				oxy_top_area_tb_dropdown_bg_color : $("#oxy_top_area_tb_dropdown_bg_color").val(),
				oxy_top_area_tb_dropdown_bg_color_hover : $("#oxy_top_area_tb_dropdown_bg_color_hover").val(),
				oxy_top_area_tb_dropdown_link_color : $("#oxy_top_area_tb_dropdown_link_color").val(),
				oxy_top_area_tb_dropdown_link_color_hover : $("#oxy_top_area_tb_dropdown_link_color_hover").val(),
				oxy_top_area_search_bg_color : $("#oxy_top_area_search_bg_color").val(),
				oxy_top_area_search_border_color : $("#oxy_top_area_search_border_color").val(),
				oxy_top_area_search_border_color_hover : $("#oxy_top_area_search_border_color_hover").val(),
				oxy_top_area_search_text_color : $("#oxy_top_area_search_text_color").val(),
				oxy_top_area_cart_text_color : $("#oxy_top_area_cart_text_color").val(),
				oxy_top_area_cart_link_color : $("#oxy_top_area_cart_link_color").val(),
				oxy_top_area_cart_link_color_hover : $("#oxy_top_area_cart_link_color_hover").val(),
				oxy_top_area_cart_separator_color : $("#oxy_top_area_cart_separator_color").val(),
				oxy_top_area_cart_icon_style : $("#oxy_top_area_cart_icon_style").val(),
				
				oxy_mm_bg_color_status : $("#oxy_mm_bg_color_status").val(),
				oxy_mm_bg_color : $("#oxy_mm_bg_color").val(),
				oxy_mm_separator_status : $("#oxy_mm_separator_status").val(),
				oxy_mm_separator_size : $("#oxy_mm_separator_size").val(),
				oxy_mm_separator_style : $("#oxy_mm_separator_style").val(),
				oxy_mm_separator_color : $("#oxy_mm_separator_color").val(),
				oxy_mm_border_top_status : $("#oxy_mm_border_top_status").val(),
				oxy_mm_border_top_size : $("#oxy_mm_border_top_size").val(),
				oxy_mm_border_top_style : $("#oxy_mm_border_top_style").val(),
				oxy_mm_border_top_color : $("#oxy_mm_border_top_color").val(),
				oxy_mm_border_bottom_status : $("#oxy_mm_border_bottom_status").val(),
				oxy_mm_border_bottom_size : $("#oxy_mm_border_bottom_size").val(),
				oxy_mm_border_bottom_style : $("#oxy_mm_border_bottom_style").val(),
				oxy_mm_border_bottom_color : $("#oxy_mm_border_bottom_color").val(),
				
				oxy_mm1_bg_color_status : $("#oxy_mm1_bg_color_status").val(),
				oxy_mm1_bg_color : $("#oxy_mm1_bg_color").val(),
				oxy_mm1_bg_hover_color : $("#oxy_mm1_bg_hover_color").val(),
				oxy_mm1_link_color : $("#oxy_mm1_link_color").val(),
				oxy_mm1_link_hover_color : $("#oxy_mm1_link_hover_color").val(),
				
				oxy_mm2_bg_color_status : $("#oxy_mm2_bg_color_status").val(),
				oxy_mm2_bg_color : $("#oxy_mm2_bg_color").val(),
				oxy_mm2_bg_hover_color : $("#oxy_mm2_bg_hover_color").val(),
				oxy_mm2_link_color : $("#oxy_mm2_link_color").val(),
				oxy_mm2_link_hover_color : $("#oxy_mm2_link_hover_color").val(),
				
				oxy_mm3_bg_color_status : $("#oxy_mm3_bg_color_status").val(),
				oxy_mm3_bg_color : $("#oxy_mm3_bg_color").val(),
				oxy_mm3_bg_hover_color : $("#oxy_mm3_bg_hover_color").val(),
				oxy_mm3_link_color : $("#oxy_mm3_link_color").val(),
				oxy_mm3_link_hover_color : $("#oxy_mm3_link_hover_color").val(),
				
				oxy_mm4_bg_color_status : $("#oxy_mm4_bg_color_status").val(),
				oxy_mm4_bg_color : $("#oxy_mm4_bg_color").val(),
				oxy_mm4_bg_hover_color : $("#oxy_mm4_bg_hover_color").val(),
				oxy_mm4_link_color : $("#oxy_mm4_link_color").val(),
				oxy_mm4_link_hover_color : $("#oxy_mm4_link_hover_color").val(),
				
				oxy_mm6_bg_color_status : $("#oxy_mm6_bg_color_status").val(),
				oxy_mm6_bg_color : $("#oxy_mm6_bg_color").val(),
				oxy_mm6_bg_hover_color : $("#oxy_mm6_bg_hover_color").val(),
				oxy_mm6_link_color : $("#oxy_mm6_link_color").val(),
				oxy_mm6_link_hover_color : $("#oxy_mm6_link_hover_color").val(),
				
				oxy_mm8_bg_color_status : $("#oxy_mm8_bg_color_status").val(),
				oxy_mm8_bg_color : $("#oxy_mm8_bg_color").val(),
				oxy_mm8_bg_hover_color : $("#oxy_mm8_bg_hover_color").val(),
				oxy_mm8_link_color : $("#oxy_mm8_link_color").val(),
				oxy_mm8_link_hover_color : $("#oxy_mm8_link_hover_color").val(),
				
				oxy_mm5_bg_color_status : $("#oxy_mm5_bg_color_status").val(),
				oxy_mm5_bg_color : $("#oxy_mm5_bg_color").val(),
				oxy_mm5_bg_hover_color : $("#oxy_mm5_bg_hover_color").val(),
				oxy_mm5_link_color : $("#oxy_mm5_link_color").val(),
				oxy_mm5_link_hover_color : $("#oxy_mm5_link_hover_color").val(),
				
				oxy_mm7_bg_color_status : $("#oxy_mm7_bg_color_status").val(),
				oxy_mm7_bg_color : $("#oxy_mm7_bg_color").val(),
				oxy_mm7_bg_hover_color : $("#oxy_mm7_bg_hover_color").val(),
				oxy_mm7_link_color : $("#oxy_mm7_link_color").val(),
				oxy_mm7_link_hover_color : $("#oxy_mm7_link_hover_color").val(),
				
				oxy_mm_sub_bg_color : $("#oxy_mm_sub_bg_color").val(),
				oxy_mm_sub_bg_hover_color : $("#oxy_mm_sub_bg_hover_color").val(),
				oxy_mm_sub_titles_bg_color : $("#oxy_mm_sub_titles_bg_color").val(),
				oxy_mm_sub_text_color : $("#oxy_mm_sub_text_color").val(),
				oxy_mm_sub_link_color : $("#oxy_mm_sub_link_color").val(),
				oxy_mm_sub_link_hover_color : $("#oxy_mm_sub_link_hover_color").val(),
				oxy_mm_sub_separator_style : $("#oxy_mm_sub_separator_style").val(),
				oxy_mm_sub_separator_color : $("#oxy_mm_sub_separator_color").val(),
				oxy_mm_sub_box_shadow : $("#oxy_mm_sub_box_shadow").val(),
				
				oxy_mm_mobile_bg_color : $("#oxy_mm_mobile_bg_color").val(),
				oxy_mm_mobile_bg_hover_color : $("#oxy_mm_mobile_bg_hover_color").val(),
				oxy_mm_mobile_text_color : $("#oxy_mm_mobile_text_color").val(),
				
				oxy_mid_prod_box_bg_hover_color : $("#oxy_mid_prod_box_bg_hover_color").val(),
				oxy_mid_prod_box_shadow_hover : $("#oxy_mid_prod_box_shadow_hover").val(),
				oxy_mid_prod_box_sale_icon_color : $("#oxy_mid_prod_box_sale_icon_color").val(),
				oxy_mid_prod_stars_color : $("#oxy_mid_prod_stars_color").val(),
				oxy_mid_prod_page_tabs_bg_color : $("#oxy_mid_prod_page_tabs_bg_color").val(),
				oxy_mid_prod_page_tabs_selected_bg_color : $("#oxy_mid_prod_page_tabs_selected_bg_color").val(),
				oxy_mid_prod_page_tabs_text_color : $("#oxy_mid_prod_page_tabs_text_color").val(),
				oxy_mid_prod_slider_bg_color : $("#oxy_mid_prod_slider_bg_color").val(),
				oxy_mid_prod_slider_name_color : $("#oxy_mid_prod_slider_name_color").val(),
				oxy_mid_prod_slider_desc_color : $("#oxy_mid_prod_slider_desc_color").val(),
				oxy_mid_prod_slider_price_color : $("#oxy_mid_prod_slider_price_color").val(),
				oxy_mid_prod_slider_links_color_hover : $("#oxy_mid_prod_slider_links_color_hover").val(),
				oxy_mid_prod_slider_bottom_bar_bg_color : $("#oxy_mid_prod_slider_bottom_bar_bg_color").val(),
				oxy_mid_prod_slider_bottom_bar_bg_color_hover : $("#oxy_mid_prod_slider_bottom_bar_bg_color_hover").val(),
				oxy_mid_prod_slider_bottom_bar_bg_color_active : $("#oxy_mid_prod_slider_bottom_bar_bg_color_active").val(),
				
				oxy_fp_bg_color : $("#oxy_fp_bg_color").val(),
				oxy_fp_title_color : $("#oxy_fp_title_color").val(),
				oxy_fp_title_color_hover : $("#oxy_fp_title_color_hover").val(),
				oxy_fp_subtitle_color : $("#oxy_fp_subtitle_color").val(),
				
				oxy_f1_bg_color : $("#oxy_f1_bg_color").val(),
				oxy_f1_titles_color : $("#oxy_f1_titles_color").val(),
				oxy_f1_titles_border_bottom_size : $("#oxy_f1_titles_border_bottom_size").val(),
				oxy_f1_titles_border_bottom_style : $("#oxy_f1_titles_border_bottom_style").val(),
				oxy_f1_titles_border_bottom_color : $("#oxy_f1_titles_border_bottom_color").val(),
				oxy_f1_text_color : $("#oxy_f1_text_color").val(),
				oxy_f1_link_color : $("#oxy_f1_link_color").val(),
				oxy_f1_link_hover_color : $("#oxy_f1_link_hover_color").val(),
				oxy_f1_icon_color : $("#oxy_f1_icon_color").val(),
				oxy_f1_border_top_status : $("#oxy_f1_border_top_status").val(),
				oxy_f1_border_top_size : $("#oxy_f1_border_top_size").val(),
				oxy_f1_border_top_style : $("#oxy_f1_border_top_style").val(),
				oxy_f1_border_top_color : $("#oxy_f1_border_top_color").val(),
				
				oxy_f2_bg_color : $("#oxy_f2_bg_color").val(),
				oxy_f2_titles_color : $("#oxy_f2_titles_color").val(),
				oxy_f2_titles_border_bottom_size : $("#oxy_f2_titles_border_bottom_size").val(),
				oxy_f2_titles_border_bottom_style : $("#oxy_f2_titles_border_bottom_style").val(),
				oxy_f2_titles_border_bottom_color : $("#oxy_f2_titles_border_bottom_color").val(),
				oxy_f2_link_color : $("#oxy_f2_link_color").val(),
				oxy_f2_link_hover_color : $("#oxy_f2_link_hover_color").val(),
				oxy_f2_border_top_status : $("#oxy_f2_border_top_status").val(),
				oxy_f2_border_top_size : $("#oxy_f2_border_top_size").val(),
				oxy_f2_border_top_style : $("#oxy_f2_border_top_style").val(),
				oxy_f2_border_top_color : $("#oxy_f2_border_top_color").val(),
				
				oxy_f4_bg_color : $("#oxy_f4_bg_color").val(),
				oxy_f4_text_color : $("#oxy_f4_text_color").val(),
				oxy_f4_link_color : $("#oxy_f4_link_color").val(),
				oxy_f4_link_hover_color : $("#oxy_f4_link_hover_color").val(),
				oxy_f4_border_top_status : $("#oxy_f4_border_top_status").val(),
				oxy_f4_border_top_size : $("#oxy_f4_border_top_size").val(),
				oxy_f4_border_top_style : $("#oxy_f4_border_top_style").val(),
				oxy_f4_border_top_color : $("#oxy_f4_border_top_color").val(),
				
				oxy_f5_bg_color : $("#oxy_f5_bg_color").val(),
				oxy_f5_text_color : $("#oxy_f5_text_color").val(),
				oxy_f5_link_color : $("#oxy_f5_link_color").val(),
				oxy_f5_link_hover_color : $("#oxy_f5_link_hover_color").val(),
				oxy_f5_border_top_status : $("#oxy_f5_border_top_status").val(),
				oxy_f5_border_top_size : $("#oxy_f5_border_top_size").val(),
				oxy_f5_border_top_style : $("#oxy_f5_border_top_style").val(),
				oxy_f5_border_top_color : $("#oxy_f5_border_top_color").val(),
				
				oxy_pattern_oxy : $("#oxy_pattern_oxy").val(),
				oxy_bg_image_custom : $("#oxy_bg_image_custom").val(),
				oxy_bg_image_position : $("#oxy_bg_image_position").val(),
				oxy_bg_image_repeat : $("#oxy_bg_image_repeat").val(),
				oxy_bg_image_attachment : $("#oxy_bg_image_attachment").val(),
				oxy_pattern_oxy_mc : $("#oxy_pattern_oxy_mc").val(),
				oxy_bg_image_mc_custom : $("#oxy_bg_image_mc_custom").val(),
				oxy_bg_image_mc_position : $("#oxy_bg_image_mc_position").val(),
				oxy_bg_image_mc_repeat : $("#oxy_bg_image_mc_repeat").val(),
				oxy_bg_image_mc_attachment : $("#oxy_bg_image_mc_attachment").val(),
				oxy_pattern_oxy_ta : $("#oxy_pattern_oxy_ta").val(),
				oxy_bg_image_ta_custom : $("#oxy_bg_image_ta_custom").val(),
				oxy_bg_image_ta_position : $("#oxy_bg_image_ta_position").val(),
				oxy_bg_image_ta_repeat : $("#oxy_bg_image_ta_repeat").val(),
				oxy_bg_image_ta_attachment : $("#oxy_bg_image_ta_attachment").val(),
				oxy_pattern_oxy_mm : $("#oxy_pattern_oxy_mm").val(),
				oxy_bg_image_mm_custom : $("#oxy_bg_image_mm_custom").val(),
				oxy_bg_image_mm_repeat : $("#oxy_bg_image_mm_repeat").val(),
				
				oxy_pattern_oxy_f1 : $("#oxy_pattern_oxy_f1").val(),
				oxy_bg_image_f1_custom : $("#oxy_bg_image_f1_custom").val(),
				oxy_bg_image_f1_position : $("#oxy_bg_image_f1_position").val(),
				oxy_bg_image_f1_repeat : $("#oxy_bg_image_f1_repeat").val(),
				
				oxy_pattern_oxy_f2 : $("#oxy_pattern_oxy_f2").val(),
				oxy_bg_image_f2_custom : $("#oxy_bg_image_f2_custom").val(),
				oxy_bg_image_f2_position : $("#oxy_bg_image_f2_position").val(),
				oxy_bg_image_f2_repeat : $("#oxy_bg_image_f2_repeat").val(),
				
				oxy_pattern_oxy_f4 : $("#oxy_pattern_oxy_f4").val(),
				oxy_bg_image_f4_custom : $("#oxy_bg_image_f4_custom").val(),
				oxy_bg_image_f4_position : $("#oxy_bg_image_f4_position").val(),
				oxy_bg_image_f4_repeat : $("#oxy_bg_image_f4_repeat").val(),
				
				oxy_pattern_oxy_f5 : $("#oxy_pattern_oxy_f5").val(),
				oxy_bg_image_f5_custom : $("#oxy_bg_image_f5_custom").val(),
				oxy_bg_image_f5_position : $("#oxy_bg_image_f5_position").val(),
				oxy_bg_image_f5_repeat : $("#oxy_bg_image_f5_repeat").val(),
				
				oxy_body_font : $("#oxy_body_font").val(),
				oxy_title_font : $("#oxy_title_font").val(),
				oxy_title_font_weight : $("#oxy_title_font_weight").val(),
				oxy_title_font_uppercase : $("#oxy_title_font_uppercase").val(),
				oxy_price_font : $("#oxy_price_font").val(),
				oxy_price_font_weight : $("#oxy_price_font_weight").val(),
				oxy_button_font : $("#oxy_button_font").val(),
				oxy_button_font_weight : $("#oxy_button_font_weight").val(),
				oxy_button_font_uppercase : $("#oxy_button_font_uppercase").val(),
				oxy_search_font : $("#oxy_search_font").val(),
				oxy_search_font_weight : $("#oxy_search_font_weight").val(),
				oxy_search_font_size : $("#oxy_search_font_size").val(),
				oxy_search_font_uppercase : $("#oxy_search_font_uppercase").val(),
				oxy_cart_font : $("#oxy_cart_font").val(),
				oxy_cart_font_weight : $("#oxy_cart_font_weight").val(),
				oxy_cart_font_size : $("#oxy_cart_font_size").val(),
				oxy_cart_font_uppercase : $("#oxy_cart_font_uppercase").val(),
				oxy_main_menu_font : $("#oxy_main_menu_font").val(),
				oxy_mm_font_weight : $("#oxy_mm_font_weight").val(),
				oxy_mm_font_size : $("#oxy_mm_font_size").val(),
				oxy_mm_font_uppercase : $("#oxy_mm_font_uppercase").val(),
				
				oxy_fp_fb1_bg_color : $("#oxy_fp_fb1_bg_color").val(),
				oxy_fp_fb1_bg_color_hover : $("#oxy_fp_fb1_bg_color_hover").val(),
				oxy_fp_fb2_bg_color : $("#oxy_fp_fb2_bg_color").val(),
				oxy_fp_fb2_bg_color_hover : $("#oxy_fp_fb2_bg_color_hover").val(),
				oxy_fp_fb3_bg_color : $("#oxy_fp_fb3_bg_color").val(),
				oxy_fp_fb3_bg_color_hover : $("#oxy_fp_fb3_bg_color_hover").val(),
				oxy_fp_fb4_bg_color : $("#oxy_fp_fb4_bg_color").val(),
				oxy_fp_fb4_bg_color_hover : $("#oxy_fp_fb4_bg_color_hover").val(),
				
				oxy_video_box_bg : $("#oxy_video_box_bg").val(),
				oxy_custom_box_bg : $("#oxy_custom_box_bg").val()
				
			};
 
		// console.log(schema_set);

            var data = {
                action: "of_ajax_post_action",
                type: "of_color_schema",
                schema: schema_set
            };

            $.post(ajaxurl, data, function(response) {

                //check nonce
                if (response == -1) { //failed

                    var fail_popup = $("#of-popup-fail");
                    fail_popup.fadeIn();
                    window.setTimeout(function() {
                        fail_popup.fadeOut();
                    }, 2000);
                }

                else {
					
					var value = $("select#oxy_skin > option").length > 0 ? parseInt($("select#oxy_skin > option:last-child").attr('value'))+1 : 0 ;
					
					var opt = $("select#oxy_skin").append('<option value="'+value+'">'+schema_set.skin_name+'</option>');
					
					$("#skin_name").val('');
					
					$("select#oxy_skin option").attr("selected",false);
					
					$("select#oxy_skin option:last-child").attr('selected',true);

                    var success_popup = $("#of-popup-save");
                    success_popup.fadeIn();
                    /*window.setTimeout(function() {
                        location.reload();                    
					}, 1000);*/
                }

            });
        }

        return false;

    });
	
			$("#load_skin").click(function(e){
			
			var selected_skin = $("#oxy_skin").val();
			var ajaxurl = 'index.php?route=catalog/product/LoadSkin&token=<?php echo $token; ?>';
				
        e.preventDefault();
         var answer = confirm("Click OK to load this skin.")

        if (answer) {

        var element = $(this);

     	var selected_skin = $("#oxy_skin").val();

        /* end by rakib*/

        var clickedObject = $(this);

        var nonce = $("#security").val();
        var elementData;
        var data = {
            action: "of_ajax_post_action",
            type: "of_color_schema_apply",
            schema_id: selected_skin,
            security: nonce
        };

        $.post(ajaxurl, data, function(response) {
  
            $("#of-popup-loading").fadeOut();
            
            $("#loading-bg-transparent").remove();

            if (response == -1) { //failed

                var fail_popup = $("#of-popup-fail");
                fail_popup.fadeIn();
                window.setTimeout(function() {
                    fail_popup.fadeOut();
                }, 2000);
            }

            else {

                elementData = response;
                
                 var data = JSON.parse(elementData);
                
                $.each(data, function(i, val) {
               
                 var elm = $("#" + i);
                 
                 var elm_name = $( '[name="'+i+ '"]');
 
                 if (typeof val == "string" || typeof val == "number" || typeof val == "boolean")

                    {

                         if (elm.length)
                        {
         
                            if (elm.is("input[type=text]") || elm.is("input[type=hidden]") || elm.is("select"))
                            {
 
									if(elm.attr('class')=="checkbox aq-input") {
						
									var ipnone_checkbox =  elm.siblings(".iPhoneCheckContainer").children(".iphone_checkboxes");

											  if(val==1) 
												 ipnone_checkbox.attr('checked', true);
											   
												 else
												 ipnone_checkbox.attr('checked', false);

									}

									else
									
                                elm.val(val).trigger("change");

                            }
                        }else if(elm_name.length){
							
							//console.log(elm_name)
							
							//oxy_mainbg_status
                        
                         $.each(elm_name, function(j, elm_val) {
               
           // input#of-radio-tile-oxy_body_bg279.checkbox               
                //var names =  [$("#of-radio-tile-"+i + j),$("#of-radio-img-"+i + j)];
                
                                var patt = elm_name.attr('id');
                                
                                var name = "";

                                if(patt.match(/of-radio-tile/)){
                                    
                                    name = $("#of-radio-tile-"+i + j);

                                }
                                else if(patt.match(/of-radio-img/)){
                                
                                    name = $("#of-radio-img-"+i + j);
                                
                                }
								
								 else if(patt.match(/iphone_checkboxes/)){
                                
                                    name = $("#of-radio-img-"+i + j);
                                
                                }
                                
								//iphone_checkboxes

                                if($.type(name) == "object" && name.length ){
                                 
                                    if(name.val()==val){

                                      //console.log( val);  

                                            name.attr('checked', true);

                                                                      //of-radio-img-selected

                                                                      //of-radio-img-label

                                            if(patt.match(/of-radio-tile/)){

                                                    name.parents(".controls").find('.of-radio-tile-img').removeClass('of-radio-tile-selected');

                                                    name.next().addClass('of-radio-tile-selected');

                                            }
                                            else if(patt.match(/of-radio-img/)){

                                                    name.parents(".controls").find(".of-radio-img-img").removeClass("of-radio-img-selected");

                                                    name.parent().find("img.of-radio-img-img").addClass("of-radio-img-selected");

                                            }

                                    }

                                }
                           });
                               
                            }
                    } 
                });

                var success_popup = $("#of-popup-color-apply");
                success_popup.fadeIn();
                window.setTimeout(function() {
                  //  success_popup.fadeOut();
                }, 1000);
            }

        });

        }
     
        return false;
    });
				
$("#delete_skin").click(function(e){
			
			var selected_skin = $("#oxy_skin").val();
			var ajaxurl = 'index.php?route=catalog/product/deleteSkin&token=<?php echo $token; ?>';
				 
        e.preventDefault();
         var answer = confirm("Are you want to delete this schema?")

        if (answer) {
  
        var clickedObject = $(this);

        var nonce = $("#security").val();
        var elementData;
        var data = {
            action: "of_ajax_post_action",
            type: "of_color_schema_delete",
            schema_id: selected_skin,
            security: nonce
        };

        $.post(ajaxurl, data, function(response) {

            //check nonce
            if (response == -1) { //failed

                var fail_popup = $("#of-popup-fail");
                fail_popup.fadeIn();
                window.setTimeout(function() {
                    fail_popup.fadeOut();
                }, 2000);
            }

            else {

                  var success_popup = $("#of-popup-color-delete");
                success_popup.fadeIn();
                window.setTimeout(function() {
                  location.reload();
                }, 500); 
            }
         });
        }
       return false;
			
			});	
		});

		//]]>
	</script>