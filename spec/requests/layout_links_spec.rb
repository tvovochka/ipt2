# coding: utf-8
require 'spec_helper'

describe "LayoutLinks" do
  
  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Главная")
  end

  it "should have a About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "О нас")
  end

  it "should have a Feedback page at '/feedback'" do
    get '/feedback'
    response.should have_selector('title', :content => "Обратная связь")
  end

  it "should have a SignUp page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Регистрация")
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "О нас"
    response.should have_selector('title', :content => "О нас")
    click_link "Обратная связь"
    response.should have_selector('title', :content => "Обратная связь")
    click_link "Главная"
    response.should have_selector('title', :content => "Главная")

  end

end
