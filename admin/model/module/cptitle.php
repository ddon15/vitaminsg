<?php
class ModelModuleCptitle extends Model 
{
	public function create_column_if_not_exists($table, $column, $column_attr)
	{
		$cnames = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "$table WHERE Field = '$column'");
		if ($cnames->num_rows === 0)
		{
			$this->db->query("ALTER TABLE " . DB_PREFIX . "$table ADD $column $column_attr");
		}
	}
			
	public function num_col_items($table, $column)
	{
		$ccount = $this->db->query("SELECT COUNT(*) FROM " . DB_PREFIX . "$table WHERE $column IS NOT NULL AND $column != ''");
		return $ccount->row['COUNT(*)'];
	}

	public function num_cols($table)
	{
		$ncols = $this->db->query("select COUNT(*) FROM " . DB_PREFIX . "$table");
		return $ncols->row['COUNT(*)'];
	}
}
?>