with import <nixpkgs> {};
stdenv.mkDerivation rec {
  name = "env";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    gcc
    git
    autoconf
    automake
    libtool
    pkgconfig
    cmake
    vim
    docker-machine
    docker_compose
    docker
    jq
    openmpi
  ];
  shellHook = ''
    docker-machine rm -f default
    docker-machine create default
    eval "$(docker-machine env default)"
  '';
}
