$(document).ready(function () {
	$(".validate").validate({
        rules: {

                "post[content]":{
                        required: true,
                        maxlength: 1000
                },

                "post[title]":{
                        required: true,
                        maxlength: 50
                },
                
                "post[unit_ids][]":{
                        required: true
                },

                "post[qimg]":{
                        extension: "png|jpeg|jpg|gif",
                        maxsize: 5242880
                },

                "post[aimg]":{
                        extension: "png|jpeg|jpg|gif",
                        maxsize: 5242880
                },

                "user[profile]":{
                        maxlength: 200
                },

                "user[uimg]":{
                        extension: "png|jpeg|jpg|gif",
                        maxsize: 5242880
                }
        },
        messages: {
                "post[unit_ids][]":{
                        required: "　😱カテゴリーを1つ以上選択してください。"
                },

                "post[qimg]":{
                        extension: "　🎆画像を選択してください。"
                },

                "post[aimg]":{
                        extension: "　🎆画像を選択してください。"
                },

                "user[uimg]":{
                        extension: "　🎆画像を選択してください。"
                }
        },
        errorPlacement: function(error, element) {
                if(element.attr("name")=="post[unit_ids][]")
                {
                        error.insertAfter("#unit_check_error");	
                }else{
                        error.insertAfter(element);	
                }
        }
        });
        // Limit the size of each individual file in a FileList.
        jQuery.validator.addMethod( "maxsize", function( value, element, param ) {
                if ( this.optional( element ) ) {
                        return true;
                }

                if ( $( element ).attr( "type" ) === "file" ) {
                        if ( element.files && element.files.length ) {
                                for ( var i = 0; i < element.files.length; i++ ) {
                                        if ( element.files[ i ].size > param ) {
                                                return false;
                                        }
                                }
                        }
                }

                return true;
        }, $.validator.format( "画像は10MBまでにしてください😵" ) );
});