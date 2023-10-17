# frozen_string_literal: true

class BackstagePasses < GildedRose
  def initialize(item)
    super
    @item = item
  end

  def update_quality
    if @item.sell_in.negative?
      0
    elsif @item.sell_in < 6
      super.increase_quality(@item.quality, 3)
    elsif @item.sell_in < 11
      super.increase_quality(@item.quality, 2)
    else
      super.increase_quality(@item.quality, 1)
    end
  end
end
