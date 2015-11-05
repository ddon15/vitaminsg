<?php

class ModelCheckoutSpecialPromotions extends Model {
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
                $exclusion_products = (empty($row['rule_exclusion_products']) ? array() : unserialize($row['rule_exclusion_products']));
                $exclusion_manufacturers = (empty($row['rule_exclusion_manufacturers']) ? array() : unserialize($row['rule_exclusion_manufacturers']));
                
                foreach ($categories as $category_id) {
                    $category_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE category_id = '" . (int)$category_id . "'");
                    foreach ($category_query->rows as $category_row) {
                        $products[] = $category_row['product_id'];
                    }
                }

                $products = array_unique($products, SORT_NUMERIC);
                $exclusion_products = array_unique($exclusion_products, SORT_NUMERIC);
                $exclusion_manufacturers = array_unique($exclusion_manufacturers, SORT_NUMERIC);

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
                    'promo_products' => $promo_products,
                    'exclusion_products' => $exclusion_products, //EXCLUSION
                    'exclusion_manufacturers' => $exclusion_manufacturers //EXCLUSION
                ));
            }

            $this->cache->set('sp_promotions', $promotions);
        }

        return $promotions;
    }

    public function stat($promotion_id, $order_id, $customer_id, $amount) {
        $this->db->query("INSERT INTO `" . DB_PREFIX . "sp_promotion_stats` SET promotion_id = '" . (int)$promotion_id . "', order_id = '" . (int)$order_id . "', customer_id = '" . (int)$customer_id . "', amount = '" . (float)$amount . "', date_added = NOW()");
    }

    public function getPromotion($promotion_id) {
        $promotion = $this->cache->get('sp_promotion.' . (int)$promotion_id);
        if (!$promotion) {
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sp_promotion WHERE promotion_id = '" . (int)$promotion_id . "'");
            $promotion = $query->row;

            $this->cache->set('sp_promotion.' . (int)$promotion_id, $promotion);
        }
        return $promotion;
    }

    public function checkCoupon($code) {
        if ($this->config->get('special_promotions_ci_coupons')) {
            $coupon_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sp_promotion` WHERE LCASE(`coupon_code`) = LCASE('" . $this->db->escape($code) . "') AND coupon_type = '1' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) AND status = '1'");
        } else {
            $coupon_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sp_promotion` WHERE BINARY coupon_code = '" . $this->db->escape($code) . "' AND coupon_type = '1' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) AND status = '1'");
        }
        return $coupon_query->num_rows > 0;
    }

    public function checkTriggers() {
        $triggers = $this->getTriggers();

        if ($this->customer->isLogged()) {
            $customer_group_id = $this->customer->getCustomerGroupId();
        } else {
            $customer_group_id = $this->config->get('config_customer_group_id');
        }

        $this->load->model('catalog/product');

        $coupons = empty($this->session->data['special_promotions_coupon']) ? array() : $this->session->data['special_promotions_coupon'];
        if (!is_array($coupons)) {
            $coupons = array();
        } elseif ($coupons && !$this->config->get('special_promotions_multiply_coupons')) {
            array_splice($coupons, 1);
        }

        if ($coupons && $this->config->get('special_promotions_ci_coupons')) {
            $coupons = array_map('utf8_strtolower', $coupons);
            $coupons = array_unique($coupons);
        }

        $this->products = $this->cart->getProducts();

        foreach ($triggers as $trigger) {

            foreach ($trigger['product'] as $_product) {
                if (!empty($_product['remove'])) {
                    foreach ($this->products as $key => $product) {
                        if ($product['product_id'] == $_product['product_id']) {
                            $this->cart->remove($key);
                            break;
                        }
                    }
                    $this->products = $this->cart->getProducts();
                }
            }

            if (!in_array($this->config->get('config_store_id'), $trigger['store'])) {
                continue;
            }

            if (!in_array($customer_group_id, $trigger['customer_group'])) {
                continue;
            }

            if ($trigger['logged'] && !$this->customer->getId()) {
                continue;
            }

            if ($this->config->get('special_promotions_ci_coupons')) {
                $trigger['coupon_code'] = utf8_strtolower($trigger['coupon_code']);
            }

            if ($trigger['coupon_type'] && !in_array($trigger['coupon_code'], $coupons)) {
                continue;
            }

            if (!empty($trigger['cart_products'])) {
                if (empty($this->products)) {
                    continue;
                }

                $check = 0;
                foreach ($this->products as $product) {
                    if (in_array($product['product_id'], $trigger['cart_products'])) {
                        $check++;
                    }
                }

                if ($check != count($trigger['cart_products'])) {
                    continue;
                }
            }

            if (!empty($trigger['cart_categories_products'])) {
                if (empty($this->products)) {
                    continue;
                }

                $check = false;
                foreach ($this->products as $product) {
                    if (in_array($product['product_id'], $trigger['cart_categories_products'])) {
                        $check = true;
                        break;
                    }
                }

                if (!$check) {
                    continue;
                }
            }

            foreach ($this->products as $product) {
                foreach ($trigger['product'] as $key => $_product) {
                    if ($product['product_id'] == $_product['product_id'] && $product['quantity'] >= $_product['quantity']) {
                        continue 3;
                    } elseif ($product['product_id'] == $_product['product_id']) {
                        $trigger['product'][$key]['quantity'] = (int)($_product['quantity'] - $product['quantity']);
                    }
                }
            }

            if (isset($trigger['rule']['conditions'][0])) {
                $check = $this->check($trigger['rule']['conditions'][0]);
                if (!$check) {
                    continue;
                }
            }

            foreach ($trigger['product'] as $product) {
                $product_info = $this->model_catalog_product->getProduct($product['product_id']);
                if ($product_info) {
                    $product_options = $this->model_catalog_product->getProductOptions($product['product_id']);

                    if (empty($product['option'])) {
                        $this->cart->add($product['product_id'], $product['quantity'], false, 0);
                    } else {
                        foreach ($product_options as $product_option) {
                            if ($product_option['required'] && empty($product['option'][$product_option['product_option_id']])) {
                                continue 2;
                            }
                        }

                        $this->cart->add($product['product_id'], $product['quantity'], $product['option'], 0);
                    }
                }
            }
        }
    }

    private function getTriggers() {
        $triggers = $this->cache->get('sp_triggers');
        if (!$triggers) {
            $query = $this->db->query("SELECT *, DATE(date_start) date_start, DATE(date_end) date_end FROM " . DB_PREFIX . "sp_trigger WHERE ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) AND status = '1' GROUP BY trigger_id ORDER BY sort_order ASC");

            $triggers = array();

            foreach ($query->rows as $row) {
                $row['rule'] = (empty($row['rule']) ? array() : unserialize($row['rule']));
                $row['product'] = (empty($row['product']) ? array() : unserialize($row['product']));
                $row['store'] = (empty($row['store']) ? array() : unserialize($row['store']));
                $row['customer_group'] = (empty($row['customer_group']) ? array() : unserialize($row['customer_group']));

                $products = (empty($row['cart_products']) ? array() : unserialize($row['cart_products']));
                $categories = (empty($row['cart_categories']) ? array() : unserialize($row['cart_categories']));

                $categories_products = array();

                foreach ($categories as $category_id) {
                    $category_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE category_id = '" . (int)$category_id . "'");
                    foreach ($category_query->rows as $category_row) {
                        $categories_products[] = $category_row['product_id'];
                    }
                }

                $products = array_unique($products, SORT_NUMERIC);
                $categories_products = array_unique($categories_products, SORT_NUMERIC);

                $triggers[] = array_merge($row, array(
                    'cart_products' => $products,
                    'cart_categories_products' => $categories_products,
                ));
            }

            $this->cache->set('sp_triggers', $triggers);
        }

        return $triggers;
    }

    private function check($rule, $data = array()) {

        if (!empty($rule['operator'])) {
            $rule['operator'] = html_entity_decode($rule['operator'], ENT_QUOTES, 'UTF-8');
        }

        switch ($rule['type']) {
            case 'rule/condition_combine':
                if (empty($rule['rules'])) {
                    $result = true;
                } else {
                    if ($rule['aggregator'] == 'all') {
                        $result = true;
                        foreach ($rule['rules'] as $r) {
                            $result = ($result && ($rule['value'] == $this->check($r, $data)));
                            if (!$result) {
                                break;
                            }
                        }
                    } else {
                        $result = false;
                        foreach ($rule['rules'] as $r) {
                            $result = ($result || ($rule['value'] == $this->check($r, $data)));
                            if ($result) {
                                break;
                            }
                        }
                    }
                }
                break;
            case 'rule/condition_product_found':
                if (empty($rule['rules'])) {
                    $result = true;
                } else {
                    $found = array();
                    foreach ($this->products as $product) {
                        if ($rule['aggregator'] == 'all') {
                            $result = true;
                            foreach ($rule['rules'] as $r) {
                                $result = ($result && ($rule['value'] == $this->check($r, $product)));
                                if (!$result) {
                                    break;
                                }
                            }
                        } else {
                            $result = false;
                            foreach ($rule['rules'] as $r) {
                                $result = ($result || ($rule['value'] == $this->check($r, $product)));
                                if ($result) {
                                    break;
                                }
                            }
                        }
                        if ($result) {
                            $found[] = $product;
                            break;
                        }
                    }
                    $result = (count($found) > 0);
                }
                break;
            case 'rule/condition_product_subselect':
                if (empty($rule['rules'])) {
                    $result = true;
                } else {
                    $total = 0;
                    $result = false;
                    foreach ($this->products as $product) {
                        $sub_total = ($rule['attribute'] == 'qty' ? $product['quantity'] : $product['total']);
                        foreach ($rule['rules'] as $r) {
                            if ($this->check($r, $product)) {
                                $result = true;
                            } else {
                                if ($rule['aggregator'] == 'all') {
                                    $result = false;
                                    break;
                                }
                            }
                        }
                        if ($result) {
                            $total += $sub_total;
                        }
                    }
                    $result = $this->logic($rule['operator'], $total, $rule['value']);
                }
                break;
            case 'rule/condition_cart|base_subtotal':
                $result = $this->logic($rule['operator'], $this->cart->getSubTotal(), $rule['value']);
                break;
            case 'rule/condition_cart|total_qty':
                $result = $this->logic($rule['operator'], $this->cart->countProducts(), $rule['value']);
                break;
            case 'rule/condition_cart|diff_qty':
                $result = $this->logic($rule['operator'], count($this->products), $rule['value']);
                break;
            case 'rule/condition_cart|weight':
                $result = $this->logic($rule['operator'], $this->cart->getWeight(), $rule['value']);
                break;
            case 'rule/condition_cart|payment_method':
                $result = $this->logic($rule['operator'], (isset($this->session->data['payment_method']['code']) ? $this->session->data['payment_method']['code'] : ''), $rule['value']);
                break;
            case 'rule/condition_cart|shipping_method':
                $code = (isset($this->session->data['shipping_method']['code']) ? $this->session->data['payment_method']['code'] : '');
                list($code) = explode('.', $code);
                $result = $this->logic($rule['operator'], $code, $rule['value']);
                break;
            case 'rule/condition_cart|shipping_postcode':
                $result = $this->logic($rule['operator'], (isset($this->session->data['shipping_postcode']) ? $this->session->data['shipping_postcode'] : ''), $rule['value']);
                break;
            case 'rule/condition_cart|shipping_zone_id':
                $result = $this->logic($rule['operator'], (isset($this->session->data['shipping_zone_id']) ? $this->session->data['shipping_zone_id'] : ''), $rule['value']);
                break;
            case 'rule/condition_cart|shipping_country_id':
                $result = $this->logic($rule['operator'], (isset($this->session->data['shipping_country_id']) ? $this->session->data['shipping_country_id'] : ''), $rule['value']);
                break;
            case 'rule/condition_customer|store_id':
                $result = $this->logic($rule['operator'], $this->config->get('config_store_id'), $rule['value']);
                break;
            case 'rule/condition_customer|customer_group_id':
                if ($this->customer->isLogged()) {
                    $customer_group_id = $this->customer->getCustomerGroupId();
                } else {
                    $customer_group_id = $this->config->get('config_customer_group_id');
                }
                $result = $this->logic($rule['operator'], $customer_group_id, $rule['value']);
                break;
            case 'rule/condition_customer|registration_date':
                if ($this->customer->isLogged()) {
                    $sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "customer` WHERE customer_id = '" . (int)$this->customer->getId() . "' AND ";
                    switch ($rule['operator']) {
                        case '==':
                            $sql .= "DATE(date_added) = DATE('" . $this->db->escape($rule['value']) . "')";
                            break;
                        case '!=':
                            $sql .= "DATE(date_added) != DATE('" . $this->db->escape($rule['value']) . "')";
                            break;
                        case '>=':
                            $sql .= "DATE(date_added) >= DATE('" . $this->db->escape($rule['value']) . "')";
                            break;
                        case '<=':
                            $sql .= "DATE(date_added) <= DATE('" . $this->db->escape($rule['value']) . "')";
                            break;
                        case '>':
                            $sql .= "DATE(date_added) > DATE('" . $this->db->escape($rule['value']) . "')";
                            break;
                        case '<':
                            $sql .= "DATE(date_added) < DATE('" . $this->db->escape($rule['value']) . "')";
                            break;
                        case '()':
                            $values = explode(',', $rule['value']);
                            $values = array_map('trim', $values);
                            $implode[] = array();
                            foreach (array_map('trim', $values) as $value) {
                                $implode[] = "DATE(date_added) = DATE('" . $this->db->escape($value) . "')";
                            }
                            $sql .= "(" . implode(" OR ", $implode) . ")";
                            break;
                        case '!()':
                            $values = explode(',', $rule['value']);
                            $values = array_map('trim', $values);
                            $implode[] = array();
                            foreach (array_map('trim', $values) as $value) {
                                $implode[] = "DATE(date_added) != DATE('" . $this->db->escape($value) . "')";
                            }
                            $sql .= "(" . implode(" AND ", $implode) . ")";
                            break;
                    }
                    $query = $this->db->query($sql);
                    $result = $query->row['total'] > 0;
                }
                break;
            case 'rule/condition_customer|email':
                if ($this->customer->isLogged()) {
                    $email = $this->customer->getEmail();
                } else {
                    $email = isset($this->session->data['guest']['email']) ? $this->session->data['guest']['email'] : '';
                }
                $result = $this->logic($rule['operator'], $email, $rule['value']);
                break;
            case 'rule/condition_customer|firstname':
                if ($this->customer->isLogged()) {
                    $firstname = $this->customer->getFirstName();
                } else {
                    $firstname = isset($this->session->data['guest']['firstname']) ? $this->session->data['guest']['firstname'] : '';
                }
                $result = $this->logic($rule['operator'], $firstname, $rule['value']);
                break;
            case 'rule/condition_customer|lastname':
                if ($this->customer->isLogged()) {
                    $lastname = $this->customer->getLastName();
                } else {
                    $lastname = isset($this->session->data['guest']['lastname']) ? $this->session->data['guest']['lastname'] : '';
                }
                $result = $this->logic($rule['operator'], $lastname, $rule['value']);
                break;
            case 'rule/condition_orders|order_num':
                if ($this->customer->isLogged()) {
                    $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id = '5' AND customer_id = '" . (int)$this->customer->getId() . "'");
                    $result = $this->logic($rule['operator'], $query->row['total'], $rule['value']);
                }
                break;
            case 'rule/condition_orders|sales_amount':
                if ($this->customer->isLogged()) {
                    $query = $this->db->query("SELECT SUM(total) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id = '5' AND customer_id = '" . (int)$this->customer->getId() . "'");
                    $result = $this->logic($rule['operator'], $query->row['total'], $rule['value']);
                }
                break;
            case 'rule/condition_cart_product|price':
                $result = $this->logic($rule['operator'], $data['price'], $rule['value']);
                break;
            case 'rule/condition_cart_product|qty':
                $result = $this->logic($rule['operator'], $data['quantity'], $rule['value']);
                break;
            case 'rule/condition_cart_product|total':
                $result = $this->logic($rule['operator'], $data['total'], $rule['value']);
                break;
            case 'rule/condition_cart_product|manufacturer_id':
                $query = $this->db->query("SELECT DISTINCT * FROM `" . DB_PREFIX . "product` WHERE product_id = '" . (int)$data['product_id'] . "' AND manufacturer_id = '" . (int)$rule['value'] . "'");
                $result = $this->logic($rule['operator'], ($query->row ? $query->row['manufacturer_id'] : 0), $rule['value']);
                break;
            case 'rule/condition_cart_product|category_id':
                $query = $this->db->query("SELECT DISTINCT * FROM `" . DB_PREFIX . "product_to_category` WHERE product_id = '" . (int)$data['product_id'] . "' AND category_id = '" . (int)$rule['value'] . "'");
                $result = $this->logic($rule['operator'], ($query->row ? $query->row['category_id'] : 0), $rule['value']);
                break;
            case 'rule/condition_cart_product|model':
                $result = $this->logic($rule['operator'], $data['model'], $rule['value']);
                break;
            default:
                $result = false;
        }

        if ($data && strpos($rule['type'], 'rule/condition_cart_product|attribute_') === 0) {
            list(, $attribute_id) = explode('|', $rule['type']);
            $attribute_id = (int)ltrim($attribute_id, 'attribute_');
            $this->load->model('catalog/product');
            $attribute_groups = $this->model_catalog_product->getProductAttributes($data['product_id']);
            foreach ($attribute_groups as $attribute_group) {
                foreach ($attribute_group['attribute'] as $attribute) {
                    if ($attribute_id == $attribute['attribute_id']) {
                        $result = $this->logic($rule['operator'], utf8_strtolower($rule['value']), utf8_strtolower($attribute['text']));
                        break 2;
                    }
                }
            }
        }

        if ($data && strpos($rule['type'], 'rule/condition_cart_product|option_') === 0) {
            if (!empty($data['option'])) {
                list(, $option_id, $type) = explode('|', $rule['type']);
                $option_id = (int)ltrim($option_id, 'option_');
                $this->load->model('catalog/product');
                if ($type == 'select' || $type == 'radio' || $type == 'checkbox' || $type == 'image') {
                    foreach ($data['option'] as $option) {
                        if ($option_id == $option['option_id']) {
                            $result = $this->logic($rule['operator'], $option['option_value_id'], $rule['value']);
                            if ($result) {
                                break;
                            }
                        }
                    }
                } elseif ($type == 'date' || $type == 'time' || $type == 'datetime') {
                    foreach ($data['option'] as $option) {
                        if ($option_id == $option['option_id']) {
                            $result = $this->logic($rule['operator'], strtotime($option['option_value']), strtotime($rule['value']));
                            break;
                        }
                    }
                } else {
                    foreach ($data['option'] as $option) {
                        if ($option_id == $option['option_id']) {
                            $result = $this->logic($rule['operator'], utf8_strtolower($option['option_value']), utf8_strtolower($rule['value']));
                            break;
                        }
                    }
                }
            } else {
                $result = false;
            }
        }

        return $result;
    }

    private function logic($operator, $value, $base) {
        switch ($operator) {
            case '==':
                $result = ($value == $base);
                break;
            case '!=':
                $result = ($value != $base);
                break;
            case '>=':
                $result = ($value >= $base);
                break;
            case '<=':
                $result = ($value <= $base);
                break;
            case '>':
                $result = ($value > $base);
                break;
            case '<':
                $result = ($value < $base);
                break;
            case '()':
                $values = explode(',', $base);
                $result = in_array($value, array_map('trim', $values));
                break;
            case '!()':
                $values = explode(',', $base);
                $result = !in_array($value, array_map('trim', $values));
                break;
        }
        return $result;
    }

}