module PostsHelper

  # new.html.erb
  def step_one
    "STEP1. わからない問題を書こう！"
  end
    
  def prev
    content_tag(:span, "P", class: "top")+"review"
  end

  def question
    content_tag(:span, "Q", class: "top")+"estion"
  end

  def answer
    content_tag(:span, "M", class: "top")+"y"+content_tag(:span, "A", class: "top")+"nswer"
  end

  def step_one_text
    "⭐️ここに問題を書こう！写真でもOK🤳"
  end

  def step_two
    "STEP2. あなたの解答を見せよう！"
  end

  def step_two_text
    "⭐️ここに自分の解答や、問題集の解答を書こう！写真でもOK🤳"
  end

  def step_three
    "STEP3. 質問内容を書こう！"
  end

  def step_three_text
    "⭐️ここに何を知りたいのか書こう！自分の解答と照らし合わせて聞くとGood！"
  end

  def step_four
    "STEP4. タイトルと単元を考えよう。"
  end

  def step_four_text
    "⭐️聞きたいこと、単元などを書くとGood！"
  end

  def step_five
    "STEP5. カテゴリーを選択しよう！"
  end

  def step_five_text
    "⭐️1つ以上のカテゴリーを選ぼう！"
  end

  def step_six
    "補足"
  end

  def step_six_text
    "⭐️問題や解答の補足情報などを書こう。"
  end

  # show.html.erb
  def confirm_del
    "⚠️投稿を削除してもいいですか？⚠️"
  end

  def edit_term
    "編集する"
  end

  def del_term
    "削除する"
  end
    
  def question_term
    "わからないこと"
  end

  def answer_term
    "質問者の答案"
  end

  def supplement_term
    "補足"
  end

  def responses_term
    "解答一覧"
  end

  def lets_term_one
    "あなたの解答を送ろう！"
  end

  def lets_term_two
    "なるべく優しく教えてあげてね"
  end

  def lets_term_three
    "投稿する"
  end

  def latex_terms
    formulas={
        # 数
        "apmb": "$a \\pm b$",
        "atimesb": "$a \\times b$",
        "adivideb": "$a \\div b $",
        "fraction": "$\\frac{b}{a}$",
        "aupx": "$a^x$",
        "logax": "$\\log_{a} x$",
        "square": "$\\sqrt{x}$",
        "squareover": "$\\sqrt[3]{x}$",
        "sintheta": "$\\sin \\theta$",
        "costheta": "$\\cos \\theta$",
        "tantheta": "$\\tan \\theta$",
        # 記号
        "abar": "$\\overline{ A }$",
        "amodb": "$a \\equiv b$",
        "anotb": "$a \\neq b$",
        "alrarrowb": "$a \\Leftrightarrow b$",
        "ararrowb": "$a \\Longrightarrow b$",
        "alarrowb": "$a \\Longleftarrow b$",
        "averticalb": "$a \\parallel b$",
        "angle": "$\\angle ABC$",
        "an": "$a_n$",
        "vector": "$\\overrightarrow{ab}$",
        # 数式
        "limit": "$\\displaystyle \\lim_{n\\to\\infty} n$",
        "diff": "$\\frac{d}{dx} f(x)$",
        "sigma": "$\\displaystyle\\tiny \\sum_{k=1}^{n} k$",
        "integral": "$\\small \\int_{a}^{b} f(x) dx$",
        "definiteintegral": "$\\left[ F(x) \\right]^b _a$"
    }
  end
end
