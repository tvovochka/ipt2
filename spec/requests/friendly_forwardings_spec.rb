# coding: utf-8
require 'spec_helper'

describe "FriendlyForwardings" do
  
  it "should forward to the requested page after signin" do
    user = Factory(:user)
    visit edit_user_path(user)
    # Тест автоматически следует перенаправить signin страницу.
    fill_in "Email", :with => user.email
    fill_in "Пароль", :with => user.password
    click_button :page_submit
    # The test follows the redirect again, this time to users/edit.
    # response.should have_selector('title', :content => "Редактирование")
    response.should render_template('users/edit')
  end
end
