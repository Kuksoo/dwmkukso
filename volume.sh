#!/bin/bash

# Функция для получения текущего уровня громкости
get_volume() {
  pactl get-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo | awk '{print $5}'
}

# Функция для получения текущего состояния mute
get_mute() {
  pactl get-sink-mute alsa_output.pci-0000_00_1f.3.analog-stereo | grep "Mute:" | awk '{print $2}'
}

# Функция для отправки сигнала dwmblocks
send_signal() {
  pkill -RTMIN+10 dwmblocks
}

# Получаем начальный уровень громкости и состояние mute
OLD_VOLUME=$(get_volume)
OLD_MUTE=$(get_mute)

# Бесконечный цикл для отслеживания изменений
while true; do
  # Получаем текущий уровень громкости и состояние mute
  NEW_VOLUME=$(get_volume)
  NEW_MUTE=$(get_mute)

  # Сравниваем текущий и предыдущий уровни громкости и состояние mute
	if [[ "$NEW_VOLUME" != "$OLD_VOLUME" || "$NEW_MUTE" != "$OLD_MUTE" ]]; then
    # Если уровень громкости или состояние mute изменились, отправляем сигнал и обновляем предыдущие значения
    send_signal
    OLD_VOLUME="$NEW_VOLUME"
    OLD_MUTE="$NEW_MUTE"
  fi

  # Ждем некоторое время перед следующей проверкой (например, 0.1 секунды)
  sleep 0.00001
done
