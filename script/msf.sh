#!/data/data/com.termux/files/usr/bin/sh

echo "1 Начать установку Metasploit Framework"
echo "2 Исправить ошибки rmf и datax"
echo "3 Создать базу данных для MSF"
echo "4 Выход"
read msfgo

case $msfgo in
1)
cd $HOME
apt update
apt upgrade
echo "Install Requirements"
apt install autoconf bison clang coreutils curl findutils git apr apr-util libffi-dev libgmp-dev libpcap-dev \
    postgresql-dev readline-dev libsqlite-dev openssl-dev libtool libxml2-dev libxslt-dev ncurses-dev pkg-config \
    postgresql-contrib wget make ruby-dev libgrpc-dev termux-tools ncurses-utils ncurses unzip zip tar

curl -LO https://github.com/rapid7/metasploit-framework/archive/4.16.2.tar.gz
tar -xf 4.16.2.tar.gz
mv metasploit-framework-4.16.2 metasploit-framework
cd $HOME/metasploit-framework/
sed '/rbnacl/d' -i Gemfile.lock
sed '/rbnacl/d' -i metasploit-framework.gemspec
echo "Installing bundler"
gem install bundler
echo "Installing nokogiri"
gem install nokogiri -- --use-system-libraries

cd $HOME
gem unpack network_interface -v '0.0.1'
cd $HOME/network_interface-0.0.1/
sed 's|git ls-files|find -type f|' -i network_interface.gemspec
curl -L https://wiki.termux.com/images/6/6b/Netifaces.patch -o netifaces.patch
patch -p1 < netifaces.patch
gem build network_interface.gemspec
gem install network_interface-0.0.1.gem
cd ..
rm -rf network_interface-0.0.1

echo "Installing grpc"
sed 's|grpc (.*|grpc (1.4.1)|g' -i $HOME/metasploit-framework/Gemfile.lock
gem unpack grpc -v 1.4.1
cd $HOME/grpc-1.4.1/
curl -LO https://raw.githubusercontent.com/grpc/grpc/v1.4.1/grpc.gemspec
curl -L https://wiki.termux.com/images/b/bf/Grpc_extconf.patch -o extconf.patch
patch -p1 < extconf.patch
gem build grpc.gemspec
gem install grpc-1.4.1.gem
cd ..
rm -r grpc-1.4.1

echo "Installig gems"
cd $HOME/metasploit-framework
bundle install -j5

echo "Performing shebang fix"
$PREFIX/bin/find -type f -executable -exec termux-fix-shebang \{\} \;
;;
2)
echo "Pereforming Data error"
cd $HOME
pkg install -y termux-elf-cleaner
termux-elf-cleaner /data/data/com.termux/files/usr/lib/ruby/gems/2.4.0/gems/pg-0.20.0/lib/pg_ext.so
echo "Finish Installation"
cd $HOME
gem uninstall rb-readline
cd $HOME/metasploit-framework/
mv metasploit-framework msfconsole 
echo "Edit Gemfile.lock in line 218 rb-readline (0.5.4) in (0.5.5)"
echo "termux-chroot and gem install rbnacl-libsodium - v '1.0.11'"
cd $HOME/msfconsole/
echo "and builde install"
;;
3)
echo "Создаем базу данных"
cd $HOME
mkdir ~/.msfdb
initdb ~/.msfdb
pg_ctl -D ~/.msfdb -l ~/.msfdb/msfdb.log start
createuser msf
createdb msfdb
pg_ctl -D ~/.msfdb -l ~/.msfdb/msfdb.log stop
chmod 700 $HOME/Storm/script/msfstart.sh
cp $HOME/Storm/script/msfstart.sh $HOME/msfconsole/
cp $HOME/Storm/script/msfstop.sh $HOME/msfconsole/
echo "Установка авершена запустите bash msfstart.sh"
echo "Добавьте bash msfstop.sh в nano msfconsole 27 линию"
;;
4)
exit 0
;;
*)
echo "Выберите правильный вариант"
;;
esac