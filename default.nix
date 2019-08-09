{ pkgs ? import <nixpkgs> {}
}:
let
  spago = import ./spago.nix {};

  zephyr = import ./zephyr.nix {};

  buildInputs = [
    spago
    zephyr
  ];

in
{
  inherit spago zephyr;

  shell = pkgs.mkShell { inherit buildInputs; };
}
