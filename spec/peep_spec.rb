require 'spec_helper'

describe Peep do
 context "Trying out the first peep" do

		it 'should be created and then retrieved from the db' do
			expect(Peep.count).to eq(0)
			Peep.create(:message => "Hello Chitter!")
			expect(Peep.count).to eq(1)
			peep = Peep.first
			expect(peep.message).to eq("Hello Chitter!")
			expect(peep.created_at.to_s).to include("2014")
			peep.destroy
			expect(Peep.count).to eq(0)
		end
	end
end
