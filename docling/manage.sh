#!/bin/bash

# 加载环境变量
set -a
[ -f .env ] && source .env
set +a

case "$1" in
  start)
    echo "正在检查并创建目录..."
    mkdir -p "${UPLOAD_DIR}" "${LOG_DIR}" "${MODEL_CACHE}"
    docker compose up -d
    echo "服务已启动。"
    ;;
  stop)
    docker compose down
    echo "服务已停止。"
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  logs)
    docker compose logs -f
    ;;
  *)
    echo "用法: $0 {start|stop|restart|logs}"
    exit 1
esac