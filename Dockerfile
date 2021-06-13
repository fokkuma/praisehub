# 作成するDockerイメージのベースとなるイメージを指定
FROM ruby:2.7.3
ENV LANG C.UTF-8

# Dockerイメージビルド時に、Dockerコンテナ内で実行するコマンドを定義
RUN apt-get update -qq && apt-get install -y nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
   && apt-get install -y nodejs

# 作業ディレクトリの作成
RUN mkdir /app
# Dockerfileをもとに生成したDockerコンテナ内で使える環境変数を指定
ENV APP_ROOT /app
WORKDIR $APP_ROOT

# ホストからGemfileをコンテナ上にコピー
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# Gemfileをbundle install:2.0.2
RUN gem install bundler -v 2.2.6
RUN bundle install
ADD . $APP_ROOT
