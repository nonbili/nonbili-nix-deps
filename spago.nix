{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "spago";

  version = "0.14.0";

  src = pkgs.fetchurl {
    url = "https://github.com/spacchetti/spago/releases/download/${version}/linux.tar.gz";
    sha256 = "0bqpns70ik55wb5vahmrpaz480bm9nhq87iq57aj74w6v52qi3bv";
  };

  setSourceRoot = "sourceRoot=`pwd`";

  installPhase = ''
    mkdir -p $out/bin
    SPAGO=$out/bin/spago
    install -D -m555 -T spago $SPAGO
  '';
}
