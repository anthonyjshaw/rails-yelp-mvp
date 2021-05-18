# frozen_string_literal: true

class RestaurantsController < ApplicationController
  before_action :set_restaurants, only: %i[show update destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show
    @rating = '<i class="far fa-star"></i>'
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def search
    @results = Restaurant.where('name LIKE ?', "%#{params[:name]}%")
    @results = if params[:name].empty?
                 @message = "You didn't enter anything!"
                 @count = 0
                 []
               elsif @results.count.zero?
                 @message = "No results for #{params[:name]}."
                 []
               else
                 @count = @results.count
                 @message = "Here are all the results for #{params[:name]}:"
                 Restaurant.where('name LIKE ?', "%#{params[:name]}%")
               end
  end


  private

  def set_restaurants
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
