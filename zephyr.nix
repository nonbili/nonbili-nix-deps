{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "zephyr";

  version = "v0.3.0";

  src = pkgs.fetchurl {
    url = "https://github.com/rnons/zephyr/releases/download/${version}/linux64.tar.gz";
    sha256 = "0p2xjnwjyllswagacrjfylfcpk8099rf16y5r2m9igfr6ch0pazm";
  };

  installPhase = ''
    mkdir -p $out/bin
    ZEPHYR=$out/bin/zephyr
    install -D -m555 -T zephyr $ZEPHYR
  '';
}
