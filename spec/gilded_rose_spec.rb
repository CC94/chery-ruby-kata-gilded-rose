# frozen_string_literal: true

require './app/gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    context 'when item name is not aged brie or backstage passes or Sulfuras' do
      it 'when sell in date is current date and quality is 0' do
        items = [Item.new('foo', 0, 0)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 0
      end

      it 'when sell in date has passed and quality is positive' do
        items = [Item.new('foo', -1, 35)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 33
      end

      it 'when sell in date has not passed and quality is positive' do
        items = [Item.new('foo', 10, 35)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 34
      end

      it 'when sell in date is updated' do
        items = [Item.new('foo', 10, 50)]
        described_class.new(items).update_quality
        expect(items[0].sell_in).to eq 9
      end
    end

    context 'when item name is Sulfuras' do
      it 'when sell in date is current date and quality is 0' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 0)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 0
      end

      it 'when sell in date has passed and quality is positive' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', -1, 35)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 35
      end

      it 'when sell in date has not passed and quality is positive' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 35)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 35
      end

      it 'when sell in date is updated' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 50)]
        described_class.new(items).update_quality
        expect(items[0].sell_in).to eq 10
      end
    end

    context 'when item name contains back stage passes' do
      it 'when sell in date is current date and quality is 0' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 0)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 0
      end

      it 'when sell in date has passed and quality is positive' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', -1, 35)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 0
      end

      it 'when sell in date is not less than 10 days away from concert and quality is positive' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 12, 35)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 36
      end

      it 'when sell in date is not less than 10 days away from concert and quality is 50' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 12, 50)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 50
      end

      it 'when sell in date is less than 10 days away from concert and quality is positive' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 35)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 37
      end

      it 'when sell in date is less than 10 days away from concert and quality is 50' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 50)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 50
      end

      it 'when sell in date is not less than 5 days away from concert and quality is positive' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 35)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 38
      end

      it 'when sell in date is not less than 5 days away from concert and quality is 50' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 50)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 50
      end

      it 'when sell in date is updated' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 50)]
        described_class.new(items).update_quality
        expect(items[0].sell_in).to eq 9
      end
    end

    context 'when item name is Aged Brie' do
      it 'when sell in date is current date and quality is 0' do
        items = [Item.new('Aged Brie', 0, 0)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 2
      end

      it 'when sell in date has passed and quality is positive' do
        items = [Item.new('Aged Brie', -1, 35)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 37
      end

      it 'when sell in date has not passed and quality is positive' do
        items = [Item.new('Aged Brie', 10, 35)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 36
      end

      it 'when sell in date has not passed and quality is 50' do
        items = [Item.new('Aged Brie', 10, 50)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 50
      end

      it 'when sell in date has passed and quality is 50' do
        items = [Item.new('Aged Brie', -1, 50)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 50
      end

      it 'when sell in date is updated' do
        items = [Item.new('Aged Brie', 10, 50)]
        described_class.new(items).update_quality
        expect(items[0].sell_in).to eq 9
      end
    end

    context 'when item = Conjured' do 
      it 'when sell in date is current date and quality is 0' do
        items = [Item.new('Conjured', 0, 0)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 0
      end

      it 'when sell in date has passed and quality is positive' do
        items = [Item.new('Conjured', -1, 35)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 31
      end

      it 'when sell in date has not passed and quality is positive' do
        items = [Item.new('Conjured', 10, 35)]
        described_class.new(items).update_quality
        expect(items[0].quality).to eq 33
      end

      it 'when sell in date is updated' do
        items = [Item.new('Conjured', 10, 50)]
        described_class.new(items).update_quality
        expect(items[0].sell_in).to eq 9
      end
    end
  end

  it 'when sell in date is current date and quality is 0' do
    items = Item.new('foo', 0, 0)
    expect(items.to_s).to eq('foo, 0, 0')
  end
end
