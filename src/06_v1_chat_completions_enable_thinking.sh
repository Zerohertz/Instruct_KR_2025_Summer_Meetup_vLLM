#!/bin/bash

# NOTE:
# vllm serve Qwen/Qwen3-0.6B --max-model-len 8192 --reasoning-parser qwen3

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
    "chat_template_kwargs": {"enable_thinking": true}
 }' | jq

# NOTE:
# "enable_thinking": false
#
# <|im_start|>user
# Hello, InstructKR!<|im_end|>
# <|im_start|>assistant
# <think>
#
# </think>

# NOTE:
# "enable_thinking": true
#
# <|im_start|>user
# Hello, InstructKR!<|im_end|>
# <|im_start|>assistant

# $ src/06_v1_chat_completions_enable_thinking.sh
#   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                  Dload  Upload   Total   Spent    Left  Speed
# 100  1134  100   939  100   195    189     39  0:00:05  0:00:04  0:00:01   250
# {
#   "id": "chatcmpl-72bce2708f9343c1b2a66213c677ab17",
#   "object": "chat.completion",
#   "created": 1753617069,
#   "model": "Qwen/Qwen3-0.6B",
#   "choices": [
#     {
#       "index": 0,
#       "message": {
#         "role": "assistant",
#         "reasoning_content": "\nOkay, the user said \"Hello, InstructKR!\" which I need to respond to. Let me check the instructions first. The user is probably trying to start a conversation or ask something. Since they mentioned \"InstructKR,\" maybe they are referring to a specific system or platform. I should acknowledge their greeting and offer help. I should keep it friendly and open-ended to encourage further interaction. Let me make sure the response is polite and helpful.\n",
#         "content": "\n\nHello! How can I assist you today? 😊",
#         "tool_calls": []
#       },
#       "logprobs": null,
#       "finish_reason": "stop",
#       "stop_reason": null
#     }
#   ],
#   "usage": {
#     "prompt_tokens": 14,
#     "total_tokens": 121,
#     "completion_tokens": 107,
#     "prompt_tokens_details": null
#   },
#   "prompt_logprobs": null,
#   "kv_transfer_params": null
# }
