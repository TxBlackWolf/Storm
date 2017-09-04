#!/data/data/com.termux/files/usr/bin/sh

echo "1 Начать установку Reaver"
echo "2 Начать установку Dnschef"
echo "3 Начать установку Sqlmap"
echo "4 Начать установку Responder"
echo "5 Выход"
read bonus

case $bonus in
1)
echo "Начало Установки Reaver"
cd $HOME
git clone https://github.com/Deathlive/reaver
mv $HOME/reaver-wps-fork-t6x $HOME/reaver
cd $HOME/reaver/src/
sh configure
make
echo "Завершение Установки"
;;
2)
echo "Начало Установки Dnschef"
cd $HOME
pkg install dnsutils
pip2 install dnslib ipy
git clone https://github.com/iphelix/dnschef
cd $HOME/dmschef/
echo "Завершение Установки, python2 dnschef.py"
;;
3)
cd $HOME
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap
cd $HOME/sqlmap/
;;
4)
cd $HOME
git clone https://github.com/SpiderLabs/Responder
cd $HOME/Responder/
;;
*)
echo "Выберите правильный вариант"
;;
esac
