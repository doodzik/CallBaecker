require 'minitest/autorun'
require 'CallBaecker'

module Setup2
  def test
    @__last_args
  end
end

class Setup
  def self.test
    @__last_args
  end

  include Setup2
  include CallBaecker

  def self.last_args_test(value1, value2)
    test
  end

  def last_args_test(value1, value2)
    test
  end

  def self.break_before
    throw :CallBaeckerDone, "brokeBefore"
    "test"
  end
  def break_before
    throw :CallBaeckerDone, "brokeBefore"
    "test"
  end
end

class CallBaeckerTest < Minitest::Test
  def test_instance_method
    assert_equal ['value', 'value'], Setup.new.last_args_test('value', 'value')
  end

  def test_class_method
    assert_equal ['value', 'value'], Setup.last_args_test('value', 'value')
  end

  def test_early_termination_from_function
    assert_equal "brokeBefore", Setup.break_before
    assert_equal "brokeBefore", Setup.new.break_before
  end
end
