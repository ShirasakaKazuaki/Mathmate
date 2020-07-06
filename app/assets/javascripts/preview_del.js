$(document).ready(function () {
    
    var del_btn = $('.del_btn');

    del_btn.on('click',function(){
        var 
        btn_for = $('.' + $(this).data('btn-class')),
        del_img = $('.' + $(this).data('del-img-class')),
        apr_form = $('.' + $(this).data('apr-form'));

            if(window.confirm('画像を削除しますか？'))
            {
                btn_for.hide();
                del_img.hide();
                apr_form.show();
            }

            return false;
    });
});