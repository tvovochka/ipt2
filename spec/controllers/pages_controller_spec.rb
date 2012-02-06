# coding: utf-8
require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = "ГБОУ СПО СО Ирбитский политехникум"
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    it "should have the right title" do
      get 'home'
      response.should have_selector("title",
        :content => @base_title + " | Главная")
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
