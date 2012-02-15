# coding: utf-8
module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "ГБОУ СПО СО Ирбитский политехникум"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
    image_tag("logo.png", :alt => "Логотип Ирбитского политехникума", 
      :class => "logo")
  end

  def user_icon
    image_tag("user_icon.png", :alt => "Add User", 
      :title => "Добавить пользователя")
  end

  def artgrand
    out = image_tag("artgrand_logo.png", :alt => "", :class => 'artgrand_logo')
    out << "<p>Design by <br /> <span>ARTGRAND</span></p>" 
  end

end
