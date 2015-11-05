<?php

class ModelCatalogClearanceProducts extends Model {

    public function getClearanceProducts($data = array(), $status = 1) {
	/*
        $sql = "SELECT *, DATE(date_start) date_start, "
                . "DATE(date_end) date_end, "
                . "DATE(date_expiry) date_expiry "
                . "FROM " . DB_PREFIX . "clearance_products cp, " 
                . DB_PREFIX 
                . "product_description p "
                . "WHERE "
                . "cp.status = $status "
                . " AND cp.product_id = p.product_id "
                . " AND ((cp.date_start = '0000-00-00' OR cp.date_start < NOW())"
                . " AND (cp.date_end = '0000-00-00' OR cp.date_end > NOW()))"
                . " AND (cp.date_expiry < NOW())";
*/

		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}	
		
		$prod_sql = "SELECT *, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special FROM " . DB_PREFIX . "product p";
		
		$clearance_sql = "SELECT * FROM " . DB_PREFIX . "clearance_products cp WHERE cp.status = $status AND ((cp.date_start = '0000-00-00' OR cp.date_start < NOW()) AND (cp.date_end = '0000-00-00' OR cp.date_end > NOW())) AND (cp.date_expiry > NOW())";
		
		$prod_desc_sql = "SELECT product_id, description FROM " . DB_PREFIX . "product_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'";
		
		$sql = "SELECT * FROM ((" . $clearance_sql . ") a LEFT JOIN (" . $prod_sql . ") b ON a.product_id = b.product_id LEFT JOIN (" . $prod_desc_sql . ") c ON a.product_id = c.product_id)";
				
		//$sql = "SELECT * FROM " . DB_PREFIX . "clearance_products cp WHERE cp.status = $status AND ((cp.date_start = '0000-00-00' OR cp.date_start < NOW()) AND (cp.date_end = '0000-00-00' OR cp.date_end > NOW())) AND (cp.date_expiry > NOW()) ORDER BY cp.sort_order, cp.date_expiry";
		
		$sort_data = array(
			'name',
			'price',
			'rating',
			'sort_order'
		);
		
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			if ($data['sort'] == 'name') {
				$sql .= " ORDER BY LCASE(a.name)";
			} elseif ($data['sort'] == 'price') {
				$sql .= " ORDER BY (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE price END)";
			} elseif ($data['sort'] == 'rating') {
				$sql .= " ORDER BY b.rating";
			}
			else {
				$sql .= " ORDER BY a." . $data['sort'];
			}
		} else {
			$sql .= " ORDER BY a.sort_order";	
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC, LCASE(name) DESC";
		} else {
			$sql .= " ASC, LCASE(name) ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}				

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getTotal($status = 1) {
        $sql = "SELECT COUNT(DISTINCT clearance_id) AS total FROM " 
                . DB_PREFIX . "clearance_products cp WHERE cp.status = $status AND ((cp.date_start = '0000-00-00' OR cp.date_start < NOW()) AND (cp.date_end = '0000-00-00' OR cp.date_end > NOW())) AND (cp.date_expiry > NOW())";
        
        $query = $this->db->query($sql);

        return $query->row['total'];
    }
/*
    public function getClearance($clearance_id,$status = 1) {
        $query = $this->db->query("SELECT *, DATE(date_start) date_start, "
                . "DATE(date_end) date_end , "
                . "DATE(date_expiry) date_expiry "
                . "FROM " . DB_PREFIX . "clearance_products WHERE "
                . "clearance_id = '" . (int) $clearance_id . "'"
                . " AND cp.status = $status "
                . " AND ((cp.date_start = '0000-00-00' OR cp.date_start < NOW())"
                . " AND (cp.date_end = '0000-00-00' OR cp.date_end > NOW()))"
                . " AND (cp.date_expiry > NOW())"
                );

        if ($query->row) {
            $data = $query->row;
            $product_id = $query->row['product_id'] ? (int) $query->row['product_id'] : '';

            $this->load->model('catalog/product');
            
            $product_info = $this->model_catalog_product->getProduct($product_id);
            $data['product_name'] = $product_info['name'];
            
        }
        
        return $data;
    }
*/
   
    public function checkProductOnClearance($product_id){
        $query = $this->db->query("SELECT * FROM ". DB_PREFIX."clearance_products "
                . " WHERE product_id = $product_id");
        
        return $query->row;
    }
}
