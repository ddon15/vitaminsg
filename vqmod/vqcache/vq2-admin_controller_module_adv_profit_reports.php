<?php
static $config = NULL;
static $log = NULL;

// Error Handler
function error_handler_for_export($errno, $errstr, $errfile, $errline) {
	global $config;
	global $log;
	
	switch ($errno) {
		case E_NOTICE:
		case E_USER_NOTICE:
			$errors = "Notice";
			break;
		case E_WARNING:
		case E_USER_WARNING:
			$errors = "Warning";
			break;
		case E_ERROR:
		case E_USER_ERROR:
			$errors = "Fatal Error";
			break;
		default:
			$errors = "Unknown";
			break;
	}
		
	if (($errors=='Warning') || ($errors=='Unknown')) {
		return true;
	}

	if ($config->get('config_error_display')) {
		echo '<b>' . $errors . '</b>: ' . $errstr . ' in <b>' . $errfile . '</b> on line <b>' . $errline . '</b>';
	}
	
	if ($config->get('config_error_log')) {
		$log->write('PHP ' . $errors . ':  ' . $errstr . ' in ' . $errfile . ' on line ' . $errline);
	}

	return true;
}


function fatal_error_shutdown_handler_for_export() {
	$last_error = error_get_last();
	if ($last_error['type'] === E_ERROR) {
		// fatal error
		error_handler_for_export(E_ERROR, $last_error['message'], $last_error['file'], $last_error['line']);
	}
}

class ControllerModuleAdvProfitReports extends Controller {
	private $error = array(); 

