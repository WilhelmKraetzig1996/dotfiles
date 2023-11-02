let
  conan_src = fetchTarball "https://github.com/NixOS/nixpkgs/archive/f21b6f77ac562732a4c9b8d1e5751c97853fe873.tar.gz";
  conan_pkgs = import conan_src { config = {}; overlays = []; };
  gcc_src = fetchTarball "https://github.com/NixOS/nixpkgs/archive/d1c3fea7ecbed758168787fe4e4a3157e52bc808.tar.gz";
  gcc_pkgs = import gcc_src { config = {}; overlays = []; };
  cmake_src = fetchTarball "https://github.com/NixOS/nixpkgs/archive/9957cd48326fe8dbd52fdc50dd2502307f188b0d.tar.gz";
  cmake_pkgs = import gcc_src { config = {}; overlays = []; };
in

conan_pkgs.mkShell {
  packages = [
    conan_pkgs.conan
    gcc_pkgs.gcc
    cmake_pkgs.cmake
  ];
  CONAN_REVISIONS_ENABLED=1;
}

