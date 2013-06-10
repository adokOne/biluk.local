<?php defined('SYSPATH') or die('No direct script access.');

class Streets_Admin extends Constructor
{
    protected $item_table   = 'streets';
    protected $tree_table   = 'categories';
    protected $orderby      = 'id';
    protected $order_dir    = 'ASC';
    protected $tree_id      = 'category_id';
    protected $use_tree     = FALSE;
    protected $use_form     = TRUE;
    protected $use_combo    = FALSE;
    protected $use_location = FALSE;
    protected $use_map      = TRUE;
    protected $use_lines    = TRUE;
    protected $street       =true;

    protected $use_logo     = FALSE;
    protected $logo_path = 'images/logos/';
    protected $logo_prefix = '_l';
    
    protected $grid_columns = array(
        "id",
        "city_id",
        "district_id",
        "name_ua",
        "type",
        "latitude",
        "longitude",
        "the_geom"
    );
    
    protected $stores = array(
        'cities',
        'districts'
    );

    protected function _load_treecombo_cities()
    {
        $this->db
            ->select(array(
                "id",
                "name AS text",
                "IF(0, null, null) AS parent_id"
            ))
            ->from('cities')
            ->orderby('name');

        $nodes['items'] = $this->db->get()->as_array();
        return $nodes;
    }

    protected function _load_treecombo_districts()
    {
        $this->db
            ->select(array(
                "id",
                "name AS text",
                "IF(0, null, null) AS parent_id"
            ))
            ->from('districts')
            ->orderby('name');

        $nodes['items'] = $this->db->get()->as_array();
        return $nodes;
    }
    public function get_districts(){
        $id=$this->input->post("city_id",1,true);
        $data=Database::instance()
                    ->from('districts')
                    ->where('city_id',$id)
                    ->get();
        foreach($data as $item){
        $result[]=array("id"=>$item->id,"name"=>$item->name);
        }
        echo json_encode(array("items"=>$result));
    }
    public function get_city(){
        $data=Database::instance()
                    ->from('cities')
                    ->get();
        foreach($data as $item){
          $result[]=array("id"=>$item->id,"name"=>$item->name);
        }
        echo json_encode(array("items"=>$result));
    }
    
    public function addStreet(){
        $data=array(
        "city_id"     =>$this->input->post("city_id"),
        "district_id" =>$this->input->post("district_id"),
        "name"        =>$this->input->post("name"),
        "name_ua"     =>$this->input->post("name_ua"),
        "longitude"   =>$this->input->post("longitude"),
        "latitude"    =>$this->input->post("latitude")
        );
        Database::instance()->insert('streets',$data);
    }
    
} // End Company
