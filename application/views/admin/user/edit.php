<?php
// Notifikasi Error
echo validation_errors('<div class="alert alert-warning">','</div>');

// Form open
echo form_open(base_url('admin/user/edit/'.$user->id_user),' class="form-horizontal"');
?>
<div class="pull-right">
    <a href="<?php echo base_url('admin/user') ?>" class="btn btn-success">
      <i class="fa fa-backward"></i> Kembali
    </a>
</div>    
  <div class="form-group">
  <label class="col-md-2 control-label">Nama pengguna</label>
  <div class="col-md-5">
    <input type="text" name="nama" class="form-control" placeholder="Nama pengguna" value="<?php echo $user->nama ?>" required>
  </div>
</div>

 <div class="form-group">
  <label class="col-md-2 control-label">Email</label>
  <div class="col-md-5">
    <input type="email" name="email" class="form-control" placeholder="Email pengguna" value="<?php echo $user->email ?>" required>
  </div>
</div>

 <div class="form-group">
  <label class="col-md-2 control-label">Username</label>
  <div class="col-md-5">
    <input type="text" name="username" class="form-control" placeholder="Username" value="<?php echo $user->username ?>" readonlye>
  </div>
</div>

 <div class="form-group">
  <label class="col-md-2 control-label">Password</label>
  <div class="col-md-5">
    <input type="password" name="password" class="form-control" placeholder="Password" value="<?php echo $user->password ?>" required>
  </div>
</div>

 <div class="form-group">
  <label class="col-md-2 control-label">Level Hak Akses</label>
  <div class="col-md-5">
     <select name="akses_level" class="form-control">
     	<option value="Admin">Admin</option>
     	<option value="User" <?php if($user->akses_level=="User") { echo "selected"; } ?>>User</option>
     </select>
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