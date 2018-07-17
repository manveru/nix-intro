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

  PATH = "${slimRuby}/bin/ruby";
  src = ./hello.rb;

  builder = "${ruby}/bin/ruby";
  args = [ ./builder.rb ];
}
