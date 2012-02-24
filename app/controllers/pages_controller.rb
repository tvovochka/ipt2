# coding: utf-8
class PagesController < ApplicationController
  def home
    @title = "Главная"
  end

  def feedback
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
    @title = "Обратная связь"
  end

  def about
    @title = "О нас"
  end

end
