<?php
class ControllerModuleSpecialPromotions extends Controller {

    private $product = array();
    private $products = array();

    protected function index($setting) {
        if (version_compare(VERSION, '1.5.1') >= 0) {
            static $module = 0;
            $setting['module'] = $module;
            $module++;
        } else {
            list($module, $banner_id) = explode('_', $setting);
            $setting = array(
                'banner_id' => array($banner_id),
                'module' => $module
            );
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/stylesheet/special_promotions.css')) {
            $this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/special_promotions.css');
        } else {
            $this->document->addStyle('catalog/view/theme/default/stylesheet/special_promotions.css');
        }

        $this->document->addStyle('catalog/view/javascript/special-promotions/modal.min.css');
        $this->document->addStyle('catalog/view/javascript/special-promotions/dimmer.min.css');

        $this->document->addScript('catalog/view/javascript/jquery/jquery.cycle.js');
        $this->document->addScript('catalog/view/javascript/special-promotions/modal.min.js');
        $this->document->addScript('catalog/view/javascript/special-promotions/dimmer.min.js');
        $this->document->addScript('catalog/view/javascript/special-promotions/jquery.cookie.js');

        $this->output = $this->build($setting);
    }

    public function banner() {
        $this->response->setOutput($this->build(array(
            'banner_id' => array((int)$this->request->get['sp-banner']),
            'module' => (int)$this->request->get['sp-module'],
            'route' => $this->request->get['sp-route'],
            'path' => $this->request->get['sp-path'],
            'manufacturer_id' => (int)$this->request->get['sp-manufacturer'],
            'product_id' => (int)$this->request->get['sp-product']
        )));
    }

    private function get_render() {
        return $this->render();
    }

