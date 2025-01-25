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


first filtered log results on the first 8 iterations 

 grep -e user -e ^generate -A1 monothreadgentile.log  | grep -v -e ^-- -e ^gener -e major  | grep ^Ple -A1 | grep user | awk -F"user" '{tot=tot+$1;i=i+1}END{print tot/i}'

**60.4478**

 grep -e user -e ^generate -A1 monothreadgentile.log  | grep -v -e ^-- -e ^gener -e major  | grep ^Could -A1 | grep user | awk -F"user" '{tot=tot+$1;i=i+1}END{print tot/i}'

**78.7425**

 grep -e user -e ^generate -A1 monothreadgentile.log  | grep -v -e ^-- -e ^gener -e major  | grep ^List -A1 | grep user | awk -F"user" '{tot=tot+$1;i=i+1}END{print tot/i}'

**54.5375**

 
