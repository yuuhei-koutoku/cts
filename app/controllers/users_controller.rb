class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user.email, @user.password)
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def login(email, password)
    @user = User.find_by(email: email)
    if @user&.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      true
    else
      # ログイン失敗
      false
    end
  end
end
