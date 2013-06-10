<?php

class Main_Controller extends Controller {



	public function index() {
		$news = $this->get_main_news();
		$important_news = ORM::factory("news")->limit(1)->find();
		foreach ($news as $k=>$n)
			if($n->important == 1){
				$important_news  = $n;
				unset($news[$k]);
				break;
			}
		
		$view = new View("main");
		$view->members = $this->get_memebers();
		$view->important_news = $important_news;
		$view->news    =  $news ;
		$view->render(true);
	}

	public function problems(){
		javascript::add(array("controllers/map"));
		$view = new View("problems_map");
		$view->city = $this->get_city();
		$view->render(true);
	}

	public function district_problems(){
		$id = (int)$this->input->post("district_id",0,true);
		$district = $this->get_district($id);
		$result = array();
		foreach ($district->problems as $problem) {
			
			$result[] = array(
				"id" 	  	 => $problem->id,
				"address" 	 => $problem->street->name_ua." ".$problem->building,
				"status"  	 => $problem->status,
				"longitude"  => $problem->longitude,
				"latitude"   => $problem->latitude,
				"has_logo"   => $problem->has_logo,
				"description"=> text::limit_chars($problem->description,150,"..."),
			);
		}

		echo json_encode($result);
		
	}

	private function get_memebers(){
		return ORM::factory("role",2)->where("show_on_main",1)->limit(3)->users;
	}
	
	private function get_city($id = false){
		$id = !$id ? Kohana::config("core.default_city_id") : $id;
		return ORM::factory("city",$id);
	}

	private function get_street($id){
		return ORM::factory("street",$id);
	}

	private function get_district($id){
		return ORM::factory("district",$id);
	}

	private function get_main_news(){
		$news = ORM::factory("news")->where(array("show_on_main"=>1))->limit(9)->find_all()->as_array();
		shuffle($news);
		return $news;
	}



}