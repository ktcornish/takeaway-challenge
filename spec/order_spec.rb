require 'order'

describe Order do

  let(:order)   { described_class.new(menu, basket) }
  let(:menu)    { double(:menu, display: nil, list: [hummus, pizza] ) }
  let(:basket)  { double(:basket, add: nil) }
  let(:hummus)  { { name: "Hummus", price: 2 } }
  let(:pizza)   { { name: "Pizza", price: 10 } }

  describe 'Viewing the Menu' do
    it 'should have a method which allows a user to view the menu' do
      expect(menu).to receive(:display)
      order.view_menu
    end
  end

  describe "Placing an Order" do
    it 'should have a method which allows the user to add an item to the order' do
      expect(basket).to receive(:add)
      order.add_item("Hummus")
    end

    it 'should enable a user to add more than 1 of an item if the user enters a quantity' do
      expect(basket).to receive(:add).exactly(3).times
      order.add_item("Pizza", 3)
    end
  end
end