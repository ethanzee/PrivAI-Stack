curl http://localhost:7000/v1/chat/completions   -H "Content-Type: application/json"   -d '{
    "model": "Qwen3-14B-FP8",
    "messages": [
      {"role": "system", "content": "你是一个乐于助人的助手。"},
      {"role": "user", "content": "你好，请介绍一下你自己。"}
    ],
    "max_tokens": 100,
    "temperature": 0.7
  }'