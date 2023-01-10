class PartsController < ApplicationController
  before_action :set_part, only: %i[show edit update destroy]
  before_action :require_user!

  def index
    @parts = current_user.parts
  end

  def show; end

  def new
    @part = Part.new
    @part.user = current_user

    # Leslie's better way:
    # @part = current_user.parts.new
  end

  def create
    @part = Part.new(part_params)
    @part.user_id = current_user.id

    if @part.save
      redirect_to user_parts_path(current_user), notice: 'Your new part was saved'
    else
      flash.now[:error] = 'There was a problem saving your part'
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    if @part.update(part_params)
      redirect_to user_part_path, notice: 'Your part was updated'
    else
      flash.now[:error] = 'There was a problem updating your part'
      render :edit
    end
  end

  def destroy
    @part.destroy
    redirect_to user_parts_path(current_user), status: :see_other, notice: 'Your part was deleted'
  end

  private

  def set_part
    @part = Part.find(params[:id])
  end

  def part_params
    params.require(:part).permit(:name, :role, :protective, :vulnerable, :description, :photo, :integrated)
  end
end
