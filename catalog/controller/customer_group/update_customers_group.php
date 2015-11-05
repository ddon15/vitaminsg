<?php
class ControllerCustomerGroupUpdateCustomersGroup extends Controller {
    public function index() {
        $this->load->model('customer_group/update_customers_group');
        $update_customers_group = $this->model_customer_group_update_customers_group->update_customers_group();
        if($update_customers_group) {
            echo "<br />Update success.";
        }
        else {
            echo "Update fail.";
        }
    }
}