	public function index() {  		

	$this->data['adv_sop_current_version'] = '3.1';
            

	$this->data['adv_ppp_current_version'] = '3.1';
            

	$this->data['adv_cop_current_version'] = '3.1';
            
		$this->load->language('module/adv_profit_reports');
		
		$this->document->setTitle($this->language->get('heading_title'));

		if (isset($this->request->get['filter_category'])) {
			$this->data['filter_category'] = $this->request->get['filter_category'];
		} else {
			$this->data['filter_category'] = '0';
		}

		if (isset($this->request->get['filter_manufacturer'])) {
			$this->data['filter_manufacturer'] = $this->request->get['filter_manufacturer'];
		} else {
			$this->data['filter_manufacturer'] = '0';
		}	

		if (isset($this->request->get['filter_status'])) {
			$this->data['filter_status'] = $this->request->get['filter_status'];
		} else {
			$this->data['filter_status'] = NULL;
		}	
		
		if (isset($this->request->get['export'])) {
			$export = $this->request->get['export'] ;
		} else {
			$export = '';
		}
		
		$this->load->model('setting/setting');
		$this->load->model('report/adv_profit_reports');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if ((isset($this->request->files['upload'])) && (is_uploaded_file($this->request->files['upload']['tmp_name']))) {
				$file = $this->request->files['upload']['tmp_name'];
				if ($this->model_report_adv_profit_reports->upload($file)) {
					$this->session->data['success'] = $this->language->get('text_upload_success');
if (isset($this->request->get['keepediting'])) {
					if (!empty($this->request->get['tabselected'])) {
						$this->session->data['tabselected'] = $this->request->get['tabselected'];
					} else {
						unset($this->session->data['tabselected']);
					}
					$this->redirect('http' . (isset($this->request->server['HTTPS']) && $this->request->server['HTTPS'] != 'off' ? 's' : '') . '://' . $this->request->server['HTTP_HOST'] . substr($this->request->server['REQUEST_URI'], 0, strpos($this->request->server['REQUEST_URI'], '&amp;keepediting=true')));
				}
					$this->redirect($this->url->link('module/adv_profit_reports', 'token=' . $this->session->data['token'], 'SSL'));
				} else {
					$this->session->data['warning'] = $this->language->get('error_upload');
if (isset($this->request->get['keepediting'])) {
					if (!empty($this->request->get['tabselected'])) {
						$this->session->data['tabselected'] = $this->request->get['tabselected'];
					} else {
						unset($this->session->data['tabselected']);
					}
					$this->redirect('http' . (isset($this->request->server['HTTPS']) && $this->request->server['HTTPS'] != 'off' ? 's' : '') . '://' . $this->request->server['HTTP_HOST'] . substr($this->request->server['REQUEST_URI'], 0, strpos($this->request->server['REQUEST_URI'], '&amp;keepediting=true')));
				}
					$this->redirect($this->url->link('module/adv_profit_reports', 'token=' . $this->session->data['token'], 'SSL'));
 				}
			}	
			
			if (isset($this->request->post['adv_payment_cost_type'])) {
				$this->request->post['adv_payment_cost_type'] = serialize($this->request->post['adv_payment_cost_type']);
			}
			
			$this->model_setting_setting->editSetting('adv_profit_reports_config', $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');
			
if (isset($this->request->get['keepediting'])) {
					if (!empty($this->request->get['tabselected'])) {
						$this->session->data['tabselected'] = $this->request->get['tabselected'];
					} else {
						unset($this->session->data['tabselected']);
					}
					$this->redirect('http' . (isset($this->request->server['HTTPS']) && $this->request->server['HTTPS'] != 'off' ? 's' : '') . '://' . $this->request->server['HTTP_HOST'] . substr($this->request->server['REQUEST_URI'], 0, strpos($this->request->server['REQUEST_URI'], '&amp;keepediting=true')));
				}
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_all_zones'] = $this->language->get('text_all_zones');
		
		$this->data['tab_product_cost'] = $this->language->get('tab_product_cost');
		$this->data['tab_payment_cost'] = $this->language->get('tab_payment_cost');		
		$this->data['tab_shipping_cost'] = $this->language->get('tab_shipping_cost');
		$this->data['tab_general'] = $this->language->get('tab_general');		
		$this->data['tab_about'] = $this->language->get('tab_about');
		
		$this->data['text_all'] = $this->language->get('text_all');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');		
		$this->data['text_export'] = $this->language->get('text_export');		
		$this->data['text_import'] = $this->language->get('text_import');		
		$this->data['text_set_order_product_cost_confirm'] = $this->language->get('text_set_order_product_cost_confirm');		
		$this->data['text_set_set_order_product_cost'] = $this->language->get('text_set_set_order_product_cost');
		$this->data['text_help_request'] = $this->language->get('text_help_request');
		$this->data['text_asking_help'] = $this->language->get('text_asking_help');		
		$this->data['text_terms'] = $this->language->get('text_terms');	
		
		$this->data['error_permission'] = $this->language->get('error_permission');			
		
		$this->data['entry_import_export'] = $this->language->get('entry_import_export');
		$this->data['entry_category'] = $this->language->get('entry_category');
		$this->data['entry_manufacturer'] = $this->language->get('entry_manufacturer');	
		$this->data['entry_prod_status'] = $this->language->get('entry_prod_status');
		$this->data['entry_set_order_product_cost'] = $this->language->get('entry_set_order_product_cost');		
		
		$this->data['entry_adv_payment_cost_status'] = $this->language->get('entry_adv_payment_cost_status');		
		$this->data['entry_adv_payment_cost_total'] = $this->language->get('entry_adv_payment_cost_total');
		$this->data['entry_adv_payment_cost_payment_type'] = $this->language->get('entry_adv_payment_cost_payment_type');
		$this->data['entry_adv_payment_cost_percentage'] = $this->language->get('entry_adv_payment_cost_percentage');
		$this->data['entry_adv_payment_cost_fixed_fee'] = $this->language->get('entry_adv_payment_cost_fixed_fee');
		$this->data['entry_adv_payment_cost_geo_zone'] = $this->language->get('entry_adv_payment_cost_geo_zone');
		
		$this->data['entry_adv_shipping_cost_status'] = $this->language->get('entry_adv_shipping_cost_status');
		$this->data['entry_adv_shipping_cost_total'] = $this->language->get('entry_adv_shipping_cost_total');
		$this->data['entry_adv_shipping_cost_rate'] = $this->language->get('entry_adv_shipping_cost_rate');
		$this->data['entry_status'] = $this->language->get('entry_status');		
		$this->data['adv_sop_ext_version'] = '';
		$this->data['adv_ppp_ext_version'] = '';
		$this->data['adv_cop_ext_version'] = '';
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_export'] = $this->language->get('button_export');
		$this->data['button_import'] = $this->language->get('button_import');		
		$this->data['button_set_rder_product_cost'] = $this->language->get('button_set_rder_product_cost');		
		$this->data['button_add_payment'] = $this->language->get('button_add_payment');
		$this->data['button_remove_payment'] = $this->language->get('button_remove_payment');		
		

		$this->data['adv_cop_text_ext_name'] = $this->language->get('adv_cop_text_ext_name');
		$this->data['adv_cop_ext_name'] = $this->language->get('adv_cop_ext_name');
		$this->data['adv_cop_text_ext_version'] = $this->language->get('adv_cop_text_ext_version');
		$this->data['adv_cop_ext_version'] = $this->language->get('adv_cop_ext_version');
		$this->data['adv_cop_ext_type'] = $this->language->get('adv_cop_ext_type');
		$this->data['adv_cop_text_ext_compatibility'] = $this->language->get('adv_cop_text_ext_compatibility');
		$this->data['adv_cop_ext_compatibility'] = $this->language->get('adv_cop_ext_compatibility');
		$this->data['adv_cop_text_ext_url'] = $this->language->get('adv_cop_text_ext_url');
		$this->data['adv_cop_ext_url'] = 'http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4409';
		$this->data['adv_cop_text_ext_support'] = $this->language->get('adv_cop_text_ext_support');
		$this->data['adv_cop_ext_support'] = $this->language->get('adv_cop_ext_support');
		$this->data['adv_cop_ext_subject'] = sprintf($this->language->get('adv_cop_ext_subject'), $this->language->get('adv_cop_ext_name'));
		$this->data['adv_cop_text_ext_legal'] = $this->language->get('adv_cop_text_ext_legal');	
		$this->data['adv_cop_text_copyright'] = $this->language->get('adv_cop_text_copyright');
            

		$this->data['adv_ppp_text_ext_name'] = $this->language->get('adv_ppp_text_ext_name');
		$this->data['adv_ppp_ext_name'] = $this->language->get('adv_ppp_ext_name');
		$this->data['adv_ppp_text_ext_version'] = $this->language->get('adv_ppp_text_ext_version');
		$this->data['adv_ppp_ext_version'] = $this->language->get('adv_ppp_ext_version');
		$this->data['adv_ppp_ext_type'] = $this->language->get('adv_ppp_ext_type');
		$this->data['adv_ppp_text_ext_compatibility'] = $this->language->get('adv_ppp_text_ext_compatibility');
		$this->data['adv_ppp_ext_compatibility'] = $this->language->get('adv_ppp_ext_compatibility');
		$this->data['adv_ppp_text_ext_url'] = $this->language->get('adv_ppp_text_ext_url');
		$this->data['adv_ppp_ext_url'] = 'http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4170';
		$this->data['adv_ppp_text_ext_support'] = $this->language->get('adv_ppp_text_ext_support');
		$this->data['adv_ppp_ext_support'] = $this->language->get('adv_ppp_ext_support');
		$this->data['adv_ppp_ext_subject'] = sprintf($this->language->get('adv_ppp_ext_subject'), $this->language->get('adv_ppp_ext_name'));
		$this->data['adv_ppp_text_ext_legal'] = $this->language->get('adv_ppp_text_ext_legal');	
		$this->data['adv_ppp_text_copyright'] = $this->language->get('adv_ppp_text_copyright');
            

		$this->data['adv_sop_text_ext_name'] = $this->language->get('adv_sop_text_ext_name');
		$this->data['adv_sop_ext_name'] = $this->language->get('adv_sop_ext_name');
		$this->data['adv_sop_text_ext_version'] = $this->language->get('adv_sop_text_ext_version');
		$this->data['adv_sop_ext_version'] = $this->language->get('adv_sop_ext_version');
		$this->data['adv_sop_ext_type'] = $this->language->get('adv_sop_ext_type');
		$this->data['adv_sop_text_ext_compatibility'] = $this->language->get('adv_sop_text_ext_compatibility');
		$this->data['adv_sop_ext_compatibility'] = $this->language->get('adv_sop_ext_compatibility');
		$this->data['adv_sop_text_ext_url'] = $this->language->get('adv_sop_text_ext_url');
		$this->data['adv_sop_ext_url'] = 'http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4087';
		$this->data['adv_sop_text_ext_support'] = $this->language->get('adv_sop_text_ext_support');
		$this->data['adv_sop_ext_support'] = $this->language->get('adv_sop_ext_support');
		$this->data['adv_sop_ext_subject'] = sprintf($this->language->get('adv_sop_ext_subject'), $this->language->get('adv_sop_ext_name'));
		$this->data['adv_sop_text_ext_legal'] = $this->language->get('adv_sop_text_ext_legal');	
		$this->data['adv_sop_text_copyright'] = $this->language->get('adv_sop_text_copyright');
            
		$this->data['token'] = $this->session->data['token'];

		$this->load->model('catalog/category');		
		$this->data['categories'] = $this->model_catalog_category->getCategories(0);
		$this->load->model('catalog/manufacturer');
		$this->data['manufacturers'] = $this->model_catalog_manufacturer->getManufacturers();
		
		$this->data['url_set_order_product_cost'] = $this->url->link('module/adv_profit_reports/SetOrderProductCost', 'token=' . $this->session->data['token']);

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);			
		} else {
			$this->data['success'] = '';
		}

