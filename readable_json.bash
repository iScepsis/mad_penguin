#!/bin/bash

# Преобразуем обычную json строку в человекопонятную и форматированную
# Dependencies: python, ascii2uni

# sudo ln -s ~/bash_scripts/readable_json /usr/bin/readable_json
# alias rjson="bash readable_json"

if [ -z "$1"]; then
	echo "Json str is empty"
	exit 1
fi


str=$1
str_length=$(echo $1 | wc -c)
first_symbol=$(echo $1 | cut -b 1)
last_symbol=$(echo $1 | cut -b $(( $str_length - 1 )));

if [ $first_symbol == '"' ] && [ $last_symbol == '"' ]; then
	str=$(echo $1 | cut -b 2-$(($str_length - 2)))
fi;

echo $str | python -m json.tool | ascii2uni -a U -q