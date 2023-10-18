# frozen_string_literal: true

require_relative 'aged_brie'
require_relative 'backstage_pass'
require_relative 'item'
require_relative 'adjustment'

class GildedRose < Item
  attr_accessor :item

  def update_quality
    quality = if sell_in.negative?
                     decrease_quality(item.quality, 2)
                   else
                     decrease_quality(item.quality, 1)
                   end
  end
end

