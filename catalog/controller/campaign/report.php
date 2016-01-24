<?php

class ControllerCampaignReport extends Controller {
	public function index() {
		if ($_GET['token'] !== 'v1T@m1NSG7462802C0d3rR@Nd0m1z3') {
			echo "Authentication Failed";
		} else {
			echo "Accessed";
		}
	}
}