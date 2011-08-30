require 'minitest/autorun'
require 'spec_helper'
# require_relative '../lib/ssearch'

describe Ssearch do
  describe '.run' do
    it 'returns a list of files which contain the given string' do
      search_for 'stuff' do |result|
        result.must_match 'example_file.rb'
      end
    end

    it 'returns a list of files that have the given string in their filenames' do
      search_for 'example_file' do |result|
        result.must_match 'example_file.rb'
      end
    end

    it 'returns the lines the given text was found on' do
      search_for 'stuff' do |result|
        result.must_match 'example_file.rb'
      end
    end

    it 'returns matching files found in sub-folders' do
      search_for 'a folder' do |result|
        result.must_match 'another_file.txt'
      end
    end
  end
end

