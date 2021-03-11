{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "purs";

  version = "v0.14.0";

  src = pkgs.fetchurl {
    url = "https://github.com/purescript/purescript/releases/download/${version}/linux64.tar.gz";
    sha256 = "1l3i7mxlzb2dkq6ff37rvnaarikxzxj0fg9i2kk26s8pz7vpqgjh";
  };

  installPhase = ''
    mkdir -p $out/bin
    PURS=$out/bin/purs
    install -D -m555 -T purs $PURS
  '';
}
