<?php 

class ModelSettingCustom extends Model {
	private static $GROUP_CODE_SETTINGS = array(
		'SALE_LABEL' => 'SALE_LABEL'
	);

	function getCssVariables($groupCode) 
	{
		$styleVar = array();

		if (!$this->hasGroupCode($groupCode)) {
			return;
		}

		$customSettings = $this->db->query("SELECT * FROM " . DB_PREFIX . "custom_settings WHERE group_code = '" . $groupCode . "'");
		
		if($customSettings && 1 === (int)$customSettings->row['status']) {
			$dataConfig = json_decode($customSettings->row['data_config']);
			$styleVar = array(
				'enabled' => (int)$customSettings->row['status'],
				'background' => $dataConfig->bgcolor,
				'color' => $dataConfig->textcolor,
				'border' => $dataConfig->border->width . ' ' . $dataConfig->border->style . ' ' . $dataConfig->border->color
			);
		}
		
		return $styleVar;	
	}

	private function hasGroupCode($groupCode) {
		return isset(self::$GROUP_CODE_SETTINGS[$groupCode]);
	}

	function getSaleText($groupCode) {
		$text = array();

		if (!$this->hasGroupCode($groupCode)) {
			return;
		}

		$customSettings = $this->db->query("SELECT * FROM " . DB_PREFIX . "custom_settings WHERE group_code = '" . $groupCode . "'");

		if($customSettings && 1 === (int)$customSettings->row['status']) {
			$dataConfig = json_decode($customSettings->row['data_config']);
			$text = array(
				'enabled' => (int)$customSettings->row['status'],
				'text' => $dataConfig->caption
			);
		}
	
		return $text;		
	}
}