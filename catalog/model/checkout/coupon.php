<?php
class ModelCheckoutCoupon extends Model {

	public function getCoupon($code) {
		$status = true;

		$coupon_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "coupon` WHERE code = '" . $this->db->escape($code) . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) AND status = '1'");

		if ($coupon_query->num_rows) {
			
			//[SB] Added check for Customer specific coupon
			/*
			if(!$this->checkCouponCustomer($coupon_query->row['coupon_id'])) {
				$status = false;
			}*/
			if ($coupon_query->row['total'] >= $this->cart->getSubTotal()) {
				$status = false;
			}

			$coupon_history_query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "coupon_history` ch WHERE ch.coupon_id = '" . (int)$coupon_query->row['coupon_id'] . "'");

			if ($coupon_query->row['uses_total'] > 0 && ($coupon_history_query->row['total'] >= $coupon_query->row['uses_total'])) {
				$status = false;
			}

			if ($coupon_query->row['logged'] && !$this->customer->getId()) {
				$status = false;
			}

			if ($this->customer->getId()) {
				$coupon_history_query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "coupon_history` ch WHERE ch.coupon_id = '" . (int)$coupon_query->row['coupon_id'] . "' AND ch.customer_id = '" . (int)$this->customer->getId() . "'");

				if ($coupon_query->row['uses_customer'] > 0 && ($coupon_history_query->row['total'] >= $coupon_query->row['uses_customer'])) {
					$status = false;
				}
			}

			// Products
			$coupon_product_data = array();

			$coupon_product_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "coupon_product` WHERE coupon_id = '" . (int)$coupon_query->row['coupon_id'] . "'");

			foreach ($coupon_product_query->rows as $product) {
				$coupon_product_data[] = $product['product_id'];
			}


			// Categories
			$coupon_category_data = array();

			$coupon_category_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "coupon_category` cc LEFT JOIN `" . DB_PREFIX . "category_path` cp ON (cc.category_id = cp.path_id) WHERE cc.coupon_id = '" . (int)$coupon_query->row['coupon_id'] . "'");

			foreach ($coupon_category_query->rows as $category) {
				$coupon_category_data[] = $category['category_id'];
			}

			//[SB] Exclude Products
			$coupon_exclude_product_data = array();

			$coupon_exclude_product_query = $this->db->query("SELECT product_id FROM `" . DB_PREFIX . "coupon_exclude_product` WHERE coupon_id = '" . (int)$coupon_query->row['coupon_id'] . "'");

			foreach ($coupon_exclude_product_query->rows as $product) {
				$coupon_exclude_product_data[] = $product['product_id'];
			}
			
			//[SB] Exclude Manufacturers
			$coupon_exclude_manufacturer_data = array();

			$coupon_exclude_manufacturer_query = $this->db->query("SELECT manufacturer_id FROM `" . DB_PREFIX . "coupon_exclude_manufacturer` WHERE coupon_id = '" . (int)$coupon_query->row['coupon_id'] . "'");

			foreach ($coupon_exclude_manufacturer_query->rows as $manufacturer) {
				$coupon_exclude_manufacturer_data[] = $manufacturer['manufacturer_id'];
			}
			
			//[SB] Manufacturers
			$coupon_manufacturer_data = array();

			$coupon_manufacturer_query = $this->db->query("SELECT manufacturer_id FROM `" . DB_PREFIX . "coupon_manufacturer` WHERE coupon_id = '" . (int)$coupon_query->row['coupon_id'] . "'");

			foreach ($coupon_manufacturer_query->rows as $manufacturer) {
				$coupon_manufacturer_data[] = $manufacturer['manufacturer_id'];
			}
			
			$product_data = array();
			$product_exclude_data = array(); //[SB] Added Exclude

			if ($coupon_product_data || $coupon_category_data || $coupon_manufacturer_data
				|| $coupon_exclude_product_data || $coupon_exclude_manufacturer_data) { //[MY] Added manufacturer ID [SB] Added Excludes

				foreach ($this->cart->getProducts() as $product) {
				
					//[SB] Added product exclude. Will override product include below.
					if (in_array($product['product_id'], $coupon_exclude_product_data)) {
						
						$product_exclude_data[] = $product['product_id'];
						continue;
					}
					else if(!$coupon_product_data && !$coupon_category_data &&
						!$coupon_manufacturer_data && !$coupon_exclude_manufacturer_data) {
						// Include product in coupon if only exclusion set. Let the below decide whether to include coupon otherwise.
						$product_data[] = $product['product_id'];
					}

					if (in_array($product['product_id'], $coupon_product_data)) {
						$product_data[] = $product['product_id'];

						continue;
					}

					foreach ($coupon_category_data as $category_id) {
						$coupon_category_query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "product_to_category` WHERE `product_id` = '" . (int)$product['product_id'] . "' AND category_id = '" . (int)$category_id . "'");

						if ($coupon_category_query->row['total']) {
							$product_data[] = $product['product_id'];

							continue;
						}						
					}

					//[MY] Manufacturers
					//troublesome but works. try not to touch actual product. 
					$product_query = $this->db->query("SELECT manufacturer_id FROM `" . DB_PREFIX . "product` WHERE `product_id` = '". $product['product_id']."'");
					$product_details = $product_query->row;

					//[SB] Added manufacturer exclude. Will override manufacturer include below.
					if (in_array($product_details['manufacturer_id'], $coupon_exclude_manufacturer_data)) {
						
						$product_exclude_data[] = $product['product_id'];
						continue;
					}
					else if(!$coupon_manufacturer_data && $coupon_exclude_manufacturer_data &&
						!in_array($product['product_id'], $product_data)) {
						// Include product in coupon if manufacturer inclusion not set
						// and manufacturer exclusion set
						// and product not already included.
						// Let the below decide otherwise.
						$product_data[] = $product['product_id'];
					}

					//[SB] Added manufacturer
					if (in_array($product_details['manufacturer_id'], $coupon_manufacturer_data)) {
						$product_data[] = $product['product_id'];

						continue;
					}
				}	

				if (!$product_data && !$product_exclude_data) {
					$status = false;
				}
			}
		} else {
			$status = false;
		}

		if ($status) {
			return array(
				'coupon_id'     => $coupon_query->row['coupon_id'],
				'code'          => $coupon_query->row['code'],
				'name'          => $coupon_query->row['name'],
				'type'          => $coupon_query->row['type'],
				'discount'      => $coupon_query->row['discount'],
				'shipping'      => $coupon_query->row['shipping'],
				'total'         => $coupon_query->row['total'],
				'product'       => $product_data,
				'product_exclude' => $product_exclude_data, //[SB] Added Product Exclude,
				'product_manufacturer' => $coupon_manufacturer_data,
				'products'		=> $coupon_product_data,
				'date_start'    => $coupon_query->row['date_start'],
				'date_end'      => $coupon_query->row['date_end'],
				'uses_total'    => $coupon_query->row['uses_total'],
				'uses_customer' => $coupon_query->row['uses_customer'],
				'status'        => $coupon_query->row['status'],
				'date_added'    => $coupon_query->row['date_added']
			);
		}
	}

	public function redeem($coupon_id, $order_id, $customer_id, $amount) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "coupon_history` SET coupon_id = '" . (int)$coupon_id . "', order_id = '" . (int)$order_id . "', customer_id = '" . (int)$customer_id . "', amount = '" . (float)$amount . "', date_added = NOW()");
	}
	
	//[SB] Added check for Customer specific coupon
	/*
	private function checkCouponCustomer($coupon_id) {
		$coupon_query = $this->db->query("SELECT customer_id FROM `" . DB_PREFIX . "coupon_customer` WHERE coupon_id = '" . (int)$coupon_id . "'");

		// Everyone can use if customer not specified
		if ($coupon_query->num_rows == 0) {
			return true;
		}
		
		// If customer specified but no log in, not valid
		if (!$this->customer->isLogged()) { 
			return false;
		}
		
		$current_id = $this->customer->getId();

		foreach ($coupon_query->rows as $customer) {
			if($current_id == $customer['customer_id']) {
				return true;
			}
		}
		
		return false;
	}*/

	public function getCouponManufacturers($couponId) {
		$coupon_manufacturer_data = array();

		$coupon_manufacturer_query = $this->db->query("SELECT manufacturer_id FROM `" . DB_PREFIX . "coupon_manufacturer` WHERE coupon_id = '" . (int)$couponId . "'");

		foreach ($coupon_manufacturer_query->rows as $manufacturer) {
			$coupon_manufacturer_data[] = $manufacturer['manufacturer_id'];
		}

		return $coupon_manufacturer_data;
		
	}

	public function getCouponProducts($couponId) {
		// Products
		$coupon_product_data = array();

		$coupon_product_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "coupon_product` WHERE coupon_id = '" . (int)$couponId . "'");

		foreach ($coupon_product_query->rows as $product) {
			$coupon_product_data[] = $product['product_id'];
		}

		return $coupon_product_data;
	}
}
?>
