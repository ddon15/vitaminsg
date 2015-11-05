<?php

class ModelTotalSpecialPromotions extends Model {

    private $products;
    private $products_active;

    public function getTotal(&$total_data, &$total, &$taxes) {
        if ($this->config->get('special_promotions_key') && $this->config->get('special_promotions_status')) {

            $include_tax = $this->config->get('special_promotions_include_tax') && $this->config->get('config_tax');

            $this->load->model('checkout/special_promotions');

            $promotions = $this->model_checkout_special_promotions->getPromotions();

            $discount_data = array();
            $this->session->data['special_promotions_select'] = array();

            $discount_total = 0;

            if (isset($this->session->data['special_promotions_shipping'])) {
                unset($this->session->data['special_promotions_shipping']);
            }

            $this->products = $this->cart->getProducts();

            uasort($this->products, array($this, 'sort_desc_total'));

            $this->session->data['special_promotions'] = array();

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

            foreach ($promotions as $promotion) {
                $discount_products = array();

                $discount_promotion = 0;

                if (!in_array($this->config->get('config_store_id'), $promotion['store'])) {
                    continue;
                }

                if (!in_array($customer_group_id, $promotion['customer_group'])) {
                    continue;
                }

                if ($this->config->get('special_promotions_ci_coupons')) {
                    $promotion['coupon_code'] = utf8_strtolower($promotion['coupon_code']);
                }

                if ($promotion['coupon_type'] && !in_array($promotion['coupon_code'], $coupons)) {
                    continue;
                }

                if ($promotion['logged'] && !$this->customer->getId()) {
                    continue;
                }

                if ($promotion['uses_total'] > 0) {
                    $sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "sp_promotion_stats` sps WHERE sps.promotion_id = '" . (int) $promotion['promotion_id'] . "'";

                    if ($promotion['uses_total_day']) {
                        $sql .= " AND sps.date_added = NOW()";
                    }

                    $promotion_stats_query = $this->db->query($sql);
                    if ($promotion_stats_query->row['total'] >= $promotion['uses_total']) {
                        continue;
                    }
                }

                if ($promotion['uses_customer'] > 0 && $this->customer->getId()) {
                    $sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "sp_promotion_stats` sps WHERE sps.promotion_id = '" . (int) $promotion['promotion_id'] . "' AND sps.customer_id = '" . (int) $this->customer->getId() . "'";

                    if ($promotion['uses_customer_day']) {
                        $sql .= " AND sps.date_added = NOW()";
                    }

                    $promotion_stats_query = $this->db->query($sql);
                    if ($promotion_stats_query->row['total'] >= $promotion['uses_customer']) {
                        continue;
                    }
                }

                $this->language->load('total/special_promotions');

                if (isset($promotion['rule']['conditions'][0])) {
                    $check = $this->check($promotion['rule']['conditions'][0]);
                    if (!$check) {
                        continue;
                    }
                }

                $discount_qty = $promotion['discount_qty'] ? $promotion['discount_qty'] : true;

                $i = 1;
                $promoted = 0;

                $this->products_active = array();
                
                foreach ($this->products as $key => $product) {
                    if (empty($promotion['products'])) {
                        $status = true;
                        $this->load->model('catalog/clearance_products');
                        if ($this->model_catalog_clearance_products->checkProductOnClearance($product['product_id'])) {
                            
                                 $status = false;
                             }
                        if ($product['is_on_sale']) {
                             	$status = false;
                             }
                    } else {
                        if (in_array($product['product_id'], $promotion['products'])) {
                            $status = true;
                           
                            $this->load->model('catalog/clearance_products');
                            if ($this->model_catalog_clearance_products->checkProductOnClearance($product['product_id'])) {
                            
                                 $status = false;
                             }
                            
                            if ($product['is_on_sale']) {
                             	$status = false;
                             }
                        } else {
                            $status = false;
                        }
                    }
                    
                    //exclusion products
                    if(in_array($product['product_id'],$promotion['exclusion_products'])){
                        $status = false;
                    }
                    //exclusion manufacturers
                    $product_manufacturer = $this->model_catalog_product->getProductPlain($product['product_id']);
                    $product['manufacturer_id'] = $product_manufacturer['manufacturer_id'];
                    
                    if(in_array($product['manufacturer_id'],$promotion['exclusion_manufacturers'])){
                        $status = false;
                    }
                    
                    if (!in_array($promotion['discount_type'], array('buy_x_get_y_fixed', 'buy_x_get_y_percent', 'buy_x_cart_get_y_fixed', 'buy_x_cart_get_y_percent', 'pack_by_fixed', 'pack_by_percent'))) {
                        if ($this->config->get('special_promotions_skip_special') && $this->isSpecial($product['product_id'])) {
                            $status = false;
                        }
                    } else {
                        $status = true;
                    }

                    if ($status && isset($promotion['rule']['actions'][0])) {
                        $status = $this->check($promotion['rule']['actions'][0], $product);
                    }

                    if ($status) {
                        $this->products_active[$key] = $product;
                    }
                }

                $sub_total = 0;
                foreach ($this->products_active as $product) {
                    if (!($this->config->get('special_promotions_skip_special') && $this->isSpecial($product['product_id']))) {
                        $sub_total += $product['total'];
                    }
                }

                if ($promotion['discount_type'] == 'by_fixed') {
                    $promotion['discount_amount'] = min($promotion['discount_amount'], $sub_total);
                } elseif ($promotion['discount_type'] == 'get_y_for_each_x_spent') {
                    if ($promotion['discount_option'] && ($sub_total / $promotion['discount_option']) >= 1) {
                        $promotion['discount_amount'] = $promotion['discount_amount'] * floor($sub_total / $promotion['discount_option']);
                    } else {
                        continue;
                    }
                }

                if (($discount_qty !== true && ($promotion['discount_type'] == 'by_fixed' || $promotion['discount_type'] == 'by_percent'))) {
                    uasort($this->products_active, array($this, 'sort_asc_price'));
                }

                if ($promotion['discount_type'] == 'n_products_fixed' || $promotion['discount_type'] == 'n_products_percent') {
                    uasort($this->products_active, array($this, 'sort_asc_price'));
                } elseif ($promotion['discount_type'] == 'each_cart_n_fixed' || $promotion['discount_type'] == 'each_cart_n_percent') {
                    if ($promotion['ignore_item_qty']) {
                        uasort($this->products_active, array($this, 'sort_asc_total'));
                    } else {
                        uasort($this->products_active, array($this, 'sort_asc_price'));
                    }
                } elseif ($promotion['discount_type'] == 'after_cart_n_fixed' || $promotion['discount_type'] == 'after_cart_n_percent') {
                    if ($promotion['ignore_item_qty']) {
                        uasort($this->products_active, array($this, 'sort_desc_total'));
                    } else {
                        uasort($this->products_active, array($this, 'sort_desc_price'));
                    }
                }

                $products = array();
                $keys = array_keys($this->products_active);
                $key = 0;
                $min_quantity = 0;

                $_taxes = $taxes;

                foreach ($this->products_active as $product) {

                    //[MY]very hackish . fix for premium product pricing
                    $this->load->model('catalog/product');

                    $product_model = $this->model_catalog_product->getProductPlain($product['product_id']);
                    if ($this->isSpecial($product['product_id'])) {
                        $product['price'] = $product_model['price'] * 0.8;
                    }

                    $tax_calcualted = false;

                    if (!$discount_qty) {
                        break;
                    }

                    $discount = 0;

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

                    if ($status && isset($promotion['rule']['actions'][0])) {
                        $status = $this->check($promotion['rule']['actions'][0], $product);
                    }

                    if ($status) {
                        if ($promotion['discount_type'] == 'by_fixed' || $promotion['discount_type'] == 'get_y_for_each_x_spent') {
                            if ($include_tax) {
                                $discount = $promotion['discount_amount'] * ($this->tax->calculate($product['price'], $product['tax_class_id'], $include_tax) * ($discount_qty !== true ? min($discount_qty, $product['quantity']) : $product['quantity']) / $sub_total);
                            } else {
                                $discount = $promotion['discount_amount'] * ($product['price'] * ($discount_qty !== true ? min($discount_qty, $product['quantity']) : $product['quantity']) / $sub_total);
                            }
                            if ($discount_qty !== true) {
                                if (!isset($discount_products[$product['name']])) {
                                    $discount_products[$product['name']] = 0;
                                }
                                $discount_products[$product['name']] += ($discount_qty !== true ? min($discount_qty, $product['quantity']) : $product['quantity']);
                                $discount_qty -= min($discount_qty, $product['quantity']);
                            }
                        } elseif ($promotion['discount_type'] == 'by_percent') {
                            if ($include_tax) {
                                $discount = $this->tax->calculate($product['price'], $product['tax_class_id'], $include_tax) * ($discount_qty !== true ? min($discount_qty, $product['quantity']) : $product['quantity']) / 100 * $promotion['discount_amount'];
                            } else {
                            	//[MY]
                            	//orig

                                if ($this->customer->isLogged()) {
                                    $premium_member_price = $this->model_catalog_product->getPremiumMemberPrice($product['product_id']);
                            	
                                    if(!empty($premium_member_price)){            
                                            if ($this->isSpecial($product['product_id'])) {
                                                $discount = $product['usual_price'] * $promotion['discount_amount'] / 100;
                                                $member_price = $product['usual_price'] * 0.9;
                                                $a = $product['usual_price'] - $discount;
                                                if ($member_price - $a > 0) {
                                                    $discount = $member_price - $a;
                                                    $discount *= $product['quantity'];
                                                } else
                                                    $discount = 0;
                                            }else {
                                                $promotion['discount_amount'] -=10;
	                            	$discount = $product['usual_price'] * ($discount_qty !== true ? min($discount_qty, $product['quantity']) : $product['quantity']) / 100 * $promotion['discount_amount'];
                                                //echo "<br/>using on special.. ". $product['product_id'];
                                            }
                                    }
                                  } else {
	                                $discount = $product['price'] * ($discount_qty !== true ? min($discount_qty, $product['quantity']) : $product['quantity']) / 100 * $promotion['discount_amount'];
	                        	}
							}
                            if ($discount_qty !== true) {
                                if (!isset($discount_products[$product['name']])) {
                                    $discount_products[$product['name']] = 0;
                                }
                                $discount_products[$product['name']] += ($discount_qty !== true ? min($discount_qty, $product['quantity']) : $product['quantity']);
                                $discount_qty -= min($discount_qty, $product['quantity']);
                            }
                        } elseif ($promotion['discount_type'] == 'n_products_fixed' || $promotion['discount_type'] == 'n_products_percent') {
                            $qty = $product['quantity'];
                            while ($qty) {
                                $products[] = $product;
                                $qty--;
                            }
                            $tax_calcualted = true;
                        } elseif ($promotion['discount_type'] == 'each_n_fixed' || $promotion['discount_type'] == 'each_n_percent') {
                            if ($promotion['discount_option'] && ($product['quantity'] / $promotion['discount_option']) >= 1) {
                                if ($promotion['discount_type'] == 'each_n_fixed') {
                                    if ($include_tax) {
                                        $discount = ($this->tax->calculate($product['price'], $product['tax_class_id'], $include_tax) - $promotion['discount_amount']) * floor($discount_qty !== true ? min($discount_qty, ($product['quantity'] / $promotion['discount_option'])) : ($product['quantity'] / $promotion['discount_option']));
                                    } else {
                                        $discount = ($product['price'] - $promotion['discount_amount']) * floor($discount_qty !== true ? min($discount_qty, ($product['quantity'] / $promotion['discount_option'])) : ($product['quantity'] / $promotion['discount_option']));
                                    }
                                } else {
                                    if ($include_tax) {
                                        $discount = $this->tax->calculate($product['price'], $product['tax_class_id'], $include_tax) / 100 * $promotion['discount_amount'] * floor($discount_qty !== true ? min($discount_qty, ($product['quantity'] / $promotion['discount_option'])) : ($product['quantity'] / $promotion['discount_option']));
                                    } else {
                                        $discount = $product['price'] / 100 * $promotion['discount_amount'] * floor($discount_qty !== true ? min($discount_qty, ($product['quantity'] / $promotion['discount_option'])) : ($product['quantity'] / $promotion['discount_option']));
                                    }
                                }
                                if (!isset($discount_products[$product['name']])) {
                                    $discount_products[$product['name']] = 0;
                                }

                                $discount_products[$product['name']] += floor($discount_qty !== true ? min($discount_qty, ($product['quantity'] / $promotion['discount_option'])) : ($product['quantity'] / $promotion['discount_option']));
                                if ($discount_qty !== true) {
                                    $discount_qty -= min($discount_qty, $product['quantity']);
                                }
                            } else {
                                continue;
                            }
                        } elseif ($promotion['discount_type'] == 'each_cart_n_fixed' || $promotion['discount_type'] == 'each_cart_n_percent') {
                            if ($promotion['ignore_item_qty']) {
                                if (!($i % $promotion['discount_option'])) {
                                    $_product = $this->products_active[$keys[$key - ($promotion['discount_option'] - 1)]];

                                    if ($promotion['discount_type'] == 'each_cart_n_fixed') {
                                        if ($include_tax) {
                                            $discount = ($this->tax->calculate($_product['price'], $_product['tax_class_id'], $include_tax) - $promotion['discount_amount']) * ($discount_qty !== true ? min($discount_qty, $_product['quantity']) : $_product['quantity']);
                                        } else {
                                            $discount = ($_product['price'] - $promotion['discount_amount']) * ($discount_qty !== true ? min($discount_qty, $_product['quantity']) : $_product['quantity']);
                                        }
                                    } else {
                                        if ($include_tax) {
                                            $discount = $this->tax->calculate($_product['price'], $_product['tax_class_id'], $include_tax) * ($discount_qty !== true ? min($discount_qty, $_product['quantity']) : $_product['quantity']) / 100 * $promotion['discount_amount'];
                                        } else {
                                            $discount = $_product['price'] * ($discount_qty !== true ? min($discount_qty, $_product['quantity']) : $_product['quantity']) / 100 * $promotion['discount_amount'];
                                        }
                                    }
                                    if (!isset($discount_products[$_product['name']])) {
                                        $discount_products[$_product['name']] = 0;
                                    }
                                    $discount_products[$_product['name']] += ($discount_qty !== true ? min($discount_qty, $_product['quantity']) : $_product['quantity']);
                                    if ($discount_qty !== true) {
                                        $discount_qty -= min($discount_qty, $_product['quantity']);
                                    }

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

                                    $tax_calcualted = true;
                                } else {
                                    $i++;
                                    $key++;
                                    continue;
                                }
                            } else {
                                $qty = $product['quantity'];
                                while ($qty) {
                                    $products[] = $product;
                                    $qty--;
                                }
                                $tax_calcualted = true;
                            }
                        } elseif ($promotion['discount_type'] == 'after_n_fixed' || $promotion['discount_type'] == 'after_n_percent') {
                            if ($product['quantity'] > $promotion['discount_option']) {
                                if ($promotion['discount_type'] == 'after_n_fixed') {
                                    if ($include_tax) {
                                        $discount = ($this->tax->calculate($product['price'], $product['tax_class_id'], $include_tax) - $promotion['discount_amount']) * ($discount_qty !== true ? min($discount_qty, floor($product['quantity'] - $promotion['discount_option'])) : floor($product['quantity'] - $promotion['discount_option']));
                                    } else {
                                        $discount = ($product['price'] - $promotion['discount_amount']) * ($discount_qty !== true ? min($discount_qty, floor($product['quantity'] - $promotion['discount_option'])) : floor($product['quantity'] - $promotion['discount_option']));
                                    }
                                } else {
                                    if ($include_tax) {
                                        $discount = $this->tax->calculate($product['price'], $product['tax_class_id'], $include_tax) / 100 * $promotion['discount_amount'] * ($discount_qty !== true ? min($discount_qty, floor($product['quantity'] - $promotion['discount_option'])) : floor($product['quantity'] - $promotion['discount_option']));
                                    } else {
                                        $discount = $product['price'] / 100 * $promotion['discount_amount'] * ($discount_qty !== true ? min($discount_qty, floor($product['quantity'] - $promotion['discount_option'])) : floor($product['quantity'] - $promotion['discount_option']));
                                    }
                                }
                                if (!isset($discount_products[$product['name']])) {
                                    $discount_products[$product['name']] = 0;
                                }
                                $discount_products[$product['name']] += ($discount_qty !== true ? min($discount_qty, floor($product['quantity'] - $promotion['discount_option'])) : floor($product['quantity'] - $promotion['discount_option']));
                                if ($discount_qty !== true) {
                                    $discount_qty -= min($discount_qty, floor($product['quantity'] - $promotion['discount_option']));
                                }
                            } else {
                                continue;
                            }
                        } elseif ($promotion['discount_type'] == 'after_cart_n_fixed' || $promotion['discount_type'] == 'after_cart_n_percent') {
                            if ($promotion['ignore_item_qty']) {
                                if ($i > $promotion['discount_option']) {
                                    if ($promotion['discount_type'] == 'after_cart_n_fixed') {
                                        if ($include_tax) {
                                            $discount = ($this->tax->calculate($product['price'], $product['tax_class_id'], $include_tax) - $promotion['discount_amount']) * ($discount_qty !== true ? min($discount_qty, $product['quantity']) : $product['quantity']);
                                        } else {
                                            $discount = ($product['price'] - $promotion['discount_amount']) * ($discount_qty !== true ? min($discount_qty, $product['quantity']) : $product['quantity']);
                                        }
                                    } else {
                                        if ($include_tax) {
                                            $discount = $this->tax->calculate($product['price'], $product['tax_class_id'], $include_tax) / 100 * $promotion['discount_amount'] * ($discount_qty !== true ? min($discount_qty, $product['quantity']) : $product['quantity']);
                                        } else {
                                            $discount = $product['price'] / 100 * $promotion['discount_amount'] * ($discount_qty !== true ? min($discount_qty, $product['quantity']) : $product['quantity']);
                                        }
                                    }
                                    if (!isset($discount_products[$product['name']])) {
                                        $discount_products[$product['name']] = 0;
                                    }
                                    $discount_products[$product['name']] += ($discount_qty !== true ? min($discount_qty, $product['quantity']) : $product['quantity']);
                                    if ($discount_qty !== true) {
                                        $discount_qty -= min($discount_qty, $product['quantity']);
                                    }
                                } else {
                                    $i++;
                                    continue;
                                }
                            } else {
                                $qty = $product['quantity'];
                                while ($qty) {
                                    $products[] = $product;
                                    $qty--;
                                }
                                $tax_calcualted = true;
                            }
                        } elseif ($promotion['discount_type'] == 'buy_x_get_y_fixed' || $promotion['discount_type'] == 'buy_x_get_y_percent') {
                            if ($promotion['discount_option'] && $product['quantity'] >= $promotion['discount_option']) {
                                $promoted += (floor($product['quantity'] / $promotion['discount_option']) * (empty($promotion['promo_qty']) ? 1 : $promotion['promo_qty']));
                                if ($discount_qty !== true) {
                                    if ($promoted >= $discount_qty) {
                                        $promoted = $discount_qty;
                                        $discount_qty = 0;
                                    }
                                }
                            } else {
                                continue;
                            }
                        } elseif ($promotion['discount_type'] == 'buy_x_cart_get_y_fixed' || $promotion['discount_type'] == 'buy_x_cart_get_y_percent') {
                            if ($promotion['ignore_item_qty']) {
                                $i++;
                            } else {
                                $i += $product['quantity'];
                            }
                            continue;
                        } elseif ($promotion['discount_type'] == 'pack_by_fixed' || $promotion['discount_type'] == 'pack_by_percent') {
                            if ($promotion['discount_option'] && $product['quantity'] >= $promotion['discount_option']) {
                                $min_quantity = $min_quantity ? min($min_quantity, $product['quantity']) : $product['quantity'];
                                $promoted += $promotion['discount_option'] * (empty($promotion['promo_qty']) ? 1 : $promotion['promo_qty']);
                            } else {
                                continue;
                            }
                        }

                        if (!$include_tax && !$tax_calcualted && $product['tax_class_id']) {
                            if (version_compare(VERSION, '1.5.1.3') >= 0) {
                                $tax_rates = $this->tax->getRates($discount, $product['tax_class_id']);

                                foreach ($tax_rates as $tax_rate) {
                                    if ($tax_rate['type'] == 'P') {
                                        $_taxes[$tax_rate['tax_rate_id']] -= $tax_rate['amount'];
                                    }
                                }
                            } else {
                                $_taxes[$product['tax_class_id']] -= ($product['total'] / 100 * $this->tax->getRate($product['tax_class_id'])) - (($product['total'] - $discount) / 100 * $this->tax->getRate($product['tax_class_id']));
                            }
                        }

                        $i++;
                    }

                    $discount_promotion += $discount;
                    
                    $key++;
                }


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

                if ($products) {
                    $i = 1;
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
                                            $discount += $this->tax->calculate($_product['price'], $_product['tax_class_id'], $include_tax) - $promotion['discount_amount'];
                                        } else {
                                            $discount += $_product['price'] - $promotion['discount_amount'];
                                        }
                                    } else {
                                        if ($include_tax) {
                                            $discount += $this->tax->calculate($_product['price'], $_product['tax_class_id'], $include_tax) / 100 * $promotion['discount_amount'];
                                        } else {
                                            $discount += $_product['price'] / 100 * $promotion['discount_amount'];
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
                        } elseif ($promotion['discount_type'] == 'each_cart_n_fixed' || $promotion['discount_type'] == 'each_cart_n_percent') {
                            if (!($i % $promotion['discount_option'])) {
                                $_product = $products[$key - ($promotion['discount_option'] - 1)];
                                if ($promotion['discount_type'] == 'each_cart_n_fixed') {
                                    if ($include_tax) {
                                        $discount = $this->tax->calculate($_product['price'], $_product['tax_class_id'], $include_tax) - $promotion['discount_amount'];
                                    } else {
                                        $discount = $_product['price'] - $promotion['discount_amount'];
                                    }
                                } else {
                                    if ($include_tax) {
                                        $discount = $this->tax->calculate($_product['price'], $_product['tax_class_id'], $include_tax) / 100 * $promotion['discount_amount'];
                                    } else {
                                        $discount = $_product['price'] / 100 * $promotion['discount_amount'];
                                    }
                                }
                                if (!isset($discount_products[$_product['name']])) {
                                    $discount_products[$_product['name']] = 0;
                                }
                                $discount_products[$_product['name']] += 1;
                                if ($discount_qty !== true) {
                                    $discount_qty -= 1;
                                }
                            } else {
                                $i++;
                                continue;
                            }

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
                        } elseif ($promotion['discount_type'] == 'after_cart_n_fixed' || $promotion['discount_type'] == 'after_cart_n_percent') {
                            if ($i > $promotion['discount_option']) {
                                if ($promotion['discount_type'] == 'after_cart_n_fixed') {
                                    if ($include_tax) {
                                        $discount = $this->tax->calculate($product['price'], $product['tax_class_id'], $include_tax) - $promotion['discount_amount'];
                                    } else {
                                        $discount = $product['price'] - $promotion['discount_amount'];
                                    }
                                } else {
                                    if ($include_tax) {
                                        $discount = $this->tax->calculate($product['price'], $product['tax_class_id'], $include_tax) / 100 * $promotion['discount_amount'];
                                    } else {
                                        $discount = $product['price'] / 100 * $promotion['discount_amount'];
                                    }
                                }
                                if (!isset($discount_products[$product['name']])) {
                                    $discount_products[$product['name']] = 0;
                                }
                                $discount_products[$product['name']] += 1;
                                if ($discount_qty !== true) {
                                    $discount_qty -= 1;
                                }
                            } else {
                                $i++;
                                continue;
                            }

                            if (!$include_tax && $product['tax_class_id']) {
                                if (version_compare(VERSION, '1.5.1.3') >= 0) {
                                    $tax_rates = $this->tax->getRates($discount, $product['tax_class_id']);

                                    foreach ($tax_rates as $tax_rate) {
                                        if ($tax_rate['type'] == 'P') {
                                            $_taxes[$tax_rate['tax_rate_id']] -= $tax_rate['amount'];
                                        }
                                    }
                                } else {
                                    $_taxes[$product['tax_class_id']] -= ($product['total'] / 100 * $this->tax->getRate($product['tax_class_id'])) - (($product['total'] - $discount) / 100 * $this->tax->getRate($product['tax_class_id']));
                                }
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

                        //[MY] very hackish
                        $this->load->model('catalog/product');
                        $product_model = $this->model_catalog_product->getProductPlain($product['product_id']);

                        //[MY] coupon fixes
                        if ($this->isSpecial($product['product_id'])) {
                            // $product['price'] = $product_model['price'] * 0.8;    
                        }

                        $discount = 0;

                        if (!$promoted) {
                            break;
                        }

                        if ($promotion['discount_option'] &&
                                ($promotion['discount_type'] == 'pack_by_fixed' || $promotion['discount_type'] == 'pack_by_percent') &&
                                (($promoted_test / (empty($promotion['promo_qty']) ? 1 : $promotion['promo_qty']) / $promotion['discount_option']) != count($promotion['products']))) {
                            break;
                        }

                        if (in_array($product['product_id'], $promotion['promo_products'])) {
                            if ($this->config->get('special_promotions_skip_special') && $this->isSpecial($product['product_id'])) {
                                continue;
                            }

                            if ($promotion['discount_type'] == 'buy_x_get_y_fixed' || $promotion['discount_type'] == 'buy_x_cart_get_y_fixed') {
                                if ($include_tax) {
                                    $discount = ($this->tax->calculate($product['price'], $product['tax_class_id'], $include_tax) - $promotion['discount_amount']) * min($promoted, $product['quantity']);
                                } else {
                                    $discount = ($product['price'] - $promotion['discount_amount']) * min($promoted, $product['quantity']);
                                }
                            } elseif ($promotion['discount_type'] == 'pack_by_fixed') {
                                if ($discount_qty !== true) {
                                    $to_promote = min($discount_qty, floor(min($product['quantity'], $min_quantity * (empty($promotion['promo_qty']) ? 1 : $promotion['promo_qty'])) / $promotion['discount_option']));
                                } else {
                                    $to_promote = floor(min($product['quantity'], $min_quantity * (empty($promotion['promo_qty']) ? 1 : $promotion['promo_qty'])) / $promotion['discount_option']);
                                }
                                if ($include_tax) {
                                    $discount = ($this->tax->calculate($product['price'], $product['tax_class_id'], $include_tax) - $promotion['discount_amount']) * $to_promote;
                                } else {
                                    $discount = ($product['price'] - $promotion['discount_amount']) * $to_promote;
                                }
                            } elseif ($promotion['discount_type'] == 'buy_x_get_y_percent' || $promotion['discount_type'] == 'buy_x_cart_get_y_percent') {
                                if ($include_tax) {
                                    $discount = $this->tax->calculate($product['usual_price'], $product['tax_class_id'], $include_tax) / 100 * $promotion['discount_amount'] * min($promoted, $product['quantity']);
                                } else {
                                    //[MY] if logged in users promotional rebate fix
                                    if ($this->customer->isLogged()) {
                                        $this->load->model('catalog/product');
                                        $premium_member_price = $this->model_catalog_product->getPremiumMemberPrice($product['product_id']);
                                    	
                                        if(!empty($premium_member_price)){
                                         if ($this->isSpecial($product['product_id'])) {
                            				 $product['price'] = $product_model['price'] * 0.8;    
                            				 $discount = $product['price'] / 100 * $promotion['discount_amount'] * min($promoted, $product['quantity']);
                            				 
                                             //   $prox = $promotion['discount_amount'] - 10;
                                             //   $discount2 = $product['usual_price'] / 100 * $prox * min($promoted, $product['quantity']);
                                            } else {
                        					$promotion['discount_amount'] -=10;
                        					 $discount = $product['usual_price'] / 100 * $promotion['discount_amount'] * min($promoted, $product['quantity']);
                        				}
                                        }else{
                                            
                                                $discount = $product['price'] / 100 * $promotion['discount_amount'] * min($promoted, $product['quantity']);
                                        }
                                    } else {
                                        $discount = $product['price'] / 100 * $promotion['discount_amount'] * min($promoted, $product['quantity']);
                                    }
                                }
                            } elseif ($promotion['discount_type'] == 'pack_by_percent') {
                                if ($discount_qty !== true) {
                                    $to_promote = min($discount_qty, floor(min($product['quantity'], $min_quantity * (empty($promotion['promo_qty']) ? 1 : $promotion['promo_qty'])) / $promotion['discount_option']));
                                } else {
                                    $to_promote = floor(min($product['quantity'], $min_quantity * (empty($promotion['promo_qty']) ? 1 : $promotion['promo_qty'])) / $promotion['discount_option']);
                                }
                                if ($include_tax) {
                                	
                                    $discount = $this->tax->calculate($product['price'], $product['tax_class_id'], $include_tax) / 100 * $promotion['discount_amount'] * $to_promote;
                                } else {
                                    $discount = $product['price'] / 100 * $promotion['discount_amount'] * $to_promote;
                                    
                                }
                            }

                            if (!isset($discount_products[$product['name']])) {
                                $discount_products[$product['name']] = 0;
                            }

                            if ($promotion['discount_type'] == 'pack_by_fixed' || $promotion['discount_type'] == 'pack_by_percent') {
                                $discount_products[$product['name']] += $to_promote;

                                $promoted -= min($promoted, $promotion['discount_option']);
                            } else {
                                $discount_products[$product['name']] += min($promoted, $product['quantity']);

                                $promoted -= min($promoted, $product['quantity']);
                            }

                            if (!$include_tax && $product['tax_class_id']) {
                                if (version_compare(VERSION, '1.5.1.3') >= 0) {
                                    $tax_rates = $this->tax->getRates($discount, $product['tax_class_id']);

                                    foreach ($tax_rates as $tax_rate) {
                                        if ($tax_rate['type'] == 'P') {
                                            $_taxes[$tax_rate['tax_rate_id']] -= $tax_rate['amount'];
                                        }
                                    }
                                } else {
                                    $_taxes[$product['tax_class_id']] -= ($product['total'] / 100 * $this->tax->getRate($product['tax_class_id'])) - (($product['total'] - $discount) / 100 * $this->tax->getRate($product['tax_class_id']));
                                }
                            }
                        }

                        $discount_promotion += $discount;
                    }
                }

                if ($this->config->get('special_promotions_select_promotion')) {
                    $this->session->data['special_promotions_select'][] = array(
                        'promotion_id' => $promotion['promotion_id'],
                        'name' => $promotion['label'][$this->config->get('config_language_id')]
                    );

                    if (empty($this->session->data['special_promotions_selected']) || $this->session->data['special_promotions_selected'] != $promotion['promotion_id']) {
                        continue;
                    }
                }

                $taxes = $_taxes;

                if ($discount_promotion) {
                    $discount_data[] = array(
                        'title' => '- ' . $promotion['label'][$this->config->get('config_language_id')],
                        'text' => $this->currency->format($discount_promotion),
                        'products' => $discount_products
                    );

                    $this->session->data['special_promotions'][] = $promotion['promotion_id'];
                }

                if ($promotion['free_shipping'] && empty($this->session->data['special_promotions_shipping'])) {
                    $this->session->data['special_promotions_shipping'] = true;
                }

                $discount_total += $discount_promotion;

                if ($promotion['stop_rules_processing']) {
                    break;
                }
            }

            if ($discount_data && $discount_total > 0) {

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
                    if ($this->config->get('special_promotions_show_product_names') && !empty($discount['products'])) {
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

                //[MY] for free shipping fix
                $this->session->data['promotions_discount_total'] = $discount_total;
            }
        }
    }

    public function confirm($order_info, $order_total) {
        if (!empty($this->session->data['special_promotions_shipping'])) {
            unset($this->session->data['special_promotions_shipping']);
        }

        if (!empty($this->session->data['special_promotions_select'])) {
            unset($this->session->data['special_promotions_select']);
        }

        if (!empty($this->session->data['special_promotions_selected'])) {
            unset($this->session->data['special_promotions_selected']);
        }

        if (!empty($this->session->data['special_promotions'])) {
            $this->load->model('checkout/special_promotions');
            foreach ($this->session->data['special_promotions'] as $promotion_id) {
                $promotion_info = $this->model_checkout_special_promotions->getPromotion($promotion_id);
                if ($promotion_info) {
                    $this->model_checkout_special_promotions->stat($promotion_info['promotion_id'], $order_info['order_id'], $order_info['customer_id'], $order_total['value']);
                }
            }
            unset($this->session->data['special_promotions']);
        }
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
                                $result = ($result && $this->check($r, $product));
                                if (!$result) {
                                    break;
                                }
                            }
                        } else {
                            $result = false;
                            foreach ($rule['rules'] as $r) {
                                $result = ($result || $this->check($r, $product));
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
                    $result = $rule['value'] ? !empty($found) : empty($found);
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
                    $sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "customer` WHERE customer_id = '" . (int) $this->customer->getId() . "' AND ";
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
                    $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id = '5' AND customer_id = '" . (int) $this->customer->getId() . "'");
                    $result = $this->logic($rule['operator'], $query->row['total'], $rule['value']);
                }
                break;
            case 'rule/condition_orders|sales_amount':
                if ($this->customer->isLogged()) {
                    $query = $this->db->query("SELECT SUM(total) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id = '5' AND customer_id = '" . (int) $this->customer->getId() . "'");
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
                $query = $this->db->query("SELECT DISTINCT * FROM `" . DB_PREFIX . "product` WHERE product_id = '" . (int) $data['product_id'] . "' AND manufacturer_id = '" . (int) $rule['value'] . "'");
                $result = $this->logic($rule['operator'], ($query->row ? $query->row['manufacturer_id'] : 0), $rule['value']);
                break;
            case 'rule/condition_cart_product|category_id':
                $query = $this->db->query("SELECT DISTINCT * FROM `" . DB_PREFIX . "product_to_category` WHERE product_id = '" . (int) $data['product_id'] . "' AND category_id = '" . (int) $rule['value'] . "'");
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
            $attribute_id = (int) ltrim($attribute_id, 'attribute_');
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
                $option_id = (int) ltrim($option_id, 'option_');
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

    private function isSpecial($product_id) {
        if ($this->customer->isLogged()) {
            $customer_group_id = $this->customer->getCustomerGroupId();
        } else {
            $customer_group_id = $this->config->get('config_customer_group_id');
        }
        $product_special_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int) $product_id . "' AND customer_group_id = '" . (int) $customer_group_id . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");
        return $product_special_query->num_rows;
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

}
