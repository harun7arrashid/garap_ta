<?php
// Notifikasi Error
echo validation_errors('<div class="alert alert-warning">','</div>');

// Form open
echo form_open(base_url('admin/kategori/edit/'.$kategori->id_kategori),' class="form-horizontal"');
?>
<div class="pull-right">
    <a href="<?php echo base_url('admin/kategori') ?>" class="btn btn-success">
      <i class="fa fa-backward"></i> Kembali
    </a>
</div>
  <div class="form-group">
  <label class="col-md-2 control-label">Nama kategori</label>
  <div class="col-md-5"> 
    <input type="text" name="nama_kategori" class="form-control" placeholder="Nama kategori" value="<?php echo $kategori->nama_kategori ?>" required>
  </div>
</div>

 <div class="form-group">
  <label class="col-md-2 control-label">Urutan</label>
  <div class="col-md-5">
    <input type="number" name="urutan" class="form-control" placeholder="Urutan" value="<?php echo $kategori->urutan ?>" required>
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