class RecordsController < ApplicationController

  def index
    @records = Record.all
  end

  def create

    @record = Record.new(record_params)

    if @record.save
      render json: @record
    else
      render json: @record.errors, status: :unprocessable_entity
    end # saved conditional

  end #create method

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      render json: @record
    else
      render json: @record.errors, status: :unprocessable_entity
    end # conditional
  end #update method

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    head :no_content
  end #destroy

  private

  def record_params
    params.require(:record).permit(:title, :amount, :date)
  end

end #class
