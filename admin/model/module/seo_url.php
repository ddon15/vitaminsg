<?php
class ModelModuleSeoUrl extends Model
{
	public function massCreateProduct()
	{
		$prods_query = $this->db->query("
			SELECT product_id, name FROM `" . DB_PREFIX . "product_description`");
		
		if($prods_query->num_rows == 0) {
			return;
		}
		
		$this->db->query("DELETE FROM `" . DB_PREFIX . "url_alias` WHERE query LIKE '%product_id=%'");
		
		$prods = $prods_query->rows;
		
		foreach($prods as $prod) {
			$query = 'product_id=' . $prod['product_id'];
			$keyword = $prod['name'];
			$keyword = preg_replace('/[^A-Za-z0-9( -]/', '', $keyword); // remove invalid chars
			$keyword = preg_replace('/\(/',"-", $keyword); // replace ( 
			$keyword = preg_replace('/\s+/', '-', $keyword); // collapse whitespace and replace by -
			$keyword = preg_replace('/-+/', '-', $keyword); // collapse dashes
			
			$this->db->query("INSERT INTO `" . DB_PREFIX . "url_alias` (query, keyword) VALUES('" . $query . "', '" . strtolower($keyword) . "')");
		}
	}
	
	public function massCreateManufacturer()
	{
		$man_query = $this->db->query("
			SELECT manufacturer_id, name FROM `" . DB_PREFIX . "manufacturer`");
		
		if($man_query->num_rows == 0) {
			return;
		}
		
		$this->db->query("DELETE FROM `" . DB_PREFIX . "url_alias` WHERE query LIKE '%manufacturer_id=%'");
		
		$mans = $man_query->rows;
		
		foreach($mans as $man) {
			$query = 'manufacturer_id=' . $man['manufacturer_id'];
			$keyword = $man['name'];
			$keyword = preg_replace('/[^A-Za-z0-9( -]/', '', $keyword); // remove invalid chars
			$keyword = preg_replace('/\(/',"-", $keyword); // replace ( 
			$keyword = preg_replace('/\s+/', '-', $keyword); // collapse whitespace and replace by -
			$keyword = preg_replace('/-+/', '-', $keyword); // collapse dashes
			
			$this->db->query("INSERT INTO `" . DB_PREFIX . "url_alias` (query, keyword) VALUES('" . $query . "', '" . strtolower($keyword) . "')");
		}
	}
}