# coding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :index]
  before_filter :correct_user, :only => [:edit, :update]

  def index
    @title = "Все пользователи"
    @users = User.paginate(:page => params[:page])
  end

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

  def edit
    @title = "Редактирование профиля"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Данные профиля обновлены."
      redirect_to @user
    else
      @title = "Редактирование профиля"
      render 'edit'
    end
  end

  private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

end
