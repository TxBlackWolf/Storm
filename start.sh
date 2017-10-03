#!/data/data/com.termux/files/usr/bin/sh
echo "   _____   _______    ____    _____    __  __  "
echo "  / ____| |__   __|  / __ \  |  __ \  |  \/  | "
echo " | (___      | |    | |  | | | |__) | | \  / | "
echo "  \___ \     | |    | |  | | |  _  /  | |\/| | "
echo "  ____) |    | |    | |__| | | | \ \  | |  | | "
echo " |_____/     |_|     \____/  |_|  \_\ |_|  |_| "
                                              
echo "1 Primary setting"
echo "2 Install the Metasploit Framework"
echo "3 Install the Routersploit"
echo "4 Programs list-1"
echo "5 Programs list-2"
echo "6 Exit"
read startgo

case $startgo in
1)
bash $HOME/Storm/script/primaryset.sh
;;
2)
bash $HOME/Storm/script/msf.sh
;;
3)
bash $HOME/Storm/script/rsf.sh
;;
4)
bash $HOME/Storm/script/programlist_1.sh
;;
5)
bash $HOME/Storm/script/programlist_2.sh
;;
6)
exit 0
;;
*)
echo "Choose the correct option"
;;
esac
