<?php
class ModelReportAdvProfitReports extends Model {
	public function getProductCostPriceQuantity($start, $limit, &$count, $categoryfilter, $manufacturerfilter, $statusfilter, $sort) {
		global $keepsort;
		global $keepdir;
		$total = 0;
		$product_data = array();

		if ($start < 0) {
			$start = 0;
		}
		
		if ($limit < 1) {
			$limit = 20;
		}
		
			$sql = "SELECT p.product_id, p.quantity AS quantity, pd.name, p.model, p.sku, p.price, p.subtract, p.cost FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (pd.product_id = p.product_id)";

		if ($categoryfilter != 0) {
			$sql .= " LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON (p.product_id = ptc.product_id)";
		}
			
			$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
			
		if ($categoryfilter != 0) {
			$sql .= " AND ptc.category_id = '" . (int)$categoryfilter . "'";
		}			
			
		if ($manufacturerfilter != 0) {
			$sql .= " AND p.manufacturer_id = '" . (int)$manufacturerfilter . "'";
		}

		if ($statusfilter != '*') {
			$sql .= " AND p.status = '" . (int)$statusfilter . "'";
		}
		
			$sql .= " ORDER BY p.quantity ASC";
		
			$query = $this->db->query($sql);
		
		foreach ($query->rows as $result) {
			$product_quantity = $result['quantity'];
			$product_id = $result['product_id'];
			$product_name = $result['name'];

			$product_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY o.sort_order");
		
			foreach ($product_option_query->rows as $product_option) {
				if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox') {
					
					$product_option_value_data = array();			
					$product_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_id = '" . (int)$product_id . "' AND pov.product_option_id = '" . (int)$product_option['product_option_id'] . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY ov.sort_order");
				
					foreach ($product_option_value_query->rows as $product_option_value) {
						if ($product_option_value['subtract'] == 1) {
							$subtract = 'Y';
							$product_quantity = $product_quantity + (int)$product_option_value['quantity'];
							$option_quantity = $product_option_value['quantity'];
						} else {
							$subtract = 'N';
							$option_quantity = 1;
						}
				
						$price = ($product_option_value['price_prefix'] == "+" ? floatval($product_option_value['price']): floatval($product_option_value['price']));
						
						$product_data[] = array(
							'id'			=> $product_option_value['product_id'],
							'option_id'		=> $product_option_value['product_option_value_id'],
							'name'			=> $product_name,
							'option'		=> $product_option_value['name'],								
							'sku'			=> $result['sku'],
							'model'			=> $result['model'],							
							'totalquantity'	=> 0,
							'quantity'		=> $option_quantity,
							'price'			=> $price,
							'cost'			=> $product_option_value['cost'],
							'subtract'		=> $subtract
						);
					
					}
				
				}
			}
		
			if ($result['subtract'] == 1) {
				$subtract = 'Y';
			} else {
				$subtract = 'N';
			}
			
			$product_data[] = array(
				'id'    		=> $result['product_id'],
				'option_id' 	=> '0',
				'name'    		=> $result['name'],
				'option'		=> '',
				'sku'  			=> $result['sku'],
				'model'  		=> $result['model'],				
				'totalquantity' => $product_quantity,
				'quantity' 		=> $result['quantity'],
				'price'   		=> $result['price'],
				'cost'   		=> $result['cost'],
				'subtract' 		=> $subtract
			);
		}
		
		$count =  count($product_data); 
		$quantity = array();
		global $keepsort;
		global $keepdir;

		if ($sort == '') {
			$sort = 'name';
			$direction =SORT_ASC;
		} else {
			$direction =  substr($sort,-1) == 'a' ?  SORT_ASC : SORT_DESC;
			$sort = substr($sort,0,strlen($sort)-1);
		}
		
   		foreach ($product_data as $product) {
    		$quantity[] = $product[$sort];
   		}
		
		$array_lowercase = array_map('strtolower', $quantity);
		array_multisort($array_lowercase, $direction, $product_data);
		$return_data = array_slice($product_data, ($start - 1) * $limit  , $limit);
		
