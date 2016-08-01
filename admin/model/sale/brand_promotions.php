<?php
class ModelSaleBrandPromotions extends Model {
	
	public function get($id = null) {
		if (null == $id) {
			$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "brand_promotions");
		} else {
			$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "brand_promotions WHERE id = '" & (int) $id & "'");
		}
		
		return $query->rows;
	}

	public function saveBrandProductPromotions($data) {
		$bp = [];
		foreach ($data as $each) {
			$bp['customer_group_id'] = $each['customer_group_id'];
			$bp['brand_id'] = $each['brand'];
			$bp['priority'] = $each['priority'];
			$bp['discount_value'] = (int)$each['discount_value'];
			$bp['product_ids'] = null;
			$bp['date_start'] = $each['date_start'];
			$bp['date_end'] = $each['date_end'];
			$bp['status'] = isset($each['status']);
			
			$bp['product_ids'] = $this->saveProductsBrandPromotion($bp);

			if (isset($each['bp_id'])) {
				$this->update($each['bp_id'], $bp);
			} else {
				$this->insert($bp);
			}
		}

		return true;
	}

	private function saveProductsBrandPromotion($bp)
	{
		if (isset($bp['productids']) && $bp['productIds']) {
			$productIds  = rtrim($bp['productIds'], ",");
			$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id IN($productIds) and date_start = '" .  $bp['date_start']  . "'");
		}

		$productIds = [];
		$brandProducts = $this->db->query("SELECT product_id, manufacturer_id, price FROM " . DB_PREFIX . "product WHERE manufacturer_id = '" . (int)$bp['brand_id'].  "';");
		foreach ($brandProducts->rows as $p) {
			array_push($productIds, $p['product_id']);

			$discountedPrice = round($p['price'] * ((100-$bp['discount_value']) / 100), 2);
		
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int)$p['product_id'] . "', customer_group_id = '" . (int)$bp['customer_group_id'] . "', priority = '" . (int)$bp['priority'] . "', price = '" . (float)$discountedPrice . "', date_start = '" . $this->db->escape($bp['date_start']) . "', date_end = '" . $this->db->escape($bp['date_end']) . "'");
		}

		if (count($productIds) > 0) {
			return implode(' ,', $productIds);
		} 

		return $productIds;
	}

	public function delete($bp) {
		//remove product promotions
		if (isset($bp['productids']) && $bp['productIds']) {
			$productIds  = rtrim($bp['productIds'], ",");
			$this->db->query("DELETE FROM " . DB_PREFIX . "brand_promotions WHERE id = '" .  (int)$bp['id']  . "'");
			$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id IN($productIds)");
		}

		return true;
	} 

	public function insert($data) {

		return $this->db->query("INSERT INTO " . DB_PREFIX . "brand_promotions (customer_group_id, brand_id, priority, discount_value, product_ids, date_start, date_end, status) 
				VALUES('" . $this->db->escape($data['customer_group_id']) . "','" . $this->db->escape($data['brand_id']) . "', '" . $this->db->escape($data['priority']) ."', '" . $this->db->escape($data['discount_value']) . "', '" . $this->db->escape($data['product_ids']) . "', '" . $this->db->escape($data['date_start']) . "', '" . $this->db->escape($data['date_end']) . "', '" . (int)$this->db->escape($data['status']) . "')");
	}

	public function update($id, $data) {
		return $this->db->query("UPDATE " . DB_PREFIX . "brand_promotions 
			SET customer_group_id = '" . $this->db->escape($data['customer_group_id']) . "', 
			brand_id = '" . $this->db->escape($data['brand_id']) . "', 
			priority = '" . $this->db->escape($data['priority']) . "', 
			discount_value = '" . $this->db->escape($data['discount_value']) . "', 
			product_ids = '" . $this->db->escape($data['product_ids']) . "',
			date_start = '" . $this->db->escape($data['date_start']) . "',
			date_end = '" . $this->db->escape($data['date_end']) . "',
			status = '" . (int)$data['status'] . "'
			WHERE id = '" . (int)$id . "'");
	}
}
?>