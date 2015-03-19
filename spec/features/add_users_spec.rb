require 'rails_helper'

describe "the add a user process" do
  it "adds a new user" do
    visit new_user_path
    fill_in 'Email', :with => 'that@yahoo.com'
    fill_in 'Password', :with => 'hunter2'
    fill_in 'Password confirmation', :with => 'hunter2'
    click_on 'Sign Up'
    expect(page).to have_content 'Welcome'
  end

  it "logs in an existing user" do
    user = User.create(:email => "yeah@gmail.com", :password => "poop", :password_confirmation => "poop")
    visit log_in_path
    fill_in 'Email', :with => 'yeah@gmail.com'
    fill_in 'Password', :with => 'poop'
    click_on 'Log in'
    expect(page).to have_content 'logged'
  end

end
