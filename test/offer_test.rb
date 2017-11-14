# noinspection RubyResolve,RubyResolve
require_relative 'test_helper'
require 'logging'

Logging.logger.root.appenders = Logging.appenders.stdout

class ClientTest < Minitest::Test
  # def test_two_bs_for_45
  #   item_b = Item.new("B")
  #   item_a = Item.new("A")
  #   offer = Offer.new(items: [item_b, item_b], offer_price: 45)
  #   assert_equal(false, offer.valid_for?([item_b]))
  #   assert_equal(false, offer.valid_for?([item_a]))
  #   assert_equal(false, offer.valid_for?([item_a, item_b]))
  #   assert_equal(true, offer.valid_for?([item_b, item_b]))
  #   assert_equal(true, offer.valid_for?([item_b, item_b, item_b]))
  # end
  #
  # def test_two_es_free_b
  #   item_b = Item.new("B")
  #   item_e = Item.new("E")
  #   item_a = Item.new("A")
  #   offer = Offer.new(items: [item_e, item_e, item_b], offer_price: item_e.unit_price * 2)
  #   assert(offer.valid_for?([Item.new("E"), Item.new("E"), item_b]))
  #   refute(offer.valid_for?([Item.new("E"), Item.new("E"), item_a]))
  # end
  #
  # def test_offer_has_price
  #   item_b = Item.new("B")
  #   item_a = Item.new("A")
  #   offer = Offer.new(items: [item_b, item_b], offer_price: 45)
  #   assert_equal(45, offer.offer_price)
  # end
  #
  # def test_debug_a_case
  #   basket = "AAAA"
  #   basket = basket.chars.map { |sku| puts sku; Item.new(sku) }
  #   offer = Offer.new(items: [Item.new("A"), Item.new("A"), Item.new("A")], offer_price: 130)
  #   puts offer.valid_for?(basket)
  #
  # end
end