    private function build($setting) {
        $out = '';

        $this->language->load('module/special_promotions');

        $this->data['module'] = $setting['module'];
        $this->data['button_cart'] = $this->language->get('button_cart');

        $this->load->model('module/special_promotions');
        $this->load->model('catalog/product');
        $this->load->model('tool/image');

        if ($this->customer->isLogged()) {
            $customer_group_id = $this->customer->getCustomerGroupId();
        } else {
            $customer_group_id = $this->config->get('config_customer_group_id');
        }

        if (!empty($setting['route'])) {
            $route = $setting['route'];
        } elseif (isset($this->request->get['route'])) {
            $route = (string)$this->request->get['route'];
        } else {
            $route = 'common/home';
        }

        if (!empty($setting['path'])) {
            $path = $setting['path'];
        } elseif (isset($this->request->get['path'])) {
            $path = (string)$this->request->get['path'];
        } else {
            $path = false;
        }

        if (!empty($setting['manufacturer_id'])) {
            $manufacturer_id = (int)$setting['manufacturer_id'];
        } elseif (isset($this->request->get['manufacturer_id'])) {
            $manufacturer_id = (int)$this->request->get['manufacturer_id'];
        } else {
            $manufacturer_id = false;
        }

        if (!empty($setting['product_id'])) {
            $product_id = (int)$setting['product_id'];
        } elseif (isset($this->request->get['product_id'])) {
            $product_id = (int)$this->request->get['product_id'];
        } else {
            $product_id = false;
        }

        $this->products = $this->cart->getProducts();

        $banners = $this->model_module_special_promotions->getBanners($setting['banner_id']);

        $no_modals_yet = true;

        foreach ($banners as $banner) {
            if ($this->config->get('special_promotions_dynamic_banners')) {
                if ($out) {
                    $out .= '</div>';
                }
                $out .= '<div class="special_banner_wrapper" data-route="' . $route . '" data-path="' . $path . '" data-manufacturer="' . $manufacturer_id . '" data-product="' . $product_id . '" data-module="' . (int)$this->data['module'] . '" data-banner="' . (int)$banner['banner_id'] . '">';
            }

            if (!in_array($this->config->get('config_store_id'), $banner['store'])) {
                continue;
            }

            if ($banner['logged'] && !$this->customer->getId()) {
                continue;
            }

            if (!in_array($customer_group_id, $banner['customer_group'])) {
                continue;
            }

            if (isset($banner['rule']['conditions'][0])) {
                $check = $this->check($banner['rule']['conditions'][0]);
                if (!$check) {
                    continue;
                }
            }

            if ($banner['rule_categories'] && $route == 'product/category' && $path !== false) {
                $path_array = explode('_', $path);
                if (!in_array(end($path_array), $banner['rule_categories'])) {
                    continue;
                }
            }

            if ($banner['rule_manufacturers'] && $route == 'product/manufacturer/info' && $manufacturer_id !== false) {
                if (!in_array($manufacturer_id, $banner['rule_manufacturers'])) {
                    continue;
                }
            }

            $check = false;
            if ($banner['rule_categories'] && $route == 'product/product' && $product_id !== false) {
                $categories = $this->model_catalog_product->getCategories($product_id);
                foreach ($categories as $category) {
                    if (in_array($category['category_id'], $banner['rule_categories'])) {
                        $check = true;
                        break;
                    }
                }
            } else {
                $check = true;
            }

            if (!$check) {
                continue;
            }

            if ($banner['rule_products'] && $route == 'product/product' && $product_id !== false) {
                if (!in_array($product_id, $banner['rule_products'])) {
                    continue;
                }
            }

            if ($route == 'product/product' && $product_id !== false) {
                $this->product = $this->model_catalog_product->getProduct($product_id);

                if (!empty($banner['skip_special']) && $this->product && $this->isSpecial($this->product['product_id'])) {
                    continue;
                }
            }

            if ($this->product && isset($banner['rule']['actions'][0])) {
                $check = $this->check_product($banner['rule']['actions'][0]);
                if (!$check) {
                    continue;
                }
            }

            if (!empty($banner['cart_products'])) {
                if (empty($this->products)) {
                    continue;
                }

                $check = 0;
                foreach ($this->products as $product) {
                    if (in_array($product['product_id'], $banner['cart_products'])) {
                        $check++;
                    }
                }

                if ($check != count($banner['cart_products'])) {
                    continue;
                }
            }

            $this->data['banner_type'] = (($no_modals_yet && $banner['banner_type']) ? (int)$banner['banner_type'] : 0);
            if ($this->data['banner_type']) {
                $no_modals_yet = false;
            }

            $this->data['banner_id'] = $banner['banner_id'];

            $this->data['cycle_timeout'] = ($banner['cycle_timeout'] ? (int)$banner['cycle_timeout'] : 4);
            $this->data['modal_timeout'] = (empty($banner['modal_timeout']) ? 0 : (int)$banner['modal_timeout']);
            $this->data['banners'] = array();

            foreach ($banner['banners'] as $sub_banner) {
                $sub_banner['heading_text'] = $sub_banner['heading_text'][$this->config->get('config_language_id')];
                $sub_banner['close_button_text'] = isset($sub_banner['close_button_text'][$this->config->get('config_language_id')]) ? $sub_banner['close_button_text'][$this->config->get('config_language_id')] : '';
                $sub_banner['content'] = html_entity_decode($sub_banner['content'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');

                $products = array();
                if (!empty($sub_banner['product'])) {
                    foreach ($sub_banner['product'] as $product_id) {
                        if ($this->product && $product_id == $this->product['product_id']) {
                            continue;
                        }

                        $product = $this->model_catalog_product->getProduct($product_id);

                        if ($product['image']) {
                            $image = $this->model_tool_image->resize($product['image'], $sub_banner['image_width'], $sub_banner['image_height']);
                        } else {
                            $image = false;
                        }

                        if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                            $price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
                        } else {
                            $price = false;
                        }

                        if ((float)$product['special']) {
                            $special = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')));
                        } else {
                            $special = false;
                        }

                        $products[] = array(
                            'product_id' => $product['product_id'],
                            'thumb' => $image,
                            'name' => $product['name'],
                            'price' => $price,
                            'special' => $special,
                            'href' => $this->url->link('product/product', 'product_id=' . $product['product_id'])
                        );
                    }
                    $sub_banner['product'] = array_filter($products);
                } else {
                    $sub_banner['product'] = array();
                }

                $this->data['banners'][] = $sub_banner;
            }

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/special_promotions.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/module/special_promotions.tpl';
            } else {
                $this->template = 'default/template/module/special_promotions.tpl';
            }

            $out .= $this->get_render();
        }

        if ($this->config->get('special_promotions_dynamic_banners') && $out) {
            $out .= '</div>';
        }

        return $out;
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

    private function check_product($rule) {

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
                            $result = ($result && ($rule['value'] == $this->check_product($r, $this->product)));
                            if (!$result) {
                                break;
                            }
                        }
                    } else {
                        $result = false;
                        foreach ($rule['rules'] as $r) {
                            $result = ($result || ($rule['value'] == $this->check_product($r, $this->product)));
                            if ($result) {
                                break;
                            }
                        }
                    }
                }
                break;
            case 'rule/condition_product|manufacturer_id':
                $query = $this->db->query("SELECT DISTINCT * FROM `" . DB_PREFIX . "product` WHERE product_id = '" . (int)$this->product['product_id'] . "' AND manufacturer_id = '" . (int)$rule['value'] . "'");
                $result = $this->logic($rule['operator'], ($query->row ? $query->row['manufacturer_id'] : 0), $rule['value']);
                break;
            case 'rule/condition_product|category_id':
                $query = $this->db->query("SELECT DISTINCT * FROM `" . DB_PREFIX . "product_to_category` WHERE product_id = '" . (int)$this->product['product_id'] . "' AND category_id = '" . (int)$rule['value'] . "'");
                $result = $this->logic($rule['operator'], ($query->row ? $query->row['category_id'] : 0), $rule['value']);
                break;
            default:
                $result = false;
        }

        if (strpos($rule['type'], 'rule/condition_product|attribute_') === 0) {
            list(, $attribute_id) = explode('|', $rule['type']);
            $attribute_id = (int)ltrim($attribute_id, 'attribute_');
            $attribute_groups = $this->model_catalog_product->getProductAttributes($this->product['product_id']);
            foreach ($attribute_groups as $attribute_group) {
                foreach ($attribute_group['attribute'] as $attribute) {
                    if ($attribute_id == $attribute['attribute_id']) {
                        $result = $this->logic($rule['operator'], utf8_strtolower($rule['value']), utf8_strtolower($attribute['text']));
                        break 2;
                    }
                }
            }
        }

        if (strpos($rule['type'], 'rule/condition_product|option_') === 0) {
            $product_option = $this->model_catalog_product->getProductOptions($this->product['product_id']);
            if ($product_option) {
                list(, $option_id, $type) = explode('|', $rule['type']);
                $option_id = (int)ltrim($option_id, 'option_');
                if ($type == 'select' || $type == 'radio' || $type == 'checkbox' || $type == 'image') {
                    foreach ($product_option as $option) {
                        if ($option_id == $option['option_id']) {
                            foreach ($option['option_value'] as $option_value) {
                                $result = $this->logic($rule['operator'], $option_value['option_value_id'], $rule['value']);
                                if ($result) {
                                    break 2;
                                }
                            }
                        }
                    }
                } elseif ($type == 'date' || $type == 'time' || $type == 'datetime') {
                    foreach ($product_option as $option) {
                        if ($option_id == $option['option_id']) {
                            $result = $this->logic($rule['operator'], strtotime($option['option_value']), strtotime($rule['value']));
                            break;
                        }
                    }
                } else {
                    foreach ($product_option as $option) {
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
        $product_special_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");
        return $product_special_query->num_rows;
    }

}