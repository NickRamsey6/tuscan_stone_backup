require 'pg'
class LandingController < ApplicationController
  DB = PG.connect({:dbname => 'lisa1_development'})
  def index
    @todays_sales = ActiveRecord::Base.connection.execute("SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id);").values[0][0]
    @todays_labor = ActiveRecord::Base.connection.execute("SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id);").values[0][0]
    @todays_cogs = ActiveRecord::Base.connection.execute("SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id);").values[0][0]
    @todays_grossmargin = ActiveRecord::Base.connection.execute("SELECT (SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id)) -( (SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id)) + (SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id)))").values[0][0]
    render :index
  end
end
