{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "purs";

  version = "v0.14.4";

  src = pkgs.fetchurl {
    url = "https://github.com/purescript/purescript/releases/download/${version}/linux64.tar.gz";
    sha256 = "0hgsh6l52z873b2zk3llvqik18ifika48lmr71qyhlqf250ng9m0";
  };

  installPhase = ''
    mkdir -p $out/bin
    PURS=$out/bin/purs
    install -D -m555 -T purs $PURS
  '';
}
