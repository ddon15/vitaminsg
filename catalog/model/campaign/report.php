<?php
class ModelCampaignReport extends Model {
	public function getAllReferreds() {
		$query = "SELECT r.referrer, r.name1 AS name, r.email1 AS ref_email, a.* FROM refers r 
			LEFT JOIN referral_shipping_addresses a ON r.email1 = a.email
			union all
			SELECT r.referrer, r.name2, r.email2 AS ref_email, a.* FROM refers r 
			LEFT JOIN referral_shipping_addresses a ON r.email2 = a.email
			union all
			SELECT r.referrer, r.name3, r.email3 AS ref_email, a.* FROM refers r 
			LEFT JOIN referral_shipping_addresses a ON r.email3 = a.email";
		
		$res = $this->db->query($query);

		return $res->rows;
	}

	public function getAllReferrers() {
		$res = $this->db->query("SELECT * FROM refers GROUP BY referrer");
		return $res->rows;
	}

	public function getReferredByReferrer($email) {
		if ($email && $email != 'recipient@vit.sg') {
			$query = "SELECT r.referrer, r.name1 AS name, r.email1 AS ref_email, a.* FROM refers r 
				LEFT JOIN referral_shipping_addresses a ON r.email1 = a.email 
				WHERE r.referrer = '$email'
				UNION ALL
				SELECT r.referrer, r.name2, r.email2 AS ref_email, a.* FROM refers r 
				LEFT JOIN referral_shipping_addresses a ON r.email2 = a.email
				WHERE r.referrer = '$email'
				UNION ALL
				SELECT r.referrer, r.name3, r.email3 AS ref_email, a.* FROM refers r 
				LEFT JOIN referral_shipping_addresses a ON r.email3 = a.email
				WHERE r.referrer = '$email'";
			
			$res = $this->db->query($query);
			return $res->rows;
		}

		return false;
	}
}
?>