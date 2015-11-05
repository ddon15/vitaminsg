<?php
/**
 * [MY]
 */
class ModelPromotionSpecialPromotions extends Model {
    private $products;

    public function getPromotions() {
        $promotions = $this->cache->get('sp_promotions');
        if (!$promotions) {
            $query = $this->db->query("SELECT *, DATE(date_start) date_start, DATE(date_end) date_end FROM " . DB_PREFIX . "sp_promotion WHERE ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) AND status = '1' GROUP BY promotion_id ORDER BY sort_order ASC");

            $promotions = array();

            foreach ($query->rows as $row) {
                $row['rule'] = (empty($row['rule']) ? array() : unserialize($row['rule']));
                $row['store'] = (empty($row['store']) ? array() : unserialize($row['store']));
                $row['customer_group'] = (empty($row['customer_group']) ? array() : unserialize($row['customer_group']));
                $row['label'] = (empty($row['label']) ? array() : unserialize($row['label']));

                $products = (empty($row['rule_products']) ? array() : unserialize($row['rule_products']));
                $categories = (empty($row['rule_categories']) ? array() : unserialize($row['rule_categories']));

                foreach ($categories as $category_id) {
                    $category_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE category_id = '" . (int)$category_id . "'");
                    foreach ($category_query->rows as $category_row) {
                        $products[] = $category_row['product_id'];
                    }
                }

                $products = array_unique($products, SORT_NUMERIC);

                $promo_products = (empty($row['promo_product']) ? array() : unserialize($row['promo_product']));
                $promo_categories = (empty($row['promo_category']) ? array() : unserialize($row['promo_category']));

                foreach ($promo_categories as $category_id) {
                    $category_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE category_id = '" . (int)$category_id . "'");
                    foreach ($category_query->rows as $category_row) {
                        $promo_products[] = $category_row['product_id'];
                    }
                }

                $promo_products = array_unique($promo_products, SORT_NUMERIC);

                $promotions[] = array_merge($row, array(
                    'products' => $products,
                    'promo_products' => $promo_products
                ));
            }

            $this->cache->set('sp_promotions', $promotions);
        }

        return $promotions;
    }
    
    /**
     * Use mainly for product display promotional content
     * @param int $product_id
     * @return array
     */
    public function getPromotionByProduct($product_id, $status = 1){
        
         $query = $this->db->query("SELECT * FROM  ".DB_PREFIX ."sp_promotion sp, "
                 . DB_PREFIX . "sp_promotion_products spp WHERE spp.product_id = ". (int)$product_id . " "
                 . "AND sp.promotion_id = spp.promotion_id AND sp.status = $status"
                 . " AND ((sp.date_start = '0000-00-00' OR sp.date_start < NOW()) AND (sp.date_end = '0000-00-00' OR sp.date_end > NOW()))");
         
         return $query->rows;
    }
    
    
    /**
     * Retrieve products that are on the promotion radar
     * @param int $limit
     * @return type
     */
    public function getPromotionProducts($limit=20, $status = 1){
        
        $query = $this->db->query("SELECT spp.promotion_id,DISTINCT(spp.product_id) "
                ." FROM ".DB_PREFIX."sp_promotion sp,".DB_PREFIX."sp_promotion_products spp WHERE "
                ." sp.status = $status AND "
                ." ((sp.date_start = '0000-00-00' OR sp.date_start < NOW()) " 
                ." AND (sp.date_end = '0000-00-00' OR sp.date_end > NOW())) "
                . "LIMIT ". (int)$limit);
        
        return $query->rows;
    }
    
    /** 
     * just check whether is there a product on promo. dont care multiple promos
     */
    public function checkProductOnPromotion($product_id){
        $query = $this->db->query("SELECT * FROM ". DB_PREFIX."sp_promotion_products "
                . " WHERE product_id = $product_id");
        
        return $query->row;
    }
    
    
}
?>
