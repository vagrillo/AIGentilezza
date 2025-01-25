# AIGentilezza
This repository collects notes, tests, experiments to verify if kindness is useful when addressing AI and how much kindness costs.


scenario:
   i want to ask a question to AI, i can use kidness (i always try to use it) but i want to find if kidness costs cpu/gpu time

   

#purpose og this file it's to test CPU time need to inference  the same question with and without kindness
for i in $(seq 1 100); do
        echo "ciclo $i"
        time ./llama.cpp/build/bin/llama-cli -m models/Llama-3.2-3B-Instruct-F16.gguf  -p "Please list the number of province in Sicily in Alphabetic order" -s 1971 -t 1  --temp 0.1 -n 100  2>&1  |  strings
        time ./llama.cpp/build/bin/llama-cli -m models/Llama-3.2-3B-Instruct-F16.gguf  -p "Could you please list the number of province in Sicily in Alphabetic order?" -s 1971 -t 1 --temp 0.4  -n 100  2>&1    | strings
        time ./llama.cpp/build/bin/llama-cli -m models/Llama-3.2-3B-Instruct-F16.gguf  -p "List the number of province in Sicily in Alphabetic order" -s 1971 -t 1 --temp 0.4 -n 100  2>&1 |  strings
done


first filtered log results:

_Please list the number of province in Sicily in Alphabetic order
61.04user 0.65system 1:01.70elapsed 99%CPU (0avgtext+0avgdata 6810924maxresident)k
Could you please list the number of province in Sicily in Alphabetic order? 2 provinces are in Sicily.
81.11user 0.72system 1:21.84elapsed 99%CPU (0avgtext+0avgdata 6811484maxresident)k
List the number of province in Sicily in Alphabetic order
52.86user 0.62system 0:53.49elapsed 99%CPU (0avgtext+0avgdata 6810956maxresident)k
Please list the number of province in Sicily in Alphabetic order
59.13user 0.73system 0:59.86elapsed 99%CPU (0avgtext+0avgdata 6810920maxresident)k
Could you please list the number of province in Sicily in Alphabetic order? 2 provinces are in Sicily.
77.24user 0.66system 1:17.91elapsed 99%CPU (0avgtext+0avgdata 6811736maxresident)k
List the number of province in Sicily in Alphabetic order
55.35user 0.60system 0:55.96elapsed 99%CPU (0avgtext+0avgdata 6811132maxresident)k
_

on the first 8 iterations 
 grep -e user -e ^generate -A1 monothreadgentile.log  | grep -v -e ^-- -e ^gener -e major  | grep ^Ple -A1 | grep user | awk -F"user" '{tot=tot+$1;i=i+1}END{print tot/i}'
**60.4478**
 grep -e user -e ^generate -A1 monothreadgentile.log  | grep -v -e ^-- -e ^gener -e major  | grep ^Could -A1 | grep user | awk -F"user" '{tot=tot+$1;i=i+1}END{print tot/i}'
**78.7425**
 grep -e user -e ^generate -A1 monothreadgentile.log  | grep -v -e ^-- -e ^gener -e major  | grep ^List -A1 | grep user | awk -F"user" '{tot=tot+$1;i=i+1}END{print tot/i}'
**54.5375**

 
