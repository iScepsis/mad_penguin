**Создаем собственный протокол для запуска программ из браузера**

1) Создаем целеыой скрипт который нужно заустить - в данном случае myproto-open.sh
2) Не забываем сделать его доступным для выполнения (chmod +x ./myproto-open.sh)
3) Создаем .desktop файл для старта приложения по анологии с myproto.desctop
4) Помещаем .desktop файл в /usr/share/applications/
5) Обновляем базу mime-типов:
sudo update-desktop-database
6) Тестим через терминал:

`xdg-open 'myproto://gedit'`

7) Тестим через html в браузере:

`<a title="Open" href="myproto://">myproto://</a>`