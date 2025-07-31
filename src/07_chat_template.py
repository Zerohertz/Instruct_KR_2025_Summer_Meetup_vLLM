#!/usr/bin/env python3

# NOTE:
# 일반적으로 모델의 chat template은 아래와 같은 경로에서 확인 가능
# cat ~/.cache/huggingface/hub/models--Qwen--Qwen3-0.6B/snapshots/c1899de289a04d12100db370d81485cdf75e47ca/tokenizer_config.json | grep chat_template
# https://huggingface.co/Qwen/Qwen3-0.6B/blob/main/tokenizer_config.json#L230

import shutil

from transformers import AutoProcessor

TERMINAL_WIDTH = shutil.get_terminal_size().columns
MODEL_NAME = "Qwen/Qwen3-0.6B"


def main():
    processor = AutoProcessor.from_pretrained(MODEL_NAME)
    print("-" * TERMINAL_WIDTH)
    print("processor.chat_template:")
    print(processor.chat_template)
    print("-" * TERMINAL_WIDTH)

    messages = [
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": "Hello, InstructKR!"},
        {"role": "assistant", "content": "Hello! How can I help you today?"},
        {"role": "user", "content": "Can you explain what InstructKR is?"},
        {
            "role": "assistant",
            "content": "InstructKR is a Korean instruction-following dataset and research initiative focused on improving language models' ability to follow instructions in Korean.",
        },
        {"role": "user", "content": "What's the weather like in Seoul today?"},
        {
            "role": "assistant",
            "content": "I'll help you check the weather in Seoul.",
            "tool_calls": [
                {
                    "id": "call_1",
                    "type": "function",
                    "function": {
                        "name": "get_weather",
                        "arguments": '{"location": "Seoul, South Korea"}',
                    },
                }
            ],
        },
        {
            "role": "tool",
            "content": "The weather in Seoul today is sunny with a temperature of 22°C (72°F). There's a light breeze and clear skies.",
            "tool_call_id": "call_1",
        },
        {
            "role": "assistant",
            "content": "Based on the weather information, Seoul is having a pleasant day today! It's sunny with a comfortable temperature of 22°C (72°F), light breeze, and clear skies. Perfect weather for outdoor activities!",
        },
        {"role": "user", "content": "Thanks! Can you help me with something else?"},
    ]
    prompt = processor.apply_chat_template(
        messages, tokenize=False, add_generation_prompt=True
    )
    print("-" * TERMINAL_WIDTH)
    print("processor.apply_chat_template:")
    print(prompt)
    print("-" * TERMINAL_WIDTH)


if __name__ == "__main__":
    main()