		if (isset($this->session->data['warning'])) {
			$this->data['warning'] = $this->session->data['warning'];
			unset($this->session->data['warning']);			
		} else {
			$this->data['warning'] = '';
		}
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		$this->data['error_vqmod'] = $this->language->get('error_vqmod');
        $this->data['vqmod_available'] = $this->VQModAvailable();
		
  		$this->data['breadcrumbs'] = array();
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false

   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/adv_profit_reports', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$this->data['action'] = $this->url->link('module/adv_profit_reports', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
	  if ($export != 'xls'){
		$this->data['payments'] = array();
		
		$this->load->model('setting/extension');

		if (isset($this->request->post['adv_payment_cost_status'])) {
			$this->data['adv_payment_cost_status'] = $this->request->post['adv_payment_cost_status'];
		} else {
			$this->data['adv_payment_cost_status'] = $this->config->get('adv_payment_cost_status');
		}
		
		$selected_payment_types = unserialize($this->config->get('adv_payment_cost_type'));
		
		if (isset($this->request->post['adv_payment_cost_type'])) {
			$this->data['adv_payment_cost_types'] = $this->request->post['adv_payment_cost_type'];
		} elseif (isset($selected_payment_types)) {
			$this->data['adv_payment_cost_types'] = $selected_payment_types;
		} else { 	
			$this->data['adv_payment_cost_types'] = array();
		}
		
		$this->load->model('localisation/geo_zone');
		$this->data['pc_geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
		
		$payment_types = $this->model_setting_extension->getInstalled('payment');

		foreach ($payment_types as $key => $code) {
			$this->load->language('payment/' . $code);
				$this->data['payment_types'][] = array(
				'name'       => $this->language->get('heading_title'),
				'paymentkey' => $code
				);
		}

		if (isset($this->request->post['adv_shipping_cost_weight_status'])) {
			$this->data['adv_shipping_cost_weight_status'] = $this->request->post['adv_shipping_cost_weight_status'];
		} else {
			$this->data['adv_shipping_cost_weight_status'] = $this->config->get('adv_shipping_cost_weight_status');
		}
		
		$sc_geo_zones = $this->model_localisation_geo_zone->getGeoZones();
		$this->data['sc_geo_zones'] = $sc_geo_zones;
		
		foreach ($sc_geo_zones as $sc_geo_zone) {
			if (isset($this->request->post['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_total']) && $this->request->post['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_total'] != '') {
				$this->data['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_total'] = $this->request->post['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_total'];
			} elseif (isset($this->request->post['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_total']) && $this->request->post['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_total'] == '') {
				$this->data['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_total'] = '';				
			} else {
				$this->data['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_total'] = $this->config->get('adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_total');
			}	

			if (isset($this->error['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_total'])) {
				$this->data['error_shipping_cost_' . $sc_geo_zone['geo_zone_id'] . '_total'] = $this->error['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_total'];
			} else {
				$this->data['error_shipping_cost_' . $sc_geo_zone['geo_zone_id'] . '_total'] = '';
			}	
			
			if (isset($this->request->post['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_rate'])) {
				$this->data['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_rate'] = $this->request->post['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_rate'];
			} else {
				$this->data['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_rate'] = $this->config->get('adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_rate');
			}		

			if (isset($this->error['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_rate'])) {
				$this->data['error_shipping_cost_' . $sc_geo_zone['geo_zone_id'] . '_rate'] = $this->error['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_rate'];
			} else {
				$this->data['error_shipping_cost_' . $sc_geo_zone['geo_zone_id'] . '_rate'] = '';
			}	
		
			if (isset($this->request->post['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_status'])) {
				$this->data['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_status'] = $this->request->post['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_status'];
			} else {
				$this->data['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_status'] = $this->config->get('adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_status');
			}
			
		}
		

		$adv_cop_check = curl_init();
 		     // Set URL to download
		curl_setopt($adv_cop_check, CURLOPT_URL,"http://opencartreports.com/version/adv_cop_version.xml");
 		    // Include header in result? (0 = yes, 1 = no)
		curl_setopt($adv_cop_check, CURLOPT_HEADER, 0);
     		// Should cURL return or print out the data? (true = return, false = print)
		curl_setopt($adv_cop_check, CURLOPT_RETURNTRANSFER, true);
 		    // Timeout in seconds
		curl_setopt($adv_cop_check, CURLOPT_TIMEOUT, 10);
 		    // Download the given URL, and return output
		$adv_cop_output = curl_exec($adv_cop_check);
    		// Close the cURL resource, and free system resources
 		curl_close($adv_cop_check);
		$adv_cop_analyse = simplexml_load_string($adv_cop_output,null);
						
		$this->data['adv_cop_version']['version'] = $adv_cop_analyse->children()->version;
		$this->data['adv_cop_version']['whats_new'] = $adv_cop_analyse->children()->whats_new;
            

		$adv_ppp_check = curl_init();
 		     // Set URL to download
		curl_setopt($adv_ppp_check, CURLOPT_URL,"http://opencartreports.com/version/adv_ppp_version.xml");
 		    // Include header in result? (0 = yes, 1 = no)
		curl_setopt($adv_ppp_check, CURLOPT_HEADER, 0);
     		// Should cURL return or print out the data? (true = return, false = print)
		curl_setopt($adv_ppp_check, CURLOPT_RETURNTRANSFER, true);
 		    // Timeout in seconds
		curl_setopt($adv_ppp_check, CURLOPT_TIMEOUT, 10);
 		    // Download the given URL, and return output
		$adv_ppp_output = curl_exec($adv_ppp_check);
    		// Close the cURL resource, and free system resources
 		curl_close($adv_ppp_check);
		$adv_ppp_analyse = simplexml_load_string($adv_ppp_output,null);
						
		$this->data['adv_ppp_version']['version'] = $adv_ppp_analyse->children()->version;
		$this->data['adv_ppp_version']['whats_new'] = $adv_ppp_analyse->children()->whats_new;
            

		$adv_sop_check = curl_init();
 		     // Set URL to download
		curl_setopt($adv_sop_check, CURLOPT_URL,"http://opencartreports.com/version/adv_sop_version.xml");
 		    // Include header in result? (0 = yes, 1 = no)
		curl_setopt($adv_sop_check, CURLOPT_HEADER, 0);
     		// Should cURL return or print out the data? (true = return, false = print)
		curl_setopt($adv_sop_check, CURLOPT_RETURNTRANSFER, true);
 		    // Timeout in seconds
		curl_setopt($adv_sop_check, CURLOPT_TIMEOUT, 10);
 		    // Download the given URL, and return output
		$adv_sop_output = curl_exec($adv_sop_check);
    		// Close the cURL resource, and free system resources
 		curl_close($adv_sop_check);
		$adv_sop_analyse = simplexml_load_string($adv_sop_output,null);
						
		$this->data['adv_sop_version']['version'] = $adv_sop_analyse->children()->version;
		$this->data['adv_sop_version']['whats_new'] = $adv_sop_analyse->children()->whats_new;
            
		$this->template = 'module/adv_profit_reports.tpl';

		$this->children = array(
			'common/header',
			'common/footer',
		);	
		
		$this->response->setOutput($this->render());
		
	  } elseif ($export == 'xls') {	  
		$this->model_report_adv_profit_reports->createXLS($this->data['filter_category'], $this->data['filter_manufacturer'], $this->data['filter_status']);
	  }
	}
	
