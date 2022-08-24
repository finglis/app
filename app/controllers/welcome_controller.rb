class WelcomeController < ApplicationController
  def index
    @customers = Customer.all
    @items = Item.all

    @total_sales = Sale.all.map(&:total_price).sum
    @total_sales_today = Sale.all.where(created_at: Date.today..Time.now.utc).map(&:total_price).sum
    @most_popular_item = LineItem.group(:item).order(sum_quantity: :desc).sum(:quantity).first&.first
  end
end
