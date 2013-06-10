<?php defined('SYSPATH') or die('No direct script access.');

class Cities_Admin extends Constructor
{
    protected $item_table   = 'cities';
    protected $orderby      = 'id';
    protected $order_dir    = 'DESC';
    protected $use_tree     = FALSE;
    protected $use_form     = FALSE;
    protected $use_combo    = FALSE;
    protected $use_logo     = FALSE;
    protected $multi_lang   = FALSE;
	
   
    protected $grid_columns = array(
        "id",
    	"name",
        "longitude",
        "latitude",
        
    );
      


    protected function _todb(&$data, $id = FALSE)
    {
        #if(empty($data->longitude) || $data->longitude ==0){
                @$address =  $data->name;
                @$this->_getlocation($data,$address);
        # }
        if ($id == 0) {
            $id = $this->db->insert($this->item_table, (array)$data)->insert_id();
        } else {
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