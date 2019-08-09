{ pkgs ? import <nixpkgs> {}
}:
let
  zephyr = import ./zephyr.nix {};

  buildInputs = [
    zephyr
  ];

in
{
  inherit zephyr;

  shell = pkgs.mkShell { inherit buildInputs; };
}
