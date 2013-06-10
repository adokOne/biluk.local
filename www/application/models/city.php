<?php 
class City_Model extends ORM{
	protected $has_many = array('districts','problems');
	
}