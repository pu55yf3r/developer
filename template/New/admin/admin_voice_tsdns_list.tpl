<section class="content-header">
    <h1>TSDNS <?php echo $gsprache->master;?></h1>
    <ol class="breadcrumb">
        <li><a href="admin.php"><i class="fa fa-home"></i> Home</a></li>
        <li><a href="admin.php?w=vo"><i class="fa fa-microphone"></i> <?php echo $gsprache->voiceserver;?></a></li>
        <li><a href="admin.php?w=vd"><i class="fa fa-server"></i> TSDNS <?php echo $gsprache->master;?></a></li>
        <li class="active"><?php echo $gsprache->overview;?></li>
    </ol>
</section>

<section class="content">

    <div class="row">
        <div class="col-md-12">
            TSDNS <?php echo $gsprache->master;?> <a href="admin.php?w=vd&amp;d=ad"><span class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i> <?php echo $gsprache->add;?></span></a>
        </div>
    </div>

    <hr>

    <div class="row">
        <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-body table-responsive">
                    <table id="dataTable" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th><?php echo $sprache->ssh_ip;?></th>
                            <th>ID</th>
                            <th><?php echo $gsprache->status;?></th>
                            <th><?php echo $sprache->description;?></th>
                            <th><?php echo $sprache->defaultdns;?></th>
                            <th><?php echo $sprache->maxserver;?></th>
                            <th><?php echo $gsprache->action;?></th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                        <tfoot>
                        <tr>
                            <th><?php echo $sprache->ssh_ip;?></th>
                            <th>ID</th>
                            <th><?php echo $gsprache->status;?></th>
                            <th><?php echo $sprache->description;?></th>
                            <th><?php echo $sprache->defaultdns;?></th>
                            <th><?php echo $sprache->maxserver;?></th>
                            <th><?php echo $gsprache->action;?></th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>