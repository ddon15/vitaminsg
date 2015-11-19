<?php

class ModelSaleClearanceProducts extends Model {

    public function getClearanceProducts($data) {
        $sql = "SELECT *, DATE(date_start) date_start, DATE(date_end) date_end, DATE(date_expiry) date_expiry FROM " . DB_PREFIX . "clearance_products cp, " . DB_PREFIX . "product_description p WHERE 1 = 1";

        if (!empty($data['filter_name'])) {
            $sql .= " AND p.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
        }

        if (!empty($data['filter_date_start'])) {
            $sql .= " AND cp.DATE(date_start) = DATE('" . $this->db->escape($data['filter_date_start']) . "')";
        }

        if (!empty($data['filter_date_end'])) {
            $sql .= " AND cp.DATE(date_end) = DATE('" . $this->db->escape($data['filter_date_end']) . "')";
        }

        if (!empty($data['filter_date_expiry'])) {
            $sql .= " AND cp.DATE(date_expiry) = DATE('" . $this->db->escape($data['filter_date_expiry']) . "')";
        }

        if (isset($data['filter_status'])) {
            $sql .= " AND cp.status = '" . (int) $data['filter_status'] . "'";
        }

        if (isset($data['filter_sort_order'])) {
            $sql .= " AND cp.sort_order = '" . (int) $data['filter_sort_order'] . "'";
        }

        $sql .= " AND cp.product_id = p.product_id";

        $sort_data = array(
            'p.name',
            'cp.date_start',
            'cp.date_end',
            'cp.date_expiry',
            'cp.status',
            'cp.sort_order'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY p.name";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getTotal($data) {
        $sql = "SELECT COUNT(DISTINCT clearance_id) AS total FROM " . DB_PREFIX . "clearance_products WHERE 1 = 1";

        if (!empty($data['filter_name'])) {
            $sql .= " AND name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
        }

        if (!empty($data['filter_date_start'])) {
            $sql .= " AND DATE(date_start) = DATE('" . $this->db->escape($data['filter_date_start']) . "')";
        }

        if (!empty($data['filter_date_end'])) {
            $sql .= " AND DATE(date_end) = DATE('" . $this->db->escape($data['filter_date_end']) . "')";
        }

        if (!empty($data['filter_date_expiry'])) {
            $sql .= " AND DATE(date_expiry) = DATE('" . $this->db->escape($data['filter_date_expiry']) . "')";
        }

        if (isset($data['filter_status'])) {
            $sql .= " AND status = '" . (int) $data['filter_status'] . "'";
        }

        if (isset($data['filter_sort_order'])) {
            $sql .= " AND sort_order = '" . (int) $data['filter_sort_order'] . "'";
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function addClearance($data) {
        $this->db->query("
            INSERT INTO
                " . DB_PREFIX . "clearance_products
            SET
                `name` = '" . $this->db->escape($data['name']) . "',
                `description` = '" . $this->db->escape($data['description']) . "',                    
                `product_id` = '" . (int) $data['product_id'] . "',
                `status` = '" . (int) $data['status'] . "',    
                `date_start` = '" . $this->db->escape($data['date_start']) . "',
                `date_end` = '" . $this->db->escape($data['date_end']) . "',
                `date_expiry` = '" . $this->db->escape($data['date_expiry']) . "',
                `sort_order` = '" . (int) $data['sort_order'] . "'
               "
        );

        $clearance_id = $this->db->getLastId();

        $this->cache->delete('clearance_products.' . (int) $clearance_id);
        $this->cache->delete('clearance_products');
    }

    public function editClearance($clearance_id, $data) {
        $this->db->query("
            UPDATE
                " . DB_PREFIX . "clearance_products
            SET
                `name` = '" . $this->db->escape($data['name']) . "',
                `description` = '" . $this->db->escape($data['description']) . "',                    
                `product_id` = '" . (int) $data['product_id'] . "',
                `status` = '" . (int) $data['status'] . "',    
                `date_start` = '" . $this->db->escape($data['date_start']) . "',
                `date_end` = '" . $this->db->escape($data['date_end']) . "',
                `date_expiry` = '" . $this->db->escape($data['date_expiry']) . "',
                `sort_order` = '" . (int) $data['sort_order'] . "'
             WHERE clearance_id = '" . (int) $clearance_id . "'"
        );

        $this->cache->delete('clearance_products.' . (int) $clearance_id);
        $this->cache->delete('clearance_products');
    }

    public function deleteClearance($clearance_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "clearance_products WHERE clearance_id = '" . (int) $clearance_id . "'");

        $this->cache->delete('clearance_products.' . (int) $clearance_id);
        $this->cache->delete('clearance_products');
    }

    public function statusClearance($clearance_id) {
        $this->db->query("
            UPDATE
                " . DB_PREFIX . "clearance_products
            SET
                `status` = 1 - `status`
             WHERE clearance_id = '" . (int) $clearance_id . "'"
        );

        $this->cache->delete('clearance_products.' . (int) $clearance_id);
    }

    public function copyClearance($clearance_id) {
        $this->db->query("
            INSERT INTO
                " . DB_PREFIX . "clearance_products (
                    `name`,
                    `description`,
                    `date_start`,
                    `date_end`,
                    `date_expiry`,
                    `sort_order`,
                    `product_id`
                ) SELECT
                    `name`,
                    `description`,
                    `date_start`,
                    `date_end`,
                    `date_expiry`,
                    `sort_order`,
                    `product_id`
                FROM " . DB_PREFIX . "clearance_products WHERE `clearance_id` = '" . (int) $clearance_id . "'");
    }

    public function getClearance($clearance_id) {
        $query = $this->db->query("SELECT *, DATE(date_start) date_start, DATE(date_end) date_end , DATE(date_expiry) date_expiry "
                . "FROM " . DB_PREFIX . "clearance_products WHERE clearance_id = '" . (int) $clearance_id . "'");

        if ($query->row) {
            $data = $query->row;
            $product_id = $query->row['product_id'] ? (int) $query->row['product_id'] : '';

            $this->load->model('catalog/product');
            
            $product_info = $this->model_catalog_product->getProduct($product_id);
            $data['product_name'] = $product_info['name'];
            
        }
        
        return $data;
    }

    public function getTotalPromotionStats($promotion_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "sp_promotion_stats WHERE promotion_id = '" . (int) $promotion_id . "'");

        return $query->row['total'];
    }

    public function install() {
        $query = <<<QUERY
                CREATE TABLE IF NOT EXISTS `%sclearance_products` (
                `clearance_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                `product_id` int(11) DEFAULT NULL,
                `date_start` datetime DEFAULT NULL,
                `date_end` datetime DEFAULT NULL,
                `date_expiry` datetime DEFAULT NULL,
                `name` text,
                `description` text,
                `status` int(11) DEFAULT NULL,
                `sort_order` int(11) DEFAULT NULL,
                PRIMARY KEY (`clearance_id`)
              ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

                
     
QUERY;

        

        $this->db->query(sprintf($query, DB_PREFIX));
    }

    public function uninstall() {
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "clearance_products`;");
    }

    public function arrayRule($rule) {
        if (!empty($rule['conditions'])) {
            $_rule = array();
            foreach ($rule['conditions'] as $positions => $item) {
                $pos = explode('--', $positions);
                $this->putIntoRule($_rule, $pos, $item);
            }
            $rule['conditions'] = $_rule;
        } else {
            $rule['conditions'] = array();
        }

        if (!empty($rule['actions'])) {
            $_rule = array();
            foreach ($rule['actions'] as $positions => $item) {
                $pos = explode('--', $positions);
                $this->putIntoRule($_rule, $pos, $item);
            }
            $rule['actions'] = $_rule;
        } else {
            $rule['actions'] = array();
        }

        return $rule;
    }

    private function putIntoRule(&$rule, $pos, $item) {
        $index = array_shift($pos) - 1;
        if (!count($pos)) {
            $rule[$index] = $item;
        } else {
            if (!isset($rule[$index]['rules'])) {
                $rule[$index]['rules'] = array();
            }
            $this->putIntoRule($rule[$index]['rules'], $pos, $item);
        }
    }

}
