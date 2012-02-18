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

  describe "when not signed in" do
    it "should have a signin link" do
      visit root_path
      response.should have_selector('form input', :type => "submit",
                                      :value => "ВХОД")
      response.should have_selector('form input#session_email')
      response.should have_selector('.auth a', :href => signup_path)
    end
  end

  describe "when signed in" do

    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :page_email, :with => @user.email
      fill_in :page_password, :with => @user.password
      click_button :page_submit
    end

    it "should have a signout link" do
      visit root_path
      response.should have_selector("div.auth p", :content => "Имя:")
      response.should have_selector("form input", :type => "submit", 
                                    :value => "ВЫХОД")
    end

    it "should have a profile link" do
      visit root_path
      response.should have_selector("a", :href => edit_user_path(@user),
                                          :content => "профиль")
    end

  end

end
