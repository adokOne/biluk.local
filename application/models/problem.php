<?php 
class Problem_Model extends ORM{
	protected $belongs_to = array('city','district','user');
	protected $has_one	  = array("street");
	
}