<?php
class ModelCustomerGroupUpdateCustomersGroup extends Model {
    public function update_customers_group() {
        $query = "SELECT pm.premium_member_id, pm.customer_id, pm.expiry, c.customer_group_id, COUNT(pm.customer_id) as num, CONCAT(c.firstname, ' ', c.lastname) as name FROM `" . DB_PREFIX . "premium_member` pm LEFT JOIN `" . DB_PREFIX . "customer` c ON (c.customer_id = pm.customer_id) LEFT JOIN `" . DB_PREFIX . "order` o ON (o.customer_id = c.customer_id) WHERE c.customer_id != '' AND c.status = 1 AND c.approved = 1 AND (c.customer_group_id = 2 OR c.customer_group_id = 3) AND pm.expiry < NOW() GROUP BY pm.customer_id";

        $get_customers = $this->db->query($query);

        if(count($get_customers->rows) > 0) {
            echo "The following customers has been converted due to membership have expired:<br /><br />";
            foreach($get_customers->rows as $one_customer) {
                if($one_customer['num'] >= 2) {
                    $get_success_orders = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order` WHERE customer_id = '" . $one_customer['customer_id'] . "' AND (order_status_id = 1 OR order_status_id = 5)");

                    if (count($get_success_orders->rows) >= 2) {
                        $query = "UPDATE `" . DB_PREFIX . "customer` SET customer_group_id = '1' WHERE customer_id = '" . $one_customer['customer_id'] . "'";
                    }
                    else {
                        $query = "UPDATE `" . DB_PREFIX . "customer` SET customer_group_id = '1' WHERE customer_id = '" . $one_customer['customer_id'] . "'";
                    }

                }
                else {
                    $query = "UPDATE `" . DB_PREFIX . "customer` SET customer_group_id = '1' WHERE customer_id = '" . $one_customer['customer_id'] . "'";
                }
                //update customer member group
                $update_customer = $this->db->query($query);

                echo "Customer id : " . $one_customer['customer_id'] . " (" . $one_customer['name'] . ")<br />";

                if(!$update_customer) {
                    return false;
                }
            }

            return true;

        }
        else {
            echo "No customer is converted.<br />";
            return true;
        }
    }
}