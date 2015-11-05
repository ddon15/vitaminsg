<?php
/**
 * [MY] Malcolm
 */
class ModelPromotionDb extends Model {

    /**
     * 
     * @param int $promotion_id
     * @return type
     */
    public function getPromotion($promotion_id) {
        $query = $this->db->query("SELECT *" .
                " FROM " . DB_PREFIX . "promotion WHERE promotion_id = " . (int) $promotion_id);

        $row = $query->row;
        return $row;
    }
    
    public function getAllPromotion() {
        $query = $this->db->query("SELECT *" .
                " FROM " . DB_PREFIX . "promotion WHERE status = ". (int)1);

        return $query->rows;
    }
    
    

    /**
     * @todo sorting by order malcolm [MY]
     * @param int $product_id
     * @return type
     */
    public function getPromotionByProduct($product_id) {

        $query = $this->db->query("SELECT *" .
                " FROM " . DB_PREFIX . "promotion p, " . DB_PREFIX . "promotion_product pr "
                . "WHERE pr.product_id = " . (int) $product_id 
                . " AND p.promotion_id = pr.promotion_id" 
                . " AND (p.date_start = '0000-00-00' OR p.date_start < NOW()) "
                . " AND (p.date_end = '0000-00-00' OR p.date_end > NOW()) "
                . " AND p.status = '1'");
        
        return $query->rows;
    }
}
?>