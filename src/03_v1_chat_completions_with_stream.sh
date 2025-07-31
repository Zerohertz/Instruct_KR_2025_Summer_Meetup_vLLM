#!/bin/bash

curl -X POST http://localhost:8000/v1/chat/completions \
	-H "Content-Type: application/json" \
	-d '{
    "model": "Qwen/Qwen3-0.6B",
    "messages": [
      {
        "role": "user",
        "content": "Hello, InstructKR!"
      }
    ],
    "stream": true
 }'

# $ src/03_v1_chat_completions_with_stream.sh
# data: {"id":"chatcmpl-dc461701bc424bac9de697c529922071","object":"chat.completion.chunk","created":1753616032,"model":"Qwen/Qwen3-0.6B","choices":[{"index":0,"delta":{"role":"assistant","content":""},"logprobs":null,"finish_reason":null}]}
#
# data: {"id":"chatcmpl-dc461701bc424bac9de697c529922071","object":"chat.completion.chunk","created":1753616032,"model":"Qwen/Qwen3-0.6B","choices":[{"index":0,"delta":{"content":"<think>"},"logprobs":null,"finish_reason":null}]}
#
# data: {"id":"chatcmpl-dc461701bc424bac9de697c529922071","object":"chat.completion.chunk","created":1753616032,"model":"Qwen/Qwen3-0.6B","choices":[{"index":0,"delta":{"content":"\n"},"logprobs":null,"finish_reason":null}]}
#
# ...
#
# data: {"id":"chatcmpl-dc461701bc424bac9de697c529922071","object":"chat.completion.chunk","created":1753616032,"model":"Qwen/Qwen3-0.6B","choices":[{"index":0,"delta":{"content":""},"logprobs":null,"finish_reason":null}]}
#
# data: {"id":"chatcmpl-dc461701bc424bac9de697c529922071","object":"chat.completion.chunk","created":1753616032,"model":"Qwen/Qwen3-0.6B","choices":[{"index":0,"delta":{"content":" 😊"},"logprobs":null,"finish_reason":null}]}
#
# data: {"id":"chatcmpl-dc461701bc424bac9de697c529922071","object":"chat.completion.chunk","created":1753616032,"model":"Qwen/Qwen3-0.6B","choices":[{"index":0,"delta":{"content":""},"logprobs":null,"finish_reason":"stop","stop_reason":null}]}
#
# data: [DONE]
