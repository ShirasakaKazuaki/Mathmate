#使用するRubyのバージョンを指定
FROM ruby:2.5.3

#　必要なパッケージをインストール
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs           

# 作業ディレクトリの作成、設定
RUN mkdir /mathmate 
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "vim"]

#作業ディレクトリ名をAPP_ROOTに割り当てて、以下$APP_ROOTで参照
ENV APP_ROOT /mathmate 
WORKDIR $APP_ROOT

# ホスト側（ローカル）のGemfileを追加する
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# Gemfileのbundle install
RUN bundle install
ADD . $APP_ROOT