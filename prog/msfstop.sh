#!/data/data/com.termux/files/usr/bin/sh

cd $HOME
pg_ctl -D ~/.msfdb -l ~/.msfdb/msfdb.log stop
cd $HOME/msfconsole/