# This is a derivation using only Ruby to build an executable
# Don't do this at home :)

{ ruby }:
let
  slimRuby = ruby.override {
    useRailsExpress = false;
    zlibSupport = true;
    opensslSupport = false;
    gdbmSupport = false;
    cursesSupport = false;
    docSupport = false;
    yamlSupport = false;
    fiddleSupport = false;
  };
in
derivation {
  name = "hello";
  system = builtins.currentSystem;
  builder = "${ruby}/bin/ruby";
  PATH = "${slimRuby}/bin/ruby";
  args = [ ./builder.rb ];
  src = ./hello.rb;
}
