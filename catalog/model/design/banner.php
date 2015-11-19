<?php
class ModelDesignBanner extends Model {	
	public function getBanner($banner_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "banner_image bi LEFT JOIN " . DB_PREFIX . "banner_image_description bid ON (bi.banner_image_id  = bid.banner_image_id) WHERE bi.banner_id = '" . (int)$banner_id . "' AND bid.language_id = '" . (int)$this->config->get('config_language_id') . "' AND (bi.date_start IS NULL OR bi.date_end IS NULL OR bi.date_start LIKE '%00%' OR bi.date_end LIKE '%00%' OR (CURDATE() >= bi.date_start AND CURDATE() < bi.date_end)) ORDER BY date_start ASC"); //[SB] Added order by title, Added start/end date
		
		return $query->rows;
	}
}
?>