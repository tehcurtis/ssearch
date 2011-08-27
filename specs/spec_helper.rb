$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'ssearch'

Dir.chdir 'specs/test_example_files/'

def search_for(string)
  ssearch_bin = File.expand_path(File.dirname(__FILE__)+'/../bin/ssearch')

  %x{#{ssearch_bin} #{string}}
end
