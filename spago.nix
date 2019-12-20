{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "spago";

  version = "0.12.1.0";

  src = pkgs.fetchurl {
    url = "https://github.com/spacchetti/spago/releases/download/${version}/linux.tar.gz";
    sha256 = "0zvnymdvf94w1m5yhibqdb3jv178ipq4vy13clrgz5ny5icv019k";
  };

  setSourceRoot = "sourceRoot=`pwd`";

  installPhase = ''
    mkdir -p $out/bin
    SPAGO=$out/bin/spago
    install -D -m555 -T spago $SPAGO
  '';
}
