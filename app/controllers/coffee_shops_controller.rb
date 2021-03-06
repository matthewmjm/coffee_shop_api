class CoffeeShopsController < ApplicationController
  before_action :find_coffee_shop_by_id, only: [:show, :update, :destroy]

  def index
    @coffee_shops = CoffeeShop.all 
    render json: @coffee_shops, include: :coffees
  end

  def show
    render json: @coffee_shop, include: :coffees
  end

  def create
    @coffee_shop = CoffeeShop.create(
      name: params[:name],
      location: params[:location],
      capacity: params[:capacity]
    )
    render json: @coffee_shop
  end
    
  def update
    @coffee_shop.update(
      name: params[:name],
      location: params[:location],
      capacity: params[:capacity]
    )
    render json: @coffee_shop, include: :coffees
  end

  def destroy
    @coffee_shop.destroy 
    render json: {message: "Successfully destroyed the coffee shop"}
  end

  private

  def find_coffee_shop_by_id
    @coffee_shop = CoffeeShop.find(params[:id])
  end

end
