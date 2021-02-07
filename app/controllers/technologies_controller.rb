class TechnologiesController < ApplicationController
  before_action :require_user_logged_in, only: %i[index show new edit]
  before_action :set_technology, only: %i[show edit update destroy]
  before_action :correct_user, only: %i[edit destroy]

  def index
    @technologies = Technology.includes([:user])
                              .includes([image_attachment: :blob])
                              .order(id: :desc)
                              .page(params[:page])
                              .per(5)
  end

  def show
    @comment = Comment.new
    @comments = @technology.comments.includes([:user])
  end

  def new
    @technology = Technology.new
  end

  def create
    @technology = Technology.new(technology_params)
    if @technology.save
      flash[:success] = '正常に投稿されました'
      redirect_to technologies_path
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end

  def edit; end

  def update
    if @technology.update(technology_params)
      flash[:success] = '正常に更新されました'
      redirect_to technologies_path
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @technology.destroy
    flash[:success] = '正常に削除されました'
    redirect_to technologies_path
  end

  private

  def set_technology
    @technology = Technology.find(params[:id])
  end

  def technology_params
    params.require(:technology).permit(:title, :content, :image).merge(user_id: current_user.id)
  end

  def correct_user
    @technology = current_user.technologies.find_by(id: params[:id])
    unless @technology
      redirect_back(fallback_location: root_path)
    end
  end
end
