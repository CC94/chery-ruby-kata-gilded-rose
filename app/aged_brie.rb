# frozen_string_literal: true

$LOAD_PATH << './app'
require 'item'
require 'adjustment'

class AgedBrie < Item
  include Adjustment

  def update_quality
    if sell_in.negative?
      increase_quality(quality, 2)
    else
      increase_quality(quality, 1)
    end
  end
end
