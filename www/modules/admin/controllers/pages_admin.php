<?php defined('SYSPATH') or die('No direct script access.');

class Pages_Admin extends Controller {

    
    public function index(){
    	$config = Kohana::config('news_admin');
		if(!is_array($config)){
			Kohana::show_404();
			
		}	
        $view = new View("pages_admin");
        $view->config = $config;
        
        $fields = $this->db->list_fields('pages');        
        $view->form_reader = "'" . implode(array_keys($fields), "', '") . "'";
        $view->render(TRUE);
    	
    }
	
    public function list_items(){
    	 $this->db->select(
    	 	"id",
    	 	"title", 
    	 	"DATE_FORMAT(FROM_UNIXTIME(created_at), '%d.%m.%Y %H:%i') as created_at" ,
    	 	"views_count",
    	 	"seo_name")
            ->from('pages');                
		
		$resultData = grid::get(
				$this->input->post('sort', 'id' ,true),	
				$this->input->post('dir',  'desc',true),
				FALSE
		);
		
		echo json_encode($resultData);
    	
    }


    public function edit_news(){
    	$id = (int)$this->input->post('id', 0, true);
    	
    	if($id > 0){
    		$data = $this->db
    			->from('pages')
    			->where('id', $id)->get()->current();    		
			$data->created_at = time();			
			$data->text = stripslashes($data->text);
			
    		echo json_encode(array((array)$data));
    		
    	}	else {        
        	 echo json_encode(array());
        	
    	}
    	
    }

    public function save(){
    	$id = (int)$this->input->post('id', 0, true);
    	
    	$data = ext::get_form('pages');  
    	
 
    	$data['seo_name']     = transliterate::render($data['title']);



  	
    	if($id > 0){    		
    		$this->db->update('pages', $data, "id = $id");
    		
    	}	else {    
    		$data['created_at']   = time();		
	    	$id = $this->db->insert('pages', $data)->insert_id();
    		
    	}    	
    	
		if( isset($_POST['mp_photo']) && file_exists($_POST['mp_photo']) ){
    		
    		$save=picenigne::save_picture($_POST['mp_photo'], Kohana::config('news.logo_folder') , $id . ".jpg");
    		
    	}
    	if (isset($save))
    		picenigne::resize_picture(DOCROOT.Kohana::config('news.logo_folder').$id.'.jpg','upload/pages/', $id . ".jpg",Kohana::config('news_pictures.sizes'));
    	echo ext::json_response(true);
    	
    }    
    
    
    /**
	 * Збереження з гріду
	 *
	 */
	public function save_grid(){		
		$ids = $this->input->post('save');
		$nodes = json_decode(stripslashes($ids));
		foreach ($nodes as $n){
			$data = array (
				'seo_name'=>transliterate::render($n->title),
                'title'=>$n->title,

			);
			$this->db->update('pages', $data, "id = $n->id");
			
		}
		echo ext::json_response(true);
	} 
	
	
	
	/**
	 * Видалення з гріду
	 *
	 */
	public function remove_news(){
    	$ids = $this->input->post('delete');
    	$nodes = json_decode(stripslashes($ids), TRUE);				    	
    	
		$this->db->delete('pages', 'id IN ('.implode($nodes[0], ', ').')');				
		
		echo ext::json_response(true);
	}    

	
} // End Document