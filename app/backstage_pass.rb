# frozen_string_literal: true

require 'item'
require 'adjustment'

class BackstagePasses < Item

  def update_quality
    if sell_in.negative?
      0
    elsif sell_in < 6
      super.increase_quality(quality, 3)
    elsif sell_in < 11
      super.increase_quality(quality, 2)
    else
      super.increase_quality(quality, 1)
    end
  end
end
