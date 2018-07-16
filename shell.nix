{ pkgs ? import ./nixpkgs.nix }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    nixIntroGems
    nixIntroGems.wrappedRuby
    bundix
  ];
}
