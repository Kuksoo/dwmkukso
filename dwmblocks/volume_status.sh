#!/bin/bash

# Этот скрипт проверяет статус громкости устройства вывода по умолчанию в PipeWire (через pactl)
# и выводит соответствующий значок и уровень для панели dwm.

# Значки (убедись, что твой шрифт для панели их поддерживает)
#  - muted (Font Awesome volume off)
#  - unmuted (Font Awesome volume up)

# Получаем статус mute устройства вывода по умолчанию
# pactl get-sink-mute @DEFAULT_SINK@ выводит "Mute: yes" или "Mute: no"
is_muted=$(pactl get-sink-mute @DEFAULT_SINK@)

# Проверяем, содержит ли вывод строку "yes"
if echo "$is_muted" | grep -q "yes"; then
    # Если звук замучен, выводим значок "mute"
    echo ""
else
    # Если звук не замучен, получаем уровень громкости
    # pactl get-sink-volume @DEFAULT_SINK@ выводит строку вроде "Volume: front-left: 65536 / 100% / 0.00 dB, ..."
    volume_output=$(pactl get-sink-volume @DEFAULT_SINK@)

    # Извлекаем процентное значение из строки (оно обычно находится после второго '/')
    # Используем awk для разделения по '/' и sed для удаления пробелов
    volume_perc=$(echo "$volume_output" | awk -F '/' '{print $2}' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

    # Выводим значок "громкость" и процентный уровень
    echo " ${volume_perc}"
fi
