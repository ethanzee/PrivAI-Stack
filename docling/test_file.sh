#!/bin/bash

# 加载环境变量获取端口
source .env
PORT=${HOST_PORT:-9969}

# 检查是否输入了文件路径
if [ -z "$1" ]; then
    echo "使用方法: ./test_file.sh [文件路径]"
    echo "示例: ./test_file.sh ./test.pdf"
    exit 1
fi

FILE_PATH=$1

if [ ! -f "$FILE_PATH" ]; then
    echo "错误: 文件 $FILE_PATH 不存在。"
    exit 1
fi

echo "--- 正在测试：上传并转换本地文件 ($FILE_PATH) ---"

# 注意：这里将 -F "file=..." 改成了 -F "files=..."
curl -s -X 'POST' \
  "http://localhost:$PORT/v1/convert/file" \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -F "files=@$FILE_PATH" | jq .