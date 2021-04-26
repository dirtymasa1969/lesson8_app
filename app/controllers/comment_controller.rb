class CommentController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @comment = Comment.new
  end

  def index
    @comment = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
    @user = @comment.user
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to tweets_path
  end

  def edit
  end
  
  def destroy
  end
end
