import (fetchTarball {
  url = https://github.com/NixOS/nixpkgs-channels/archive/6e76a618fb5d0033b06b45e64649707c6d38ddae.tar.gz;
  sha256 = "1hlq1n115phbnw07mnf54z0bvlny35xz5chd352pw1ykjxyydp7x";
}) {
  config = {};
  overlays = [(self: super: rec {
    ruby      = super.ruby_2_5;
    nodejs    = super.nodejs-10_x;
    yarn2nix  = super.yarn2nix.override { inherit nodejs; };
    yarn      = super.yarn.override     { inherit nodejs; };
    markpress = self.callPackage ../nur/pkgs/markpress {};
    nodeppt = self.callPackage ../nur/pkgs/nodeppt {};
    nixIntroGems = super.bundlerEnv {
      name = "nix-intro-gems";
      inherit ruby;
      gemdir = ./.;
    };
  })];
}
