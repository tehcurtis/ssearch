require 'minitest/autorun'
require 'spec_helper'
# require_relative '../lib/ssearch'

describe Ssearch do
  describe '.run' do
    it 'returns a list of files which contain the given string' do
      result = search_for 'stuff'

      result.must_match 'example_file.rb'
    end

    it 'returns a list of files that have the given string in their filenames' do
      result = search_for 'example_file'

      result.must_match 'example_file.rb'
    end

    it 'returns the lines the given text was found on' do
      result = search_for 'stuff'

      result.must_match 'example_file.rb'
    end
  end
end

