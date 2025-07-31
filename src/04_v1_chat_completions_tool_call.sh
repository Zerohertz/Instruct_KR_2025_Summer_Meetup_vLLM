#!/bin/bash

curl -X POST http://localhost:8000/v1/chat/completions \
	-H "Content-Type: application/json" \
	-d '{
    "model": "Qwen/Qwen3-0.6B",
    "messages": [
      {
        "role": "user",
        "content": "What is the weather like in Seoul?"
      }
    ],
    "tools": [
      {
        "type": "function",
        "function": {
          "name": "get_weather",
          "description": "Get the current weather in a given location",
          "parameters": {
            "type": "object",
            "properties": {
              "location": {
                "type": "string",
                "description": "The city and state, e.g. San Francisco, CA"
              },
              "unit": {
                "type": "string",
                "enum": ["celsius", "fahrenheit"]
              }
            },
            "required": ["location"]
          }
        }
      }
    ],
    "tool_choice": "auto"
 }' | jq

# $ src/04_v1_chat_completions_tool_call.sh
#   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                  Dload  Upload   Total   Spent    Left  Speed
# 100   981  100   168  100   813  34890   164k --:--:-- --:--:-- --:--:--  239k
# {
#   "object": "error",
#   "message": "\"auto\" tool choice requires --enable-auto-tool-choice and --tool-call-parser to be set",
#   "type": "BadRequestError",
#   "param": null,
#   "code": 400
# }

# $ scripts/04_v1_chat_completions_tool_call.sh
#   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                  Dload  Upload   Total   Spent    Left  Speed
# 100  1957  100  1144  100   813    282    200  0:00:04  0:00:04 --:--:--   483
# {
#   "id": "chatcmpl-892580acdd4443edb7eacee820fb2280",
#   "object": "chat.completion",
#   "created": 1753616514,
#   "model": "Qwen/Qwen3-0.6B",
#   "choices": [
#     {
#       "index": 0,
#       "message": {
#         "role": "assistant",
#         "reasoning_content": null,
#         "content": "<think>\nOkay, the user is asking about the weather in Seoul. I need to use the get_weather function. The function requires the location and optionally the unit. The location here is Seoul. Since the user didn't specify the unit, I'll default to Celsius. Let me check the parameters again. The required parameter is location, so I'll include that. The unit is optional, so I'll leave it out. So the function call should be get_weather with location \"Seoul\" and unit omitted. That should get the current weather information for Seoul.\n</think>\n\n",
#         "tool_calls": [
#           {
#             "id": "chatcmpl-tool-0e7aedb0c1e543d592c2ba92cb77d4d5",
#             "type": "function",
#             "function": {
#               "name": "get_weather",
#               "arguments": "{\"location\": \"Seoul\"}"
#             }
#           }
#         ]
#       },
#       "logprobs": null,
#       "finish_reason": "tool_calls",
#       "stop_reason": null
#     }
#   ],
#   "usage": {
#     "prompt_tokens": 194,
#     "total_tokens": 330,
#     "completion_tokens": 136,
#     "prompt_tokens_details": null
#   },
#   "prompt_logprobs": null,
#   "kv_transfer_params": null
# }
