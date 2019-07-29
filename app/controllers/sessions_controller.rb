class SessionsController < ApplicationController
  def new
  end
  
  def create
    #[:session][:email]は1塊として、DBから引き出し、userに格納
    user = User.find_by(email: params[:session][:email].downcase)
    
    #userはpasswordも持っているため、authenticateで同じが見る
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      #helperで定義したloginを使用
      log_in user
      redirect_to user
    else
      # エラーメッセージを作成する
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
