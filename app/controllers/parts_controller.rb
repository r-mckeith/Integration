class PartsController < ApplicationController
  require 'faker'
  before_action :set_part, only: %i[show edit update destroy]
  # layout :static, only: [:static]
  layout 'static', only: [:static]

  def index
    @parts = Part.all
  end

  def static
    @fake_images = []

    1.times do
      Faker::LoremFlickr.unique.clear
      @fake_images << "#{Faker::LoremFlickr.unique.image}/#{Faker::Name.first_name}"
    end
  end

  def show; end

  def new
    @part = Part.new
  end

  def create
    @part = Part.new(part_params)

    if @part.save
      redirect_to parts_path, notice: 'Your new part was saved'
    else
      flash.now[:error] = 'There was a problem saving your part'
      render :new
    end
  end

  def edit; end

  def update
    if @part.update(part_params)
      redirect_to part_path, notice: 'Your part was updated'
    else
      flash.now[:error] = 'There was a problem updating your part'
      render :edit
    end
  end

  def destroy
    @part.destroy
    redirect_to parts_path, status: :see_other, notice: 'Your part was deleted'
  end

  private

  def set_part
    @part = Part.find(params[:id])
  end

  def part_params
    params.require(:part).permit(:name, :role, :protective, :vulnerable, :description, :photo, :integrated)
  end
end
