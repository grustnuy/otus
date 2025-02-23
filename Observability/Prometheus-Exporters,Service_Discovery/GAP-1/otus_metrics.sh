#!/bin/bash

# Генерация трех случайных метрик со значением от 0 до 100
metric1=$((RANDOM % 101))
metric2=$((RANDOM % 101))
metric3=$((RANDOM % 101))

# Создание JSON-объекта
json_output=$(jq -n \
  --arg metric1 "$metric1" \
  --arg metric2 "$metric2" \
  --arg metric3 "$metric3" \
  '{
    "data": [
      { "{#METRIC}": "metric1", "{#VALUE}": $metric1 },
      { "{#METRIC}": "metric2", "{#VALUE}": $metric2 },
      { "{#METRIC}": "metric3", "{#VALUE}": $metric3 }

    ]
  }')

# Вывод JSON
echo "$json_output"
