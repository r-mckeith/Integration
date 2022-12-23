class PartsController < ApplicationController
  before_action :set_part, only: %i[show edit update destroy]

  def index
    @parts = Part.all
  end

  def show
  end

  def new
    @part = Part.new
  end

  def create
    @part = Part.new(part_params)

    if @part.save
      redirect_to parts_path, notice: 'Your new part was saved'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @part.update(part_params)
      redirect_to part_path, notice: 'Your part was updated'
    else
      render :edit
    end
  end

  def destroy
    @part.destroy
    redirect_to parts_path, notice: 'Your part was deleted'
  end

  private

  def set_part
    @part = Part.find(params[:id])
  end

  def part_params
    params.require(:part).permit(:name, :role, :protective, :vulnerable, :checkbox_value, :description, :photo, :integrated)
  end
end
