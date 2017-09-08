#!/data/data/com.termux/files/usr/bin/sh

echo "1 Start installation Reaver"
echo "2 Start installation Dnschef"
echo "3 Start installation Sqlmap"
echo "4 Start installation Responder"
echo "5 Start installation MITMf"
echo "6 Exit"
read bonus

case $bonus in
1)
echo "Start install Reaver"
cd $HOME
git clone https://github.com/Deathlive/reaver
mv $HOME/reaver-wps-fork-t6x $HOME/reaver
cd $HOME/reaver/src/
sh configure
make
echo "End of Setup"
;;
2)
echo "Start install Dnschef"
cd $HOME
git clone https://github.com/iphelix/dnschef
pip2 install dnslib ipy
echo "End of Setup, python2 dnschef.py"
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
4)
cd $HOME
git clone https://github.com/byt3bl33d3r/MITMf
pkg install clang python2 python2-dev libjpeg-turbo-dev ndk-sysroot clang
pip2 install wheel Twisted
LDFLAGS="-L/system/lib/" CFLAGS="-I/data/data/com.termux/files/usr/include/" pip install pillow
echo "termux-chroot, pip2 install -r requirements.txt
;;
6)
exit 0
;;
*)
echo "Choose the correct option"
;;
esac
