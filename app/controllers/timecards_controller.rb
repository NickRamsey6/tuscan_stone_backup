class TimecardsController < ApplicationController

  def index
    @timecards = Timecard.all
    render :index
  end

  def new
    @timecard = Timecard.new
    render :new
  end

  def create
    @timecard = Timecard.create(timecard_params)
    if @timecard.save
      redirect_to timecards_path
    else
      render :new
    end
  end

  def edit
    @timecard = Timecard.find(params[:id])
    render :edit
  end

  def show
    @timecard = Timecard.find(params[:id])
    render :show
  end

  def update
    @timecard = Timecard.find(params[:id])
    if @timecard.update(timecard_params)
      redirect_to timecards_path
    else
      render :edit
    end
  end

  def destroy
    @timecard = Timecard.find(params[:id])
    @timecard.destroy
    redirect_to timecards_path
  end

  def import
    Timecard.import(params[:file])
    redirect_to'/'
  end

  private
  def timecard_params
    params.require(:timecard).permit(:day, :store_id, :employee_id, :hours, :wage)
  end
end
