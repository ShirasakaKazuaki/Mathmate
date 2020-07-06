function latexInput(type, btn_name, add_text, added_form){
    var typeClass = "." + type;
    var btnId = "#" + btn_name;

    $(typeClass + btnId).click( function() {

        var textarea = document.querySelector(added_form);
        var sentence = textarea.value;
        var len      = sentence.length;
        var pos      = textarea.selectionStart;
        var before   = sentence.substr(0, pos);
        var word     = add_text;
        var after    = sentence.substr(pos, len);

        sentence = before + word + after;
        textarea.value = sentence;  
    });
}

const latex_items = [
    {name: "apmb", formula: "$$a \\pm b$$"},
    {name: "atimesb", formula: "$$a \\times b$$"},
    {name: "adivideb", formula: "$$a \\div b $$"},
    {name: "fraction", formula: "$$\\frac{b}{a}$$"},
    {name: "aupx", formula: "$$a^x$$"},
    {name: "logax", formula: "$$\\log_{a} x$$"},
    {name: "square", formula: "$$\\sqrt{x}$$"},
    {name: "squareover", formula: "$$\\sqrt[3]{x}$$"},
    {name: "sintheta", formula: "$$\\sin \\theta$$"},
    {name: "costheta", formula: "$$\\cos \\theta$$"},
    {name: "tantheta", formula: "$$\\tan \\theta$$"},
    {name: "abar", formula: "$$\\overline{ A }$$"},
    {name: "amodb", formula: "$$a \\equiv b$$"},
    {name: "anotb", formula: "$$a \\neq b$$"},
    {name: "alrarrowb", formula: "$$a \\Leftrightarrow b$$"},
    {name: "ararrowb", formula: "$$a \\Longrightarrow b$$"},
    {name: "alarrowb", formula: "$$a \\Longleftarrow b$$"},
    {name: "averticalb", formula: "$$a \\parallel b$$"},
    {name: "angle", formula: "$$\\angle ABC$$"},
    {name: "an", formula: "$$a_n$$"},
    {name: "vector", formula: "$$\\overrightarrow{ab}$$"},
    {name: "limit", formula: "$$\\lim_{n\\to\\infty} n$$"},
    {name: "diff", formula: "$$\\frac{d}{dx} f(x)$$"},
    {name: "sigma", formula: "$$\\sum_{k=1}^{n} k$$"},
    {name: "integral", formula: "$$\\int_{a}^{b} f(x) dx$$"},
    {name: "definiteintegral", formula: "$$\\left[ F(x) \\right]^b _a$$"}
];


$(function () {
    $('.btn-latex-pack').each(function(){
        $(this).on('click',function(){
            $("+.latex-buttons",this).slideToggle();
            return false;
        });
    });

    for(let i =0; i<latex_items.length; i++){
        latexInput("question_type", latex_items[i].name, latex_items[i].formula, "#textform_question");
        latexInput("answer_type", latex_items[i].name, latex_items[i].formula, "#textform_answer");
        latexInput("content_type", latex_items[i].name, latex_items[i].formula, "#textform_content");
    }
});