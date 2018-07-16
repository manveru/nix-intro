{
  activesupport = {
    dependencies = ["concurrent-ruby" "i18n" "minitest" "tzinfo"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1nkzg31x501l8d1hbygyh1lr4c3vnw88a3c1rxz5ifvvzb10i6zm";
      type = "gem";
    };
    version = "5.2.0";
  };
  concurrent-ruby = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "183lszf5gx84kcpb779v6a2y0mx9sssy8dgppng1z9a505nj1qcf";
      type = "gem";
    };
    version = "1.0.5";
  };
  fetcher = {
    dependencies = ["logutils"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1j1mhhwnq2bbalv1i3x4vll8w9dpx7sd1aaqz91q4c0jr48nn69l";
      type = "gem";
    };
    version = "0.4.5";
  };
  gli = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0g7g3lxhh2b4h4im58zywj9vcfixfgndfsvp84cr3x67b5zm4kaq";
      type = "gem";
    };
    version = "2.17.1";
  };
  i18n = {
    dependencies = ["concurrent-ruby"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1milplpsdpxlvn23q6pvir4jgxsphq2ps2jgdb3i29kzpc55gm7y";
      type = "gem";
    };
    version = "1.0.1";
  };
  iniparser = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "05za7xh60bq3xljrpirgbra8rfbhdphfd3dvchx5q8ifz7zblkwj";
      type = "gem";
    };
    version = "0.1.0";
  };
  kramdown = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1n1c4jmrh5ig8iv1rw81s4mw4xsp4v97hvf8zkigv4hn5h542qjq";
      type = "gem";
    };
    version = "1.17.0";
  };
  liquid = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "17fa0jgwm9a935fyvzy8bysz7j5n1vf1x2wzqkdfd5k08dbw3x2y";
      type = "gem";
    };
    version = "4.0.0";
  };
  logutils = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "18r9yaz0k0z7v47clxa289znvqja9k1g133pg0ddxw5dm2mcwvd3";
      type = "gem";
    };
    version = "0.6.1";
  };
  minitest = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0icglrhghgwdlnzzp4jf76b0mbc71s80njn5afyfjn4wqji8mqbq";
      type = "gem";
    };
    version = "5.11.3";
  };
  pakman = {
    dependencies = ["fetcher" "liquid" "logutils"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1djp0scqv2710zh46bc99pqjzv022b3jnkby7jbz63c0xvi5bs0v";
      type = "gem";
    };
    version = "1.1.0";
  };
  props = {
    dependencies = ["iniparser"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08scpwmqhfpydiqnh58i5ylcxm0kichmsr791fnwc33zb4x0z4g8";
      type = "gem";
    };
    version = "1.2.0";
  };
  rubyzip = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "06js4gznzgh8ac2ldvmjcmg9v1vg9llm357yckkpylaj6z456zqz";
      type = "gem";
    };
    version = "1.2.1";
  };
  slideshow = {
    dependencies = ["gli" "slideshow-models"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bqml9apmywphy0kw30m9y3jb60dx9nxpcffi1gwvfzxwln6nz8y";
      type = "gem";
    };
    version = "4.0.0";
  };
  slideshow-models = {
    dependencies = ["activesupport" "kramdown" "logutils" "pakman" "props" "textutils"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0vxw3fr58p4ib47qih77fd38l1apni95x6q3mg50iigrm2n298m9";
      type = "gem";
    };
    version = "4.0.1";
  };
  textutils = {
    dependencies = ["activesupport" "logutils" "props" "rubyzip"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "098l3flh1ynqqj992133pn2l201my5mqrfgjzrdrvk5cfx9p349x";
      type = "gem";
    };
    version = "1.4.0";
  };
  thread_safe = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nmhcgq6cgz44srylra07bmaw99f5271l0dpsvl5f75m44l0gmwy";
      type = "gem";
    };
    version = "0.3.6";
  };
  tzinfo = {
    dependencies = ["thread_safe"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1fjx9j327xpkkdlxwmkl3a8wqj7i4l4jwlrv3z13mg95z9wl253z";
      type = "gem";
    };
    version = "1.2.5";
  };
}