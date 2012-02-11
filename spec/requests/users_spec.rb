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
          click_button
          response.should render_template('users/new')
          response.should have_selector("div#error_explanation")
        end.should_not change(User, :count)
      end

    end

    describe "success" do

      it "should make a new user" do
        lambda do
          visit signup_path
          fill_in "Имя",            :with => "Example User"
          fill_in "Email",          :with => "user@example.com"
          fill_in "Пароль",         :with => "foobar"
          fill_in "Подтверждение",  :with => "foobar"
          click_button
          response.should have_selector("div.flash.success",
                                          :content => "Добро пожаловать")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end

  end

end
