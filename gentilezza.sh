#purpose og this file it's to test CPU time need to inference  the same question with and without kindness
for i in $(seq 1 100); do
        echo "ciclo $i"
        time ./llama.cpp/build/bin/llama-cli -m models/Llama-3.2-3B-Instruct-F16.gguf  -p "Please list the number of province in Sicily in Alphabetic order" -s 1971 -t 1  --temp 0.1 -n 100  2>&1  |  strings
        time ./llama.cpp/build/bin/llama-cli -m models/Llama-3.2-3B-Instruct-F16.gguf  -p "Could you please list the number of province in Sicily in Alphabetic order?" -s 1971 -t 1 --temp 0.4  -n 100  2>&1    | strings
        time ./llama.cpp/build/bin/llama-cli -m models/Llama-3.2-3B-Instruct-F16.gguf  -p "List the number of province in Sicily in Alphabetic order" -s 1971 -t 1 --temp 0.4 -n 100  2>&1 |  strings

done

