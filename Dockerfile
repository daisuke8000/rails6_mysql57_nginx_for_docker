FROM ruby:2.6.6
# 2020.04月時点での安定版

ENV LANG C.UTF-8
# コンテナへの環境変数の定義(エンコード)
ENV APP_ROOT /usr/src
# コンテナへの環境変数の定義（ディレクトリ）
WORKDIR $APP_ROOT
# 作業ディレクトリの割当

RUN set -ex && \
    apt-get update -qq && \
    apt-get install -y sudo && \
    : "Install node.js" && \
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - && \
    apt-get update -qq && \
    apt-get install -y nodejs && \
    : "Install yarn" && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    apt-get install -y yarn && \
    : "Install rails6.X latest version" && \
    gem install rails --version="~>6.0.0"
