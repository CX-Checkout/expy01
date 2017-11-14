# noinspection RubyResolve,RubyResolve
require_relative 'test_helper'
require 'logging'

Logging.logger.root.appenders = Logging.appenders.stdout

class ClientTest < Minitest::Test

  def setup
    @app = App.new
  end

  attr_reader :app

  def test_single_item_pricing
    assert_equal(app.checkout("A"), 50)
    assert_equal(app.checkout("B"), 30)
    assert_equal(app.checkout("C"), 20)
    assert_equal(app.checkout("D"), 15)
  end

  def test_empty_basket_costs_nothing
    assert_equal(app.checkout(""), 0)
  end

  def test_price_with_multiple_items
    assert_equal(app.checkout("AB"), 80)
    assert_equal(app.checkout("AD"), 65)
  end

  def test_pricing_with_discounts
    assert_equal(app.checkout("AAAA"), 180)
    assert_equal(app.checkout("BBBB"), 90)
    assert_equal(app.checkout("AAAD"), 145)
  end

  def test_returns_minus_one_for_invalid_input
    assert_equal(app.checkout("-"), -1)
  end

end