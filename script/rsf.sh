#!/data/data/com.termux/files/usr/bin/sh

echo "Начало Установки RouterSploit \n"
cd $HOME
git clone https://github.com/reverse-shell/routersploit
cd $HOME/routersploit/
echo "Дальше сами, Termux-chroot, cd routersploit, pip2 install -r requirements.txt"