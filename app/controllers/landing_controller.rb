require 'pg'
class LandingController < ApplicationController
  DB = PG.connect({:dbname => 'lisa1_development'})
  def index
    @todays_sales = ActiveRecord::Base.connection.execute("SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id);").values[0][0].to_i
    @todays_labor = ActiveRecord::Base.connection.execute("SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id);").values[0][0].to_i
    @todays_cogs = ActiveRecord::Base.connection.execute("SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id);").values[0][0].to_i
    @todays_grossmargin = ActiveRecord::Base.connection.execute("SELECT (SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id)) -( (SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id)) + (SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id)))").values[0][0].to_i
    @nc_sales = ActiveRecord::Base.connection.execute("SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 1;").values[0][0].to_i
    @nc_labor = ActiveRecord::Base.connection.execute("SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id) WHERE employees.store_id = 1;").values[0][0].to_i
    @nc_cogs = ActiveRecord::Base.connection.execute("SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 1;").values[0][0].to_i
    @nc_grossmargin = ActiveRecord::Base.connection.execute("SELECT (SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id=1) -( (SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id) WHERE employees.store_id=1) + (SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 1))").values[0][0].to_i
    @mi_sales = ActiveRecord::Base.connection.execute("SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 2;").values[0][0].to_i
    @mi_labor = ActiveRecord::Base.connection.execute("SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id) WHERE employees.store_id = 2;").values[0][0].to_i
    @mi_cogs = ActiveRecord::Base.connection.execute("SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 2;").values[0][0].to_i
    @mi_grossmargin = ActiveRecord::Base.connection.execute("SELECT (SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id =2) - ( (SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id) WHERE employees.store_id=2) + (SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 2))").values[0][0].to_i
    @tm_sales = ActiveRecord::Base.connection.execute("SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 3;").values[0][0].to_i
    @tm_labor = ActiveRecord::Base.connection.execute("SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id) WHERE employees.store_id = 3;").values[0][0].to_i
    @tm_cogs = ActiveRecord::Base.connection.execute("SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 3;").values[0][0].to_i
    @tm_grossmargin = ActiveRecord::Base.connection.execute("SELECT (SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id=3) -( (SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id) WHERE employees.store_id=3) + (SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 3))").values[0][0].to_i
    @is_sales = ActiveRecord::Base.connection.execute("SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 4;").values[0][0].to_i
    @is_labor = ActiveRecord::Base.connection.execute("SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id) WHERE employees.store_id = 4;").values[0][0].to_i
    @is_cogs = ActiveRecord::Base.connection.execute("SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 4;").values[0][0].to_i
    @is_grossmargin = ActiveRecord::Base.connection.execute("SELECT (SELECT SUM(price) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id=4) -( (SELECT SUM(wage*hours) FROM employees JOIN timecards ON(timecards.employee_id = employees.id) WHERE employees.store_id=4) + (SELECT SUM(cost) FROM products JOIN orders ON (orders.product_id = products.id) WHERE store_id = 4))").values[0][0].to_i
    @most_orders = ActiveRecord::Base.connection.execute("SELECT products.name, count(orders.id) as orders_count FROM products INNER JOIN orders ON orders.product_id = products.id GROUP BY products.id ORDER BY orders_count DESC LIMIT 3").values()
    render :index
  end
end
