class GrumblesController < ApplicationController
  def index
    @grumbles = Grumble.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @grumbles }
    end
  end

  def show
    @grumble = Grumble.find(params[:id])

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @grumble }
    end
  end

  def new
    @grumble = Grumble.new
  end

  def create
    @grumble = Grumble.new(grumble_params)

    respond_to do |format|
      if @grumble.save!
        format.html { redirect_to @grumble, notice: 'Grumble was successfully created.' }
        format.json { render json: @grumble, status: :created, location: @grumble }
      else
        format.html { render :new }
        format.json { render json: @grumble.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @grumble = Grumble.find(params[:id])
  end

  def update
    @grumble = Grumble.find(params[:id])

    respond_to do |format|
      if @grumble.update!(grumble_params)
        format.html { redirect_to @grumble, notice: 'Grumble was successfully updated.' }
        format.json { render json: @grumble, location: @grumble }
      else
        format.html { render :new }
        format.json { render json: @grumble.errors, status: :unprocessable_entity }
      end
    end
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
