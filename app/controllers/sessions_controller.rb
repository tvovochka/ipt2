# coding: utf-8
class SessionsController < ApplicationController

  def new
    @title = "Вход пользователя"
  end

  def create
    user = User.authenticate(params[:session][:email],
                              params[:session][:password])
    if user.nil?
      flash.now[:error] = "Не верный email или пароль."
      @title = "Вход на сайт"
      render 'new'
    else
      sign_in user
      redirect_back_or user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
