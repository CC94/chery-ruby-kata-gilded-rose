# frozen_string_literal: true

require_relative 'aged_brie'
require_relative 'backstage_pass'
require_relative 'item'
require_relative 'adjustment'
require_relative 'item_factory'

class GildedRose
  def initialize(items)
    @items = items.map do |item|
      ItemFactory.call(item)
    end
  end

  def update_quality
    @items.each do |item|
      item.update_quality
    end
  end
end

