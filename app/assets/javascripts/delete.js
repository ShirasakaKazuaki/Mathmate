$(document).ready(function () {

    function img_del(target_box, target_btn, target_form){
        target_box.find("div.img_del").on('click',function(){

            if(window.confirm('画像を削除しますか？'))
            {
                $(this).parent().find('input[type=file]').val('');
                $(this).parent().find('.img_view, br').remove();
                $(this).remove();
                target_btn.show();
                target_form.show();
            }

            return false;
        });
    }  
    
});