# 1. Установка и настройка Prometheus, использование exporters

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

# 2. Разворачивание хранилища метрик VictoriaMetrics
![html](img/vivtoria.JPG)

### Проверка отправки метрик в хранилище
![html](img/vivtoria3.JPG)

### Подключение DataSource в Grafana
![html](img/datasource.JPG)


![html](img/vivtoria2.JPG)

# 3. Алертинг
### Уведомления в telegram
![html](img/telegram-alerts.JPG)
![html](img/telegram-alerts2.JPG)
![html](img/telegram-alerts3.JPG)

# 4. Grafana - продвинутое использование

### app
![html](GAP-2/grafana-cms.JPG)
### infra
![html](GAP-2/grafana-infra.JPG)
![html](GAP-2/grafana-infra2.JPG)



# 5. Развернут Zabbix
![html](img/zabbix.JPG)

### скрипт генерирующий метрики:

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


### Настройка 
![html](img/zabbix-discovery.JPG)
![html](img/zabbix-itemprototype.JPG)
![html](img/zabbix-tryggerprototype.JPG)

### Получение метрик
![html](img/lld-metrics.JPG)

### Алертинг
![html](img/telegram-alerts-zabbix.JPG)


# 6. TICK stack

### Процесс развертывания стэка [TICK-1](install/install%20-tick)

### Настройка dashboard
![html](TICK-1/tick-dashboard.JPG)

### Добавлены TICKscripts 
![html](TICK-1/tick-scripts.JPG)

## Отправка alerts в Telegram
![html](TICK-1/tick-telegram.JPG)


# 7. Beats - инструменты доставки данных

### Заметки по развертывания  [elastic & kibana](install/install-elk)

### Файлы конфигурации beats:
- [Filebeate](ELK-1/filebeat.yml)
- [Metricbeat ](ELK-1/metricbeat.yml)
- [Heartbeat](ELK-1/heartbeat.yml)

### Полученные данные в Kibana
![html](img/kibana-beats.JPG)

![html](img/kibana-beats2.JPG)

# 8. Системы агрегации сообщений Logstash/Vector 
### beats настроены на отправку в logstash  [filebeat](ELK-2/filebeat.yml), [metricbeat](ELK-2/metricbeat.yml)
### Файлы конфигурации:
- [Logstash](ELK-2/my.conf)
- [Vector](ELK-2/vector.yaml)

### Полученные данные в Kibana
Данные из logstash
![html](img/kibana-logstash.JPG)


Данные из Vector
![html](img/kibana-vector.JPG)

![html](img/kibana-vector2.JPG)


# 9. Grafana Loki - управление логами и доставка 
### Развернута Grafana и Grafana Loki. Шипером выбран promtail. 
### Файлы конфигурации:
- [Promtail](Loki/promtail-local-config.yaml)
- [Grafana Loki](Loki/loki-local-config.yaml)

### Полученные данные
#### Promtail
![html](img/promtail.JPG)

#### Grafana Loki
![html](img/loki.JPG)

#### Grafana
![html](img/grafana-loki.JPG)
