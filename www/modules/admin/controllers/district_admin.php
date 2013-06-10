<?php defined('SYSPATH') or die('No direct script access.');

class District_Admin extends Controller
{
	public function index()
	{
		
		$view = new View('districts_admin');
		$view->cities = ORM::factory('city')->find_all();

		$view->render(TRUE);
	}
	
	public function panel(){
		$view = new View('districts_panel');
		$view->cities = ORM::factory('city')->find_all();
		$view->districts = ORM::factory('district')->find_all();
		$view->render(true);
	}
	
	public function get_items(){
		$city_id = (int) $this->input->post('city', 2, true);
		$districts = ORM::factory('district')
							->where('city_id', $city_id)
							->find_all();
		$dstr = array();
		foreach ($districts as $d){
			$i = $d->as_array();
			$i['geom'] = explode(',', substr($d->the_geom, 9, -2));
			
			foreach ($i['geom'] as $k => $c)
				$i['geom'][$k] = explode(' ', $c);
			
			$dstr[] = $i;
			
		}
		echo json_encode(array('success'=>true, 'items'=>$dstr, 'total'=>count($dstr)));
	}
	
	public function create(){
		
		
		$name = $this->input->post('name', "", true);
		$lng = $this->input->post('lng', "", true);
		$lat = $this->input->post('lat', "", true);
		$color = $this->input->post('color', "", true);
		$zoom = $this->input->post('zoom', "", true);
		$city_id = $this->input->post('city_id', "", true);
		$coordinates = $this->input->post('coordinates', "", false);
		
		$coords = array();
		foreach($coordinates as $row){
			$coords[] =  $row[0] . " " . $row[1];
		}
		
		$the_geom = 'POLYGON((' . implode(',', $coords) . '))';
		
		$district_id = (int) $this->input->post('district_id', null, false);
		if( $district_id > 0){
			$district = ORM::factory('district', $district_id);
		}else {
			$district = ORM::factory('district');
		} 
		
		
		$district->name = $name;
		$district->zoom = $zoom;
		$district->latitude = $lat;
		$district->longitude = $lng;
		$district->city_id = $city_id;
		$district->color = $color;
		$district->the_geom = $the_geom;
		$district->save();
		
		echo json_encode(array('status'=>true));
		
	}
}