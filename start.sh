#!/data/data/com.termux/files/usr/bin/sh

echo "Select the Program to install"
echo "1 Primary setting"
echo "2 Customize the interface"
echo "3 Customize the interface continue"
echo "4 Install the Metasploit Framework"
echo "5 Install the Routersploit"
echo "6 Additional programs"
echo "7 Exit"
read startgo

case $startgo in
1)
echo "Start setup"
cd $HOME
pkg update
pkg upgrade
pkg install -y python2 python2-dev python python-dev git nmap hydra nano ncdu proot fish zsh tsu coreutils wget tar \
bash clang curl libclang macchanger make man openssl openssl-dev dnsutils libsodium libsodium-dev libtool Termux-exec
echo "Setup complete"
;;
2)
echo "Start setup"
cd $HOME
echo PS1="\[\033[1;33;1;32m\]:\[\033[1;31m\]\w$ \[\033[0m\]\[\033[0m\]" > .bashrc
chmod u+rwx,g+x .bashrc
chsh -s fish
echo "Setup complete, Fish Installed by Default"
echo "Reboot the program CTR + D , Enter"
;;
3)
cd $HOME
rm -rf $HOME/.local/share/fish/
cp -r $HOME/Storm/prog/fish/ $HOME/.local/share/
echo "Completed"
echo "Reboot the program CTR + D , Enter"
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
echo "Choose the correct option"
;;
esac
