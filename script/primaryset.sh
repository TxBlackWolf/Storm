#!/data/data/com.termux/files/usr/bin/sh

echo "Select the Program to install"
echo "1 Primary setting"
echo "2 Setup Fish in default SHELL"
echo "3 Setup Zsh in default SHELL"
echo "4 Exit"
read primary

case $primary in
1)
echo "Start setup"
cd $HOME
pkg update
pkg upgrade
pkg install -y python2 python2-dev python python-dev git nmap hydra nano ncdu proot fish zsh tsu coreutils wget tar \
bash clang curl libclang macchanger make man openssl openssl-dev dnsutils libsodium libsodium-dev libtool Termux-exec
echo "------------------"
echo "Setup complete"
echo "------------------"
;;
2)
echo "Setup Fish in default"
cd $HOME
echo PS1="\[\033[1;33;1;32m\]:\[\033[1;31m\]\w$ \[\033[0m\]\[\033[0m\]" > .bashrc
chmod u+rwx,g+x .bashrc
chsh -s fish
fish
cd $HOME
rm -rf $HOME/.local/share/fish/
cp -r $HOME/Storm/prog/fish/ $HOME/.local/share/
echo "------------------------------"
echo "Setup complete, Fish Installed by Default"
echo "------------------------------"
;;
3)
echo "Setup Zsh in default"
cd $HOME
echo PS1="\[\033[1;33;1;32m\]:\[\033[1;31m\]\w$ \[\033[0m\]\[\033[0m\]" > .bashrc
chmod u+rwx,g+x .bashrc
chsh -s zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/fornwall/oh-my-zsh/etc-shells-may-not-exist/tools/install.sh)"
sed 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' -i $HOME/.zshrc
;;
4)
exit 0
;;
*)
echo "Choose the correct option"
;;
esac
