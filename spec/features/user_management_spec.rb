require 'spec_helper'
require_relative 'helpers/helper'

include SessionHelpers

feature "User signs up" do

  scenario "when being logged out" do
  	lambda {sign_up}.should change(User, :count).by(1)
  	expect(page).to have_content("Welcome, ecomba")
  	expect(User.first.email).to eq("ecomba@makersacademy.com")
  end

  scenario "with a password that doesn't match" do
    lambda {sign_up("ecomba@makersacademy.com", "ecomba", "Enriqure Comba", "pass", "wrong")}.should change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Passwords don't match")
  end

  scenario "with an email that is already registered" do    
    lambda { sign_up }.should change(User, :count).by(1)
    lambda { sign_up }.should change(User, :count).by(0)
    expect(page).to have_content("Email is already taken")
  end

feature "User signs in" do

  before(:each) do
    User.create(:email => "test@test.com",
                :username => "ecomba",
                :full_name => "Enrique C",
                :password => "test",
                :password_confirmation => "test")
  end

  scenario "with correct credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, ecomba")
    sign_in("test@test.com", "test")
    expect(page).to have_content("Welcome, ecomba")
  end

  scenario "with incorrect credentials" do
    visit "/"
    expect(page).not_to have_content("Welcome, ecomba")
    sign_in("test@test.com", "wrong")
    expect(page).to have_content("The email or password is incorrect")
  end

end
feature "User signs out" do 
  before(:each) do
    User.create(:email => "test@test.com",
                :username => "ecomba",
                :full_name => "Enrique C",
                :password => "test",
                :password_confirmation => "test")
  end

  scenario 'while being signed in' do
    sign_in('test@test.com', 'test')
    click_button "Sign out"
    expect(page).to have_content("Good bye!")
    expect(page).not_to have_content("Welcome, test@test.com")
  end

end

end