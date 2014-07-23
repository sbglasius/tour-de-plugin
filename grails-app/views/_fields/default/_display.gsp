<div class="form-group clearfix">
    <label class="col-sm-${cols ?: '2'} control-label">${label}</label>

    <div class="col-sm-${cols ? 12 - cols.toInteger() : 10}">

        <p class="form-control-static"><strong>${raw(value)}</strong></p>
    </div>
</div>
