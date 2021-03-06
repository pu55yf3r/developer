<section class="content-header">
     <script src="js/default/jquery.min.js" type="text/javascript"></script>
    <h1><?php echo $imageSprache->liveConsole;?></h1>
<div class="">
        <a href="userpanel.php?w=gs&amp;d=rs&amp;id=<?php echo $id;?>&amp;r=gs" onclick="return confirm('<?php echo $serverIp.':'.$port;?>: <?php echo $sprache->confirm_restart;?>');"><button class="btn btn-outline-success"><i class="icon-white icon-play"></i> <?php echo $sprache->restarts;?></button></a>
    <?php if($stopped=='N'){ ?><a href="userpanel.php?w=gs&amp;d=st&amp;id=<?php echo $id;?>&amp;r=gs" onclick="return confirm('<?php echo $serverIp.':'.$port;?>: <?php echo $sprache->confirm_stop;?>');"><button class="btn btn-outline-danger"><i class="fa fa-power-off"></i> <?php echo $sprache->stop;?></button></a><?php } ?></div>
    <ol class="breadcrumb">
        <li><a href="userpanel.php"><i class="fa fa-home"></i> Home</a></li>
        <li><a href="userpanel.php?w=gs"><i class="fa fa-gamepad"></i> <?php echo $gsprache->gameserver;?></a></li>
        <li><i class="fa fa-terminal"></i> <?php echo $imageSprache->liveConsole;?></li>
        <li class="active"><?php echo $serverIp.':'.$port;?></li>
    </ol>
</section>

<section style="padding: 15px 15px 0 15px; class="content">

    <div class="row">
        <div class="col-md-12">
            <div class="box box-primary">

                <div class="box-body" id="boxBody" style="overflow-y:scroll;height: 500px;font-family:'Courier';">
                </div>

                <div class="box-footer">
                    <?php if ($liveConsole=='Y') { ?>
                    <div class="input-group">
                        <input id="inputCommand" type="text" class="form-control" name="command" value="" onkeydown="enterUsed(event)">
                        <span class="input-group-btn">
                            <button class="btn btn-primary btn-flat" type="button" onclick="submitForm()"><i class="fa fa-play-circle"></i></button>
                        </span>
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</section>
<script type='text/javascript'>

    var lastLog = 0;
    var getRequestStarted = false;

    function enterUsed(event) {
        if (event.keyCode === 13) {
            submitForm();
        }
    }

    function submitForm() {

        var inputCommand = $('#inputCommand');

        $.ajax({
            url: 'ajax.php?d=serverLog&id=<?php echo $id;?>',
            cache: false,
            method: 'POST',
            data: {
                cmd: inputCommand.val()
            }
        }).done(function(jsonReturn) {
            setTimeout(function(){getLog()},1000);
        });

        inputCommand.val('');

        return false;
    }

    function getLog() {

        if (getRequestStarted === false) {

            getRequestStarted = true;

            $.ajax({
                url: 'ajax.php?d=serverLog&id=<?php echo $id;?>&lastLog=' + lastLog,
                cache: false
            }).done(function(jsonReturn) {

                getRequestStarted = false;

                var jsonParsed = JSON.parse(jsonReturn);

                if (jsonParsed.error) {

                    alert(jsonParsed.error);

                } else {

                    lastLog = jsonParsed.lastLog;

                    if (jsonParsed.log.length > 0) {
                        var boxBody = $('#boxBody');
                        boxBody.append(jsonParsed.log);
                        boxBody.scrollTop(boxBody.prop("scrollHeight"));
                    }
                }
            });
        }
    }

    function resizeHeigth() {
        var logHeight = window.innerHeight - $('.content-header').height() - $('.box-footer').height() - $('.main-header').height();
        $('#boxBody').height(logHeight * 0.6);
    }

    $(window).resize(function() {
        resizeHeigth();
    });

    $(function(){
        resizeHeigth();
        getLog();

        setInterval(function(){getLog()},3000);
    });
</script>
