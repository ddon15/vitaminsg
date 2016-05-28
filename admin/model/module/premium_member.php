<?php
class ModelModulePremiumMember extends Model
{
	public function install()
	{
		$this->db->query("
			CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "premium_member` (
			  `premium_member_id` int(11) NOT NULL AUTO_INCREMENT,
			  `customer_id` int(11) NOT NULL,
			  `email` varchar(96) NOT NULL,
			  `created` DATETIME NOT NULL,
			  `modified` DATETIME NOT NULL,
			  `expiry` DATETIME NOT NULL,
			  PRIMARY KEY (`premium_member_id`)
			) ENGINE=MyISAM DEFAULT COLLATE=utf8_general_ci;");
			
		$this->db->query("
			CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "premium_member_paypal` (
			  `premium_member_paypal_id` int(11) NOT NULL AUTO_INCREMENT,
			  `premium_member_id` int(11) NOT NULL,
			  `created` DATETIME NOT NULL,
			  `capture_status` ENUM('Complete','NotComplete') DEFAULT NULL,
			  `currency_code` CHAR(3) NOT NULL,
			  `transaction_id` CHAR(20) NOT NULL,
			  `receipt_id` CHAR(20) NOT NULL,
			  `payment_type` ENUM('none','echeck','instant', 'refund', 'void') DEFAULT NULL,
			  `payment_status` CHAR(20) NOT NULL,
			  `pending_reason` CHAR(50) NOT NULL,
			  `transaction_entity` CHAR(50) NOT NULL,
			  `amount` DECIMAL( 10, 2 ) NOT NULL,
			  `debug_data` TEXT NOT NULL,
			  PRIMARY KEY (`premium_member_paypal_id`)
			) ENGINE=MyISAM DEFAULT COLLATE=utf8_general_ci;");
	}
}