{ stdenv, nixIntroGems, ruby, slides }:

stdenv.mkDerivation {
  name = builtins.replaceStrings [".md"] [""] (builtins.baseNameOf slides);
  buildInputs = [ nixIntroGems ];
  src = [ slides ];
  phases = ["buildPhase"];
  buildPhase = ''
    mkdir -p $out
    cd $out
    cp -r ${./img} $out/img
    slideshow -c ${./slideshow-config} build $src -t reveal.js
    mv *.html index.html
  '';
}
