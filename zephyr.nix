{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "zephyr";

  version = "v0.2.1";

  src = pkgs.fetchurl {
    url = "https://github.com/coot/zephyr/releases/download/${version}/linux64.tar.gz";
    sha256 = "0afcnpqabjs4b60grkcvz2hb3glpjhlnvqvpgc0zsdwaqnmcrrnk";
  };

  installPhase = ''
    mkdir -p $out/bin
    ZEPHYR=$out/bin/zephyr
    install -D -m555 -T zephyr $ZEPHYR
  '';
}
