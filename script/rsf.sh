#!/data/data/com.termux/files/usr/bin/sh

echo "Start Install RouterSploit"
cd $HOME
git clone https://github.com/reverse-shell/routersploit
cd $HOME
pip2 install six pycparser cffi requests
SODIUM_INSTALL=system pip2 install pynacl
echo "------------------"
echo "Termux-chroot, cd routersploit, pip2 install -r requirements.txt"
echo "------------------"
