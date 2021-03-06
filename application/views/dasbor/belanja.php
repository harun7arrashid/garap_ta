
<!-- Content page -->
<section class="bgwhite p-t-55 p-b-65">
<div class="container">
	<div class="row">
		<div class="col-sm-6 col-md-3 col-lg-3 p-b-50">
			<div class="leftbar p-r-20 p-r-0-sm">
				<!--  -->
				<?php include('menu.php') ?>
			</div>
		</div>

		<div class="col-sm-6 col-md-9 col-lg-9 p-b-50">
				
				<h2><?php echo $title ?></h2>
				<hr>
				<p>Berikut adalah riwayat belanja Anda</p>

				<?php
				// Kalau ada transaksi, tampilkan tabel
				if($header_transaksi) { // $header_transaksi itu dari Dasbor.php 
				?>

				<table class="table table-bordered" width="100%">
					<thead>
						<tr class="bg-info">
							<th>NO</th>
							<th>KODE</th>
							<th>TANGGAL</th>
							<th>JUMLAH TOTAL</th>
							<th>JUMLAH ITEM</th>
							<th>STATUS BAYAR</th>
							<th>ACTION</th>
						</tr>
					</thead>
					<tbody>
						<?php $i=1; foreach($header_transaksi as $header_transaksi) { // ini tuh tabel header_transaksi?>
						<tr>
							<td><?php echo $i ?></td>
							<td><?php echo $header_transaksi->kode_transaksi ?></td>
							<td><?php echo date('d-m-Y',strtotime($header_transaksi->tanggal_transaksi)) ?></td>
							<td><?php echo number_format($header_transaksi->jumlah_transaksi) ?></td>
							<td><?php echo $header_transaksi->total_item ?></td>
							<td><?php echo $header_transaksi->status_bayar ?></td>
							<td>
								<div class="btn-group">
								<table>
									<td>
										<a href="<?php echo base_url('dasbor/detail/'.$header_transaksi->kode_transaksi) ?>" class="btn btn-danger btn-sm"><i class="fa fa-eye"></i> Detail </a>
									</td>
									<td>
										<a href="<?php echo base_url('dasbor/konfirmasi/'.$header_transaksi->kode_transaksi) ?>" class="btn btn-success btn-sm"><i class="fa fa-upload"></i> Konfirmasi Bayar </a>
									</td>
								</table>												
								</div>
							</td>
						</tr>
						<?php $i++; } ?>
					</tbody>
				</table>

				<?php
				// Kalau gada tampilkan notifikasi 
				}else{ ?>

					<p class="alert alert-success">
						<i class="fa fa-warning"></i> Belum ada data transaksi
					</p>

				<?php } ?>

					
		</div>
	</div>
</div>
</section>
