<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-7">
            <div class="card shadow-lg border-0 rounded-lg mt-5">
                <div class="card-header">
                    <h3 class="text-center font-weight-light my-4">Create Account</h3>
                </div>
                <div class="card-body">
                    <?= $this->session->flashdata('message'); ?>
                    <form method="post" action="<?= base_url('auth/register'); ?>">
                        <div class="form-floating mb-3">
                            <input class="form-control" id="nama" name="nama" type="text" placeholder="Enter your name"
                                value="<?= set_value('nama'); ?>" />
                            <label for="nama">Name</label>
                            <?= form_error('nama', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>
                        <div class="form-floating mb-3">
                            <input class="form-control" id="email" name="email" type="email"
                                placeholder="name@example.com" value="<?= set_value('email'); ?>" />
                            <label for="email">Email address</label>
                            <?= form_error('email', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>
                        <div class="form-floating mb-3">
                            <input class="form-control" id="username" name="username" type="text"
                                placeholder="Enter your username" value="<?= set_value('username'); ?>" />
                            <label for="username">Username</label>
                            <?= form_error('username', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <div class="form-floating mb-3 mb-md-0">
                                    <input class="form-control" id="password" name="password" type="password"
                                        placeholder="Create a password" />
                                    <label for="password">Password</label>
                                    <?= form_error('password', '<small class="text-danger pl-3">', '</small>'); ?>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating mb-3 mb-md-0">
                                    <input class="form-control" id="konfirmasi_password" name="konfirmasi_password"
                                        type="password" placeholder="Confirm password" />
                                    <label for="konfirmasi_password">Confirm Password</label>
                                    <?= form_error('konfirmasi_password', '<small class="text-danger pl-3">', '</small>'); ?>
                                </div>
                            </div>
                        </div>
                        <div class="mt-4 mb-0">
                            <div class="d-grid"><button type="submit" class="btn btn-primary btn-block">Create
                                    Account</button></div>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center py-3">
                    <div class="small"><a href="<?= base_url('auth/login'); ?>">Have an account? Go to login</a></div>
                </div>
            </div>
        </div>
    </div>
</div>