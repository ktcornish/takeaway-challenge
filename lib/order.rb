require_relative 'menu'
require_relative 'basket'

class Order

  attr_reader :basket

  def initialize(menu = Menu.new, basket = Basket.new)
    @menu = menu
    @basket = basket
  end

  def view_menu
    @menu.display
  end

  def add_item(name, quantity = 1)
    quantity.times do
      @menu.list.each { |item| @basket.add(item) if item[:name] == name }
    end
  end

  def order_complete
    basket.return_order
    confirmed?
  end

  def confirmed?
    puts 'please press enter to confirm order'
    answer = gets.chomp
    complete if answer == ""
  end

  def complete
    "yay"
  end

end
