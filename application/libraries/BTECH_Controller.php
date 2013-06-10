<?php

class Controller extends Controller_Core {
	
	public    $logged_in = false;
	public    $user = null;
	protected $title = null;
	
	public function __construct(){
		$this->_set_user();
		$this->_prepare_layout();
		$this->db = Database::instance();
		$this->lang_id = 0;
		$this->_set_meta();

		parent::__construct();
		
		
	}
	
	private function _set_user(){
		if( $this->logged_in = Auth::instance()->logged_in() ) {
			$this->user = Auth::instance()->get_user();
			View::set_global('user',$this->user);
		}
	
		View::set_global('logged_in', $this->logged_in);
	}
	
	private function _prepare_layout(){
		stylesheet::add(array(
			'reset',
			#'jNice2',
			'forms',
			'grid',
			'css',
			'jquery-ui-1.8.17.custom',
			'jquery.snippet.min',
			'jplayer.blue.monday',
			'prettyPhoto',
			'pro_pages_style',
			'style',

			)
		);

		javascript::add(array(
			'jquery-1.7.1.min',
			'jquery.snippet.min',
			'jquery.cycle.all.min',
			'kwicks-1.5.1.pack',
			'jquery.validate',
			'jquery.mvc',
			'protos',
			'script'
			)
		);

		View::set_global('langs_ids',Kohana::config('locale.lang_ids'));
		
		#javascript::add(array('translations_' . Kohana::$lang_code )); 
		
	
	}
	
	
	protected  function _set_meta($name = false,$desc=false,$keywords=false){
		if(!$name){
			$title = Kohana::config('core.sitename');
		} else {
			$title = $name ;
		}
		if(!$desc){
			$meta_desc = Kohana::config('core.meta_desc');
		} else {
			$meta_desc = $desc ;
		}
		if(!$keywords){
			$meta_keywords = Kohana::config('core.meta_keywords');
		} else {
			$meta_keywords = $keywords ;
		}

		View::set_global('title', $title);	
		View::set_global('meta_desc', $meta_desc);
		View::set_global('meta_keywords', $meta_keywords);
	}
	
	
	
	

}