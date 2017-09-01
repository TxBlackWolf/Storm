#!/data/data/com.termux/files/usr/bin/sh

cd $HOME
pg_ctl -D ~/.msfdb -l ~/.msfdb/msfdb.log start
cd $HOME/msfconsole/
ruby msfconsole