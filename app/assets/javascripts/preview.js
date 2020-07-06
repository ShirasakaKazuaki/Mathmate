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
    
    $(".file").on('change', function(){
        var 
        text_form = $('.' + $(this).data('target-text')),
        view_button = $('.' + $(this).data('target-btn')),
        view_box = $('.' + $(this).data('target-box')),
        fileprop = $(this).prop('files')[0],
        find_img = $(this).next('img'),
        fileRdr = new FileReader();

        if(find_img.length){
            find_img.nextAll().remove();
            find_img.remove();
        }

        var img = '<div class="prev_img_zone"><div><img class="img_view"></div><div class="img_del btn btn-danger">画像を削除する</div></div>';

        fileRdr.onload = function() { 
            view_box.append(img);
            view_button.hide();
            view_box.find('img').attr('src', fileRdr.result);
            img_del(view_box, view_button, text_form); 
        }
        fileRdr.readAsDataURL(fileprop);  
    });
    
});