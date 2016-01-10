<?php 

class ModelSettingCustom extends Model {
	private static $GROUP_CODE_SETTINGS = array(
		'SALE_LABEL' => 'SALE_LABEL',
		'BRANDS_BANNER' => 'BRANDS_BANNER'
	);

	function saveSaleLabel($data) 
	{
		$groupCode = $data['group_code'];
		$status = $data['status'];
		$values = json_encode($data['data_config']);

		if (!$this->hasGroupCode($groupCode)) {
			return;
		}

		$customSettings = $this->db->query("SELECT * FROM " . DB_PREFIX . "custom_settings WHERE group_code = '" . $groupCode . "'");

		if (!$customSettings->row) {
			$res = $this->db->query("INSERT INTO " . DB_PREFIX . "custom_settings (group_code, data_config, status) VALUES('" . $this->db->escape($groupCode) . "', '" . $this->db->escape($values) ."', '" . $this->db->escape($status) . "')");
		} else {
			$res = $this->db->query("UPDATE " . DB_PREFIX . "custom_settings SET data_config = '" . $this->db->escape($values) . "', status = '" . $this->db->escape($status) . "' WHERE group_code = '" . $this->db->escape($groupCode) . "'");
		}

		return $res;
	}

	function saveBrandsBanner($data)
	{

		$brandsBanner = $this->db->query("SELECT * FROM " . DB_PREFIX . "brands_banner WHERE banner_id = '" . (int)$data['banner_id'] . "'");

		if (!$brandsBanner->row) {
			$res =  $this->db->query("INSERT INTO " . DB_PREFIX . "brands_banner (header_label, brands, brands_top, banner_id, is_enabled) VALUES('" . $this->db->escape($data['header_label']) . "','" . $this->db->escape(implode(' ,', $data['brands'])) . "', '" . $this->db->escape(implode(' ,', $data['brands'])) ."', '" . $this->db->escape($data['banner_id']) . "', '" . $this->db->escape($data['is_enabled']) . "')");				
		}
		else {
			$res = $this->db->query("UPDATE " . DB_PREFIX . "brands_banner SET brands = '" . $this->db->escape(implode(' ,', $data['brands'])) . "',header_label = '" . $this->db->escape($data['header_label']) . "', brands_top = '" . $this->db->escape(implode(' ,', $data['brands_top'])) . "', banner_id = '" . $this->db->escape($data[
				'banner_id']) . "', is_enabled = '" . $this->db->escape($data[
				'is_enabled']) . "' WHERE banner_id = '" . $this->db->escape($data['banner_id']) . "'");
		}

		$this->updateBrandsBannerSortOrder($data['brands'], $data['brands_top']);


		return $res;
	}

	function getBrandsBanner() {
		return $this->db->query("SELECT * FROM " . DB_PREFIX . "brands_banner");
	}

	function getBrands($banner_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "brands_banner WHERE banner_id = '" . (int)$banner_id . "'"); 
		$brandsBanner = $query->row;
		$brands = array();
		$brandsTop = array();


		if ($brandsBanner && $brandsBanner['is_enabled'] == 1) {
			
			$brandIds = rtrim($brandsBanner['brands'], ",");
			$brandTopIds = rtrim($brandsBanner['brands_top'], ",");
			
			$brandsQry = $this->db->query("SELECT * FROM " . DB_PREFIX . "manufacturer WHERE manufacturer_id IN ($brandIds) ORDER BY sort_order_brands_banner;"); 
			$brandsTopQry = $this->db->query("SELECT * FROM " . DB_PREFIX . "manufacturer WHERE manufacturer_id IN ($brandTopIds) ORDER BY sort_order_brands_banner;"); 
			
			$brands = $brandsQry->rows;
			$brandsTop = $brandsTopQry->rows;
		}
		
		return array('brands' => $brands, 'brands_top' => $brandsTop, 'header_label' => $brandsBanner['header_label']);	
	}

	function getDataConfigByGroupCode($groupCode) 
	{
		if (!$this->hasGroupCode($groupCode)) {
			return;
		}

		$customSettings = $this->db->query("SELECT * FROM " . DB_PREFIX . "custom_settings WHERE group_code = '" . $groupCode . "'");
		
		return $customSettings->row;
	}

	function getDataConfig() {
		$customConfig = $this->db->query("SELECT * FROM " . DB_PREFIX . "custom_settings");
		$customConfigArr = [];

		foreach($customConfig as $c) {
			if(!isset($customConfigArr[$c['group_code']]))
				$customConfigArr[$c['group_code']] = $c;
		}

		return $customConfigArr;
	}

	function getDataConfigStyle($groupCode) 
	{
		$style = '';

		if (!$this->hasGroupCode($groupCode)) {
			return;
		}

		$customSettings = $this->db->query("SELECT * FROM " . DB_PREFIX . "custom_settings WHERE group_code = '" . $groupCode . "'");
		
		if($customSettings) {
			$dataConfig = json_decode($customSettings->row['data_config'], true);
			$style = $this->buildSaleLabelStyle($dataConfig);
		}
		
		return $style;	
	}

	function getGroupCode() {
		return self::$GROUP_CODE_SETTINGS;
	}

	private function hasGroupCode($groupCode) {
		return isset(self::$GROUP_CODE_SETTINGS[$groupCode]);
	}

	private function buildSaleLabelStyle($dataConfig) {
		return 'background:' . $dataConfig->bgcolor . ';color:' . $dataConfig->texcolor . ';border:' . $dataConfig->border->width . ' ' . $dataConfig->border->style . ' ' . $dataConfig->border->color;
	}
	// TODO: Improve query
	private function updateBrandsBannerSortOrder($brands, $brandsTop) {
		foreach ($brands as $key => $value) {
			 $this->db->query("UPDATE " . DB_PREFIX . "manufacturer SET sort_order_brands_banner = '" . $this->db->escape($key) . "' WHERE manufacturer_id = '" . $this->db->escape($value) . "'");
		}

		foreach ($brandsTop as $key => $value) {
			 $this->db->query("UPDATE " . DB_PREFIX . "manufacturer SET sort_order_brands_banner = '" . $this->db->escape($key) . "' WHERE manufacturer_id = '" . $this->db->escape($value) . "'");
		}
	}	

}