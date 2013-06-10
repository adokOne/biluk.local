<?php defined('SYSPATH') or die('No direct script access.');


/*
    protected $item_table   = 'news';
    protected $orderby      = 'id';
    protected $order_dir    = 'DESC';


	protected $grid_columns = array(
    	 	"id",
    	 	"important", 
    	 	"title", 
    	 	"created_at", 
    	 	"views_count",
    	 	"show_on_main"
    );


*/
class News_Admin extends Controller {

    
    public function index(){
    	$config = Kohana::config('news_admin');
		if(!is_array($config)){
			Kohana::show_404();
			
		}	
        $view = new View("news_admins");
        $view->config = $config;
        
        $fields = $this->db->list_fields('news');        
        $view->form_reader = "'" . implode(array_keys($fields), "', '") . "'";
        $view->render(TRUE);
    	
    }
	
    public function list_items(){
    	 $this->db->select(
    	 	"id",
    	 	"important", 
    	 	"title", 
    	 	"DATE_FORMAT(FROM_UNIXTIME(created_at), '%d.%m.%Y %H:%i') as created_at" ,
    	 	"views_count",
    	 	"show_on_main")
            ->from('news');                
		
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
    			->from('news')
    			->where('id', $id)->get()->current();    		
			$data->created_at = date('Y.m.d' ,$data->created_at);			
			$data->anons = stripslashes($data->anons);
			$data->text = stripslashes($data->text);
			
    		echo json_encode(array((array)$data));
    		
    	}	else {        
        	 echo json_encode(array());
        	
    	}
    	
    }

    public function save(){
    	$id = (int)$this->input->post('id', 0, true);
    	
    	$data = ext::get_form('news');  
    	
		$dt = explode('.', $data['created_at']);
    	$data['created_at']   = strtotime("{$dt[2]}.{$dt[1]}.{$dt[0]}");
    	$data['show_on_main'] = (!isset($data['show_on_main'])) ? 0 : 1; 
    	$data['important']    = (!isset($data['important'])) ? 0 : 1;
    	$data['seo_name']     = transliterate::render($data['title']);
        $data['has_logo']     = isset($_POST['mp_photo']) && file_exists($_POST['mp_photo'])  ? 1 : 0;


  	
    	if($id > 0){    		
    		$this->db->update('news', $data, "id = $id");
    		
    	}	else {    		
	    	$id = $this->db->insert('news', $data)->insert_id();
    		
    	}    	
    	
		if( isset($_POST['mp_photo']) && file_exists($_POST['mp_photo']) ){
    		
    		$save=picenigne::save_picture($_POST['mp_photo'], Kohana::config('news.logo_folder') , $id . ".jpg");
    		
    	}
    	if (isset($save))
    		picenigne::resize_picture(DOCROOT.Kohana::config('news.logo_folder').$id.'.jpg','upload/news/', $id . ".jpg",Kohana::config('news_pictures.sizes'));
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
                'important'=>$n->important,
                'show_on_main'=> $n->show_on_main ? 1 : 0

			);
			$this->db->update('news', $data, "id = $n->id");
			
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
    	
		$this->db->delete('news', 'id IN ('.implode($nodes[0], ', ').')');				
		
		echo ext::json_response(true);
	}    

	
} // End Document