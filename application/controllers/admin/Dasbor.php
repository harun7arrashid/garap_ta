<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dasbor extends CI_Controller {

	// Load Model
	public function __construct()
	{
		parent::__construct();
		// Proteksi halaman
		$this->simple_login->cek_login();
	} 

	// Halaman Utama Dasbor
	public function index()
	{
		$data = array(	'title'		=> 'Halaman Administrator',
						'isi'		=> 'admin/dasbor/list'
					);
		$this->load->view('admin/layout/wrapper', $data, FALSE);

	}
}