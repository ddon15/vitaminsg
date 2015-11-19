<?php
class ModelShippingSpecialPromotions extends Model {
    function getQuote($address) {
        $this->language->load('shipping/special_promotions');

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('special_promotions_shipping_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

        if (!$this->config->get('special_promotions_shipping_geo_zone_id')) {
            $status = true;
        } elseif ($query->num_rows) {
            $status = true;
        } else {
            $status = false;
        }

        if (empty($this->session->data['special_promotions_shipping'])) {
            $status = false;
        }

        $method_data = array();

        if ($status) {
            $quote_data = array();

            $quote_data['special_promotions'] = array(
                'code'         => 'special_promotions.special_promotions',
                'title'        => $this->language->get('text_description'),
                'cost'         => 0.00,
                'tax_class_id' => 0,
                'text'         => $this->currency->format(0.00)
            );

            $method_data = array(
                'code'       => 'special_promotions',
                'title'      => $this->language->get('text_title'),
                'quote'      => $quote_data,
                'sort_order' => $this->config->get('special_promotions_shipping_sort_order'),
                'error'      => false
            );
        }

        return $method_data;
    }
}