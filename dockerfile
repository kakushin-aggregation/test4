# ベースイメージを指定
FROM python:3.6-stretch
#環境変数を設定
ENV PYTHONUNBUFFERED 1
#コンテナ内に/codeというディレクトリを作成
RUN mkdir /code
# /codeディレクトリをルートディレクトリに設定
WORKDIR /code

# pipでrequirements.txtに記載のパッケージをインストーdル
#COPY requirements.txt /code/
#RUN pip3 install -r requirements.txt


 #ホストのPipfileとPipfile.lockをコンテナの/code/配下にコピー
 COPY Pipfile /code/
 COPY Pipfile.lock /code/
 #pipenvをインストール
 RUN pip3 install pipenv
 #Pipfileに定義しているツールのインストール
 RUN pipenv install --system

COPY . /code/