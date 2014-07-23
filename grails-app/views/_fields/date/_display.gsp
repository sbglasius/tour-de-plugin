<div class="form-group clearfix">
    <label class="col-sm-2 control-label">${label}</label>

    <div class="col-sm-10">
        <p class="form-control-static"><g:formatDate date="${bean."$property"}" format="${format ? format : 'yyyy-MM-dd HH:mm'}"/></p>
    </div>
</div>
