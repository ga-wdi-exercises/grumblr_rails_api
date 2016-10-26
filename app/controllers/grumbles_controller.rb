class GrumblesController < ApplicationController
  def index
    @grumbles = Grumble.all.order(:created_at)
  end

  def show
    @grumble = Grumble.find(params[:id])
  end

  def new
    @grumble = Grumble.new
  end

  def create
    @grumble = Grumble.create(grumble_params)
  end

  def edit
    @grumble = Grumble.find(params[:id])
  end

  def update
    @grumble = Grumble.find(params[:id])
    @grumble.update(grumble_params)
    redirect_to @grumble
  end

  def destroy
    @grumble = Grumble.find(params[:id])
    @grumble.destroy
    redirect_to grumbles_path
  end

  private

  def grumble_params
    params.require(:grumble).permit(:authorName, :content, :title, :photoUrl)
  end
end
