require 'pg'
class LandingController < ApplicationController
  DB = PG.connect({:dbname => 'lisa1_development'})
  def index
    @todays_sales = ActiveRecord::Base.connection.execute("SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id);").values[0][0]
    @todays_labor = ActiveRecord::Base.connection.execute("SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id);").values[0][0]
    @todays_cogs = ActiveRecord::Base.connection.execute("SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id);").values[0][0]
    @todays_grossmargin = ActiveRecord::Base.connection.execute("SELECT (SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id)) -( (SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id)) + (SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id)))").values[0][0]
    @nc_sales = ActiveRecord::Base.connection.execute("SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 1;").values[0][0]
    @nc_labor = ActiveRecord::Base.connection.execute("SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id) WHERE employees.store_id = 1;").values[0][0]
    @nc_cogs = ActiveRecord::Base.connection.execute("SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 1;").values[0][0]
    @nc_grossmargin = ActiveRecord::Base.connection.execute("SELECT (SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id)) -( (SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id)) + (SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 1))").values[0][0]
    @mi_sales = ActiveRecord::Base.connection.execute("SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 2;").values[0][0]
    @mi_labor = ActiveRecord::Base.connection.execute("SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id) WHERE employees.store_id = 2;").values[0][0]
    @mi_cogs = ActiveRecord::Base.connection.execute("SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 2;").values[0][0]
    @mi_grossmargin = ActiveRecord::Base.connection.execute("SELECT (SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id)) -( (SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id)) + (SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 2))").values[0][0]
    @tm_sales = ActiveRecord::Base.connection.execute("SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 3;").values[0][0]
    @tm_labor = ActiveRecord::Base.connection.execute("SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id) WHERE employees.store_id = 3;").values[0][0]
    @tm_cogs = ActiveRecord::Base.connection.execute("SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 3;").values[0][0]
    @tm_grossmargin = ActiveRecord::Base.connection.execute("SELECT (SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id)) -( (SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id)) + (SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 3))").values[0][0]
    @is_sales = ActiveRecord::Base.connection.execute("SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 4;").values[0][0]
    @is_labor = ActiveRecord::Base.connection.execute("SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id) WHERE employees.store_id = 4;").values[0][0]
    @is_cogs = ActiveRecord::Base.connection.execute("SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 4;").values[0][0]
    @is_grossmargin = ActiveRecord::Base.connection.execute("SELECT (SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id)) -( (SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id)) + (SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 4))").values[0][0]
    render :index
  end
end
