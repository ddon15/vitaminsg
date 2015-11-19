<?php
class ModelSaleSummary extends Model {
	public function getDailySummary() {
		$order_query = $this->db->query("SELECT SUM(total) AS 'total', SUM(1) AS 'transactions' FROM `" . DB_PREFIX . "order` o WHERE o.date_added >= CURDATE() AND o.order_status_id != 0");
		
		if ($order_query->num_rows) {
		
			if(empty($order_query->row['total'])) {
				$total = 0;
			}
			else {
				$total = $order_query->row['total'];
			}
			
			if(empty($order_query->row['transactions'])) {
				$transactions = 0;
			}
			else {
				$transactions = (int) $order_query->row['transactions'];
			}
			
			return array(
				'total' => $total,
				'transactions' => $transactions
			);
		}
		else {
			return false;
		}
	}
}
?>