# --------------------------------------------------------------------------------
# processor.chat_template:
# {%- if tools %}
#     {{- '<|im_start|>system\n' }}
#     {%- if messages[0].role == 'system' %}
#         {{- messages[0].content + '\n\n' }}
#     {%- endif %}
#     {{- "# Tools\n\nYou may call one or more functions to assist with the user query.\n\nYou are provided with function signatures within <tools></tools> XML tags:\n<tools>" }}
#     {%- for tool in tools %}
#         {{- "\n" }}
#         {{- tool | tojson }}
#     {%- endfor %}
#     {{- "\n</tools>\n\nFor each function call, return a json object with function name and arguments within <tool_call></tool_call> XML tags:\n<tool_call>\n{\"name\": <function-name>, \"arguments\": <args-json-object>}\n</tool_call><|im_end|>\n" }}
# {%- else %}
#     {%- if messages[0].role == 'system' %}
#         {{- '<|im_start|>system\n' + messages[0].content + '<|im_end|>\n' }}
#     {%- endif %}
# {%- endif %}
# {%- set ns = namespace(multi_step_tool=true, last_query_index=messages|length - 1) %}
# {%- for message in messages[::-1] %}
#     {%- set index = (messages|length - 1) - loop.index0 %}
#     {%- if ns.multi_step_tool and message.role == "user" and message.content is string and not(message.content.startswith('<tool_response>') and message.content.endswith('</tool_response>')) %}
#         {%- set ns.multi_step_tool = false %}
#         {%- set ns.last_query_index = index %}
#     {%- endif %}
# {%- endfor %}
# {%- for message in messages %}
#     {%- if message.content is string %}
#         {%- set content = message.content %}
#     {%- else %}
#         {%- set content = '' %}
#     {%- endif %}
#     {%- if (message.role == "user") or (message.role == "system" and not loop.first) %}
#         {{- '<|im_start|>' + message.role + '\n' + content + '<|im_end|>' + '\n' }}
#     {%- elif message.role == "assistant" %}
#         {%- set reasoning_content = '' %}
#         {%- if message.reasoning_content is string %}
#             {%- set reasoning_content = message.reasoning_content %}
#         {%- else %}
#             {%- if '</think>' in content %}
#                 {%- set reasoning_content = content.split('</think>')[0].rstrip('\n').split('<think>')[-1].lstrip('\n') %}
#                 {%- set content = content.split('</think>')[-1].lstrip('\n') %}
#             {%- endif %}
#         {%- endif %}
#         {%- if loop.index0 > ns.last_query_index %}
#             {%- if loop.last or (not loop.last and reasoning_content) %}
#                 {{- '<|im_start|>' + message.role + '\n<think>\n' + reasoning_content.strip('\n') + '\n</think>\n\n' + content.lstrip('\n') }}
#             {%- else %}
#                 {{- '<|im_start|>' + message.role + '\n' + content }}
#             {%- endif %}
#         {%- else %}
#             {{- '<|im_start|>' + message.role + '\n' + content }}
#         {%- endif %}
#         {%- if message.tool_calls %}
#             {%- for tool_call in message.tool_calls %}
#                 {%- if (loop.first and content) or (not loop.first) %}
#                     {{- '\n' }}
#                 {%- endif %}
#                 {%- if tool_call.function %}
#                     {%- set tool_call = tool_call.function %}
#                 {%- endif %}
#                 {{- '<tool_call>\n{"name": "' }}
#                 {{- tool_call.name }}
#                 {{- '", "arguments": ' }}
#                 {%- if tool_call.arguments is string %}
#                     {{- tool_call.arguments }}
#                 {%- else %}
#                     {{- tool_call.arguments | tojson }}
#                 {%- endif %}
#                 {{- '}\n</tool_call>' }}
#             {%- endfor %}
#         {%- endif %}
#         {{- '<|im_end|>\n' }}
#     {%- elif message.role == "tool" %}
#         {%- if loop.first or (messages[loop.index0 - 1].role != "tool") %}
#             {{- '<|im_start|>user' }}
#         {%- endif %}
#         {{- '\n<tool_response>\n' }}
#         {{- content }}
#         {{- '\n</tool_response>' }}
#         {%- if loop.last or (messages[loop.index0 + 1].role != "tool") %}
#             {{- '<|im_end|>\n' }}
#         {%- endif %}
#     {%- endif %}
# {%- endfor %}
# {%- if add_generation_prompt %}
#     {{- '<|im_start|>assistant\n' }}
#     {%- if enable_thinking is defined and enable_thinking is false %}
#         {{- '<think>\n\n</think>\n\n' }}
#     {%- endif %}
# {%- endif %}
# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------
# processor.apply_chat_template:
# <|im_start|>system
# You are a helpful assistant.<|im_end|>
# <|im_start|>user
# Hello, InstructKR!<|im_end|>
# <|im_start|>assistant
# Hello! How can I help you today?<|im_end|>
# <|im_start|>user
# Can you explain what InstructKR is?<|im_end|>
# <|im_start|>assistant
# InstructKR is a Korean instruction-following dataset and research initiative focused on improving language models' ability to follow instructions in Korean.<|im_end|>
# <|im_start|>user
# What's the weather like in Seoul today?<|im_end|>
# <|im_start|>assistant
# I'll help you check the weather in Seoul.
# <tool_call>
# {"name": "get_weather", "arguments": {"location": "Seoul, South Korea"}}
# </tool_call><|im_end|>
# <|im_start|>user
# <tool_response>
# The weather in Seoul today is sunny with a temperature of 22°C (72°F). There's a light breeze and clear skies.
# </tool_response><|im_end|>
# <|im_start|>assistant
# Based on the weather information, Seoul is having a pleasant day today! It's sunny with a comfortable temperature of 22°C (72°F), light breeze, and clear skies. Perfect weather for outdoor activities!<|im_end|>
# <|im_start|>user
# Thanks! Can you help me with something else?<|im_end|>
# <|im_start|>assistant
#
# --------------------------------------------------------------------------------
