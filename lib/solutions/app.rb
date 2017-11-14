PRICES = {
    "A" => 50,
    "B" => 30,
    "C" => 20,
    "D" => 15
}

OFFER = {
    "A" => [3, 130],
    "B" => [2, 45]
}

class App
  def checkout(basket)
    sku_list = basket.split("")
    return -1 unless sku_list.all? { |x| PRICES.keys.include?(x) }
    skus = sku_list.inject(Hash.new(0)) { |total, e| total[e] += 1; total }
    offer_price_for_a = (skus.fetch("A", 0) / 3) * 130
    offer_price_for_b = (skus.fetch("B", 0) / 2) * 45
    remaining_price_for_a = (skus.fetch("A", 0) % 3) * 50
    remaining_price_for_b = (skus.fetch("B", 0) % 2) * 30
    price_for_c = skus.fetch("C", 0) * 20
    price_for_d = skus.fetch("D", 0) * 15

    offer_price_for_a +
    offer_price_for_b +
    remaining_price_for_a +
    remaining_price_for_b +
    price_for_c +
    price_for_d

  end
end
