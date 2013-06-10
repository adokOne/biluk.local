<?php 
class Page_Model extends ORM{
	
	public function sorting($sortby = array()){
		
		$this->sorting = $sortby;
		
		return $this;
		
	}
	
}