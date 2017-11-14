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
    assert_equal(50, app.checkout("A"))
    assert_equal(30, app.checkout("B"))
    assert_equal(20, app.checkout("C"))
    assert_equal(15, app.checkout("D"))
    assert_equal(40, app.checkout("E"))
  end

  def test_empty_basket_costs_nothing
    assert_equal(0, app.checkout(""))
  end

  def test_price_with_multiple_items
    assert_equal(80, app.checkout("AB"))
    assert_equal(65, app.checkout("AD"))
    assert_equal(130, app.checkout("AEE"))
  end

  def test_pricing_with_discounts
    assert_equal(180, app.checkout("AAAA"))
    assert_equal(90, app.checkout("BBBB"))
    assert_equal(145, app.checkout("AAAD"))
  end

  def test_returns_minus_one_for_invalid_input
    assert_equal(app.checkout("-"), -1)
  end

  def test_multiple_offers_for_an_item
    assert_equal(180, app.checkout("A" * 4))
    assert_equal(200, app.checkout("A" * 5))
    assert_equal(330, app.checkout("A" * 8))
    assert_equal(380, app.checkout("A" * 9))
  end

  def test_special_b_discount
    assert_equal(80, app.checkout("EEB"))
    assert_equal(110, app.checkout("EEBB"))
  end

end