	private function validate() {
		$this->data['error_numeric_value'] = $this->language->get('error_numeric_value');
		$this->data['error_shipping_cost_total'] = $this->language->get('error_shipping_cost_total');
		$this->data['error_shipping_cost_rate'] = $this->language->get('error_shipping_cost_rate');
		
		if (!$this->user->hasPermission('modify', 'module/adv_profit_reports')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		$this->load->model('localisation/geo_zone');
		$sc_geo_zones = $this->model_localisation_geo_zone->getGeoZones();
		
		foreach ($sc_geo_zones as $sc_geo_zone) {
    		if (isset($this->request->post['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_total']) && (!preg_match('/^[0-9.]*$/', $this->request->post['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_total']))) {
      			$this->error['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_total'] = $this->language->get('error_numeric_value');
    		}

    		if (isset($this->request->post['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_total']) && ($this->request->post['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_status'] == '1') && (!preg_match('/^[0-9.]/', $this->request->post['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_total']))) {
      			$this->error['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_total'] = $this->language->get('error_numeric_value');
    		}
		
    		if (isset($this->request->post['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_rate']) && (!preg_match('/^[0-9,.:]*$/', $this->request->post['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_rate']))) {
      			$this->error['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_rate'] = $this->language->get('error_shipping_cost_rate');
    		}
			
    		if (isset($this->request->post['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_rate']) && ($this->request->post['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_status'] == '1') && (!preg_match('/^[0-9,.:]/', $this->request->post['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_rate']))) {
      			$this->error['adv_shipping_cost_weight_' . $sc_geo_zone['geo_zone_id'] . '_rate'] = $this->language->get('error_shipping_cost_rate');
    		}			
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	public function install(){
		// Insert DB columns
		$query = $this->db->query("DESC `" . DB_PREFIX . "product` cost_additional");
			if (!$query->num_rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "product` ADD `cost_additional` decimal(15,4) NOT NULL DEFAULT '0.0000' AFTER `price`;");
			}

		$query = $this->db->query("DESC `" . DB_PREFIX . "product` cost_percentage");
			if (!$query->num_rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "product` ADD `cost_percentage` decimal(15,2) NOT NULL DEFAULT '0.00' AFTER `price`;");
			}

		$query = $this->db->query("DESC `" . DB_PREFIX . "product` cost_amount");
			if (!$query->num_rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "product` ADD `cost_amount` decimal(15,4) NOT NULL DEFAULT '0.0000' AFTER `price`;");
			}
			
		$query = $this->db->query("DESC `" . DB_PREFIX . "product` cost");
			if (!$query->num_rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "product` ADD `cost` decimal(15,4) NOT NULL DEFAULT '0.0000' AFTER `price`;");
			}

