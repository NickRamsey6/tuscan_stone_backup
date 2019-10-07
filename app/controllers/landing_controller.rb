require 'pg'
class LandingController < ApplicationController
  DB = PG.connect({:dbname => 'lisa1_development'})
  def index
    @todays_sales = ActiveRecord::Base.connection.execute("SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id);").values[0][0]
    render :index
  end
end
