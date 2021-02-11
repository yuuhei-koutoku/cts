class CommentsController < ApplicationController
  before_action :require_user_logged_in, only: [:edit]
  before_action :set_technology, only: %i[create edit update destroy]
  before_action :correct_user, only: %i[edit destroy]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = '正常に投稿されました'
      redirect_to technology_path(@technology)
    else
      @comments = @technology.comments.includes([:user])
      flash.now[:danger] = '投稿されませんでした'
      render 'technologies/show'
    end
  end

  def edit
    @comment = @technology.comments.find(params[:id])
  end

  def update
    @comment = @technology.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to technology_path(@technology)
      flash[:success] = '正常に更新されました'
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @comment = @technology.comments.find(params[:id])
    @comment.destroy
    redirect_to technology_path(@technology)
    flash[:success] = '正常に削除されました'
  end

  private

  def set_technology
    @technology = Technology.find(params[:technology_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :technology_id).merge(user_id: current_user.id)
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to technology_path(@technology)
    end
  end
end
