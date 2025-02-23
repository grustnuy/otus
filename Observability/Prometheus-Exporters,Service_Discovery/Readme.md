# Установка и настройка Prometheus, использование exporters

В каталоге [GAP-1](GAP-1) находятся файлы конфигурации prometheus и alertmanager

Процесс установки находится в каталоге install

### Развернут wordpres, prometheus, grafana, alertmanager и exporters

##Развернут wordpres, prometheus, grafana, alertmanager и exporters
![html](img/wp.JPG)


![html](img/prom.JPG)

![html](img/graf.JPG)

![html](img/graf2.JPG)
![html](img/graf3.JPG)

![html](img/alert.JPG)
![html](img/alert2.JPG)

### Разворачивание хранилище метрик VictoriaMetrics
![html](img/vivtoria.JPG)

### Проверка отправки метрик в хранилище
![html](img/vivtoria3.JPG)

### Подключение DataSource в Grafana
![html](img/datasource.JPG)


![html](img/vivtoria2.JPG)

### Уведомления в telegram
![html](img/telegram-alerts.JPG)
![html](img/telegram-alerts2.JPG)
![html](img/telegram-alerts3.JPG)

### Grafana - продвинутое использование

app
![html](GAP-2/grafana-cms.JPG)
infra
![html](GAP-2/grafana-infra.JPG)
![html](GAP-2/grafana-infra2.JPG)



### Развернут Zabbix
![html](img/zabbix.JPG)

скрипт генерирующий метрики:

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

Добавлен UserParameter

     UserParameter=otus, /etc/zabbix/zabbix_agent2.d/otus_metrics.sh


Настройка 
![html](img/zabbix-discovery.JPG)
![html](img/zabbix-itemprototype.JPG)
![html](img/zabbix-tryggerprototype.JPG)

Получение метрик
![html](img/lld-metrics.JPG)

Алертинг
![html](img/telegram-alerts-zabbix.JPG)
