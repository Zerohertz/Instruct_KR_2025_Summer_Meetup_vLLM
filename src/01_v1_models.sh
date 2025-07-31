#!/bin/bash

curl http://localhost:8000/v1/models | jq

# $ src/01_v1_models.sh
#   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                  Dload  Upload   Total   Spent    Left  Speed
# 100   480  100   480    0     0   396k      0 --:--:-- --:--:-- --:--:--  468k
# {
#   "object": "list",
#   "data": [
#     {
#       "id": "Qwen/Qwen3-0.6B",
#       "object": "model",
#       "created": 1753615922,
#       "owned_by": "vllm",
#       "root": "Qwen/Qwen3-0.6B",
#       "parent": null,
#       "max_model_len": 8192,
#       "permission": [
#         {
#           "id": "modelperm-fd1a1a66bd7444e694a116b6a2c90e85",
#           "object": "model_permission",
#           "created": 1753615922,
#           "allow_create_engine": false,
#           "allow_sampling": true,
#           "allow_logprobs": true,
#           "allow_search_indices": false,
#           "allow_view": true,
#           "allow_fine_tuning": false,
#           "organization": "*",
#           "group": null,
#           "is_blocking": false
#         }
#       ]
#     }
#   ]
# }
