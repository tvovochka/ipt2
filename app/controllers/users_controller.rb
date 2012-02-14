# coding: utf-8
class UsersController < ApplicationController
  def new
    @user = User.new
    @title = "Регистрация"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Добро пожаловать на сайт Ирбитского политехникума!"
      redirect_to @user
    else
      @title = "Регистрация"
      @user.password = ""
      render 'new'
    end
  end

end