		$query = $this->db->query("DESC `" . DB_PREFIX . "product_option_value` cost_prefix");
			if (!$query->num_rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_option_value` ADD `cost_prefix` varchar(1) COLLATE utf8_bin NOT NULL AFTER `price`;");
			}	
			
		$query = $this->db->query("DESC `" . DB_PREFIX . "product_option_value` cost");
			if (!$query->num_rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_option_value` ADD `cost` decimal(15,4) NOT NULL DEFAULT '0.0000' AFTER `price`;");
			}	
			
		$query = $this->db->query("DESC `" . DB_PREFIX . "order_product` cost");
			if (!$query->num_rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "order_product` ADD `cost` decimal(15,4) NOT NULL DEFAULT '0.0000';");
			}
			
		$query = $this->db->query("DESC `" . DB_PREFIX . "order` shipping_cost");
			if (!$query->num_rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "order` ADD `shipping_cost` decimal(15,4) NOT NULL DEFAULT '0.0000' AFTER `shipping_method`;");
			}

		$query = $this->db->query("DESC `" . DB_PREFIX . "order` payment_cost");
			if (!$query->num_rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "order` ADD `payment_cost` decimal(15,4) NOT NULL DEFAULT '0.0000' AFTER `payment_method`;");
			}	

		// Optimize all tables
		//$alltables = mysql_query("SHOW TABLES");
		//while ($table = mysql_fetch_assoc($alltables)) {
		//	foreach ($table as $db => $tablename) {
		//		mysql_query("OPTIMIZE TABLE `" . $tablename . "`")
		//		or die(mysql_error());
		//	}
		//}
		
		// Add indexes
		$query = $this->db->query("SHOW KEYS FROM `" . DB_PREFIX . "order_product` WHERE Key_name != 'PRIMARY';");
			if (!$query->rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "order_product` ADD INDEX (product_id,total,cost,price,tax,quantity);");
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "order_product` ADD INDEX (order_id);");
			}	
			
		$query = $this->db->query("SHOW KEYS FROM `" . DB_PREFIX . "order_total` WHERE Key_name != 'PRIMARY' AND Key_name != 'idx_orders_total_orders_id';");
			if (!$query->rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "order_total` ADD INDEX (order_id,value,code);");
			}	
			
		$query = $this->db->query("SHOW KEYS FROM `" . DB_PREFIX . "order_option` WHERE Key_name != 'PRIMARY';");
			if (!$query->rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "order_option` ADD INDEX (order_product_id,type,name,product_option_value_id);");
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "order_option` ADD INDEX (order_id);");
			}
			
		$query = $this->db->query("SHOW KEYS FROM `" . DB_PREFIX . "order_history` WHERE Key_name != 'PRIMARY';");
			if (!$query->rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "order_history` ADD INDEX (order_status_id);");
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "order_history` ADD INDEX (order_id);");
			}
			
		$query = $this->db->query("SHOW KEYS FROM `" . DB_PREFIX . "order` WHERE Key_name != 'PRIMARY';");
			if (!$query->rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "order` ADD INDEX (customer_id,date_added,total,email,firstname,lastname,payment_company);");
			}

		$query = $this->db->query("SHOW KEYS FROM `" . DB_PREFIX . "product` WHERE Key_name != 'PRIMARY';");
			if (!$query->rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "product` ADD INDEX (product_id,model,sku,manufacturer_id,sort_order,status);");
			}	

		$query = $this->db->query("SHOW KEYS FROM `" . DB_PREFIX . "category` WHERE Key_name != 'PRIMARY';");
			if (!$query->rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "category` ADD INDEX (category_id,parent_id);");
			}	

		$query = $this->db->query("SHOW KEYS FROM `" . DB_PREFIX . "option` WHERE Key_name != 'PRIMARY';");
			if (!$query->rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "option` ADD INDEX (sort_order);");
			}
			
		$query = $this->db->query("SHOW KEYS FROM `" . DB_PREFIX . "option_description` WHERE Key_name != 'PRIMARY';");
			if (!$query->rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "option_description` ADD INDEX (name);");
			}	

		$query = $this->db->query("SHOW KEYS FROM `" . DB_PREFIX . "option_value` WHERE Key_name != 'PRIMARY';");
			if (!$query->rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "option_value` ADD INDEX (option_id,sort_order);");
			}

		$query = $this->db->query("SHOW KEYS FROM `" . DB_PREFIX . "option_value_description` WHERE Key_name != 'PRIMARY';");
			if (!$query->rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "option_value_description` ADD INDEX (option_id,name);");
			}

		$query = $this->db->query("SHOW KEYS FROM `" . DB_PREFIX . "product_option` WHERE Key_name != 'PRIMARY';");
			if (!$query->rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_option` ADD INDEX (product_id,option_id);");
			}

		$query = $this->db->query("SHOW KEYS FROM `" . DB_PREFIX . "product_option_value` WHERE Key_name != 'PRIMARY';");
			if (!$query->rows) {
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_option_value` ADD INDEX (product_id,option_id,option_value_id,quantity,price,cost);");
				$this->db->query("ALTER TABLE `" . DB_PREFIX . "product_option_value` ADD INDEX (product_option_id);");
			}
		
		$this->load->model('user/user_group');
		$this->model_user_user_group->addPermission($this->user->getId(), 'access', 'module/adv_profit_reports');
		$this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'module/adv_profit_reports');		
	}
	
	public function uninstall(){
		$this->load->model('setting/setting');
		$this->model_setting_setting->deleteSetting('adv_profit_reports');
		$this->model_setting_setting->deleteSetting('adv_profit_reports_config');
		
		$this->load->model('setting/extension');
		$this->model_setting_extension->uninstall('module', 'adv_profit_reports');
	}
	
	public function SetOrderProductCost() {
		if (!$this->user->hasPermission('modify', 'module/adv_profit_reports')) {
			$this->load->language('module/adv_profit_reports');			
			$this->session->data['warning'] = $this->language->get('error_permission');
if (isset($this->request->get['keepediting'])) {
					if (!empty($this->request->get['tabselected'])) {
						$this->session->data['tabselected'] = $this->request->get['tabselected'];
					} else {
						unset($this->session->data['tabselected']);
					}
					$this->redirect('http' . (isset($this->request->server['HTTPS']) && $this->request->server['HTTPS'] != 'off' ? 's' : '') . '://' . $this->request->server['HTTP_HOST'] . substr($this->request->server['REQUEST_URI'], 0, strpos($this->request->server['REQUEST_URI'], '&amp;keepediting=true')));
				}
			$this->redirect($this->url->link('module/adv_profit_reports', 'token=' . $this->session->data['token'], 'SSL'));			
		} else {
			$query = $this->db->query("SELECT product_id, cost FROM `" . DB_PREFIX . "product` WHERE status = 1");
			foreach ($query->rows as $result) {
				$this->db->query("UPDATE `" . DB_PREFIX . "order_product` op SET op.cost = '" . (float)$result['cost'] . "' + IFNULL((SELECT SUM(pov.cost) FROM `" . DB_PREFIX . "order_option` oo, `" . DB_PREFIX . "product_option_value` pov WHERE op.product_id = '" . (int)$result['product_id'] . "' AND op.order_product_id = oo.order_product_id AND oo.product_option_id = pov.product_option_id AND oo.product_option_value_id = pov.product_option_value_id),0) WHERE op.product_id = '" . (int)$result['product_id'] . "' AND op.cost = '0.0000' OR op.cost IS NULL");
			}
			$this->load->language('module/adv_profit_reports');
			$this->session->data['success'] = $this->language->get('text_set_order_product_cost_success');	
if (isset($this->request->get['keepediting'])) {
					if (!empty($this->request->get['tabselected'])) {
						$this->session->data['tabselected'] = $this->request->get['tabselected'];
					} else {
						unset($this->session->data['tabselected']);
					}
					$this->redirect('http' . (isset($this->request->server['HTTPS']) && $this->request->server['HTTPS'] != 'off' ? 's' : '') . '://' . $this->request->server['HTTP_HOST'] . substr($this->request->server['REQUEST_URI'], 0, strpos($this->request->server['REQUEST_URI'], '&amp;keepediting=true')));
				}
			$this->redirect($this->url->link('module/adv_profit_reports', 'token=' . $this->session->data['token'], 'SSL'));
		}	
	}
	
	private function VQModAvailable() {
		if (class_exists('VQModObject')) {
			return true;
		}
		return false;
	}	
}
?>