{ stdenv, bash }:
let
  greeter = msg:
    stdenv.mkDerivation {
      name = msg;
      unpackPhase = "true";
      src = ./greeter.sh;
      installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/${msg}
        chmod +x $out/bin/${msg}
      '';
    };
  hello    = greeter "hello";
  bye      = greeter "bye";
  sayonara = greeter "konnichiwa";
in
  stdenv.mkDerivation {
    name = "hello-goodbye";
    unpackPhase = "true";
    src = ./builder.sh;
    buildInputs = [ hello bye sayonara ];
    installPhase = ''
      set -x
      mkdir -p $out/bin
      for input in $buildInputs; do
        cp $input/bin/* $out/bin/
      done
      set +x
    '';
  }
