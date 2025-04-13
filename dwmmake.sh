#!/bin/bash

SOURCE_DIR="$HOME/dwmkukso/dwm"
INSTALL_PREFIX="/usr/local"

error() {
  echo "Ошибка: $1" >&2
  exit 1
}

require_command() {
  if ! command -v "$1" &> /dev/null; then
    error "Необходима программа '$1', но она не найдена в PATH."
  fi
}

require_command make
require_command sudo

if [ ! -d "$SOURCE_DIR" ]; then
  error "Каталог с исходным кодом '$SOURCE_DIR' не существует."
fi

if [ ! -f "$SOURCE_DIR/Makefile" ]; then
  error "Makefile не найден в каталоге '$SOURCE_DIR'."
fi

echo "Начинаю сборку и установку из каталога '$SOURCE_DIR'..."

cd "$SOURCE_DIR" || error "Не удалось перейти в каталог '$SOURCE_DIR'."

echo "Выполняю 'make'..."
make || error "Сборка с помощью 'make' завершилась с ошибкой."

echo "Выполняю 'sudo make install'..."
sudo make install PREFIX="$INSTALL_PREFIX" || error "Установка с помощью 'sudo make install' завершилась с ошибкой."

echo "Сборка и установка успешно завершены."
echo "Программа установлена в '$INSTALL_PREFIX'."

exit 0
