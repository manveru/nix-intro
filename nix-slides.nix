{ stdenv, nixIntroGems, ruby, slides }:

stdenv.mkDerivation {
  name = "nix-slides";
  buildInputs = [ nixIntroGems ];
  src = [ slides ];
  unpackPhase = "true";
  installPhase = ''
    mkdir -p $out
    cd $out
    ln -s ${./img} $out/img
    slideshow -c ${./slideshow-config} build $src -t reveal.js
    mv *.html index.html
  '';
}
