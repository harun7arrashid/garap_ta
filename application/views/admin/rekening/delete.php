<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#delete-<?php echo $rekening->id_rekening ?>">
<i class="fa fa-trash-o"></i> Hapus
</button>

<div class="modal modal-info fade" id="delete-<?php echo $rekening->id_rekening ?>">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title text-center"><i class="fa fa-exclamation-triangle"></i> Hapus Data Rekening ?</h4>
      </div>
      <div class="modal-body">
       <div class="callout callout-danger">
            <h4>Peringatan <i class="fa fa-exclamation"></i> </h4>
             Yakin ingin menghapus data ini ? Data yang sudah dihapus tidak dapat dikembalikan.
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning pull-left" data-dismiss="modal"><i class="fa fa-times"></i> Batal</button>
        <a href="<?php echo base_url('admin/rekening/delete/'.$rekening->id_rekening) ?>" class="btn btn-success"><i class="fa fa-trash-o"></i> Ya, Hapus Data Ini</a>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->