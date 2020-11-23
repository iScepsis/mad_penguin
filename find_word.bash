#!/bin/bash

# Поиск слов из фразы в строках. Возвращаем 1, если слова найдены в 1ой группе слов, 2 - если во второй, 0 - если не
# найдено соответствий ни в одной из групп
# Вызов:
#  $ bash ./find_word.bash 'искомое_слово_или_фраза' 'группа_слов_1' 'группа_слов_2'
# Реальный пример:
#  $ bash ./find_word.bash 'три толстяка' 'один два три' 'четыре пять шесть'


#Разбиваем искомую фразу на слова (разделитель пробел) из параметра $1 и ищем в строке, переданной параметром $2
function find_word() {
  #Разбиваем слова
  local result=1;
  # shellcheck disable=SC2155
  local needle=$(echo "$1" | tr " " "\n")
  for word in $needle
  do
      if echo "$2" | grep -q "$word"; then
        result=0;
      fi;
  done
  return $result;
}

#to lower case
needle="${1,,}"
haystack1="${2,,}"
haystack2="${3,,}"

find_word "$needle" "$haystack1"
true_words=$?
find_word "$needle" "$haystack2"
false_words=$?

if [ "$true_words" == 0 ]; then
  printf "1";
elif [ "$false_words" == 0 ]; then
  printf "2";
else
  printf "0";
fi;