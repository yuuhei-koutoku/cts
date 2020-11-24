class TechnologiesController < ApplicationController
  before_action :set_technology, only: [:show, :edit, :update, :destroy]
  
  def index
    @technologies = Technology.order(id: :desc).page(params[:page]).per(10)
  end
  
  def show
    @comment = Comment.new
  end
  
  def new
    @technology = Technology.new
  end
  
  def create
    @technology = Technology.new(technology_params)
    if @technology.save
      flash[:success] = '正常に投稿されました'
      redirect_to root_path
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @technology.update(technology_params)
      flash[:success] = '正常に更新されました'
      redirect_to root_path
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @technology.destroy
    flash[:success] = '正常に削除されました'
    redirect_to root_path
  end
  
  private
    def set_technology
      @technology = Technology.find(params[:id])
    end
    
    def technology_params
      params.require(:technology).permit(:title, :content)
    end
end
