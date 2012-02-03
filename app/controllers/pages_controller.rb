# coding: utf-8
class PagesController < ApplicationController
  def home
    @title = "Главная"
  end

  def feedback
    @title = "Обратная связь"
  end

  def about
    @title = "О нас"
  end

end
