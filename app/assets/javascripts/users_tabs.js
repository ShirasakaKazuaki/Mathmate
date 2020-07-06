$(document).ready(function () {
	$('.tab').click(function(){

        $('.active').removeClass('active');
        $(this).addClass('active');
        $('.is-show').removeClass('is-show');

        const index = $(this).index();

        $('.user-content').eq(index).addClass('is-show');

    });
});