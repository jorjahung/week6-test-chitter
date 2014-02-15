require 'spec_helper'

feature "User browses the list of links" do 
  before(:each) { Peep.create(:message => "Hello Chitter!", 
                              :timestamp => Time.now.strftime("%F %R"))
                  Peep.create(:message => "Second message!", 
                              :timestamp => Time.now.strftime("%F %R"))
                  Peep.create(:message => "Third peep!", 
                              :timestamp => Time.now.strftime("%F %R"))
  }


  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("Hello Chitter!")
  end

end