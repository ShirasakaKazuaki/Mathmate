$(document).ready(function () {

    $('input[class="check_box"]').change(function() {
            
        var 
        for_class = '.' + $(this).attr('id'),
        del_btn = $(for_class),
        del_img = $('.' + del_btn.data('del-img-class')),
        apr_form = $('.' + del_btn.data('apr-form'));

            if(window.confirm('画像を削除しますか？'))
            {
                del_btn.hide();
                del_img.hide();
                apr_form.show();
            }

            return false;
            
        });

});