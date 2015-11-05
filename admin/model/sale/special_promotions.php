<?php



class ModelSaleSpecialPromotions extends Model {



    public function getPromotions($data) {



        $sql = "SELECT *, DATE(date_start) date_start, DATE(date_end) date_end FROM " . DB_PREFIX . "sp_promotion WHERE 1 = 1";



        if (!empty($data['filter_name'])) {

            $sql .= " AND name LIKE '" . $this->db->escape($data['filter_name']) . "%'";

        }



        if (!empty($data['filter_coupon_code'])) {

            $sql .= " AND coupon_code LIKE '" . $this->db->escape($data['filter_coupon_code']) . "%'";

        }



        if (!empty($data['filter_date_start'])) {

            $sql .= " AND DATE(date_start) = DATE('" . $this->db->escape($data['filter_date_start']) . "')";

        }



        if (!empty($data['filter_date_end'])) {

            $sql .= " AND DATE(date_end) = DATE('" . $this->db->escape($data['filter_date_end']) . "')";

        }



        if (isset($data['filter_status'])) {

            $sql .= " AND status = '" . (int) $data['filter_status'] . "'";

        }



        if (isset($data['filter_sort_order'])) {

            $sql .= " AND sort_order = '" . (int) $data['filter_sort_order'] . "'";

        }



        $sql .= " GROUP BY promotion_id";



        $sort_data = array(

            'name',

            'coupon_code',

            'date_start',

            'date_end',

            'status',

            'sort_order'

        );



        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {

            $sql .= " ORDER BY " . $data['sort'];

        } else {

            $sql .= " ORDER BY name";

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



    public function getTotalPromotions($data) {

        $sql = "SELECT COUNT(DISTINCT promotion_id) AS total FROM " . DB_PREFIX . "sp_promotion WHERE 1 = 1";



        if (!empty($data['filter_name'])) {

            $sql .= " AND name LIKE '" . $this->db->escape($data['filter_name']) . "%'";

        }



        if (!empty($data['filter_coupon_code'])) {

            $sql .= " AND coupon_code LIKE '" . $this->db->escape($data['filter_coupon_code']) . "%'";

        }



        if (!empty($data['filter_date_start'])) {

            $sql .= " AND DATE(date_start) = DATE('" . $this->db->escape($data['filter_date_start']) . "')";

        }



        if (!empty($data['filter_date_end'])) {

            $sql .= " AND DATE(date_end) = DATE('" . $this->db->escape($data['filter_date_end']) . "')";

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



    public function addPromotion($data) {

        $this->db->query("

            INSERT INTO

                " . DB_PREFIX . "sp_promotion

            SET

                `name` = '" . $this->db->escape($data['name']) . "',

                `description` = '" . $this->db->escape($data['description']) . "',

                `status` = '" . (int) $data['status'] . "',

                `coupon_type` = '" . (int) $data['coupon_type'] . "',

                `coupon_code` = '" . $this->db->escape($data['coupon_type'] ? $data['coupon_code'] : '') . "',

                `uses_total` = '" . (int) $data['uses_total'] . "',

                `uses_total_day` = '" . (int) !empty($data['uses_total_day']) . "',

                `uses_customer` = '" . (int) $data['uses_customer'] . "',

                `uses_customer_day` = '" . (int) !empty($data['uses_customer_day']) . "',

                `date_start` = '" . $this->db->escape($data['date_start']) . "',

                `date_end` = '" . $this->db->escape($data['date_end']) . "',

                `sort_order` = '" . (int) $data['sort_order'] . "',

                `rule` = '" . $this->db->escape(serialize($data['rule'])) . "',

                `rule_categories` = '" . (empty($data['rule_category']) ? '' : $this->db->escape(serialize($data['rule_category']))) . "',

                `rule_products` = '" . (empty($data['rule_product']) ? '' : $this->db->escape(serialize($data['rule_product']))) . "',

                `rule_manufacturers` = '" . (empty($data['rule_manufacturer']) ? '' : $this->db->escape(serialize($data['rule_manufacturer']))) . "',

                `discount_type` = '" . $this->db->escape($data['discount_type']) . "',

                `discount_amount` = '" . (float) $data['discount_amount'] . "',

                `promo_qty` = '" . ((int) $data['promo_qty'] ? (int) $data['promo_qty'] : 1) . "',

                `discount_qty` = '" . (int) $data['discount_qty'] . "',

                `discount_option` = '" . (int) $data['discount_option'] . "',

                `ignore_item_qty` = '" . (int) !empty($data['ignore_item_qty']) . "',

                `free_shipping` = '" . (int) $data['free_shipping'] . "',

                `stop_rules_processing` = '" . (int) $data['stop_rules_processing'] . "',

                `label` = '" . $this->db->escape(serialize($data['label'])) . "',

                `logged` = '" . (int) $data['logged'] . "',

                `store` = '" . (empty($data['store_ids']) ? '' : $this->db->escape(serialize($data['store_ids']))) . "',

                `customer_group` = '" . (empty($data['customer_group_ids']) ? '' : $this->db->escape(serialize($data['customer_group_ids']))) . "',

                `promo_category` = '" . (empty($data['promo_category']) ? '' : $this->db->escape(serialize($data['promo_category']))) . "',

                `promo_product` = '" . (empty($data['promo_product']) ? '' : $this->db->escape(serialize($data['promo_product']))) . "',

                `rule_exclusion_products` = '" . (empty($data['rule_exclusion_product']) ? '' : $this->db->escape(serialize($data['rule_exclusion_product'])))."',

                `rule_exclusion_manufacturers` = '" . (empty($data['rule_exclusion_manufacturer']) ? '' : $this->db->escape(serialize($data['rule_exclusion_manufacturer'])))."'"

        );





        $promotion_id = $this->db->getLastId();

        if (!empty($data['promo_product'])) {

            $products = $data['promo_product'];

            foreach ($products as $p) {

                //check if existing

                $query = $this->db->query("

            SELECT * FROM

                " . DB_PREFIX . "sp_promotion_products

            WHERE

                `promotion_id` = '" . (int) $promotion_id . "' AND

                `product_id` = '" . $p . "'"

                );

                $promo = $query->row;

                if (empty($promo)) {

                    $this->db->query("

            INSERT INTO

                " . DB_PREFIX . "sp_promotion_products

            SET

                `promotion_id` = '" . (int) $promotion_id . "',

                `product_id` = '" . $p . "'"

                    );

                }

            }

        }

        //product rules

        if (!empty($data['rule_product'])) {

            $products = $data['rule_product'];

            foreach ($products as $p) {

            $sql = "SELECT * FROM " . DB_PREFIX . "product WHERE `product_id` = '" . $p . "'";

            $query = $this->db->query($sql);

            $getProducts = $query->row;

            }

            //check if existing

            if(!empty($getProducts)) {

                foreach($getProducts as $oneProduct) {

                    $query = $this->db->query("

            SELECT * FROM

                " . DB_PREFIX . "sp_promotion_products

            WHERE

                `promotion_id` = '" . (int) $promotion_id . "' AND

                `product_id` = '" . $oneProduct['product_id'] . "'"

                    );

                    $promo = $query->row;

                    if (empty($promo)) {

                        $this->db->query("

                INSERT INTO

                    " . DB_PREFIX . "sp_promotion_products

                SET

                    `promotion_id` = '" . (int) $promotion_id . "',

                    `product_id` = '" . $oneProduct['product_id'] . "'"

                        );

                    }

                }

            }

        }

        //manufacturer rules

        elseif (!empty($data['rule_manufacturer'])) {

            $manufacturers = $data['rule_manufacturer'];

            foreach ($manufacturers as $brand_id) {

                $sql = "SELECT * FROM " . DB_PREFIX . "product WHERE `manufacturer_id` = '" . $brand_id . "' AND `status` = '1'";

                if(!empty($data['rule_exclusion_product'])) {

                    foreach ($data['rule_exclusion_product'] as $exclusion_product_id) {

                        $sql .= " AND  `product_id` != '" . $exclusion_product_id . "'";

                    }

                }

                $query = $this->db->query($sql);

                $getProducts = $query->rows;

                if (!empty($getProducts)) {

                    foreach($getProducts as $oneProduct) {

                        //check if existing

                        $query = $this->db->query("

            SELECT * FROM

                " . DB_PREFIX . "sp_promotion_products

            WHERE

                `promotion_id` = '" . (int) $promotion_id . "' AND

                `product_id` = '" . $oneProduct['product_id'] . "'"

                        );

                        $promo = $query->row;

                        if (empty($promo)) {

                            $this->db->query("

                    INSERT INTO

                        " . DB_PREFIX . "sp_promotion_products

                    SET

                        `promotion_id` = '" . (int) $promotion_id . "',

                        `product_id` = '" . $oneProduct['product_id'] . "'"

                            );

                        }

                    }

                }

            }

        }

        //category rules

        elseif (!empty($data['rule_category'])) {

            $excludedProducts = array();

            $exclusion_manufacturers = $data['rule_exclusion_manufacturer'];

            $exclusion_products = $data['rule_exclusion_product'];

            $sql = "select * from  " . DB_PREFIX . "product where `product_id` = '' AND `status` = '1'";

            if(!empty($exclusion_manufacturers)) {

                foreach($exclusion_manufacturers as $exclusion_brand_id) {

                    $sql .= "AND `manufacturer_id` != '" . $exclusion_brand_id . "'";
                }
            }

            if(!empty($exclusion_products)) {

                foreach($exclusion_products as $exclusion_product_id) {

                    $sql .= "AND `product_id` != '" . $exclusion_product_id . "'";
                }
            }

            $query = $this->db->query($sql);

            $getExcludedProduct = $query->rows;

            if(!empty($getExcludedProduct)) {

                foreach($getExcludedProduct as $getOneExcludedProduct) {

                    $excludedProducts[] = $getOneExcludedProduct['product_id'];

                }

            }

            $categories = $data['rule_category'];

            foreach ($categories as $category_id) {

                $sql = "SELECT DISTINCT(`product_id`) FROM " . DB_PREFIX . "product_to_category WHERE `category_id` = '" . $category_id . "'";

                $query = $this->db->query($sql);

                $getCategoryProducts = $query->rows;

                if(!empty($getCategoryProducts)) {

                    foreach($getCategoryProducts as $oneCategoryProduct) {

                        if(!empty($excludedProducts)) {

                            foreach($excludedProducts as $oneExcludedProduct) {

                                if($oneExcludedProduct == $oneCategoryProduct['product_id']) {

                                    //check if existing

                                    $query = $this->db->query("

                            SELECT * FROM

                                " . DB_PREFIX . "sp_promotion_products

                            WHERE

                                `promotion_id` = '" . (int) $promotion_id . "' AND

                                `product_id` = '" . $oneCategoryProduct['product_id'] . "'"

                                    );

                                    $promo = $query->row;

                                    if (empty($promo)) {

                                        $this->db->query("

                                    INSERT INTO

                                        " . DB_PREFIX . "sp_promotion_products

                                    SET

                                        `promotion_id` = '" . (int) $promotion_id . "',

                                        `product_id` = '" . $oneCategoryProduct['product_id'] . "'"

                                        );

                                    }

                                }

                            }

                        }

                    }

                }

            }

        }





        $this->cache->delete('sp_promotion.' . (int) $this->db->getLastId());

        $this->cache->delete('sp_promotions');

    }



    public function editPromotion($promotion_id, $data) {

        $this->db->query("

            UPDATE

                " . DB_PREFIX . "sp_promotion

            SET

                `name` = '" . $this->db->escape($data['name']) . "',

                `description` = '" . $this->db->escape($data['description']) . "',

                `status` = '" . (int) $data['status'] . "',

                `coupon_type` = '" . (int) $data['coupon_type'] . "',

                `coupon_code` = '" . $this->db->escape($data['coupon_type'] ? $data['coupon_code'] : '') . "',

                `uses_total` = '" . (int) $data['uses_total'] . "',

                `uses_total_day` = '" . (int) !empty($data['uses_total_day']) . "',

                `uses_customer` = '" . (int) $data['uses_customer'] . "',

                `uses_customer_day` = '" . (int) !empty($data['uses_customer_day']) . "',

                `date_start` = '" . $this->db->escape($data['date_start']) . "',

                `date_end` = '" . $this->db->escape($data['date_end']) . "',

                `sort_order` = '" . (int) $data['sort_order'] . "',

                `rule` = '" . $this->db->escape(serialize($data['rule'])) . "',

                `rule_categories` = '" . (empty($data['rule_category']) ? '' : $this->db->escape(serialize($data['rule_category']))) . "',

                `rule_products` = '" . (empty($data['rule_product']) ? '' : $this->db->escape(serialize($data['rule_product']))) . "',

                `rule_manufacturers` = '" . (empty($data['rule_manufacturer']) ? '' : $this->db->escape(serialize($data['rule_manufacturer']))) . "',

                `discount_type` = '" . $this->db->escape($data['discount_type']) . "',

                `discount_amount` = '" . (float) $data['discount_amount'] . "',

                `promo_qty` = '" . ((int) $data['promo_qty'] ? (int) $data['promo_qty'] : 1) . "',

                `discount_qty` = '" . (int) $data['discount_qty'] . "',

                `discount_option` = '" . (int) $data['discount_option'] . "',

                `ignore_item_qty` = '" . (int) !empty($data['ignore_item_qty']) . "',

                `free_shipping` = '" . (int) $data['free_shipping'] . "',

                `stop_rules_processing` = '" . (int) $data['stop_rules_processing'] . "',

                `label` = '" . $this->db->escape(serialize($data['label'])) . "',

                `logged` = '" . (int) $data['logged'] . "',

                `store` = '" . (empty($data['store_ids']) ? '' : $this->db->escape(serialize($data['store_ids']))) . "',

                `customer_group` = '" . (empty($data['customer_group_ids']) ? '' : $this->db->escape(serialize($data['customer_group_ids']))) . "',

                `promo_category` = '" . (empty($data['promo_category']) ? '' : $this->db->escape(serialize($data['promo_category']))) . "',

                `promo_product` = '" . (empty($data['promo_product']) ? '' : $this->db->escape(serialize($data['promo_product']))) . "',

                `rule_exclusion_products` = '" . (empty($data['rule_exclusion_product']) ? '' : $this->db->escape(serialize($data['rule_exclusion_product'])))."',

                `rule_exclusion_manufacturers` = '" . (empty($data['rule_exclusion_manufacturer']) ? '' : $this->db->escape(serialize($data['rule_exclusion_manufacturer'])))."'

             WHERE promotion_id = '" . (int) $promotion_id . "'"

        );



        $this->db->query("DELETE FROM " . DB_PREFIX . "sp_promotion_products WHERE promotion_id = '" . (int) $promotion_id . "'");



        if (!empty($data['promo_product'])) {

            $products = $data['promo_product'];

            foreach ($products as $p) {

                //check if existing

                $query = $this->db->query("

            SELECT * FROM

                " . DB_PREFIX . "sp_promotion_products

            WHERE

                `promotion_id` = '" . (int) $promotion_id . "' AND

                `product_id` = '" . $p . "'"

                );

                $promo = $query->row;

                if (empty($promo)) {

                    $this->db->query("

            INSERT INTO

                " . DB_PREFIX . "sp_promotion_products

            SET

                `promotion_id` = '" . (int) $promotion_id . "',

                `product_id` = '" . $p . "'"

                    );

                }

            }

        }


        //product rules

        if (!empty($data['rule_product'])) {

            $products = $data['rule_product'];

            foreach ($products as $p) {

                $sql = "SELECT * FROM " . DB_PREFIX . "product WHERE `product_id` = '" . $p . "'";

                $query = $this->db->query($sql);

                $getProducts = $query->row;

            }

            //check if existing

            if(!empty($getProducts)) {

                foreach($getProducts as $oneProduct) {

                    $query = $this->db->query("

            SELECT * FROM

                " . DB_PREFIX . "sp_promotion_products

            WHERE

                `promotion_id` = '" . (int) $promotion_id . "' AND

                `product_id` = '" . $oneProduct['product_id'] . "'"

                    );

                    $promo = $query->row;

                    if (empty($promo)) {

                        $this->db->query("

                INSERT INTO

                    " . DB_PREFIX . "sp_promotion_products

                SET

                    `promotion_id` = '" . (int) $promotion_id . "',

                    `product_id` = '" . $oneProduct['product_id'] . "'"

                        );

                    }

                }

            }

        }

        //manufacturer rules

        elseif (!empty($data['rule_manufacturer'])) {

            $manufacturers = $data['rule_manufacturer'];

            foreach ($manufacturers as $brand_id) {

                $sql = "SELECT * FROM " . DB_PREFIX . "product WHERE `manufacturer_id` = '" . $brand_id . "' AND `status` = '1'";

                if(!empty($data['rule_exclusion_product'])) {

                    foreach ($data['rule_exclusion_product'] as $exclusion_product_id) {

                        $sql .= " AND  `product_id` != '" . $exclusion_product_id . "'";

                    }

                }

                $query = $this->db->query($sql);

                $getProducts = $query->rows;

                if (!empty($getProducts)) {

                    foreach($getProducts as $oneProduct) {

                        //check if existing

                        $query = $this->db->query("

            SELECT * FROM

                " . DB_PREFIX . "sp_promotion_products

            WHERE

                `promotion_id` = '" . (int) $promotion_id . "' AND

                `product_id` = '" . $oneProduct['product_id'] . "'"

                        );

                        $promo = $query->row;

                        if (empty($promo)) {

                            $this->db->query("

                    INSERT INTO

                        " . DB_PREFIX . "sp_promotion_products

                    SET

                        `promotion_id` = '" . (int) $promotion_id . "',

                        `product_id` = '" . $oneProduct['product_id'] . "'"

                            );

                        }

                    }

                }

            }

        }

        //category rules

        elseif (!empty($data['rule_category'])) {

            $excludedProducts = array();

            $exclusion_manufacturers = $data['rule_exclusion_manufacturer'];

            $exclusion_products = $data['rule_exclusion_product'];

            $sql = "select * from  " . DB_PREFIX . "product where `product_id` != '' AND `status` = '1'";

            if(!empty($exclusion_manufacturers)) {

                foreach($exclusion_manufacturers as $exclusion_brand_id) {

                    $sql .= "AND `manufacturer_id` != '" . $exclusion_brand_id . "'";
                }
            }

            if(!empty($exclusion_products)) {

                foreach($exclusion_products as $exclusion_product_id) {

                    $sql .= "AND `product_id` != '" . $exclusion_product_id . "'";
                }
            }

            $query = $this->db->query($sql);

            $getExcludedProduct = $query->rows;

            if(!empty($getExcludedProduct)) {

                foreach($getExcludedProduct as $getOneExcludedProduct) {

                    $excludedProducts[] = $getOneExcludedProduct['product_id'];

                }

            }

            $categories = $data['rule_category'];

            foreach ($categories as $category_id) {

                $sql = "SELECT DISTINCT(`product_id`) FROM " . DB_PREFIX . "product_to_category WHERE `category_id` = '" . $category_id . "'";

                $query = $this->db->query($sql);

                $getCategoryProducts = $query->rows;

                if(!empty($getCategoryProducts)) {

                    foreach($getCategoryProducts as $oneCategoryProduct) {

                        if(!empty($excludedProducts)) {

                            foreach($excludedProducts as $oneExcludedProduct) {

                                if($oneExcludedProduct == $oneCategoryProduct['product_id']) {

                                    //check if existing

                                    $query = $this->db->query("

                            SELECT * FROM

                                " . DB_PREFIX . "sp_promotion_products

                            WHERE

                                `promotion_id` = '" . (int) $promotion_id . "' AND

                                `product_id` = '" . $oneCategoryProduct['product_id'] . "'"

                                    );

                                    $promo = $query->row;

                                    if (empty($promo)) {

                                        $this->db->query("

                                    INSERT INTO

                                        " . DB_PREFIX . "sp_promotion_products

                                    SET

                                        `promotion_id` = '" . (int) $promotion_id . "',

                                        `product_id` = '" . $oneCategoryProduct['product_id'] . "'"

                                        );

                                    }

                                }

                            }

                        }

                    }

                }

            }

        }



        $this->cache->delete('sp_promotion.' . (int) $promotion_id);

        $this->cache->delete('sp_promotions');

    }



    public function deletePromotion($promotion_id) {

        $this->db->query("DELETE FROM " . DB_PREFIX . "sp_promotion WHERE promotion_id = '" . (int) $promotion_id . "'");

        $this->db->query("DELETE FROM " . DB_PREFIX . "sp_promotion_stats WHERE promotion_id = '" . (int) $promotion_id . "'");

        $this->db->query("DELETE FROM " . DB_PREFIX . "sp_promotion_products WHERE promotion_id = '" . (int) $promotion_id . "'");



        $this->cache->delete('sp_promotion.' . (int) $promotion_id);

        $this->cache->delete('sp_promotions');

    }



    public function statusPromotion($promotion_id) {

        $this->db->query("

            UPDATE

                " . DB_PREFIX . "sp_promotion

            SET

                `status` = 1 - `status`

             WHERE promotion_id = '" . (int) $promotion_id . "'"

        );



        $this->cache->delete('sp_promotion.' . (int) $promotion_id);

        $this->cache->delete('sp_promotions');

    }



    public function copyPromotion($promotion_id) {

        $this->db->query("

            INSERT INTO

                " . DB_PREFIX . "sp_promotion (

                    `name`,

                    `description`,

                    `coupon_type`,

                    `coupon_code`,

                    `uses_total`,

                    `uses_total_day`,

                    `uses_customer`,

                    `uses_customer_day`,

                    `date_start`,

                    `date_end`,

                    `sort_order`,

                    `rule`,

                    `rule_categories`,

                    `rule_products`,

                    `rule_exclusion_products`,

                    `rule_exclusion_manufacturers`,

                    `discount_type`,

                    `discount_amount`,

                    `promo_qty`,

                    `discount_qty`,

                    `discount_option`,

                    `ignore_item_qty`,

                    `free_shipping`,

                    `stop_rules_processing`,

                    `label`,

                    `logged`,

                    `store`,

                    `customer_group`,

                    `promo_category`,

                    `promo_product`

                ) SELECT

                    `name`,

                    `description`,

                    `coupon_type`,

                    `coupon_code`,

                    `uses_total`,

                    `uses_total_day`,

                    `uses_customer`,

                    `uses_customer_day`,

                    `date_start`,

                    `date_end`,

                    `sort_order`,

                    `rule`,

                    `rule_categories`,

                    `rule_products`,

                    `rule_exclusion_products`,

                    `rule_exclusion_manufacturers`,

                    `discount_type`,

                    `discount_amount`,

                    `promo_qty`,

                    `discount_qty`,

                    `discount_option`,

                    `ignore_item_qty`,

                    `free_shipping`,

                    `stop_rules_processing`,

                    `label`,

                    `logged`,

                    `store`,

                    `customer_group`,

                    `promo_category`,

                    `promo_product`

                FROM " . DB_PREFIX . "sp_promotion WHERE `promotion_id` = '" . (int) $promotion_id . "'");

    }



    public function getPromotion($promotion_id) {

        $query = $this->db->query("SELECT *, DATE(date_start) date_start, DATE(date_end) date_end FROM " . DB_PREFIX . "sp_promotion WHERE promotion_id = '" . (int) $promotion_id . "'");



        if ($query->row) {

            $query->row['store_ids'] = $query->row['store'] ? unserialize($query->row['store']) : array();

            $query->row['customer_group_ids'] = $query->row['customer_group'] ? unserialize($query->row['customer_group']) : array();



            if (version_compare(VERSION, '1.5.5.1') >= 0) {

                $query->row['promo_categories'] = array();



                $promo_categories = $query->row['promo_category'] ? unserialize($query->row['promo_category']) : array();



                $this->load->model('catalog/category');

                foreach ($promo_categories as $category_id) {

                    $category_info = $this->model_catalog_category->getCategory($category_id);



                    if ($category_info) {

                        $query->row['promo_categories'][] = array(

                            'category_id' => $category_info['category_id'],

                            'name' => strip_tags(html_entity_decode(($category_info['path'] ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']), ENT_QUOTES, 'UTF-8'))

                        );

                    }

                }

            } else {

                $query->row['promo_categories'] = $query->row['promo_category'] ? unserialize($query->row['promo_category']) : array();

            }



            $query->row['promo_products'] = array();



            $promo_products = $query->row['promo_product'] ? unserialize($query->row['promo_product']) : array();



            $this->load->model('catalog/product');

            foreach ($promo_products as $product_id) {

                $product_info = $this->model_catalog_product->getProduct($product_id);



                if ($product_info) {

                    $query->row['promo_products'][] = array(

                        'product_id' => $product_info['product_id'],

                        'name' => strip_tags(html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8'))

                    );

                }

            }



            $query->row['label'] = unserialize($query->row['label']);

            $query->row['rule'] = $query->row['rule'] ? unserialize($query->row['rule']) : array();



            $rule_products = $query->row['rule_products'] ? unserialize($query->row['rule_products']) : array();



            $query->row['rule_products'] = array();



            foreach ($rule_products as $product_id) {

                $product_info = $this->model_catalog_product->getProduct($product_id);



                if ($product_info) {

                    $query->row['rule_products'][] = array(

                        'product_id' => $product_info['product_id'],

                        'name' => strip_tags(html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8'))

                    );

                }

            }

            $this->load->model('catalog/manufacturer');


            $rule_manufacturers = $query->row['rule_manufacturers'] ? unserialize($query->row['rule_manufacturers']) : array();


            $query->row['rule_manufacturers'] = array();




            foreach ($rule_manufacturers as $manufacturer_id) {

                $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($manufacturer_id);



                if ($manufacturer_info) {

                    $query->row['rule_manufacturers'][] = array(

                        'manufacturer_id' => $manufacturer_info['manufacturer_id'],

                        'name' => strip_tags(html_entity_decode($manufacturer_info['name'], ENT_QUOTES, 'UTF-8'))

                    );

                }

            }

            

            //exclusion

            $rule_exclusion_products = $query->row['rule_exclusion_products'] ? unserialize($query->row['rule_exclusion_products']) : array();

            $query->row['rule_exclusion_products'] = array();



            

            foreach ($rule_exclusion_products as $product_id) {

                $product_info = $this->model_catalog_product->getProduct($product_id);



                if ($product_info) {

                    $query->row['rule_exclusion_products'][] = array(

                        'product_id' => $product_info['product_id'],

                        'name' => strip_tags(html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8'))

                    );

                }

            }

            

            //exclude manufacturer

            $rule_exclusion_manufacturers = $query->row['rule_exclusion_manufacturers'] ? unserialize($query->row['rule_exclusion_manufacturers']) : array();

            $query->row['rule_exclusion_manufacturers'] = array();



            $this->load->model('catalog/manufacturer');

            foreach ($rule_exclusion_manufacturers as $manufacturer_id) {

                $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($manufacturer_id);



                if ($manufacturer_id) {

                    $query->row['rule_exclusion_manufacturers'][] = array(

                        'manufacturer_id' => $manufacturer_info['manufacturer_id'],

                        'name' => strip_tags(html_entity_decode($manufacturer_info['name'], ENT_QUOTES, 'UTF-8'))

                    );

                }

            }



            if (version_compare(VERSION, '1.5.5.1') >= 0) {

                $rule_categories = $query->row['rule_categories'] ? unserialize($query->row['rule_categories']) : array();



                $query->row['rule_categories'] = array();



                foreach ($rule_categories as $category_id) {

                    $category_info = $this->model_catalog_category->getCategory($category_id);



                    if ($category_info) {

                        $query->row['rule_categories'][] = array(

                            'category_id' => $category_info['category_id'],

                            'name' => strip_tags(html_entity_decode(($category_info['path'] ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']), ENT_QUOTES, 'UTF-8'))

                        );

                    }

                }

            } else {

                $query->row['rule_categories'] = $query->row['rule_categories'] ? unserialize($query->row['rule_categories']) : array();

            }

        }



        return $query->row;

    }



    public function getPromotionStats($promotion_id, $start = 0, $limit = 10) {

        if ($start < 0) {

            $start = 0;

        }



        if ($limit < 1) {

            $limit = 10;

        }



        $query = $this->db->query("SELECT sps.order_id, CONCAT(c.firstname, ' ', c.lastname) AS customer, sps.customer_id, sps.amount, sps.date_added FROM " . DB_PREFIX . "sp_promotion_stats sps LEFT JOIN " . DB_PREFIX . "customer c ON (sps.customer_id = c.customer_id) WHERE sps.promotion_id = '" . (int) $promotion_id . "' ORDER BY sps.date_added ASC LIMIT " . (int) $start . "," . (int) $limit);



        return $query->rows;

    }



    public function getTotalPromotionStats($promotion_id) {

        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "sp_promotion_stats WHERE promotion_id = '" . (int) $promotion_id . "'");



        return $query->row['total'];

    }



    public function install() {

        $query = <<<QUERY

            CREATE TABLE IF NOT EXISTS `%ssp_promotion` (

                `promotion_id` int(11) NOT NULL auto_increment,

                `name` varchar(255) NOT NULL,

                `description` TEXT NOT NULL,

                `status` tinyint(1) NOT NULL,

                `coupon_type` tinyint(1) NOT NULL,

                `coupon_code` varchar(255) NOT NULL,

                `uses_total` int(11) NOT NULL default 0,

                `uses_total_day` tinyint(1) NOT NULL,

                `uses_customer` int(11) NOT NULL default 0,

                `uses_customer_day` tinyint(1) NOT NULL,

                `date_start` datetime NOT NULL,

                `date_end` datetime NOT NULL,

                `sort_order` int(11) NOT NULL default 0,

                `rule` text NOT NULL,

                `rule_categories` text NOT NULL,

                `rule_products` text NOT NULL,

                `discount_type` varchar(255) NOT NULL,

                `discount_amount` decimal(15,4) NOT NULL,

                `promo_qty` int(11) NOT NULL default 1,

                `discount_qty` int(11) NOT NULL,

                `discount_option` int(11) NOT NULL,

                `ignore_item_qty` tinyint(11) NOT NULL,

                `free_shipping` tinyint(1) NOT NULL,

                `stop_rules_processing` tinyint(1) NOT NULL,

                `label` TEXT NOT NULL,

                `logged` tinyint(1) NOT NULL,

                `store` text NOT NULL,

                `customer_group` text NOT NULL,

                `promo_category` text NOT NULL,

                `promo_product` text NOT NULL,

                PRIMARY KEY  (`promotion_id`)

            ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

QUERY;



        $this->db->query(sprintf($query, DB_PREFIX));



        $query = <<<QUERY

            CREATE TABLE IF NOT EXISTS `%ssp_banner` (

                `banner_id` int(11) NOT NULL auto_increment,

                `name` varchar(255) NOT NULL,

                `status` tinyint(1) NOT NULL,

                `date_start` datetime NOT NULL,

                `date_end` datetime NOT NULL,

                `sort_order` int(11) NOT NULL default 0,

                `banner_type` int(11) NOT NULL default 0,

                `cycle_timeout` int(11) NOT NULL default 4,

                `modal_timeout` int(11) NOT NULL default 4,

                `skip_special` tinyint(1) NOT NULL default 0,

                `rule` text NOT NULL,

                `positions` text NOT NULL,

                `banners` text NOT NULL,

                `rule_manufacturers` text NOT NULL,

                `rule_categories` text NOT NULL,

                `rule_products` text NOT NULL,

                `cart_categories` text NOT NULL,

                `cart_products` text NOT NULL,

                `logged` tinyint(1) NOT NULL,

                `store` text NOT NULL,

                `customer_group` text NOT NULL,

                PRIMARY KEY  (`banner_id`)

            ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

QUERY;



        $this->db->query(sprintf($query, DB_PREFIX));



        $query = <<<QUERY

            CREATE TABLE IF NOT EXISTS `%ssp_trigger` (

                `trigger_id` int(11) NOT NULL auto_increment,

                `name` varchar(255) NOT NULL,

                `status` tinyint(1) NOT NULL,

                `coupon_type` tinyint(1) NOT NULL,

                `coupon_code` varchar(255) NOT NULL,

                `date_start` datetime NOT NULL,

                `date_end` datetime NOT NULL,

                `sort_order` int(11) NOT NULL default 0,

                `rule` text NOT NULL,

                `product` text NOT NULL,

                `cart_categories` text NOT NULL,

                `cart_products` text NOT NULL,

                `logged` tinyint(1) NOT NULL,



                `store` text NOT NULL,

                `customer_group` text NOT NULL,

                PRIMARY KEY  (`trigger_id`)

            ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

QUERY;



        $this->db->query(sprintf($query, DB_PREFIX));



        $query = <<<QUERY

            CREATE TABLE IF NOT EXISTS `%ssp_promotion_stats` (

                `promotion_stats_id` int(11) NOT NULL AUTO_INCREMENT,

                `promotion_id` int(11) NOT NULL,

                `order_id` int(11) NOT NULL,

                `customer_id` int(11) NOT NULL,

                `amount` decimal(15,4) NOT NULL,

                `date_added` datetime NOT NULL,

                PRIMARY KEY (`promotion_stats_id`)

            ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

QUERY;



        $this->db->query(sprintf($query, DB_PREFIX));

    }



    public function uninstall() {

        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "sp_promotion`;");

        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "sp_banner`;");

        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "sp_trigger`;");

        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "sp_promotion_stats`;");

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

