class CardsController < ApplicationController
  def show
    @order = current_order
    puts "@order: #{@order.inspect}"
    @order_items = @order.order_items
    puts "@order_items: #{@order_items.inspect}"
  end
end
