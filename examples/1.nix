let
  config = import <nix/config.nix>;
in

derivation {
  name = "foo";
  builder = config.shell;
  args = [ "-c" "${config.coreutils}/touch $out" ];
}
