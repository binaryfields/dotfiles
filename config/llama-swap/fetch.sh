#!/bin/bash

MODEL_HOME="/Users/Shared/models"

models=(
    "google/gemma-3-27b-it-qat-q4_0-gguf:q4_0"
    "unsloth/Devstral-Small-2505-GGUF:UD-Q4_K_XL"
    "unsloth/Mistral-Small-3.1-24B-Instruct-2503-GGUF:UD-Q4_K_XL"
    "unsloth/Qwen3-32B-GGUF:UD-Q4_K_XL"
)

testing=(
    "unsloth/Magistral-Small-2506-GGUF:UD-Q4_K_XL"
    "unsloth/Mistral-Small-3.1-24B-Instruct-2503-GGUF:Q6_K"
    "unsloth/gemma-3-27b-it-GGUF:Q6_K"
)

for model in "${models[@]}"; do
    IFS=':' read -r repo quant <<< "$model"
    huggingface-cli download $repo --local-dir $MODEL_HOME --include "*$quant.gguf"
done

for model in "${testing[@]}"; do
    IFS=':' read -r repo quant <<< "$model"
    huggingface-cli download $repo --local-dir $MODEL_HOME --include "*$quant.gguf"
done
