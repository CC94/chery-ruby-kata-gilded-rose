# frozen_string_literal: true

require 'item'
require 'adjustment'

class BackstagePasses < Item

  def update_quality
    if sell_in.negative?
      0
    elsif sell_in < 6
      increase_quality(3)
    elsif sell_in < 11
      increase_quality(2)
    else
      increase_quality(1)
    end
  end
end
