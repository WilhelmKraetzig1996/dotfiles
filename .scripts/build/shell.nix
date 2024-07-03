let
  conan_src = fetchTarball "https://github.com/NixOS/nixpkgs/archive/f21b6f77ac562732a4c9b8d1e5751c97853fe873.tar.gz";
  conan_pkgs = import conan_src { config = {}; overlays = []; };
  gcc_src = fetchTarball "https://github.com/NixOS/nixpkgs/archive/55070e598e0e03d1d116c49b9eff322ef07c6ac6.tar.gz";
  gcc_pkgs = import gcc_src { config = {}; overlays = []; };
  cmake_src = fetchTarball "https://github.com/NixOS/nixpkgs/archive/9957cd48326fe8dbd52fdc50dd2502307f188b0d.tar.gz";
  cmake_pkgs = import cmake_src { config = {}; overlays = []; };
  libxml2_src = fetchTarball "https://github.com/NixOS/nixpkgs/archive/9957cd48326fe8dbd52fdc50dd2502307f188b0d.tar.gz";
  libxml2_pkgs = import libxml2_src { config = {}; overlays = []; };
  ninja_src = fetchTarball "https://github.com/NixOS/nixpkgs/archive/e89cf1c932006531f454de7d652163a9a5c86668.tar.gz";
  ninja_pkgs = import libxml2_src { config = {}; overlays = []; };
in

conan_pkgs.mkShell {
  packages = [
    conan_pkgs.conan
    gcc_pkgs.gcc
    cmake_pkgs.cmake
    libxml2_pkgs.libxml2
    libxml2_pkgs.openssl_legacy
    libxml2_pkgs.xar
    ninja_pkgs.ninja
  ];
  CONAN_REVISIONS_ENABLED=1;
}

