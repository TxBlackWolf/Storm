#!/data/data/com.termux/files/usr/bin/sh

echo "Start Install RouterSploit"
cd $HOME
git clone https://github.com/reverse-shell/routersploit
cd $HOME
pip2 install six wheel pycparser cffi requests
SODIUM_INSTALL=system pip2 install pynacl
#pkg install libjpeg-turbo-dev
#LDFLAGS="-L/system/lib/" CFLAGS="-I/data/data/com.termux/files/usr/include/" pip install Pillow
echo "------------------"
echo "use termux-chroot, cd routersploit, pip2 install -r requirements.txt"
echo "------------------"
