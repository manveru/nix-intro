let pkgs = import ./nixpkgs.nix;
in builtins.map (slides:
  pkgs.callPackage ./nix-slides.nix { inherit slides; }
) [ ./slides_1.md ./slides_2.md ]
