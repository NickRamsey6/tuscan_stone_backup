require 'pg'
class NewCastleController < ApplicationController
  DB = PG.connect({:dbname => 'lisa1_development'})

  def index
    @nc_sales = ActiveRecord::Base.connection.execute("SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 1;").values[0][0]
    @nc_labor = ActiveRecord::Base.connection.execute("SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id) WHERE employees.store_id = 1;").values[0][0]
    @nc_cogs = ActiveRecord::Base.connection.execute("SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 1;").values[0][0]
    @nc_grossmargin = ActiveRecord::Base.connection.execute("SELECT (SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id)) -( (SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id)) + (SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 1))").values[0][0]
  end
end
