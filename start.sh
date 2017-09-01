#!/data/data/com.termux/files/usr/bin/sh

echo "Выберите Программу для установки"
echo "1 Начальная Настройка"
echo "2 Настройка Интерфейса"
echo "3 Установить Metasploit Framework"
echo "4 Установка Routersploit"
echo "5 Дополнительные программы"
echo "6 Выход"
read startgo

case $startgo in
1)
echo "Начало настройки"
cd $HOME
pkg update
pkg upgrade
pkg install -y python2 python2-dev python python-dev git nmap hydra nano ncdu proot fish zsh tsu coreutils wget tar bash clang curl libclang macchanger make man openssl openssl-dev
cp -r /data/data/com.termux/files/home/Storm/prog/sqlmap /data/data/com.termux/files/home/ 
echo "SQLmap установлена в каталог HOME"
cp -r /data/data/com.termux/files/home/Storm/prog/responder /data/data/com.termux/files/home/ 
echo "Responder установлена в каталог HOME"
echo "Настройка завершена"
;;
2)
echo "Начало настройки"
cd $HOME
echo PS1="\[\033[1;33;1;32m\]:\[\033[1;31m\]\w$ \[\033[0m\]\[\033[0m\]" > .bashrc
chmod u+rwx,g+x .bashrc
chsh -s fish
rm -rf $HOME/.local/share/fish/
cp -r $HOME/Storm/prog/fish/ $HOME/.local/share/
echo "Настройка завершена, Fish Установлена по Умолчанияю"
echo "Перезагрузите программу"
;;
3)
bash $HOME/Storm/script/msf.sh
;;
4)
bash $HOME/Storm/script/rsf.sh
;;
5)
bash $HOME/Storm/script/bonus.sh
;;
6)
exit 0
;;
*)
echo "Выберите правильный вариант"
;;
esac