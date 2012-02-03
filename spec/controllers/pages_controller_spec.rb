# coding: utf-8
require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    it "should have the right title" do
      get 'home'
      response.should have_selector("title",
        :content => "ГБОУ СПО СО Ирбитский политехникум | Главная")
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
        :content => "ГБОУ СПО СО Ирбитский политехникум | Обратная связь")
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
        :content => "ГБОУ СПО СО Ирбитский политехникум | О нас")
    end
  end



end
