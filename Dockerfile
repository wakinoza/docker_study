# 1. ベースにするイメージ（今回は軽量なAlpine Linux）
FROM alpine:latest

# 2. 自分の好きなツールをインストール（例: curl と mysql-client）
RUN apk add --no-cache curl mysql-client

# 3. コンテナ起動時に実行されるデフォルトコマンド
CMD ["sh"]