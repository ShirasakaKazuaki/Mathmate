$(function () {
    $('.btn-category-pack').each(function(){
        $(this).on('click',function(){
            $("+.box_unit",this).slideToggle();
            return false;
        });
    });
});