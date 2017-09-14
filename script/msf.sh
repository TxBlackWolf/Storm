#!/data/data/com.termux/files/usr/bin/sh

echo "1 Start installation Metasploit Framework"
echo "2 Correct mistakes datax and PREFIX"
echo "3 Create a database for MSF"
echo "4 Exit"
read msfgo

case $msfgo in
1)
cd $HOME
apt update
apt upgrade
apt install autoconf bison clang coreutils curl findutils git apr apr-util libffi-dev libgmp-dev libpcap-dev \
    postgresql-dev readline-dev libsqlite-dev openssl-dev libtool libxml2-dev libxslt-dev ncurses-dev pkg-config \
    postgresql-contrib wget make ruby-dev libgrpc-dev termux-tools ncurses-utils ncurses unzip zip tar
echo "Dependencies Installed"
git clone https://github.com/rapid7/metasploit-framework
cd $HOME/metasploit-framework/
sed 's/rb-readline (0.5.4)/rb-readline (0.5.5)/g' -i $HOME/metasploit-framework/Gemfile.lock
sed 's/network_interface (0.0.1)/network_interface (0.0.2)/g' -i $HOME/metasploit-framework/Gemfile.lock

gem install bundler
gem install nokogiri -- --use-system-libraries


echo "Install GRPC"
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

echo "Install GEM"
cd $HOME/metasploit-framework
bundle install -j5

cd $HOME
mv $HOME/metasploit-framework $HOME/msfconsole
echo "msfconsole installed, Start the option-2"
;;
2)
echo "Correct mistakes datax and Shebang-PREFIX"
cd $HOME
pkg install -y termux-elf-cleaner
termux-elf-cleaner /data/data/com.termux/files/usr/lib/ruby/gems/2.4.0/gems/pg-0.20.0/lib/pg_ext.so
echo "Datax error fixed"

echo "Performance shebang fix"
cd $HOME/msfconsole
$PREFIX/bin/find -type f -executable -exec termux-fix-shebang \{\} \;
echo "Installation completed"

ln -s $HOME/msfconsole/msfconsole /data/data/com.termux/files/usr/bin/

rm -rf $HOME/msfconsole/modules/auxiliary/gather/http_pdf_authors.rb
echo "run msfconsole"
;;
3)
echo "Create a database"
cd $HOME
mkdir ~/.msfdb
initdb ~/.msfdb
pg_ctl -D ~/.msfdb -l ~/.msfdb/msfdb.log start
echo "Server start"
echo "createuser msf and createdb msfdb"
echo "pg_ctl stop Server stop"
;;
4)
exit 0
;;
*)
echo "Choose the correct option"
;;
esac
