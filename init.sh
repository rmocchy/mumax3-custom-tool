#! /bin/bash

# 仮想環境構築
docker buildx build -t mumax3-custom-tool .
# エラーが起きるようならこっちにしてください
# docker buildx build --no-cache -t mumax3-custom-tool .