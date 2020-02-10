{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "zephyr";

  version = "v0.2.2";

  src = pkgs.fetchurl {
    url = "https://github.com/coot/zephyr/releases/download/${version}/x86_64-linux.tar.gz";
    sha256 = "0kgvrd6i1yj5n09ar82q27wgq6n5x9x6iy93nx1yqvk87kcmbji6";
  };

  installPhase = ''
    mkdir -p $out/bin
    ZEPHYR=$out/bin/zephyr
    install -D -m555 -T zephyr $ZEPHYR
  '';
}
