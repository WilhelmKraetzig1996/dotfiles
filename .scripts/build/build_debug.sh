#! /usr/bin/env nix-shell
#! nix-shell /home/dear/.scripts/build/shell.nix -i bash
conan install -if ./build .
cd build
cmake -G "Unix Makefiles" -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=Debug -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DBUILD_BENCHMARK=true -DBUILD_INTEGRATION_TESTS=true ..
cmake --build . --parallel 7 
cp RUNTIME_OUTPUT_DIRECTORY/* ~/Documents/Pd/externals/
cd ..
