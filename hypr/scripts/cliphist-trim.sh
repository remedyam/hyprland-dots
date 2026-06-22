#!/bin/bash
MAX_LINES=100

# Позволяем cliphist записать новые данные из буфера
cliphist store

# Считаем текущее количество записей
COUNT=$(cliphist list | wc -l)

# Если записей больше лимита, удаляем самые старые
if [ "$COUNT" -gt "$MAX_LINES" ]; then
    # Вычисляем, сколько записей нужно удалить
    DEL_COUNT=$((COUNT - MAX_LINES))

    # Берем последние строки из списка (они самые старые) и удаляем их
    cliphist list | tail -n "$DEL_COUNT" | cliphist delete
fi
