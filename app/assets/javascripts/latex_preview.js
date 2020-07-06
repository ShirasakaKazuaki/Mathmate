$(function() {
    // 入力内容をLaTexに変換
    function makePreview(id, prev_box) {
        var area_id = "#" + id;
        var prev = "#" + prev_box;
    
        input = $(area_id).val().replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/\n/g,"<br>");
        $(prev).html(input);
        MathJax.Hub.Queue(["Typeset",MathJax.Hub,prev]);
    }
    function backVanish(prev_class){
        var prev = "." + prev_class;
        $(prev).show(900);
    } 

    // プレビュー欄に入力内容を反映
    function bodyAdd(id, prev_box, prev_class){
        var area_id = "#" + id;
        $(area_id).keyup(function(){backVanish(prev_class)});
        $(area_id).keyup(function(){makePreview(id, prev_box)});
    }
    

    const items = [
        {id: "textform_question", prev_box: "q_preview", prev_class: "show_question"},
        {id: "textform_answer", prev_box: "a_preview", prev_class: "show_answer"},
        {id: "textform_content", prev_box: "content_preview", prev_class: "new_content_only"},
    ]

    for (let i = 0; i < 3; i ++){
        bodyAdd(items[i].id, items[i].prev_box, items[i].prev_class);
    }

});