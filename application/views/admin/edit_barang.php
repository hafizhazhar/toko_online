<div class="container-fluid">
    <h3><i class="fas fa-edit"></i>EDIT DATA BARANG</h3>

    <?php foreach($barang as $brg) : ?>

        <form method="post" action="<?php echo base_url(). 'admin/data_barang/update' ?>">
            <div class="for-group">
                <label>Nama Barang</label>
                <input type="text" name="nama_brg" class="form-control"
                value="<?php echo $brg->nama_brg ?>">
            </div>

            <div class="for-group">
                <label>Keterangan</label>
                <input type="hidden" name="Id_brg" class="form-control"
                value="<?php echo $brg->Id_brg ?>">
                <input type="text" name="Keterangan" class="form-control"
                value="<?php echo $brg->Keterangan ?>">
            </div>

            <div class="for-group">
                <label>Kategori</label>
                <input type="text" name="Kategori" class="form-control"
                value="<?php echo $brg->Kategori ?>">
            </div>

            <div class="for-group">
                <label>Harga</label>
                <input type="text" name="Harga" class="form-control"
                value="<?php echo $brg->Harga ?>">
            </div>

            <div class="for-group">
                <label>Stok</label>
                <input type="text" name="Stok" class="form-control"
                value="<?php echo $brg->Stok ?>">
            </div>

            <button type="submit" class= "btn btn-primary btn-sm mt-3"> Simpan </button>
        </form>

        <?php endforeach; ?>

</div>
