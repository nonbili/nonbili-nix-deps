{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "spago";

  version = "0.10.0.0";

  src = pkgs.fetchurl {
    url = "https://github.com/spacchetti/spago/releases/download/${version}/linux.tar.gz";
    sha256 = "0i6bax9h7bq3mkh15d2dbgn6cjs7fb3vac15669lqwhdz8dw0qcx";

  };

  setSourceRoot = "sourceRoot=`pwd`";

  installPhase = ''
    mkdir -p $out/bin
    SPAGO=$out/bin/spago
    install -D -m555 -T spago $SPAGO
  '';
}
