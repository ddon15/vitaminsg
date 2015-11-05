<?php
/**
 * @author Malcolm [MY]
 */
class ModelPromotionProduct extends Model {

    public function getPromotionProduct($promotion_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "promotion_product WHERE promotion_id = '" . (int) $promotion_id . "'");
    
        return $query->rows;
    }
    
    public function getPromotionDiscountProduct($promotion_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "promotion_discount_product WHERE promotion_id = '" . (int) $promotion_id . "'");
    
        return $query->rows;
    } 
}
?>