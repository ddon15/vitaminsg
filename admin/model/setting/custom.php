<?php 

class ModelSettingCustom extends Model {
	private static $GROUP_CODE_SETTINGS = array(
		'SALE_LABEL' => 'SALE_LABEL'
	);

	function save($data) 
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

	function getDataConfig($groupCode) 
	{
		if (!$this->hasGroupCode($groupCode)) {
			return;
		}

		$customSettings = $this->db->query("SELECT * FROM " . DB_PREFIX . "custom_settings WHERE group_code = '" . $groupCode . "'");
		
		return $customSettings->row;
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
			$style = 'background:' . $dataConfig->bgcolor . ';color:' . $dataConfig->texcolor . ';border:' . $dataConfig->border->width . ' ' . $dataConfig->border->style . ' ' . $dataConfig->border->color;
		}
		
		return $style;	
	}

	private function hasGroupCode($groupCode) {
		return isset(self::$GROUP_CODE_SETTINGS[$groupCode]);
	}
}