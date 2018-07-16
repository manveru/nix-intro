{ ruby }:
derivation {
  name = "hello";
  system = builtins.currentSystem;
  builder = "${ruby}/bin/ruby";
  args = [ "-e" (''
    require 'fileutils'

    FileUtils.mkdir_p(File.join(ENV["out"], "bin"))
    FileUtils.cp(ENV["src"], File.join(ENV["out"], "bin", "hello"))
    FileUtils.chmod(0744, File.join(ENV["out"], "bin", "hello"))
  '')];
  src = ./hello.rb;
}
