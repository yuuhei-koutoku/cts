class CommentsController < ApplicationController
  before_action :set_technology, only: [:create, :edit, :update, :destroy]
  
  def create
    @comment = Comment.new(comment_params)
    #binding.pry
    if @comment.save
      flash[:success] = '正常に投稿されました'
      redirect_to technology_path(@technology)
    else
      #binding.pry
      flash.now[:danger] = '投稿されませんでした'
      render 'technologies/show'
      #redirect_to technology_path(@technology)
    end
  end
  
  def edit
    #binding.pry
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
      params.require(:comment).permit(:content, :technology_id,)
    end
end
