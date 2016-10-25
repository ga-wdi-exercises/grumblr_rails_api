class CommentsController < ApplicationController
  def index
    @grumble = Grumble.find(params[:grumble_id])
    @comments = @grumble.comments.order(:created_at)

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @comments }
    end
  end

  def show
    @grumble = Grumble.find(params[:grumble_id])
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @comment }
    end
  end

  def new
    @grumble = Grumble.find(params[:grumble_id])
    @comment = @grumble.comments.new
  end

  def create
    @grumble = Grumble.find(params[:grumble_id])
    @comment = @grumble.comments.new(comment_params)

    respond_to do |format|
      if @comment.save!
        format.html { redirect_to @grumble, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @grumble = Grumble.find(params[:grumble_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @grumble = Grumble.find(params[:grumble_id])
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update!(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render json: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @grumble = Grumble.find(params[:grumble_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @grumble
  end

  private

  def comment_params
    params.require(:comment).permit(:authorName, :content, :grumble_id)
  end
end
