# coding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :index, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy
  before_filter :zareg_user, :only => [:new, :create]

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
    @microposts = @user.microposts.paginate(:page => params[:page])
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

  def destroy
    user = User.find(params[:id])
    if current_user?(user)
      flash[:error] = "Вы не можете удалить себя"
    else
      user.destroy
      flash[:success] = "Пользователь удален"
    end
    redirect_to users_path
  end

  private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    def zareg_user
      redirect_to(root_path) if signed_in?
    end
end
