<?php

/**
 * Created by PhpStorm.
 * User: Desktop
 * Date: 16/7/2015
 * Time: 12:22 PM
 */
class ModelModuleFreeMember extends Model
{
    public function install()
    {
        $this->db->query("
			CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "claim_code` (
			  `claim_code_id` int(11) NOT NULL AUTO_INCREMENT,
			  `claim_code` varchar(20) NOT NULL,
			  `description` varchar(255) NOT NULL,
			  `max_usage` int(11) NOT NULL,
			  `start_date` DATETIME NOT NULL,
			  `end_date` DATETIME NOT NULL,
			  `expiry` varchar(20),
			  `created` DATETIME NOT NULL,
			  `modified` DATETIME NOT NULL,
			  PRIMARY KEY (`claim_code_id`)
			) ENGINE=MyISAM DEFAULT COLLATE=utf8_general_ci;");

        $query = $this->db->query("SELECT COUNT(*) AS COL_EXISTS FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '".DB_DATABASE."' AND TABLE_NAME = '".DB_PREFIX."premium_member' AND COLUMN_NAME = 'claim_code'");
        if($query->rows[0]["COL_EXISTS"]==0){
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "premium_member` ADD `claim_code` VARCHAR(20);");
        }
    }

    public function addClaimCode($data)
    {
        $this->db->query("INSERT INTO " . DB_PREFIX . "claim_code SET claim_code = '" . $this->db->escape($data['freemember_claim_code'])
            . "', description = '" . $this->db->escape($data['freemember_code_description'])
            . "', max_usage = '" . $this->db->escape($data['freemember_max_usage'])
            . "', start_date = '" . $this->db->escape($data['freemember_start_date'])
            . "', end_date = '" . $this->db->escape($data['freemember_start_date'])
            . "', expiry = '" . $this->db->escape($data['freemember_expiry'])
            . "', created = NOW(), modified = NOW()");
    }

    public function updateClaimCode($data)
    {
        $this->db->query("UPDATE " . DB_PREFIX . "claim_code SET description = '" . $this->db->escape($data['freemember_code_description'])
            . "', max_usage = '" . $this->db->escape($data['freemember_max_usage'])
            . "', expiry = '" . $this->db->escape($data['freemember_expiry'])
            . "', start_date = '" . $this->db->escape($data['freemember_start_date'])
            . "', end_date = '" . $this->db->escape(date("Y-m-d 23:59:59",strtotime($data['freemember_end_date'])))
            . "', modified = NOW() WHERE claim_code_id=" . $data['claim_code_id']);
    }

    public function deleteClaimCode($claim_code_id)
    {
        $this->db->query("DELETE FROM " . DB_PREFIX . "claim_code WHERE claim_code_id=" . $claim_code_id);
    }

    public function checkClaimCode($claim_code)
    {
        $sql = "SELECT COUNT(*) AS NUMCODES FROM " . DB_PREFIX . "claim_code WHERE claim_code='" . $claim_code . "'";
        $result = $this->db->query($sql);
        return ($result->rows[0]["NUMCODES"] > 0);
    }

    public function getClaimCode($claim_code_id)
    {
        $sql = "SELECT claim_code_id, claim_code, description, max_usage, expiry, start_date, end_date, created, modified, (select count(*) from " . DB_PREFIX . "premium_member where claim_code=cc.claim_code) as `usage` FROM " .
            DB_PREFIX . "claim_code cc WHERE claim_code_id=" . $claim_code_id;
        $query = $this->db->query($sql);

        return $query->rows[0];
    }

    public function getClaimCodes($data = array(), $getCount)
    {
        $sql = "SELECT " . ($getCount ? "count(*)" : "claim_code_id, claim_code, description, max_usage, start_date, end_date, created, (select count(*) from " . DB_PREFIX . "premium_member where claim_code=cc.claim_code) as `usage`") . " FROM " . DB_PREFIX . "claim_code cc";

        $implode = array();

        if (!empty($data['filter_claim_code'])) {
            $implode[] = "claim_code LIKE '%" . $this->db->escape($data['filter_claim_code']) . "%'";
        }

        if (!empty($data['filter_claim_description'])) {
            $implode[] = "description LIKE '%" . $this->db->escape($data['filter_claim_description']) . "%'";
        }

        if (!empty($data['filter_max_usage'])) {
            $implode[] = "max_usage= " . $this->db->escape($data['filter_max_usage']);
        }

        if ((!empty($data['filter_start_date']) && ($data['filter_start_date'] != undefined))) {
            $implode[] = "DATE(start_date) = DATE('" . $this->db->escape($data['filter_start_date']) . "')";
        }

        if ((!empty($data['filter_end_date']) && ($data['filter_end_date'] != undefined))) {
            $implode[] = "DATE(end_date) = DATE('" . $this->db->escape($data['filter_end_date']) . "')";
        }

        if ((!empty($data['filter_date_added']) && ($data['filter_date_added'] != undefined))) {
            $implode[] = "DATE(created) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
        }

        if ($implode) {
            $sql .= " WHERE " . implode(" AND ", $implode);
        }

        $sort_data = array(
            'claim_code',
            'description',
            'max_usage',
            'start_date',
            'end_date',
            'created'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY claim_code";
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

            if (!$getCount) {
                $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
            }
        }

        $query = $this->db->query($sql);
//        echo $sql;

        return $query->rows;
    }
}