#!/bin/bash

# Скачиваем и разворачиваем досовские игрища на linux-машине в домашней директории
# Dependencies: wget, unrar

GAMES_DIR="$HOME/DosGames"

LINK_BLOOD="http://dl.old-games.su/get/d8olk8x4IXo2YZ6BdB6EiA==,1599816094/pc/blood/files/Blood.rar"
LINK_HERETIC="http://dl.old-games.su/get/IsG0NyN41tG60pyWRFoUsw==,1599820633/pc/heretic_shadow_of_the_serpent_riders/files/heretic.rar"
LINK_DUKE3D="http://dl.old-games.su/get/RO5Oyi1LTYMZaIUE1X98sw==,1599821120/pc/duke_nukem_3d/files/Duke_Nukem_3D.rar"
LINK_DOOM="http://dl.old-games.su/get/Iwv-l-rt2L_k7U7_1KZREw==,1599823299/pc/doom/files/Doom.rar"
LINK_DOOM2="http://dl.old-games.su/get/Wu-sdZDOXOqf1F_7U1_KTQ==,1599823461/pc/doom_2_hell_on_earth/files/Doom_2_Hell_on_Earth.rar"
LINK_WC2="http://dl.old-games.su/get/SNjRbay3IKNdgkJ_lwvrhQ==,1599823714/pc/warcraft_2_tides_of_darkness/files/Warcraft_2_RUS.rar"

if [ ! -d "$GAMES_DIR" ]; then
  mkdir "$GAMES_DIR";
fi

#Скачиваем и распаковываем архив с игрой
# Параметры:
#   $1 - ссылка на игру
#   $2 - название архива который нужно распаковать
download_and_unrar () {
  wget -P "$GAMES_DIR/$2_tmp" "$1" \
    && unrar x "$GAMES_DIR/$2_tmp/$2.rar" "$GAMES_DIR" \
    && rm -R "$GAMES_DIR/$2_tmp"
}

#BLOOD 1997
download_and_unrar $LINK_BLOOD "Blood"
#HERETIC 1994
download_and_unrar $LINK_HERETIC "heretic"
#DUKE NUKEM 3D 1997
download_and_unrar $LINK_DUKE3D "Duke_Nukem_3D"
#DOOM 1993
download_and_unrar $LINK_DOOM "Doom"
#DOOM II 1994
download_and_unrar $LINK_DOOM2 "Doom_2_Hell_on_Earth"
#WARCRAFT II 1995
download_and_unrar $LINK_WC2 "Warcraft_2_RUS"