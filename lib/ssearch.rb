require_relative 'ssearch/version'

module Ssearch
  extend self

  def execute(string)
    @found_files = []

    Dir.glob('*').each do |folder_item|
      next unless File.readable?(folder_item)

      file = File.open(folder_item, 'r')

      found_file = nil

      found_file = FoundFile.new(folder_item) if folder_item =~ /#{string}/

      i = 1
      file.each_line do |line|
        if line =~ /#{string}/
          found_file = FoundFile.new(folder_item) if found_file.nil?

          found_file.lines << "#{i}: #{line}"
        end
        i += 1
      end

      @found_files << found_file unless found_file.nil?
    end

    @found_files.each do |ff|
      print ff.filename
      print '-'*50

      ff.lines.each do |line|
        print line
      end
    end
  end
end


class FoundFile
  attr_accessor :lines, :filename

  def initialize(filename)
    @filename = filename
    @lines ||= []
  end
end


