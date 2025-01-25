# AIGentilezza
This repository collects notes, tests, experiments to verify if kindness is useful when addressing AI and how much kindness costs.


**scenario**:
   i want to ask a question to **AI**, i can use **kidness** (i always try to use it) but i want to find if kidness **costs** in terms of **cpu/gpu time **(watt)

the questions are:

**"Please list the number of province in Sicily in Alphabetic order"**

**"Could you please list the number of province in Sicily in Alphabetic order?"**
 
 **"List the number of province in Sicily in Alphabetic order"**


the model i'm using is a quantized **Llama 3.2 3B** (Llama-3.2-3B-Instruct-F16.gguf)   

the parameters are:
```
temperature = 0.4
num tokens =  1100
thread = 1
seed = 1971 (the same for all) 
```

purpose of this file it's to test CPU time need to inference  the same question with and without kindness

```
<for i in $(seq 1 100); do
        echo "ciclo $i"
        time ./llama.cpp/build/bin/llama-cli -m models/Llama-3.2-3B-Instruct-F16.gguf  -p "Please list the number of province in Sicily in Alphabetic order" -s 1971 -t 1  --temp 0.1 -n 100  2>&1  |  strings
        time ./llama.cpp/build/bin/llama-cli -m models/Llama-3.2-3B-Instruct-F16.gguf  -p "Could you please list the number of province in Sicily in Alphabetic order?" -s 1971 -t 1 --temp 0.4  -n 100  2>&1    | strings
        time ./llama.cpp/build/bin/llama-cli -m models/Llama-3.2-3B-Instruct-F16.gguf  -p "List the number of province in Sicily in Alphabetic order" -s 1971 -t 1 --temp 0.4 -n 100  2>&1 |  strings
done>
```


first filtered log results on the first iterations 
```
 sh analisi.sh

"Please" costs 60.2292 sec for 24 iterations
"Could" costs 78.8779 sec for 24 iterations
"List" costs 55.0075 sec for 24 iterations


```

 

 
