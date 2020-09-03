{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "purs";

  version = "v0.13.8";

  src = pkgs.fetchurl {
    url = "https://github.com/purescript/purescript/releases/download/${version}/linux64.tar.gz";
    sha256 = "01xb9sl6rmg02ypdrv4n0mkzmdr5y9rajcdmg9c3j46q7z6q9mxy";
  };

  installPhase = ''
    mkdir -p $out/bin
    PURS=$out/bin/purs
    install -D -m555 -T purs $PURS
  '';
}
