<?php
class ModelModuleSpecialPromotions extends Model {
    public function getBanners($banner_ids = array()) {
        if (!$banner_ids) {
            return array();
        }
        $banners = $this->cache->get('sp_banners.' . implode('_', $banner_ids));
        if (!$banners) {
            $implode = array();
            foreach ($banner_ids as $banner_id) {
                $implode[] = "banner_id = '" . (int)$banner_id . "'";
            }
            $query = $this->db->query("SELECT *, DATE(date_start) date_start, DATE(date_end) date_end FROM " . DB_PREFIX . "sp_banner WHERE (" . implode(" OR ", $implode) . ") AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) AND status = '1' GROUP BY banner_id ORDER BY sort_order ASC");
            $banners = array();
            foreach ($query->rows as $row) {
                $row['rule_products'] = (empty($row['rule_products']) ? array() : unserialize($row['rule_products']));
                $row['rule_categories'] = (empty($row['rule_categories']) ? array() : unserialize($row['rule_categories']));
                $row['rule_manufacturers'] = (empty($row['rule_manufacturers']) ? array() : unserialize($row['rule_manufacturers']));
                $row['rule'] = (empty($row['rule']) ? array() : unserialize($row['rule']));
                $row['store'] = (empty($row['store']) ? array() : unserialize($row['store']));
                $row['customer_group'] = (empty($row['customer_group']) ? array() : unserialize($row['customer_group']));
                $row['banners'] = (empty($row['banners']) ? array() : unserialize($row['banners']));

                $products = (empty($row['cart_products']) ? array() : unserialize($row['cart_products']));
                $categories = (empty($row['cart_categories']) ? array() : unserialize($row['cart_categories']));

                foreach ($categories as $category_id) {
                    $category_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE category_id = '" . (int)$category_id . "'");
                    foreach ($category_query->rows as $category_row) {
                        $products[] = $category_row['product_id'];
                    }
                }

                $row['cart_products'] = array_unique($products, SORT_NUMERIC);

                $banners[] = $row;
            }
            $this->cache->set('sp_banners.' . implode('_', $banner_ids), $banners);
        }
        return $banners;
    }

}