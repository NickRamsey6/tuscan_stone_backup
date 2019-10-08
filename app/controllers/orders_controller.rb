class OrdersController < ApplicationController

  def index
    @orders = Order.all
    render :index
  end

  def new
    @order = Order.new
    render :new
  end

  def create
    @order = Order.create(order_params)
    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  def edit
    @order = Oder.find(params[:id])
    render :edit
  end

  def show
    @order = Order.find(params[:id])
    render :show
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to orders_path
    else
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destory
    redirect_to orders_path
  end

  def import
    Order.import(params[:file])
    redirect_to'/'
  end

  private
  def order_params
    params.require(:order).permit(:store_id, :product_id, :day)
  end
end
