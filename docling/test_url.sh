#!/bin/bash

# 加载环境变量获取端口
source .env
PORT=${HOST_PORT:-9969}

echo "--- 正在测试：转换在线 PDF ---"
echo "目标地址: http://localhost:$PORT"

curl -s -X 'POST' \
  "http://localhost:$PORT/v1/convert/source" \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "http_sources": [
    {"url": "https://arxiv.org/pdf/2408.09869"}
  ]
}' | jq .
