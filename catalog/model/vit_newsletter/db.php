<?php
class ModelVitNewsletterDb extends Model {
	public function addSubscription($data)
	{
		$this->db->query("INSERT INTO " . DB_PREFIX . "vit_newsletter SET name = '" . $this->db->escape($data['subscribe-name']) . "', email = '" . $this->db->escape($data['subscribe-email']) . "', date_subscribe = NOW()");
		
		return $this->db->countAffected() == 1;
	}
}
?>