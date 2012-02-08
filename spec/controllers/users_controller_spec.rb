# coding: utf-8
require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'new'" do

    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title in new user page" do
      get 'new'
      response.should have_selector('title', :content => "Регистрация")
    end

  end

end
