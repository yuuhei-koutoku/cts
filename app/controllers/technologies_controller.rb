class TechnologiesController < ApplicationController
  def index
    @technologies = Technology.all
  end

  def show
  end

  def new
    @technology = Technology.new
  end
  
  def create
    @technology = Technology.new(technology_params)
    if @technology.save
      redirect_to root_path, notice: '保存しました'
    else
      flash[:alert] = '保存できませんでした'
      render :new
    end
  end

  def edit
    @technology = Technology.find(params[:id])
  end
  
  def update
    @technology = Technology.find(params[:id])
    if @technology.update(technology_params)
      redirect_to root_path, notice: '保存しました'
    else
      flash[:alert] = '保存できませんでした'
      render :edit
    end
  end
  
  def destroy
    @technology = Technology.find(params[:id])
    @technology.destroy
    redirect_to root_path, notice: '削除しました'
  end
  
  private
    def technology_params
      params.require(:technology).permit(:title, :content, :company, :name)
    end
end
