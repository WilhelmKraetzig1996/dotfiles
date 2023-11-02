#! /usr/bin/env nix-shell
#! nix-shell /home/dear/.scripts/build/shell.nix -i bash
mkdir cmake-build
conan install --install-folder ./cmake-build .
cd cmake-build
cmake -G "Unix Makefiles" -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=Debug -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ ..
cmake --build . --parallel 7 
