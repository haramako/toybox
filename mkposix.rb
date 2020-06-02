#!/bin/env ruby

# Make posix stab functions.

require 'pp'

def trace(*msg)
  puts(*msg) if ENV['V']
end

def find_func_def(funcs)
  defs = {}
  files = Dir.glob('/usr/include/**/*.h').map{|f| [f, IO.read(f)]}
  funcs.each do |func|
    trace '.'
    found = false
    regex = /extern\s+((struct\s+)?[a-zA-Z0-9_]+\s+\*?#{func}\s+\(.+?\))/m
    files.each do |fname,src|
      mo = src.match(regex)
      if mo
        found = true
        defs[func] = mo[1].gsub(/\s+/,' ')
        break
      end
    end
    puts "(NOT FOUND)" unless found
  end
  trace
  defs
end

funcs = IO.read('posix_func.txt').split(/\n/)
func_defs = find_func_def(funcs)

# pp func_defs

puts func_defs.map{|x| x[1] + '{}'}
