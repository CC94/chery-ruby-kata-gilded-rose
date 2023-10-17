# frozen_string_literal: true

require 'gilded_rose'

class AgedBrie < GildedRose
  def initialize(item)
    super
    @items = item
  end

  def update_quality
    @items.each do |item|
      if @item.sell_in.negative?
        super.increase_quality(@item.quality, 2)
      else
        super.increase_quality(@item.quality, 1)
      end
    end
  end
end

item = Item.new('Aged Brie', 6, 34)
test = AgedBrie.new(item)
test.update_quality
pp item.to_s
