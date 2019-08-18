<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dasbor extends CI_Controller {

	// Load Model
	public function __construct()
	{
		parent::__construct();
		$this->load->model('pelanggan_model');
		$this->load->model('header_transaksi_model'); // Load Header_transaksi_model.php
		$this->load->model('transaksi_model'); // Load Transaksi_model.php
		$this->load->model('rekening_model'); // Load Rekening_model.php
		// Halaman ini di proteksi dgn Simple_pelanggan.php function cek_login()
		$this->simple_pelanggan->cek_login();
	}

	// Halaman Dasbor
	public function index()
	{
		// Ambil data login id_pelanggan dari SESSION
		$id_pelanggan 		= $this->session->userdata('id_pelanggan');
		$header_transaksi 	= $this->header_transaksi_model->pelanggan($id_pelanggan);

		$data =	array(	'title'				=>	'Halaman Dashboard Pelanggan',
						'header_transaksi'	=>	$header_transaksi,
						'isi'				=>	'dasbor/list' // ini tuh folder dasbor/list.php
					);
		$this->load->view('layout/wrapper', $data, FALSE);
	}

	// FUngsi Belanja
	public function belanja()
	{
		// Ambil data login id_pelanggan dari SESSION
		$id_pelanggan 	  = $this->session->userdata('id_pelanggan'); // Ini tuh dari libraries Simple_pelanggan ada session id_pelanggan
		$header_transaksi = $this->header_transaksi_model->pelanggan($id_pelanggan); // manggil function pelanggan di Header_transaksi_model.php

		$data = array(	'title'				=>	'Riwayat Belanja',
						'header_transaksi'	=>	$header_transaksi,
						'isi'				=>	'dasbor/belanja' // nanti kita buat view belanja
					);
		$this->load->view('layout/wrapper', $data, FALSE);
	}

	// FUngsi buat yg klik Detail
	public function detail($kode_transaksi)
	{
		// Ambil data login id_pelanggan dari SESSION
		$id_pelanggan 	  = $this->session->userdata('id_pelanggan'); // Ini tuh dari libraries Simple_pelanggan ada session id_pelanggan
		$header_transaksi = $this->header_transaksi_model->kode_transaksi($kode_transaksi); // manggil function pelanggan di Header_transaksi_model.php
		$transaksi 		  = $this->transaksi_model->kode_transaksi($kode_transaksi); // ini dari Transaksi_model.php function kode_transaksi
		
		// Pastikan bahwa pelanggan hanya mengakses data transaksinya
		if($header_transaksi->id_pelanggan != $id_pelanggan) {
			$this->session->set_flashdata('warning', 'Anda mencoba mengakses data transaksi orang lain');
			redirect(base_url('masuk'));
		}

		$data = array(	'title'				=>	'Riwayat Belanja',
						'header_transaksi'	=>	$header_transaksi,
						'transaksi'			=>	$transaksi,
						'isi'				=>	'dasbor/detail' 
					);
		$this->load->view('layout/wrapper', $data, FALSE);	
	}

	// Profil
	public function profil()
	{
		// Ambil data login id_pelanggan dari session
		$id_pelanggan	= $this->session->userdata('id_pelanggan');
		$pelanggan 		= $this->pelanggan_model->detail($id_pelanggan);   // Baru kita bisa ambil data pelanggannya 

		// Validasi Input
		$valid = $this->form_validation;

		$valid->set_rules('nama_pelanggan','Nama Lengkap','required',
			array(	'required'		=> '%s harus diisi'));

		$valid->set_rules('alamat','Alamat Lengkap','required',
			array(	'required'		=> '%s harus diisi'));

		$valid->set_rules('telepon','Nomor Telepon','required',
			array(	'required'		=> '%s harus diisi'));

		if($valid->run()===FALSE) {
		// END Validasi

		$data = array(	'title'			=>	'Profil Saya',
						'pelanggan'		=>	$pelanggan,
						'isi'			=>	'dasbor/profil'
					);
		$this->load->view('layout/wrapper', $data, FALSE);
		// Masuk Database
	}else{
		$i = $this->input;
		// Kalau password lbh dari 6 karakter maka password akan diganti
		if(strlen($i->post('password')) >= 6 ) {
			$data = array(	'id_pelanggan'		=> $id_pelanggan, // dari SESSION
							'nama_pelanggan'	=> $i->post('nama_pelanggan'),
							'password'			=> SHA1($i->post('password')),
							'telepon'			=> $i->post('telepon'),
							'alamat'			=> $i->post('alamat'),
						); // ini tuh proses Data nya 
		}else{
			// Kalau Password kurang dari 6 maka password gk diganti

			$data = array(	'id_pelanggan'		=> $id_pelanggan,
							'nama_pelanggan'	=> $i->post('nama_pelanggan'),
							'telepon'			=> $i->post('telepon'),
							'alamat'			=> $i->post('alamat'),	
						);
		}
		// End Data Update
		$this->pelanggan_model->edit($data);
		$this->session->set_flashdata('sukses', 'Update Profil Berhasil');
		redirect(base_url('dasbor/profil'),'refresh');
	}
	// End Masuk database
	}

	// Konfirmasi Pembayaran
	public function konfirmasi($kode_transaksi)
	{
		$header_transaksi 	= $this->header_transaksi_model->kode_transaksi($kode_transaksi);
		$rekening 			= $this->rekening_model->listing(); // lalu tarik ke line 130
		
		// Validasi Input Copy paste dari fungsi tambah tp ada yg dirubah2
		$valid 		= $this->form_validation;

		$valid->set_rules('nama_bank','Nama Bank','required',
			array(	'required'		=> '%s harus diisi')); // nama_bank tuh field dari table header_transaksi

		$valid->set_rules('rekening_pembayaran','Nomor Rekening','required',
			array(	'required'		=> '%s harus diisi'));

		$valid->set_rules('rekening_pelanggan','Nama Pemilik Rekening','required',
			array(	'required'		=> '%s harus diisi'));

		$valid->set_rules('tanggal_bayar','Tanggal Pembayaran','required',
			array(	'required'		=> '%s harus diisi'));

		$valid->set_rules('jumlah_bayar','Jumlah Pembayaran','required',
			array(	'required'		=> '%s harus diisi'));
							
		if($valid->run()) {
			// Check jika gambar telah diganti, bukti_bayar itu sesuai name sama field di table header_transaksi
			if(!empty($_FILES['bukti_bayar']['name'])){

			$config['upload_path'] 		= './assets/upload/image/'; 
			$config['allowed_types']	= 'gif|jpg|png|jpeg';
			$config['max_size']  		= '2400';//Dalam KB
			$config['max_width'] 		= '2024';
			$config['max_height']  		= '2024';
			
			$this->load->library('upload', $config);
			
			if ( ! $this->upload->do_upload('bukti_bayar')){
		// END Validasi

		$data = array(	'title'				=> 'Konfirmasi Pembayaran',
						'header_transaksi'	=>	$header_transaksi,
						'rekening'			=>  $rekening,
						'error'				=>	$this->upload->display_errors(),
						'isi'				=>	'dasbor/konfirmasi'
					);
		$this->load->view('layout/wrapper', $data, FALSE);
				// Masuk Database
	}else{
		$upload_gambar = array('upload_data' => $this->upload->data());

		// Create thumbnail Gambar
		$config['image_library'] 	= 'gd2';
		$config['source_image'] 	= './assets/upload/image/'.$upload_gambar['upload_data']['file_name'];
		// Lokasi Folder Thumbail
		$config['new_image']		= './assets/upload/image/thumbs/';
		$config['create_thumb'] 	= TRUE;
		$config['maintain_ratio'] 	= TRUE;
		$config['width']         	= 250; //Pixel 
		$config['height']       	= 250; //Pixel
		$config['thumb_marker']		= '';

		$this->load->library('image_lib', $config);

		$this->image_lib->resize();
		// End Create Thumbnail

		$i = $this->input;
		// Ini tuh sesuai dgn field2 di table header_transaksi
		$data = array(	'id_header_transaksi'	=> $header_transaksi->id_header_transaksi,
						'status_bayar'			=> 'Konfirmasi',
						'jumlah_bayar'			=> $i->post('jumlah_bayar'),
						'rekening_pembayaran'	=> $i->post('rekening_pembayaran'),
						'rekening_pelanggan'	=> $i->post('rekening_pelanggan'),
						'bukti_bayar'			=> $upload_gambar['upload_data']['file_name'], // yg Disimpan adalah nama file Gambarnya
						'id_rekening'			=> $i->post('id_rekening'),
						'tanggal_bayar'			=> $i->post('tanggal_bayar'),
						'nama_bank'				=> $i->post('nama_bank')
					);
		$this->header_transaksi_model->edit($data);
		$this->session->set_flashdata('sukses', 'Konfirmasi Pembayaran Berhasil');
		redirect(base_url('dasbor'),'refresh');
	}}else{  // Konfirmasi tanpa bukti bayar
		// Edit Produk tanpa Ganti Gambar..
		$i = $this->input;
		
		$data = array(	'id_header_transaksi'	=> $header_transaksi->id_header_transaksi,
						'status_bayar'			=> 'Konfirmasi',
						'jumlah_bayar'			=> $i->post('jumlah_bayar'),
						'rekening_pembayaran'	=> $i->post('rekening_pembayaran'),
						'rekening_pelanggan'	=> $i->post('rekening_pelanggan'),
					//	bukti_bayar'			=> $upload_gambar['upload_data']['file_name'], // yg Disimpan adalah nama file Gambarnya
						'id_rekening'			=> $i->post('id_rekening'),
						'tanggal_bayar'			=> $i->post('tanggal_bayar'),
						'nama_bank'				=> $i->post('nama_bank')
					);
		$this->header_transaksi_model->edit($data);
		$this->session->set_flashdata('sukses', 'Konfirmasi Pembayaran Berhasil');
		redirect(base_url('dasbor'),'refresh');
		}}
	// End Masuk database	
		$data = array(	'title'				=> 'Konfirmasi Pembayaran',
						'header_transaksi'	=>	$header_transaksi,
						'rekening'			=>  $rekening,
						'isi'				=>	'dasbor/konfirmasi'
					);
		$this->load->view('layout/wrapper', $data, FALSE);
	}
}



/* End of file Dasbor.php */
/* Location: ./application/controllers/Dasbor.php */