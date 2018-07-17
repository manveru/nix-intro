# You can build me with:
# nix-build --show-trace -E '((import ../../nixpkgs.nix).callPackage ./. {})'
# And then see the enabled greeters in ./result/bin

{ stdenv, fetchurl, bash, glibcLocales }:
let
  greeters = {
    "english" = "en_US.UTF-8";
    "german" = "de_DE.UTF-8";
    # "spanish" = "es_ES.UTF-8";
    # "japanese" = "ja_JP.UTF-8";
    # "italian" = "it_IT.UTF-8";
  };

  hello = import ../gnu-hello { inherit stdenv fetchurl; };

  greeter = { language ? "english", locale ? "en_US.UTF-8" }:
    stdenv.mkDerivation {
      name = "${language}-greeter";
      phases = ["installPhase"];
      nativeBuildInputs = [ hello glibcLocales ];
      installPhase = ''
        mkdir -p $out/bin
        cat <<-EOF > $out/bin/hello-${language}
        #!${stdenv.shell}
        echo "$(LC_ALL=${locale} hello)"
        EOF
        chmod +x $out/bin/hello-${language}
      '';
    };
in
  stdenv.mkDerivation {
    name = "hello-goodbye";
    phases = [ "installPhase" ];

    greeters = builtins.map (language:
      greeter { language = language; locale = greeters."${language}"; }
    ) (builtins.attrNames greeters);

    installPhase = ''
      set -ex
      echo $greeters
      mkdir -p $out/bin
      for greeter in $greeters; do
        ls -la $greeter
        ln -s $greeter/bin/* $out/bin/
      done
      set +x
    '';
  }
