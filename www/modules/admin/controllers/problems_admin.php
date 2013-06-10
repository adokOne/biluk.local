<?php defined('SYSPATH') or die('No direct script access.');

class Problems_Admin extends Constructor
{
    protected $item_table   = 'problems';
    protected $orderby      = 'id';
    protected $order_dir    = 'ASC';
    protected $use_tree     = False;
    protected $use_form     = TRUE;
    protected $use_combo    = TRUE;
    protected $use_location = FALSE;
    protected $use_map      = TRUE;

    protected $use_logo     = TRUE;
    protected $logo_path = 'upload/problems/';
    protected $logo_prefix = '/pic_320';

    
    protected $grid_columns = array(
        "id",
        "city_id",
        "district_id",
        "street_id",
        "building",
        "DATE(FROM_UNIXTIME(created_at)) AS created_at",
        "DATE(FROM_UNIXTIME(resolved_at)) AS resolved_at",
        "user_id",
        "partner_id",
        "status",
        "has_logo",
        "longitude",
        "latitude",
        "description",

    );
    
    protected $stores = array(
        'cities',
        'districts',
        'streets',
        'users',
        'partners'
    );


     protected function _load_treecombo_users()
    {
        $this->db
            ->select(array(
                "id",
                "name"
            ))
            ->from('users')
            ->where("id IN (Select user_id FROM roles_users Where role_id=5)")
            ->orderby('name');

        $nodes['items'] = $this->db->get()->as_array();
        return $nodes;
    }


     protected function _load_treecombo_partners()
    {
        $this->db
            ->select(array(
                "id",
                "name"
            ))
            ->from('users')
            ->where("id IN (Select user_id FROM roles_users Where role_id=4)")
            ->orderby('name');

        $nodes['items'] = $this->db->get()->as_array();
        return $nodes;
    }















    

    protected function _load_treecombo_cities()
    {
        $this->db
            ->select(array(
                "id",
                "name",
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
                "name"
            ))
            ->from('districts')
            ->orderby('name');
            if($id = $this->input->post("city_id")){
                $this->db->where("city_id",$id);
            }
        $nodes['items'] = $this->db->get()->as_array();
        return $nodes;
    }

    protected function _load_treecombo_streets()
    {
        $this->db
            ->select(array(
                "id",
                "name_ua AS name",
                "latitude",
                "longitude"
            ))
            ->from('streets')
            ->orderby('name');
            if($id = $this->input->post("district_id")){
                $this->db->where("district_id",$id);
            }
        $nodes['items'] = $this->db->get()->as_array();
        return $nodes;
    }

    public function streets_List(){
        echo  json_encode($this->_load_treecombo_streets());
    }
    public function districts_List(){
        echo  json_encode($this->_load_treecombo_districts());
    }



    protected function _todb(&$data, $id = FALSE)
    {
        #if(empty($data->longitude) || $data->longitude ==0){
                @$address =  ORM::factory("city")->find($data->city_id)->name."+".ORM::factory("district")->find($data->district_id)->name."+".ORM::factory("street")->find($data->street_id)->name;
                @$this->_getlocation($data,$address);
        # }
        if ($id == 0) {
            $data->created_at = time();
            $id = $this->db->insert($this->item_table, (array)$data)->insert_id();
        } else {
            unset($data->created_at);
            $this->db->update($this->item_table, (array)$data, "id = $id");
        }

        return $id;
    }



    private function _getlocation(&$data,$address){
            $address = trim(str_replace(" ", "%20", $address));
            $country = "Украина";
            $address = $country."+".$address;
            $url    = "http://maps.googleapis.com/maps/api/geocode/json?address=".$address."&sensor=true";
            $datas   = json_decode(file_get_contents($url));
   
            
            
            if($datas->status=="OK"){
                $data->latitude  = $datas->results[0]->geometry->location->lat;
                $data->longitude = $datas->results[0]->geometry->location->lng;
                
                return true;
            }
            else return false;
    }



    
} 
