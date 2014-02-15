require 'spec_helper'

feature "User browses the list of links" do 
  before(:each) { Peep.create(:message => "Hello Chitter!")
                  Peep.create(:message => "Second message!")
                  Peep.create(:message => "Third peep!")
  }


  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("Hello Chitter!")
  end

end