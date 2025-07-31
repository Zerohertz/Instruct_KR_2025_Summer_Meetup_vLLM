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
    "chat_template_kwargs": {"enable_thinking": false}
 }' | jq

# $ src/05_v1_chat_completions_disable_thinking.sh
#   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                  Dload  Upload   Total   Spent    Left  Speed
# 100   686  100   490  100   196    161     64  0:00:03  0:00:03 --:--:--   225
# {
#   "id": "chatcmpl-71549b47f91e4575ab302c3df8c42f8e",
#   "object": "chat.completion",
#   "created": 1753616781,
#   "model": "Qwen/Qwen3-0.6B",
#   "choices": [
#     {
#       "index": 0,
#       "message": {
#         "role": "assistant",
#         "reasoning_content": null,
#         "content": "Hello, InstructKR! 😊 How can I assist you today?",
#         "tool_calls": []
#       },
#       "logprobs": null,
#       "finish_reason": "stop",
#       "stop_reason": null
#     }
#   ],
#   "usage": {
#     "prompt_tokens": 18,
#     "total_tokens": 34,
#     "completion_tokens": 16,
#     "prompt_tokens_details": null
#   },
#   "prompt_logprobs": null,
#   "kv_transfer_params": null
# }
