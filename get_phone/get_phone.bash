#!/bin/bash

# Вспомогательный скрипт, для балансировки распределения звоноков на разные телефонные номера.
# Список номеров хранится в директории скрипта в файле phones.txt. Каждый номер начинается с новой строки, в файле не
# должно быть пустых строк. Номера будут выдаваться скриптом по очереди.

# Получаем последний использованный ключ массива из файла
FILE=./flag.txt
PHONES_DICT=./phones.txt
KEY_RANGE=`wc -l < $PHONES_DICT`

# Получаем последний использованный ключ массива из файла
if [[ -f "$FILE" ]]; then
    CURRENT_IDX=`cat $FILE`
else
    CURRENT_IDX=1
fi

# Если по каким-то причинам в файле оказалось меньше номеров чем в последнем ключе
if [[ $CURRENT_IDX -gt $(($KEY_RANGE + 1)) ]]
  then
    CURRENT_IDX=1
    echo "2" > $FILE
# Если достигли последнего номера - сбрасываем счетчик
elif [[ CURRENT_IDX -eq $(($KEY_RANGE + 1)) ]]
then
  echo "1" > $FILE
else
  echo "$((CURRENT_IDX + 1))" > $FILE
fi

echo -n `sed -n "$((CURRENT_IDX))p" < $PHONES_DICT`