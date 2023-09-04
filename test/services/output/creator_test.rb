require "test_helper"
# require 'services/output/creator'

module Output
  class CreatorTest < ActiveSupport::TestCase
    test 'output file' do
      assert_equal true, Output::Creator.new(nil, 'test/output.sql').call
    end
  end
end
