<?php
// Notifikasi Error
echo validation_errors('<div class="alert alert-warning">','</div>');

// Form open
echo form_open(base_url('admin/rekening/tambah'), ' class="form-horizontal"');
?>
<div class="pull-right">
    <a href="<?php echo base_url('admin/rekening') ?>" class="btn btn-success">
      <i class="fa fa-backward"></i> Kembali
    </a>
</div>

  <div class="form-group">
  <label class="col-md-2 control-label">Nama Bank</label>
  <div class="col-md-5">
    <input type="text" name="nama_bank" class="form-control" placeholder="Nama Bank" value="<?php echo set_value('nama_bank') ?>" required>
  </div>
</div>

 <div class="form-group">
  <label class="col-md-2 control-label">Nomor Rekening</label>
  <div class="col-md-5">
    <input type="number" name="nomor_rekening" class="form-control" placeholder="Nomor Rekening" value="<?php echo set_value('nomor_rekening') ?>" required>
  </div>
</div>

<div class="form-group">
  <label class="col-md-2 control-label">Nama Pemilik Rekening (Atas Nama)</label>
  <div class="col-md-5">
    <input type="text" name="nama_pemilik" class="form-control" placeholder="Nama Pemilik Rekening" value="<?php echo set_value('nama_pemilik') ?>" required>
  </div>
</div>

 <div class="form-group">
  <label class="col-md-2 control-label"></label>
  <div class="col-md-5">
  <button class="btn btn-primary btn-lg" name="submit" type="submit">
  	<i class="fa fa-paper-plane"></i> Simpan
  </button>
  <button class="btn btn-danger btn-lg" name="reset" type="reset">
  	<i class="fa fa-refresh"></i> Reset
  </button>
  </div>
</div>

<?php echo form_close(); ?>