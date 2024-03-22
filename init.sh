#! /bin/bash

# コマンドをどこでも使えるようにすする
# シンボリックリンク
#sudo ln -s router.sh /usr/local/bin/mx3tool
# 実行権限付与
#sudo sudo chmod +x /usr/local/bin/mx3tool

# 仮想環境構築
docker buildx build -t mumax3-custom-tool .
# エラーが起きるようならこっちにしてください
# docker buildx build --no-cache -t mumax3-custom-tool .