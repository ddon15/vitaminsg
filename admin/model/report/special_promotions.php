<?php
class ModelReportSpecialPromotions extends Model {
    public function getOrders($data = array()) {
        $sql = "SELECT MIN(tmp.date_added) AS date_start, MAX(tmp.date_added) AS date_end, COUNT(tmp.order_id) AS `orders`, SUM(tmp.products) AS products, SUM(tmp.tax) AS tax, SUM(tmp.total) AS total, SUM(tmp.discounted) AS discounted FROM (SELECT o.order_id, (SELECT SUM(op.quantity) FROM `" . DB_PREFIX . "order_product` op WHERE op.order_id = o.order_id GROUP BY op.order_id) AS products, (SELECT SUM(ot.value) FROM `" . DB_PREFIX . "order_total` ot WHERE ot.order_id = o.order_id AND ot.code = 'tax' GROUP BY ot.order_id) AS tax, o.total, o.date_added, sps.amount AS discounted FROM `" . DB_PREFIX . "sp_promotion_stats` sps LEFT JOIN `" . DB_PREFIX . "order` o ON (sps.order_id = o.order_id)";

        if (!empty($data['filter_promotion_id'])) {
            $sql .= " WHERE sps.promotion_id = '" . (int)$data['filter_promotion_id'] . "'";
        } else {
            $sql .= " WHERE sps.promotion_id > '0'";
        }

        if (!empty($data['filter_date_start'])) {
            $sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
        }

        if (!empty($data['filter_date_end'])) {
            $sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
        }

        $sql .= " GROUP BY o.order_id) tmp";

        if (!empty($data['filter_group'])) {
            $group = $data['filter_group'];
        } else {
            $group = 'week';
        }

        switch($group) {
            case 'day';
                $sql .= " GROUP BY DAY(tmp.date_added)";
                break;
            default:
            case 'week':
                $sql .= " GROUP BY WEEK(tmp.date_added)";
                break;
            case 'month':
                $sql .= " GROUP BY MONTH(tmp.date_added)";
                break;
            case 'year':
                $sql .= " GROUP BY YEAR(tmp.date_added)";
                break;
        }

        $sql .= " ORDER BY tmp.date_added DESC";

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getTotalOrders($data = array()) {
        if (!empty($data['filter_group'])) {
            $group = $data['filter_group'];
        } else {
            $group = 'week';
        }

        switch($group) {
            case 'day';
                $sql = "SELECT COUNT(DISTINCT DAY(o.date_added)) AS total FROM `" . DB_PREFIX . "sp_promotion_stats` sps LEFT JOIN `" . DB_PREFIX . "order` o ON (sps.order_id = o.order_id)";
                break;
            default:
            case 'week':
                $sql = "SELECT COUNT(DISTINCT WEEK(o.date_added)) AS total FROM `" . DB_PREFIX . "sp_promotion_stats` sps LEFT JOIN `" . DB_PREFIX . "order` o ON (sps.order_id = o.order_id)";
                break;
            case 'month':
                $sql = "SELECT COUNT(DISTINCT MONTH(o.date_added)) AS total FROM `" . DB_PREFIX . "sp_promotion_stats` sps LEFT JOIN `" . DB_PREFIX . "order` o ON (sps.order_id = o.order_id)";
                break;
            case 'year':
                $sql = "SELECT COUNT(DISTINCT YEAR(o.date_added)) AS total FROM `" . DB_PREFIX . "sp_promotion_stats` sps LEFT JOIN `" . DB_PREFIX . "order` o ON (sps.order_id = o.order_id)";
                break;
        }

        if (!empty($data['filter_promotion_id'])) {
            $sql .= " WHERE promotion_id = '" . (int)$data['filter_promotion_id'] . "'";
        } else {
            $sql .= " WHERE promotion_id > '0'";
        }

        if (!empty($data['filter_date_start'])) {
            $sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
        }

        if (!empty($data['filter_date_end'])) {
            $sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function getPromotions() {
        $query = $this->db->query("SELECT `promotion_id`, `name` FROM `" . DB_PREFIX . "sp_promotion` ORDER BY `name` ASC");

        return $query->rows;
    }
}