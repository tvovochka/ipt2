# coding: utf-8
require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = "ГБОУ СПО СО Ирбитский политехникум"
  end

  describe "GET 'home'" do

    describe "when not signed in" do

      before(:each) do
        get :home
      end

      it "should be successful" do
        response.should be_success
      end

      it "should have the right title" do
        response.should have_selector("title",
          :content => @base_title + " | Главная")
      end
    end

    describe "when signed in" do

      before (:each) do
        @user = test_sign_in(Factory(:user))
        other_user = Factory(:user, :email => Factory.next(:email))
        other_user.follow!(@user)
      end

      it "should have the right follower/following counts" do
        get :feedback
        response.should have_selector("a", :href => following_user_path(@user),
                                           :content => "0")
        response.should have_selector("a", :href => followers_user_path(@user),
                                           :content => "1")
      end
    end
  end

  describe "GET 'feedback'" do
    it "should be successful" do
      get 'feedback'
      response.should be_success
    end
    it "should have the right title" do
      get 'feedback'
      response.should have_selector("title",
        :content => @base_title + " | Обратная связь")
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    it "should have the right title" do
      get 'about'
      response.should have_selector("title",
        :content => @base_title + " | О нас")
    end
  end



end
