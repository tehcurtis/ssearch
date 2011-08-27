require_relative 'ssearch/version'

module Ssearch
  extend self

  def execute(query_string)
    @query_string = query_string
    find_files
    present_found_files
  end

  private

  def present_found_files
    @found_files.each do |ff|
      puts "\n\n"
      puts ff.filename
      puts '-'*50

      ff.lines.each do |line|
        print line
      end
    end
  end


  def find_files
    @found_files = []

    scan_items_or_folders('.')

  end

  def scan_items_or_folders(dir)

    Dir.glob("#{dir}/*").each do |folder_item|
      next unless File.readable?(folder_item)

      if File.directory?(folder_item)
        scan_items_or_folders("#{dir}/#{folder_item}")
        next
      end

      file = File.open(folder_item, 'r')

      found_file = nil

      found_file = FoundFile.new(folder_item) if folder_item =~ /#{@query_string}/

      i = 1
      file.each_line do |line|
        if line =~ /#{@query_string}/
          found_file = FoundFile.new(folder_item) if found_file.nil?

          found_file.lines << "#{i}: #{line}"
        end
        i += 1
      end

      @found_files << found_file unless found_file.nil?
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


