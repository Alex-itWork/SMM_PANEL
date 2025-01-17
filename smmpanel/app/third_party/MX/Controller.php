<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

/** load the CI class for Modular Extensions **/
require dirname(__FILE__).'/Base.php';

/**
 * Modular Extensions - HMVC
 *
 * Adapted from the CodeIgniter Core Classes
 * @link	http://codeigniter.com
 *
 * Description:
 * This library replaces the CodeIgniter Controller class
 * and adds features allowing use of modules and the HMVC design pattern.
 *
 * Install this file as application/third_party/MX/Controller.php
 *
 * @copyright	Copyright (c) 2015 Wiredesignz
 * @version 	5.5
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 **/
class MX_Controller 
{
	public $autoload = array();
	
	public function __construct() 
	{
		$class = str_replace(CI::$APP->config->item('controller_suffix'), '', get_class($this));
		log_message('debug', $class." MX_Controller Initialized");
		Modules::$registry[strtolower($class)] = $this;	
		date_default_timezone_set(TIMEZONE);
		/* copy a loader instance and initialize */
		$this->load = clone load_class('Loader');
		$this->load->initialize($this);	
		$CI = &get_instance();
		$cookie_verify_maintenance_mode = "non-verified";
		if (isset($_COOKIE["verify_maintenance_mode"]) && $_COOKIE["verify_maintenance_mode"] != "") {
          $cookie_verify_maintenance_mode = encrypt_decode($_COOKIE["verify_maintenance_mode"]);
        }

        if (!in_array(segment(2), ['cron'])) {
			if ($cookie_verify_maintenance_mode != 'verified' && $this->__check_maintenance_mode() && segment(1) != "maintenance") {
				redirect(cn("maintenance"));
			}
        }

		if (!in_array(segment(2), array('cron', 'set_language')) && !in_array(segment(3), array('cron', 'complete'))) {
			$allowed_controllers = ['auth', 'api', 'client', 'services', 'crons'];
			$allowed_page        = ['logout', 'ipn'];
			if (!session('uid') && !$this->__check_maintenance_mode() && !in_array($this->router->fetch_class(), $allowed_controllers) && !in_array($this->router->fetch_method(), $allowed_page)) {
				if(segment(1) != ""  && !in_array(segment(1), ['unitpay_ipn', 'gbprimepay_ipn', 'cashmaal_ipn', 'cron', 'ipn'])){
					redirect(PATH);
				}
			}
		}
		
		if (session("uid")) {
			$user_allowed_controllers = [];
			$user = $this->__get_current_user_data( session('uid') );
			$user_allowed_controllers = $this->user_allowed_controllers($user->role);
			$cookie_lc_verified       = '';
			if (isset($_COOKIE["lc_verified"]) && $_COOKIE["lc_verified"] != "") {
	          $cookie_lc_verified = base64_decode($_COOKIE["lc_verified"]);
	        }
			
			if ($user->role != 'admin' && (in_array($this->router->fetch_class(), $user_allowed_controllers) || in_array(segment(2), ['update']))) {
				redirect(PATH."statistics");
			}

			if ($user->role == 'admin' && segment(1) == "statistics") {
				$CI->db->query("DELETE FROM general_sessions WHERE timestamp < UNIX_TIMESTAMP(DATE_SUB(NOW(), INTERVAL 60 MINUTE))");
			}
		}
		$this->output->enable_profiler(ENVIRONMENT == 'development');
		/* autoload module items */
		$this->load->_autoloader($this->autoload);
	}
	
	public function __get($class) 
	{
		return CI::$APP->$class;
	}

	private  function __check_maintenance_mode(){
		$CI = &get_instance();
		$CI->load->database();
		$user = $CI->db->select("value");
				$CI->db->from(OPTIONS);
				$CI->db->where("name", "is_maintenance_mode");
		        $query = $this->db->get();
		$result = $query->row();
		if(!empty($result)){
			if ($result->value) {
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}

	private function __get_current_user_data(){
		$CI = &get_instance();
		$CI->load->database();
		$user = $CI->db->select("role");
				$CI->db->from(USERS);
				$CI->db->where("id", session("uid"));
		        $query = $this->db->get();
		$result = $query->row();
		if(!empty($result)){
			return $result;
		}else{
			return false;
		}
	}

	private function __curl($url){
	    $ch = curl_init(); curl_setopt($ch, CURLOPT_URL, $url); 
	    curl_setopt($ch, CURLOPT_VERBOSE, 1); 
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
	    curl_setopt($ch, CURLOPT_AUTOREFERER, false); 
	    curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1); 
	    curl_setopt($ch, CURLOPT_HEADER, 0); 
	    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 0); 
	    curl_setopt($ch, CURLOPT_TIMEOUT, 60); 
	    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	    $result = curl_exec($ch); 
	    curl_close($ch); 
	    return $result; 
	}

	private function user_allowed_controllers($role){
		switch ($role) {
			case 'supporter':
				$result = array('faqs', 'setting', 'module', 'api_provider', 'user_block_ip', 'user_logs', 'payments', 'subscribers', 'payments_bonuses');
				break;	

			case 'user':
				$result = array('faqs', 'users', 'setting', 'module', 'api_provider', 'category', 'user_mail_logs', 'user_block_ip', 'user_logs', 'payments', 'subscribers','payments_bonuses');
				break;

			default:
				$result = array();
				break;
		}
		return $result;
	}
}

?>