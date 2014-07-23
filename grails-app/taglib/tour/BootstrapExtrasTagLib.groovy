package tour

class BootstrapExtrasTagLib {
    static namespace = "b"

    static defaultEncodeAs = [taglib:'html']
    static encodeAsForTags = [datepicker: [taglib:'raw']]

    /**
     * @attr name REQUIRED the name of the property holding the date
     * @attr value the current value
     */
    def datepicker = { attrs, body ->
        // There might be multiple datepickers referring to properties of the same name but on different entities
        // and/or in different forms. Generate a random id to handle this.
        String datePickerId = "datepicker-${UUID.randomUUID().toString()}"
        String name = attrs.name
        Date value = attrs.value
        // Groovy or at least IntelliJ barfs on data-date-format: ..., so need an intermediate map.
        def params = [name: name, class: "form-control date-picker", id: datePickerId, type: "text"]
        params["data-date-format"] = "yyyy-mm-dd"
        if (value) {
            params.value = value.format("yyyy-MM-dd")
        }
        String textFieldContents = textField(params)
        out << """
<div class="input-group">
    ${textFieldContents}
    <span class="input-group-addon">
        <i class="glyphicon glyphicon-calendar bigger-110"></i>
    </span>
</div>
        """
        String assetContents = asset.script() { """
\$('#${datePickerId}').datepicker({autoclose:true}).next().on("click", function(){
    \$(this).prev().focus();
});
        """}
        out << assetContents
    }

}
