{ pkgs ? import <nixpkgs> {}
}:
let
  purs = import ./purs.nix {};

  spago = import ./spago.nix {};

  zephyr = import ./zephyr.nix {};

  buildInputs = [
    purs
    spago
    zephyr
  ];

in
{
  inherit purs spago zephyr;

  shell = pkgs.mkShell { inherit buildInputs; };
}
