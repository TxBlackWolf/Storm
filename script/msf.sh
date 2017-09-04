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
apt install autoconf bison clang coreutils curl findutils git apr apr-util libffi-dev libgmp-dev libpcap-dev \
    postgresql-dev readline-dev libsqlite-dev openssl-dev libtool libxml2-dev libxslt-dev ncurses-dev pkg-config \
    postgresql-contrib wget make ruby-dev libgrpc-dev termux-tools ncurses-utils ncurses unzip zip tar
echo "Зависимости Установлены"
git clone https://github.com/rapid7/metasploit-framework
cd $HOME/metasploit-framework/
gem install bundler
gem install nokogiri -- --use-system-libraries

echo "Устанавливаем GRPC"
cd $HOME/metasploit-framework/
sed 's|grpc (.*|grpc (1.4.1)|g' -i Gemfile.lock
gem unpack grpc -v 1.4.1
cd $HOME/metasploit-framework/grpc-1.4.1/
curl -LO https://raw.githubusercontent.com/grpc/grpc/v1.4.1/grpc.gemspec
curl -L https://wiki.termux.com/images/b/bf/Grpc_extconf.patch -o extconf.patch
patch -p1 < extconf.patch
gem build grpc.gemspec
gem install grpc-1.4.1.gem
cd ..
rm -rf grpc-1.4.1

echo "Устанавливаем rbnacl-libsodium"
gem unpack rbnacl-libsodium -v'1.0.13'
cd rbnacl-libsodium-1.0.13
termux-fix-shebang ./vendor/libsodium/configure ./vendor/libsodium/build-aux/*
sed 's|">= 3.0.1"|"~> 3.0", ">= 3.0.1"|g' -i rbnacl-libsodium.gemspec
sed 's|">= 10"|"~> 10"|g' -i rbnacl-libsodium.gemspec
curl -LO https://Auxilus.github.io/configure.patch
patch ./vendor/libsodium/configure < configure.patch
gem build rbnacl-libsodium.gemspec
gem install rbnacl-libsodium-1.0.13.gem
cd .. 
rm -rf rbnacl-libsodium-1.0.13

echo "Установка GEM"
cd $HOME/metasploit-framework
bundle install -j5

echo "Выполнение shebang fix"
cd $HOME/metasploit-framework
$PREFIX/bin/find -type f -executable -exec termux-fix-shebang \{\} \;
echo "Установка завершена"

cd $HOME
mv $HOME/metasploit-framework $HOME/msfconsole
echo "msfconsole установлена, начние пункт 2"
;;
2)
echo "Исправляем ощибку rmf и datax"
cd $HOME
pkg install -y termux-elf-cleaner
termux-elf-cleaner /data/data/com.termux/files/usr/lib/ruby/gems/2.4.0/gems/pg-0.20.0/lib/pg_ext.so
echo "Datax ошибка устранена"
cd $HOME
gem uninstall rb-readline
cd $HOME/msfconsole/
echo "Edit Gemfile.lock in line 218 rb-readline (0.5.4) in (0.5.5)"
echo "and builde install"
;;
3)
echo "Создаем базу данных"
cd $HOME
mkdir ~/.msfdb
initdb ~/.msfdb
pg_ctl -D ~/.msfdb -l ~/.msfdb/msfdb.log start
echo "Старт сервера"
echo "createuser msf and createdb msfdb"
echo "pg_ctl -D ~/.msfdb -l ~/.msfdb/msfdb.log stop"
;;
4)
exit 0
;;
*)
echo "Выберите правильный вариант"
;;
esac
