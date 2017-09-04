#!/data/data/com.termux/files/usr/bin/sh
███──███──████──████──█───██
█─────█───█──█──█──█──██─███
███───█───█──█──████──█─█─██
──█───█───█──█──█─█───█───██
███───█───████──█─█───█───██

echo "Выберите Программу для установки"
echo "1 Начальная Настройка"
echo "2 Настройка Интерфейса"
echo "3 Продолжить Интерфейса"
echo "4 Установить Metasploit Framework"
echo "5 Установка Routersploit"
echo "6 Дополнительные программы"
echo "7 Выход"
read startgo

case $startgo in
1)
echo "Начало настройки"
cd $HOME
pkg update
pkg upgrade
pkg install -y python2 python2-dev python python-dev git nmap hydra nano ncdu proot fish zsh tsu coreutils wget tar bash clang curl libclang macchanger make man openssl openssl-dev
echo "Настройка завершена"
;;
2)
echo "Начало настройки"
cd $HOME
echo PS1="\[\033[1;33;1;32m\]:\[\033[1;31m\]\w$ \[\033[0m\]\[\033[0m\]" > .bashrc
chmod u+rwx,g+x .bashrc
chsh -s fish
echo "Настройка завершена, Fish Установлена по Умолчанияю"
echo "Перезагрузите программу CTR - D , Enter"
;;
3)
cd $HOME
rm -rf $HOME/.local/share/fish/
cp -r $HOME/Storm/prog/fish/ $HOME/.local/share/
echo "Завершено"
echo "Перезагрузите программу CTR - D , Enter"
;;
4)
bash $HOME/Storm/script/msf.sh
;;
5)
bash $HOME/Storm/script/rsf.sh
;;
6)
bash $HOME/Storm/script/bonus.sh
;;
7)
exit 0
;;
*)
echo "Выберите правильный вариант"
;;
esac
