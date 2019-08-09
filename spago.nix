{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "spago";

  version = "0.9.0.0";

  src = pkgs.fetchurl {
    url = "https://github.com/spacchetti/spago/releases/download/${version}/linux.tar.gz";
    sha256 = "0rrpg1h1rdvfcxnldwni9kaqnv58cblfadgz7wamnggmnwsjnnzk";
  };

  setSourceRoot = "sourceRoot=`pwd`";

  installPhase = ''
    mkdir -p $out/bin
    SPAGO=$out/bin/spago
    install -D -m555 -T spago $SPAGO
  '';
}
