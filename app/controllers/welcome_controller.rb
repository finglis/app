class WelcomeController < ApplicationController
  def index
    @customers = Customer.all
    @items = Item.all
  end
end
