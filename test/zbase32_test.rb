# frozen_string_literal: true

require 'test_helper'

class ZBase32Test < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ZBase32::VERSION
  end

  def test_it_encodes
    assert_equal 'b4gkh5w', ::ZBase32.encode('test')
  end

  def test_it_decodes
    assert_equal 'test', ::ZBase32.decode('b4gkh5w')
  end
end
