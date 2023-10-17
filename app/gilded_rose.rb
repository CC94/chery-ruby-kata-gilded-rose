# frozen_string_literal: true


class GildedRose
  def initialize(item)
    @item = item
  end

  def update_quality
    @item.quality = if @item.sell_in.negative?
                      decrease_quality(@item.quality, 2)
                    else
                      decrease_quality(@item.quality, 1)
                    end
  end

  def increase_quality(quality, increment_by)
    quality += increment_by
    [quality, 50].min
  end

  def decrease_quality(quality, decrement_by)
    quality -= decrement_by
    if quality.positive?
      quality
    else
      0
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
item = Item.new('Aged Brie', 0, 0)
item.sell_in -= 1
test = GildedRose.new(item)
test.update_quality
pp item.to_s
