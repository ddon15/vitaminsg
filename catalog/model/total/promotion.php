<?php

/**
 * Malcolm [MY]
 * Calculate promotions and modify final totals with taxes
 */
class ModelTotalPromotion extends Model {

    private $products;
    private $products_active;

    public function getTotal(&$total_data, &$total, &$taxes) {
        $this->language->load('total/promotion');

        $this->load->model('promotion/db');
        $this->load->model('promotion/product');

        $discount_total = 0;
        $sub_total = 0;
        $promotion_info = array();


        $this->products = $this->cart->getProducts();

        //get all valid promotions
        $promotions = $this->model_promotion_db->getAllPromotion();

        uasort($this->products, array($this, 'sort_desc_total'));

        foreach ($promotions as $promotion) {
         
            $discount_products = array();
            $discount_promotion = 0;
            $discount_qty = $promotion['discount_qty'] ? $promotion['discount_qty'] : true;

            //get related products
            $promo_products = $this->model_promotion_product->getPromotionProduct($promotion['promotion_id']);
            $temp = array();
            foreach ($promo_products as $p) {
                if (!empty($p['product_id'])) {
                    $temp[] = $p['product_id'];
                }
            }
            $promotion['products'] = $temp;

            //get all discounted products related to the promotion
            $discount_products = $this->model_promotion_product->getPromotionDiscountProduct($promotion['promotion_id']);
            $temp = array();
            foreach ($discount_products as $p) {
                if (!empty($p['product_id'])) {
                    $temp[] = $p['product_id'];
                }
            }
            $promotion['promo_products'] = $temp;

            $discount_qty = $promotion['discount_qty'] ? $promotion['discount_qty'] : true;
            $i = 1;
            $promoted = 0;
            $this->products_active = array();

            //check whether the products are valid
            foreach ($this->products as $key => $product) {
                $status = false;
                if (empty($promotion['promo_products'])) {
                    $status = true;
                } else if (in_array($product['product_id'], $promotion['products'])) {
                    $status = true;
                }
                if ($status) {
                    $this->products_active[$key] = $product;
                }
            }

            $sub_total = 0;

            if ($promotion['discount_type'] == 'n_products_fixed' || $promotion['discount_type'] == 'n_products_percent') {
                uasort($this->products_active, array($this, 'sort_asc_price'));
            }

            $products = array();
            $keys = array_keys($this->products_active);
            $key = 0;
            $min_quantity = 0;

            foreach ($this->products_active as $product) {
                //$status = false;
                //check whether hit the promotion discount qty
                //will always be true or choose qty given
                if (!$discount_qty) {
                    break;
                }

                $discount = 0;

                //checking whehter product exists as "X"
                if (empty($promotion['products'])) {
                    $status = true;
                } else {
                    if (in_array($product['product_id'], $promotion['products'])) {
                        $status = true;
                    } else {
                        $status = false;
                    }
                }

                if (!in_array($promotion['discount_type'], array('buy_x_get_y_fixed', 'buy_x_get_y_percent', 'buy_x_cart_get_y_fixed', 'buy_x_cart_get_y_percent', 'pack_by_fixed', 'pack_by_percent')) && $this->config->get('special_promotions_skip_special') && $this->isSpecial($product['product_id'])) {
                    $status = false;
                }

                if ($status) {
                    if ($promotion['discount_type'] == 'n_products_fixed' || $promotion['discount_type'] == 'n_products_percent') {
                        $qty = $product['quantity'];
                        while ($qty) {
                            $products[] = $product;
                            $qty--;
                        }
                    } else if ($promotion['discount_type'] == 'buy_x_get_y_fixed' || $promotion['discount_type'] == 'buy_x_get_y_percent') {
                        if ($promotion['discount_qty'] && $product['quantity'] >= $promotion['discount_qty']) {
                            $promoted += (floor($product['quantity'] / $promotion['discount_qty']) * (empty($promotion['promo_qty']) ? 1 : $promotion['promo_qty']));

                            if ($discount_qty !== true) {
                                if ($promoted >= $discount_qty) {
                                    $promoted = $discount_qty;
                                    $discount_qty = 0;
                                }
                            }
                        } else {
                            continue;
                        }
                    }
                    $i++;
                }

                $discount_promotion += $discount;
                $key++;
            }

            //check for cart options..
            if ($promotion['discount_type'] == 'buy_x_cart_get_y_fixed' || $promotion['discount_type'] == 'buy_x_cart_get_y_percent') {
                if ($promotion['discount_option'] && $i > $promotion['discount_option']) {
                    $promoted += (floor(($i - 1) / $promotion['discount_option']) * (empty($promotion['promo_qty']) ? 1 : $promotion['promo_qty']));
                    if ($discount_qty !== true) {
                        if ($promoted >= $discount_qty) {
                            $promoted = min($discount_qty, $promoted);
                            $discount_qty = 0;
                        }
                    }
                }
            }

            //calculated product related items only
            if ($products) {
                $i = 1;
                //tax option 
                //@todo get current taxes.. 
                $include_tax = false;
                foreach ($products as $key => $product) {
                    if (!$discount_qty) {
                        break;
                    }

                    $discount = 0;
                    if ($promotion['discount_type'] == 'n_products_fixed' || $promotion['discount_type'] == 'n_products_percent') {
                        if (!($i % $promotion['discount_option'])) {
                            $qty = 0;
                            while ($qty < $promotion['discount_option']) {
                                $_product = $products[$key - ($promotion['discount_option'] - $qty - 1)];
                                if ($promotion['discount_type'] == 'n_products_fixed') {
                                    if ($include_tax) {
                                       // $discount += $this->tax->calculate($_product['price'], $_product['tax_class_id'], $include_tax) - $promotion['discount_amount'];
                                        $discount += $this->tax->calculate($_product['price'], $_product['tax_class_id'], $include_tax) - $promotion['discount'];
                                    } else {
                                        //$discount += $_product['price'] - $promotion['discount_amount'];
                                        $discount += $_product['price'] - $promotion['discount'];
                                    }
                                } else {
                                    if ($include_tax) {
                                        //$discount += $this->tax->calculate($_product['price'], $_product['tax_class_id'], $include_tax) / 100 * $promotion['discount_amount'];
                                        $discount += $this->tax->calculate($_product['price'], $_product['tax_class_id'], $include_tax) / 100 * $promotion['discount'];
                                    } else {
                                        //$discount += $_product['price'] / 100 * $promotion['discount_amount'];
                                        $discount += $_product['price'] / 100 * $promotion['discount'];
                                    }
                                }
                                if (!isset($discount_products[$_product['name']])) {
                                    $discount_products[$_product['name']] = 0;
                                }
                                $discount_products[$_product['name']] += 1;

                                if (!$include_tax && $_product['tax_class_id']) {
                                    if (version_compare(VERSION, '1.5.1.3') >= 0) {
                                        $tax_rates = $this->tax->getRates($discount, $_product['tax_class_id']);

                                        foreach ($tax_rates as $tax_rate) {
                                            if ($tax_rate['type'] == 'P') {
                                                $_taxes[$tax_rate['tax_rate_id']] -= $tax_rate['amount'];
                                            }
                                        }
                                    } else {
                                        $_taxes[$_product['tax_class_id']] -= ($_product['total'] / 100 * $this->tax->getRate($_product['tax_class_id'])) - (($_product['total'] - $discount) / 100 * $this->tax->getRate($_product['tax_class_id']));
                                    }
                                }

                                $qty++;
                            }
                            if ($discount_qty !== true) {
                                $discount_qty -= 1;
                            }
                        } else {
                            $i++;
                            continue;
                        }
                    } 

                    $discount_promotion += $discount;
                    $i++;
                }
            }



            $promoted_test = $promoted;

            if ($promoted && $promotion['promo_products']) {
                uasort($this->products_active, array($this, 'sort_asc_total'));

                foreach ($this->products_active as $product) {
                    $discount = 0;

                    if (!$promoted) {
                        break;
                    }

                    if ($promotion['discount_qty'] &&
                            ($promotion['discount_type'] == 'pack_by_fixed' || $promotion['discount_type'] == 'pack_by_percent') &&
                            (($promoted_test / (empty($promotion['promo_qty']) ? 1 : $promotion['promo_qty']) / $promotion['discount_qty']) != count($promotion['products']))) {
                        break;
                    }

                    if (in_array($product['product_id'], $promotion['promo_products'])) {
                        if ($this->config->get('special_promotions_skip_special') && $this->isSpecial($product['product_id'])) {
                            continue;
                        }

                        if ($promotion['discount_type'] == 'buy_x_get_y_fixed' || $promotion['discount_type'] == 'buy_x_cart_get_y_fixed') {
                            if ($include_tax) {
                                //$discount = ($this->tax->calculate($product['price'], $product['tax_class_id'], $include_tax) - $promotion['discount_amount']) * min($promoted, $product['quantity']);
                                $discount = ($this->tax->calculate($product['price'], $product['tax_class_id'], $include_tax) - $promotion['discount']) * min($promoted, $product['quantity']);
                            } else {
                                //[MY]
                                //$discount = ($product['price'] - $promotion['discount_amount']) * min($promoted, $product['quantity']);
                                $discount = ($product['price'] - $promotion['discount']) * min($promoted, $product['quantity']);
                                
                            }
                        } elseif ($promotion['discount_type'] == 'buy_x_get_y_percent' || $promotion['discount_type'] == 'buy_x_cart_get_y_percent') {
                            //if ($include_tax) {
                            //    $discount = $this->tax->calculate($product['price'], $product['tax_class_id'], $include_tax) / 100 * $promotion['discount_amount'] * min($promoted, $product['quantity']);
                            //} else {
                            $discount = $product['price'] / 100 * $promotion['discount'] * min($promoted, $product['quantity']);
                            // }
                        }

                        if (!isset($discount_products[$product['name']])) {
                            $discount_products[$product['name']] = 0;
                        }

                        $discount_products[$product['name']] += min($promoted, $product['quantity']);

                        $promoted -= min($promoted, $product['quantity']);
                    }

                    $discount_promotion += $discount;
                }
            }

            if ($discount_promotion) {
                $discount_data[] = array(
                    'title' => '- ' . $promotion['name'], //$promotion['name'][$this->config->get('config_language_id')],
                    'text' => $this->currency->format($discount_promotion),
                    'products' => $discount_products
                );

                $this->session->data['special_promotions'][] = $promotion['promotion_id'];
            }

            $discount_total += $discount_promotion;
        }

        //display discounted content for totals 
        if (!empty($discount_data) && $discount_data && $discount_total > 0) {

            if (count($discount_data) > 1) {
                array_unshift($discount_data, array(
                    'title' => $this->language->get('text_total_title') . '</b>',
                    'text' => $this->currency->format(-$discount_total)
                ));
            } else {
                $discount_data = array(
                    array(
                        'title' => ltrim($discount_data[0]['title'], '- '),
                        'text' => $this->currency->format(-$discount_total),
                        'products' => ($this->config->get('special_promotions_show_product_names') && isset($discount_data[0]['products'])) ? $discount_data[0]['products'] : array()
                    )
                );
            }

            $title = array();
            $text = array();
            foreach ($discount_data as $key => $discount) {
                $products_text = array();
                if (!empty($discount['products'])) {
                    $qty_test = array_values($discount['products']);
                    $qty_test = array_shift($qty_test);
                    if (count($discount['products']) || $qty_test) {
                        foreach ($discount['products'] as $name => $qty) {
                            $products_text[] = $name . ' &times; ' . $qty;
                        }
                    }
                }
                if ($key) {
                    $title[] = '<small>' . $discount['title'] . ($products_text ? ' (' . implode(', ', $products_text) . ')' : '') . '</small>';
                    $text[] = '<small>' . $discount['text'] . '</small>';
                } else {
                    if (isset($discount['products'])) {
                        $title[] = $discount['title'] . ($products_text ? ' (' . implode(', ', $products_text) . ')' : '') . ':</b>';
                    } else {
                        $title[] = $discount['title'] . ($products_text ? ' (' . implode(', ', $products_text) . ')' : '');
                    }
                    $text[] = $discount['text'];
                }
            }
            $title = implode('<br/>', $title) . '<b style=\'display:none;\'>';
            $text = implode('<br/>', $text);

            $total_data[] = array(
                'code' => 'special_promotions',
                'title' => $title,
                'text' => $text,
                'value' => -$discount_total,
                'sort_order' => $this->config->get('special_promotions_sort_order')
            );

            $total -= $discount_total;
        }
    }

    private function sort_asc_total($a, $b) {
        if ($a['total'] == $b['total']) {
            return 0;
        }
        return ($a['total'] < $b['total']) ? -1 : 1;
    }

    private function sort_asc_price($a, $b) {
        if ($a['price'] == $b['price']) {
            return 0;
        }
        return ($a['price'] < $b['price']) ? -1 : 1;
    }

    private function sort_desc_total($a, $b) {
        if ($a['total'] == $b['total']) {
            return 0;
        }
        return ($a['total'] > $b['total']) ? -1 : 1;
    }

    private function sort_desc_price($a, $b) {
        if ($a['price'] == $b['price']) {
            return 0;
        }
        return ($a['price'] > $b['price']) ? -1 : 1;
    }

    //check whether the product is a special item [by Opencart]
    private function isSpecial($product_id) {
        if ($this->customer->isLogged()) {
            $customer_group_id = $this->customer->getCustomerGroupId();
        } else {
            $customer_group_id = $this->config->get('config_customer_group_id');
        }
        $product_special_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int) $product_id . "' AND customer_group_id = '" . (int) $customer_group_id . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");
        return $product_special_query->num_rows;
    }

}

?>