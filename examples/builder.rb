#!/usr/bin/env ruby

require 'pp'
require 'fileutils'

FileUtils.mkdir_p(File.join(ENV["out"], "bin"))
FileUtils.cp(ENV["src"], File.join(ENV["out"], "bin", "hello"))
FileUtils.chmod(0744, File.join(ENV["out"], "bin", "hello"))
