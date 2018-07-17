#!/usr/bin/env ruby

require 'fileutils'

executables = {}
ENV["PATH"].split(":").each do |path|
  executables[File.basename(path)] = "#!/usr/bin/env #{path}"
end

bin = File.join(ENV["out"], "bin")
hello = File.join(ENV["out"], "bin", "hello")

FileUtils.mkdir_p bin

File.open hello, 'w+' do |dst|
  File.open ENV["src"], 'r' do |src|
    src.each_line.with_index do |line, i|
      line.gsub! %r(^#\s*!/usr/bin/env\s+(\S+)$) do
        executables[$1]
      end if i == 0
      dst.write line
    end
  end
end

FileUtils.chmod 0744, hello
