{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "purs";

  version = "v0.15.2";

  src = pkgs.fetchurl {
    url = "https://github.com/purescript/purescript/releases/download/${version}/linux64.tar.gz";
    sha256 = "1p37k6briczw6gvw04idkx734ms1swgrx9sl4hi6xwvxkfp1nm0m";

  };

  installPhase = ''
    mkdir -p $out/bin
    PURS=$out/bin/purs
    install -D -m555 -T purs $PURS
  '';
}
