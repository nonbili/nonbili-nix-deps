{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "spago";

  version = "0.20.3";

  src = pkgs.fetchurl {
    url = "https://github.com/spacchetti/spago/releases/download/${version}/linux.tar.gz";
    sha256 = "1g267pnwqdy1r6x938pwd93b0095q3gk7r59r678f18pl0pvrzc1";
  };

  setSourceRoot = "sourceRoot=`pwd`";

  installPhase = ''
    mkdir -p $out/bin
    SPAGO=$out/bin/spago
    install -D -m555 -T spago $SPAGO
  '';
}