		return $return_data;
	}	
	
	function uploadProducts(&$reader, &$database) {
		$data = $reader->getSheet(0);
		$products = array();
		$product = array();
		$isFirstRow = TRUE;
		$i = 0;
		$k = $data->getHighestRow();
		for ($i=0; $i<$k; $i+=1) {
			$j = 1;
			if ($isFirstRow) {
				$isFirstRow = FALSE;
				continue;
			}
			
			$productId = trim($this->getCell($data,$i,$j++));
			$optionsId = trim($this->getCell($data,$i,$j++));
			$name = $this->getCell($data,$i,$j++);
			$name = htmlentities($name, ENT_QUOTES, $this->detect_encoding($name));
			$option = $this->getCell($data,$i,$j++);
			$option = htmlentities($option, ENT_QUOTES, $this->detect_encoding($option));			
			$sku = $this->getCell($data,$i,$j++,'   ');
			$model = $this->getCell($data,$i,$j++,'   ');			
			$subtract = $this->getCell($data,$i,$j++,'true');
			$quantity = $this->getCell($data,$i,$j++,'0');
			$price = str_replace(",","",$this->getCell($data,$i,$j++,'0.0000'));
			$cost = str_replace(",","",$this->getCell($data,$i,$j++,'0.0000'));
			
			$product = array();
			$product['product_id'] = $productId;
			$product['option_id'] = $optionsId;
			$product['name'] = $name;
			$product['option'] = $option;			
			$product['sku'] = $sku;
			$product['model'] = $model;			
			$product['subtract'] = $subtract;
			$product['quantity'] = $quantity;
			$product['price'] = $price;
			$product['cost'] = $cost;
			$products[$i] = $product;
		}
		
		foreach ($products as $product) {
		   $subtract = strtoupper($product['subtract']) == 'Y' ? 1 : 0;
			
			if ($product['option_id'] != 0) { //update item at option level
				$this->db->query("UPDATE ".DB_PREFIX."product_option_value SET quantity=" .$product['quantity']. ", price=".(float)$product['price'].", cost=".$product['cost'].", subtract=".$subtract."  WHERE product_option_value_id=" .$product['option_id'].";");
			} else { //update item at product level
				$this->db->query("UPDATE ".DB_PREFIX."product SET quantity=".$product['quantity'].", price=".(float)$product['price'].", cost=".$product['cost'].", cost_amount=".$product['cost'].", subtract=".$subtract." WHERE  product_id=".$product['product_id'].";");
			}
		}
		
		return TRUE;
	}
	
	function getCell(&$worksheet,$row,$col,$default_val='') {
		$col -= 1; // we use 1-based, PHPExcel uses 0-based column index
		$row += 1; // we use 0-based, PHPExcel used 1-based row index
		return ($worksheet->cellExistsByColumnAndRow($col,$row)) ? $worksheet->getCellByColumnAndRow($col,$row)->getValue() : $default_val;
	}
	
	protected function detect_encoding($str) {
		// auto detect the character encoding of a string
		return mb_detect_encoding($str, 'UTF-8,ISO-8859-15,ISO-8859-1,cp1251,KOI8-R');
	}
	
	function validateUpload(&$reader) {
		if ($reader->getSheetCount() != 1) {
			error_log(date('Y-m-d H:i:s - ', time()).$this->language->get('error_sheet_count')."\n",3,DIR_LOGS."error.txt");
			return FALSE;
		}
		
		return TRUE;
	}
	
	function clearCache() {
		$this->cache->delete('*');
	}
	
	function upload($filename) {
		// we use our own error handler
		global $config;
		global $log;
		$config = $this->config;
		$log = $this->log;
	
		$database =& $this->db;

		// use a generous enough configuration, the Import can be quite memory hungry (this needs to be improved)
		// ini_set("memory_limit","512M");
		// ini_set("max_execution_time",180);
		//set_time_limit( 60 );

		// we use the PHPExcel package from http://phpexcel.codeplex.com/
		$cwd = getcwd();
		chdir(DIR_SYSTEM.'library/PHPExcel');
		require_once('Classes/PHPExcel.php');
		chdir($cwd);

		// parse uploaded spreadsheet file
		$inputFileType = PHPExcel_IOFactory::identify($filename);
		$objReader = PHPExcel_IOFactory::createReader($inputFileType);
		$objReader->setReadDataOnly(true);
		$reader = $objReader->load($filename);

		// read the various worksheets and load them to the database
		$ok = $this->validateUpload($reader);
		if (!$ok) {
			return FALSE;
		}
		
		$this->clearCache();
		
		$ok = $this->uploadProducts($reader, $database);
		if (!$ok) {
			return FALSE;
		}
		
		return TRUE;
	}

	protected function clearSpreadsheetCache() {
		$files = glob(DIR_CACHE . 'Spreadsheet_Excel_Writer' . '*');
		
		if ($files) {
			foreach ($files as $file) {
				if (file_exists($file)) {
					@unlink($file);
					clearstatcache();
				}
			}
		}
	}
	
	public function createXLS($categoryfilter, $manufacturerfilter, $statusfilter) {
		// we use our own error handler
		global $config;
		global $log;
		$config = $this->config;
		$log = $this->log;
		set_error_handler('error_handler_for_export',E_ALL);
		register_shutdown_function('fatal_error_shutdown_handler_for_export');
	
		$cwd = getcwd();
		chdir(DIR_SYSTEM.'library/pear');
		require_once "Spreadsheet/Excel/Writer.php";
		chdir($cwd);
		
		// Creating a workbook
		$workbook = new Spreadsheet_Excel_Writer();
		$workbook->setTempDir(DIR_CACHE);
		$workbook->setVersion(8); // Use Excel97/2000 BIFF8 Format
		$priceFormat =& $workbook->addFormat(array('Size' => 10,'Align' => 'right','NumFormat' => '######0.0000'));
		$boxFormat =& $workbook->addFormat(array('Size' => 10,'vAlign' => 'vequal_space'));
		$weightFormat =& $workbook->addFormat(array('Size' => 10,'Align' => 'right','NumFormat' => '##0.0000'));
		$textFormat =& $workbook->addFormat(array('Size' => 10, 'NumFormat' => "@"));
		
		// sending HTTP headers
		$workbook->send('adv_report_cost.xls');
		
		$worksheet =& $workbook->addWorksheet('Products');
		$worksheet->setInputEncoding ('UTF-8');
		//$this->populateProductsWorksheet( $worksheet, $database, $languageId, $priceFormat, $boxFormat, $weightFormat, $textFormat );
		// Set the column widths
		$j = 0;
		$worksheet->setColumn($j,$j++,max(strlen('product_id'),4)+1);
		$worksheet->setColumn($j,$j++,max(strlen('option_id'),4)+1);
		$worksheet->setColumn($j,$j++,max(strlen('name'),30)+1);
		$worksheet->setColumn($j,$j++,max(strlen('option'),30)+1);		
		$worksheet->setColumn($j,$j++,max(strlen('sku'),30)+1);
		$worksheet->setColumn($j,$j++,max(strlen('model'),30)+1);		
		$worksheet->setColumn($j,$j++,max(strlen('subtract'),4)+1);
		$worksheet->setColumn($j,$j++,max(strlen('quantity'),12)+1);
		$worksheet->setColumn($j,$j++,max(strlen('price'),10)+1,$priceFormat);
		$worksheet->setColumn($j,$j++,max(strlen('cost'),10)+1,$priceFormat);
		
		// The product headings row
		$i = 0;
		$j = 0;
		$worksheet->writeString($i, $j++, 'product_id', $boxFormat);
		$worksheet->writeString($i, $j++, 'option_id', $boxFormat);
		$worksheet->writeString($i, $j++, 'name', $boxFormat);
		$worksheet->writeString($i, $j++, 'option', $boxFormat);		
		$worksheet->writeString($i, $j++, 'sku', $boxFormat);
		$worksheet->writeString($i, $j++, 'model', $boxFormat);		
		$worksheet->writeString($i, $j++, 'subtract', $boxFormat);
		$worksheet->writeString($i, $j++, 'quantity', $boxFormat);
		$worksheet->writeString($i, $j++, 'price', $boxFormat);
		$worksheet->writeString($i, $j++, 'cost', $boxFormat);
		
		// The actual products data
		$i += 1;
		$j = 0;

    	$results = $this->model_report_adv_profit_reports->getProductCostPriceQuantity(1 , 100000, $count, $categoryfilter, $manufacturerfilter, $statusfilter,'');

			foreach ($results as $result) {
				$worksheet->setRow( $i, 26 );
				$worksheet->write($i, $j++, $result['id']);
				$worksheet->write($i, $j++, $result['option_id']);
				$worksheet->writeString($i, $j++, $result['name'],$textFormat);
				$worksheet->writeString($i, $j++, $result['option'],$textFormat);			
				$worksheet->writeString($i, $j++, $result['sku'],$textFormat);
				$worksheet->writeString($i, $j++, $result['model'],$textFormat);			
				$worksheet->writeString($i, $j++, $result['subtract'],$textFormat);
				$worksheet->write($i, $j++, $result['quantity']);
				$worksheet->writeString($i, $j++, number_format($result['price'],4),$priceFormat);
				$worksheet->writeString($i, $j++, number_format($result['cost'],4),$priceFormat);
			
				$i += 1;
				$j = 0;
			}
		
		$worksheet->freezePanes(array(1, 1, 1, 1));
		
		// Let's send the file
		$workbook->close();
		
		// Clear the spreadsheet caches
		$this->clearSpreadsheetCache();
		exit;
	}
}
?>