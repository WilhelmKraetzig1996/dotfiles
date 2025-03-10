#! /usr/bin/env nix-shell
#! nix-shell /home/dear/.scripts/build/shell.nix -i bash
conan install -if ./build_release -s build_type=Release .
cd build_release
cmake -G "Ninja" -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DBUILD_BENCHMARK=true -DBUILD_INTEGRATION_TESTS=true ..
cmake --build . --parallel 7 
cd ..

