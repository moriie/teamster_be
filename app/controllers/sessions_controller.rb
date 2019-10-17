class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by(email: u_params[:email])
    if @user && @user.authenticate(u_params[:password]) 
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def auth_check
    @user = current_user
    if @user
      render json: {user: @user}
    else
      render json: {error: 'Please login.'}
    end
  end

  def destroy
    # session[:user_id] = nil
  end

  private

  def u_params
      params.require(:user).permit(:email, :password)
  end

end
