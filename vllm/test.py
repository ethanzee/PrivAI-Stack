from openai import OpenAI

# 连接本地服务（无需真实 API Key）
client = OpenAI(
    base_url="http://localhost:8000/v1",
    api_key="dummy-key"
)

# 调用聊天接口
response = client.chat.completions.create(
    model="./qwen2.5-7b-instruct-awq",
    messages=[
        {"role": "system", "content": "回答友好简洁"},
        {"role": "user", "content": "介绍下弗洛伊德"}
    ],
    max_tokens=300
)

# 打印结果
print("模型回答：")
print(response.choices[0].message.content)
