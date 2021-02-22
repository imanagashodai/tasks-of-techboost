class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(session_email) #課題箇所①
    if user && user.authenticate(session_password[:password]) #課題箇所②
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  #課題箇所③始まり
  def session_email
    params.require(:session).permit(:email)
  end
  
  def session_password
    params.require(:session).permit(:password)
  end
  # 課題箇所③終わり

end