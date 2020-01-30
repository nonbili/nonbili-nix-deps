{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "purs";

  version = "v0.13.6";

  src = pkgs.fetchurl {
    url = "https://github.com/purescript/purescript/releases/download/${version}/linux64.tar.gz";
    sha256 = "012znrj32aq96qh1g2hscdvhl3flgihhimiz40agk0dykpksblns";
  };

  installPhase = ''
    mkdir -p $out/bin
    PURS=$out/bin/purs
    install -D -m555 -T purs $PURS
  '';
}
