# coding: utf-8

require 'spec_helper'

describe "Users" do

	describe "signup" do

		describe "failure" do

		  it "should not make a new user" do
        lambda do
          visit signup_path
          fill_in "Имя",            :with => ""
          fill_in "Email",          :with => ""
          fill_in "Пароль",         :with => ""
          fill_in "Подтверждение",  :with => ""
          click_button "Зарегистрироваться"
          response.should render_template('users/new')
          response.should have_selector("div#error_explanation")
        end.should_not change(User, :count)
      end

    end

    describe "success" do

      it "should make a new user" do
        lambda do
          visit signup_path
          fill_in :user_name,                 :with => "Example User"
          fill_in :user_email,                :with => "user@example.com"
          fill_in :user_password,             :with => "foobar"
          fill_in :user_password_confirmation,:with => "foobar"
          click_button "Зарегистрироваться"
          response.should have_selector("div.flash.success",
                                          :content => "Добро пожаловать")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end

  end

  describe "sign in/out" do

    describe "failure" do
      it "should not sign a user in" do
        visit signin_path
        fill_in "Email",   :with => ""
        fill_in "Пароль",  :with => ""
        click_button "Войти"
        response.should have_selector("div.flash.error", :content => "Не верный")
      end
    end

    describe "success" do
      it "should sign a user in and out" do
        user = Factory(:user)
        visit signin_path
        fill_in :session_email, :with => user.email
        fill_in :session_password, :with => user.password
        click_button "ВХОД"
        controller.should be_signed_in
        visit root_path
        click_button "ВЫХОД"
        controller.should_not be_signed_in
      end
    end

  end

end
