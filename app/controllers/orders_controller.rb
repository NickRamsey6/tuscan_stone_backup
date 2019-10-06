class OrdersController < ApplicationController

  def import
    Order.import(params[:file])
    redirect_to'/'
  end
end
