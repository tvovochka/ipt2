# coding: utf-8
class MicropostsController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_user, :only => :destroy

  def create
    @micropost  = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Сообщение создано!"
      redirect_to feedback_path
    else
      @feed_items = []
      render 'pages/feedback'
    end
  end

  def destroy
    @micropost.destroy
    redirect_back_or root_path
  end

  private

    def authorized_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_path if @micropost.nil?
    end
end