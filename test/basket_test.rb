# noinspection RubyResolve,RubyResolve
require_relative 'test_helper'
require 'logging'

Logging.logger.root.appenders = Logging.appenders.stdout

class ClientTest < Minitest::Test
  def test_new_basket_will_have_items
    basket = Basket.new("A")
    assert_equal(1, basket.quantity_of("A"))
    assert_equal(0, basket.quantity_of("B"))
  end

  def test_basket_will_not_be_initialized_with_invalid_sku_string
    assert_raises ArgumentError do
      basket = Basket.new("-")
    end
  end

  def test_can_remove_items
    basket = Basket.new("AAAB")
    basket = basket.remove_items("AA")
    assert_equal(1, basket.quantity_of("A"))
    assert_equal(1, basket.quantity_of("B"))
  end

  def test_errors_when_removing_items_not_there
    basket = Basket.new("AAAB")
    assert_raises do
      basket = basket.remove_items("AAAA")
    end
  end

  def test_identify_empty_basket
    basket = Basket.new("A")
    refute(basket.empty?)
    bakset = basket.remove_items("A")
    assert(bakset.empty?)
  end

end