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
    ]
 }' | jq

# $ src/02_v1_chat_completions_without_stream.sh
#   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                  Dload  Upload   Total   Spent    Left  Speed
# 100  1346  100  1206  100   140    333     38  0:00:03  0:00:03 --:--:--   372
# {
#   "id": "chatcmpl-c3148b655d294d1a8b27621eeca246c4",
#   "object": "chat.completion",
#   "created": 1753615979,
#   "model": "Qwen/Qwen3-0.6B",
#   "choices": [
#     {
#       "index": 0,
#       "message": {
#         "role": "assistant",
#         "reasoning_content": null,
#         "content": "<think>\nOkay, the user just said \"Hello, InstructKR!\" So they're probably testing or trying to get a response. I need to respond in a friendly and helpful way. Let me check if there's any specific context I should be aware of. Since they mentioned \"InstructKR,\" maybe they're referring to a particular platform or system. But since I don't have that information, I should just acknowledge their message and offer assistance.\n\nI should make sure to keep the response simple and positive. Maybe say something like, \"Hello! How can I assist you today?\" That way, it's open-ended and invites them to ask more. Let me double-check for any typos or errors in the response to ensure it's clear and appropriate.\n</think>\n\nHello! How can I assist you today? 😊",
#         "tool_calls": []
#       },
#       "logprobs": null,
#       "finish_reason": "stop",
#       "stop_reason": null
#     }
#   ],
#   "usage": {
#     "prompt_tokens": 14,
#     "total_tokens": 181,
#     "completion_tokens": 167,
#     "prompt_tokens_details": null
#   },
#   "prompt_logprobs": null,
#   "kv_transfer_params": null
# }
