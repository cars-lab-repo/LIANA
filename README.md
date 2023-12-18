# LIANA </br>
This repository contains three scripts related to hardware Trojan mitigation. </br>
[Jordan Maynard](https://github.com/j0rban) & [Amin Rezaei](https://github.com/r3zaei) </br>

# Contents
* `find_rare.cpp` : finds steady state probabilities of design FSM </br>
* `duplicate_state.cpp`:  duplicates a chosen state in the design </br>
* `insert_trojan.cpp` : inserts a stealthy Trojan on a chosen state </br>
* `benchmarks/` : folder containing original and example benchmarks
  * `v/` : original FSM benchmarks from [Synthezza](https://www.synthezza.com/fsm-benchmarks)
  * `v_d/` : least likely state duplicated
  * `v_ti1/` : stealthy stuck-at-fault Trojan inserted on least likely state
  * `v_ti2/` : stealthy wrong transition Trojan inserted on least likely state
  * `v_d_ti1/` : least likely state duplicated and stealthy stuck-at-fault Trojan introduced to original least likely state
  * `v_d_ti2/` : least likely state duplicated and stealthy wrong transition Trojan introduced to original least likely state
* `output/` : output location for user-run scripts

# Compiling
1. g++ version 8.1.0 & Windows 10/11 is used to compile. To download g++, follow [this link](https://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win64/Personal%20Builds/mingw-builds/8.1.0/threads-posix/seh/x86_64-8.1.0-release-posix-seh-rt_v6-rev0.7z/download).
2. Run `g++ find_rare.cpp -o fr.exe`, then `g++ duplicate_state.cpp -o ds.exe` then `g++ insert_trojan.cpp -o it.exe` to compile and create executables for each script.
3. Run `./[the one you want to use].exe` to use each script.

# Usage
1. `find_rare.cpp`
  * Run `./fr.exe`.
  * Input benchmark file name, including ".v". *Example: `benchmarks/v/ass13.v`*
2. `duplicate_state.cpp`
  * Run `./ds.exe`.
  * Input benchmark file name, including ".v". *Example: `benchmarks/v/ass13.v`*
  * Choose the state you want to duplicate by number. *NOTE: if duplicating a duplicate state, use `2_d`*
3. `insert_trojan.cpp`
  * Run `./it.exe`.
  * Input benchmark file name, including ".v". *Example: `benchmarks/v/ass13.v`*
  * Choose the state you want to duplicate by number. *NOTE: if infecting a duplicate state, use `2_d`*
  * Choose the number of state visits before Trojan trigger activates.
  * Choose between stuck-at-fault or wrong state transition payload.
