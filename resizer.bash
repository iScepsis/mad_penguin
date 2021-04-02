#!/bin/bash
#Массово меняем разрешение изображений

for i in *.png ; do
  convert "$i" -resize 512x512 "$i"
done