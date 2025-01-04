<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 
class freekassa extends MX_Controller {
	public $tb_users;
	public $tb_transaction_logs;
	public $tb_payments;
	public $tb_payments_bonuses;
	public $freekassa;
	public $payment_type;
	public $payment_id;
	public $currency_code;
	public $mode;
	public $merchant_id;
	public $secret_key_1;
	public $secret_key_2;

	public function __construct($payment = ""){
		parent::__construct();
		$this->load->model('add_funds_model', 'model');

		$this->tb_users            = USERS;
		$this->payment_type	       = 'freekassa';
		$this->tb_transaction_logs = TRANSACTION_LOGS;
		$this->tb_payments         = PAYMENTS_METHOD;
		$this->tb_payments_bonuses = PAYMENTS_BONUSES;
		$this->currency_code       = get_option("currency_code", "USD");
		if ($this->currency_code == "") {
			$this->currency_code = 'USD';
		}

		if (!$payment) {
			$payment = $this->model->get('id, type, name, params', $this->tb_payments, ['type' => $this->payment_type]);
		}

		$this->payment_id = $payment->id;
		$params  = $payment->params;
		$option                = get_value($params, 'option');
		$this->merchant_id     = get_value($option, 'merchant_id');
		$this->secret_key_1    = get_value($option, 'secret_key_1');
		$this->secret_key_2    = get_value($option, 'secret_key_2');
		
	}

	public function index(){
		redirect(cn("add_funds"));
	}

	/**
	 *
	 * Create payment
	 *
	 */
	public function create_payment($data_payment = ""){
		_is_ajax($data_payment['module']);
		$amount = $data_payment['amount'];

		if (!$amount) {
			_validation('error', lang('There_was_an_error_processing_your_request_Please_try_again_later'));
		}

		if (!$this->merchant_id || !$this->secret_key_1) {
			_validation('error', lang('this_payment_is_not_active_please_choose_another_payment_or_contact_us_for_more_detail'));
		}

		$users  = session('user_current_info');
		$order_id = time().session("uid").rand(3);
		$sign = md5($this->merchant_id.':'.$amount.':'.$this->secret_key_1.':'.$this->currency_code.':'.$order_id);
		$url = 'https://pay.freekassa.ru/?m='.$this->merchant_id.'&oa='.$amount.'&o='.$order_id.'&s='.$sign.'&currency='.$this->currency_code.'&us_user='.session("uid");
		$data_tnx_log = array(
			"ids" 				=> ids(),
			"uid" 				=> session("uid"),
			"type" 				=> $this->payment_type,
			"transaction_id" 	=> $order_id,
			"amount" 	        => $amount,
			"status" 	        => 0,
			"created" 			=> NOW,
		);
					
		$transaction_log_id = $this->db->insert($this->tb_transaction_logs, $data_tnx_log);
		if ($this->input->is_ajax_request()) {
			ms(['status' => 'success', 'redirect_url' => $url]);
		} 
	}

	/**
	 *
	 * Call Execute payment after creating payment
	 *
	 */
	public function complete(){

	/*function getIP() {
		   if(isset($_SERVER['HTTP_X_REAL_IP'])) return $_SERVER['HTTP_X_REAL_IP'];
		   return $_SERVER['REMOTE_ADDR'];
		}*/

		//if (!in_array(getIP(), array('168.119.157.136', '168.119.60.227', '138.201.88.124', '178.154.197.79'))) die("hacking attempt!");

		$transaction = $this->model->get('*', $this->tb_transaction_logs, ['transaction_id' => $_REQUEST['MERCHANT_ORDER_ID'], 'type' => $this->payment_type]);

		$sign = md5($this->merchant_id .':'.$_REQUEST['AMOUNT'].':'.$this->secret_key_2.':'.$_REQUEST['MERCHANT_ORDER_ID']);

		if($sign == $_REQUEST['SIGN']){
			$amount = $_REQUEST['AMOUNT'];
			$data_tnx_log = array(
				"txn_fee"	=> 0,
				"status" 	=> 1
			);

			$this->db->update($this->tb_transaction_logs, $data_tnx_log, ['transaction_id' => $_REQUEST['MERCHANT_ORDER_ID']]);
				// Update Balance 
				require_once 'add_funds.php';
				$add_funds = new add_funds();
				$add_funds->add_funds_bonus_email($transaction, $this->payment_id);
				
			die('YES');
		}else{
			die('Error sign');
		}
	}
}