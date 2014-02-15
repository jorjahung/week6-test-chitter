require 'spec_helper'
require_relative 'helpers/helper'

include SessionHelpers

feature "User adds a new peep" do

  scenario "should have timestamp" do
  	sign_up
    expect(Peep.count).to eq(0)
    visit '/peeps/new'
    add_peep("My first peep!")
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.message).to eq("My first peep!")
    expect(peep.timestamp).to include("2014")
  end


end