 grep -e user -e ^generate -A1 monothreadgentile.log  | grep -v -e ^-- -e ^gener -e major  | grep ^Ple -A1 | grep user | awk -F"user" '{tot=tot+$1;i=i+1}END{print "\"Please\" costs "tot/i" sec for "i" iterations"}'
 grep -e user -e ^generate -A1 monothreadgentile.log  | grep -v -e ^-- -e ^gener -e major  | grep ^Could -A1 | grep user | awk -F"user" '{tot=tot+$1;i=i+1}END{print "\"Could\" costs "tot/i" sec for "i" iterations"}'
 grep -e user -e ^generate -A1 monothreadgentile.log  | grep -v -e ^-- -e ^gener -e major  | grep ^List -A1 | grep user | awk -F"user" '{tot=tot+$1;i=i+1}END{print "\"List\" costs "tot/i" sec for "i" iterations"}'

