class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to root_path
    end
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end

  def new_guest
    user = User.find_by(email: 'guest@email.jp')
    if user
      session[:user_id] = user.id
      flash[:success] = 'ゲストユーザーとしてログインしました。'
      redirect_to root_path
    else
      flash[:success] = 'ゲストユーザーとしてログイン失敗しました。'
      redirect_to root_path
    end
  end

  private

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
