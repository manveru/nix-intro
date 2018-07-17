with builtins;

let
  pkgs = import ./nixpkgs.nix;
  inherit (pkgs.lib) hasPrefix hasSuffix removePrefix removeSuffix
                     concatMapStringsSep;

  mkSlide = slides: pkgs.callPackage ./nix-slides.nix { inherit slides; };
  isSlide = fileName: (hasPrefix "slides_" fileName) &&
                      (hasSuffix ".md" fileName);

  slideFiles = map (n: {path = ./. + "/${n}"; name = n;})
                   (filter isSlide (attrNames (readDir ./.)));

  indexFileList = concatMapStringsSep " " (file:
    let href = removeSuffix ".md" file.name;
        name = removePrefix "slides_" href;
    in ''<li><a href="${href}/index.html">Part ${name}</a></li>''
  ) slideFiles;

  index = pkgs.writeTextFile {
    name = "index.html";
    text = ''
      <html>
        <head>
          <meta charset="UTF-8">
          <title>Nix Intro</title>
        </head>
        <style>
          body { text-align: center; font-size: 2em; }
          li { list-style: none; margin: 2em; }
        </style>
        <body>
          <h1>Nix Intro</h1>
          <ol>${indexFileList}</ol>
        </body>
      </html>
    '';
  };
in pkgs.stdenv.mkDerivation {
  name = "nix-intro";
  phases = ["installPhase"];
  builtSlides = map mkSlide (map (f: f.path) slideFiles);
  installPhase = ''
    mkdir -p $out
    for built in $builtSlides; do
      dst="$out/$(basename $built | cut -d- -f2)"
      cp -r $built $dst
    done
    cp ${index} $out/index.html
  '';
}
