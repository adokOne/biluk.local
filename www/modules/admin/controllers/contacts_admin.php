<?php defined('SYSPATH') or die('No direct script access.');

class Contacts_Admin extends Constructor
{
    protected $item_table   = 'contacts';
    protected $orderby      = 'id';
    protected $order_dir    = 'DESC';
    protected $use_form     = TRUE;
	
   
    protected $grid_columns = array(
        "id",
    	"name",
    	"email",
    	"phone",
    	"created_at",
    	"text"
    );
	
}