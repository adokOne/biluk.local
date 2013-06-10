<?php defined('SYSPATH') or die('No direct script access.');

class Problems_Admin extends Constructor
{
    protected $item_table   = 'problems';
    protected $orderby      = 'id';
    protected $order_dir    = 'ASC';
    protected $use_form     = TRUE;
    protected $use_combo    = TRUE;
    protected $use_location = FALSE;
    protected $use_map      = TRUE;
    protected $tree_id      = 'category_id';
    protected $use_tree     = TRUE;
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
        "category_id",

    );
    
    protected $stores = array(
        'cities',
        'districts',
        'streets',
        'users',
        'partners'
    );
    protected function _load_tree(){
        
        $result = ORM::factory("category")->find_all();

        $res = array();
        foreach($result as $row){            
            $res[$row->id]['id'] = $row->id;            
            $res[$row->id]['text'] = $row->name;
            $res[$row->id]['is_root']  = true;
            $res[$row->id]['iconCls'] = 'ico_page';
            $res[$row->id]['children'] = !empty($res[$row->id]['children']) ? $res[$row->id]['children'] : array();            
            if(intval($row->parent_id) > 0){
                $res[$row->id]['is_root'] = false;
                $res[$row->parent_id]['children'][] = &$res[$row->id];                  
            }        
        }
        
        $resultArray = array();
        reset($res);
        foreach($res as $key => $value) {        
            if($value['is_root']) {
                $resultArray[] = $value;
            }
        }            
        return $resultArray;
        
    }

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

    public function save_category(){
        $cat = $this->input->post("id" ,0 ,true) > 0 ? ORM::factory("category")->find($this->input->post("id" ,0 ,true)) : ORM::factory("category");
        $cat->name      = $this->input->post("name");
        #$cat->seo_name  = $this->input->post("seo_name");
        $cat->parent_id = $this->input->post("parent_id");
        $cat->save();

       # if ($this->use_logo)
       #     $this->_logo($cat->id, 1);

        echo json_encode(array("success"=>true));

    }


    public function delete_category(){
        $cat = ORM::factory("category",$this->input->post("node_id"));

        $cat->delete();
        echo json_encode(array("success"=>true));


    }

    public function edit_category(){
        $id  = $this->input->post("id");
        $cat = ORM::factory("category")->find($id)->as_array();
        echo json_encode($cat);
        

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
                @$address =  ORM::factory("city")->find($data->city_id)->name."+".ORM::factory("district")->find($data->district_id)->name."+".ORM::factory("street")->find($data->street_id)->name_ua;
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
