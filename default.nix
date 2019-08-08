{ pkgs ? import <nixpkgs> {}
}:
let
  zephyr = import ./zephyr.nix {};

  buildInputs = [
    zephyr
  ];

in
pkgs.stdenv.mkDerivation {
  name = "nonbili-nix-deps";
  inherit buildInputs;
}
