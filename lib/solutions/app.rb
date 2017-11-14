EMPTY_BASKET = ("A".."Z").map{|l| [l, 0]}.to_h.freeze

class Basket
  def initialize(sku_string)
    new_items = sku_string.chars.group_by{ |sku| sku }
    raise ArgumentError, "Invalid skus" unless (new_items.keys - EMPTY_BASKET.keys).empty?
    @contents = EMPTY_BASKET.merge(new_items) do |key, existing, added|
      existing + added.count
    end
  end

  def empty?
    @contents == EMPTY_BASKET
  end

  def quantity_of(sku)
    @contents.fetch(sku)
  end

  def remove_items(sku_string)
    new_items = sku_string.chars.group_by{ |sku| sku }
    raise ArgumentError, "Invalid skus" unless (new_items.keys - EMPTY_BASKET.keys).empty?
    new_contents = @contents.merge(new_items) do |k, existing, new|
      value = existing - new.count
    end
    new_string = new_contents.reduce("") { |total, (k, v)| total + (k * v) }
    Basket.new(new_string)
  end
end

class Shop
  def initialize(basket)
    @total = 0
    @basket = basket
  end

  attr_reader :total

  def make_purchase(deal)
    @basket = @basket.remove_items(deal.items)
    @total += deal.price
    make_purchase(deal)
  rescue ArgumentError

  end
end

class Deal
  def initialize(items, price)
    @items = items
    @price = price
  end

  attr_reader :items, :price
end

class App

  def checkout(items)
    begin
      basket = Basket.new(items)
    rescue ArgumentError
      return -1
    end
    shop = Shop.new(basket)

    choice_deal_items = ["Z", "Y", "T", "S", "X"]
    c = choice_deal_items

    combinations = c.map { |x| c.map { |y| c.map { |z| [x, y, z].join } } }.flatten

    combinations.each do |combo|
      shop.make_purchase(Deal.new(combo, 45))
    end

    shop.make_purchase(Deal.new("VVV", 130))
    shop.make_purchase(Deal.new("VV", 90))
    shop.make_purchase(Deal.new("UUUU", 120))
    shop.make_purchase(Deal.new("RRRQ", 150))
    shop.make_purchase(Deal.new("QQQ", 80))
    shop.make_purchase(Deal.new("PPPPP", 200))
    shop.make_purchase(Deal.new("NNNM", 120))
    shop.make_purchase(Deal.new("KK", 120))
    shop.make_purchase(Deal.new("HHHHHHHHHH", 80))
    shop.make_purchase(Deal.new("HHHHH", 45))
    shop.make_purchase(Deal.new("FFF", 20))
    shop.make_purchase(Deal.new("EEB", 80))
    shop.make_purchase(Deal.new("BB", 45))
    shop.make_purchase(Deal.new("A" * 5, 200))
    shop.make_purchase(Deal.new("A" * 3, 130))
    shop.make_purchase(Deal.new("Z", 21))
    shop.make_purchase(Deal.new("Y", 20))
    shop.make_purchase(Deal.new("X", 17))
    shop.make_purchase(Deal.new("W", 20))
    shop.make_purchase(Deal.new("V", 50))
    shop.make_purchase(Deal.new("U", 40))
    shop.make_purchase(Deal.new("T", 20))
    shop.make_purchase(Deal.new("S", 20))
    shop.make_purchase(Deal.new("R", 50))
    shop.make_purchase(Deal.new("Q", 30))
    shop.make_purchase(Deal.new("P", 50))
    shop.make_purchase(Deal.new("O", 10))
    shop.make_purchase(Deal.new("N", 40))
    shop.make_purchase(Deal.new("M", 15))
    shop.make_purchase(Deal.new("L", 90))
    shop.make_purchase(Deal.new("K", 70))
    shop.make_purchase(Deal.new("J", 60))
    shop.make_purchase(Deal.new("I", 35))
    shop.make_purchase(Deal.new("H", 10))
    shop.make_purchase(Deal.new("G", 20))
    shop.make_purchase(Deal.new("F", 10))
    shop.make_purchase(Deal.new("E", 40))
    shop.make_purchase(Deal.new("D", 15))
    shop.make_purchase(Deal.new("C", 20))
    shop.make_purchase(Deal.new("B", 30))
    shop.make_purchase(Deal.new("A", 50))
    shop.total
  end
end