<?php 
class Street_Model extends ORM{
	protected $belongs_to = array('district','city');
	
}