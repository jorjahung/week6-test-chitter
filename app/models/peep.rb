class Peep
# This class corresponds to a table in the database
# We can use it to manipulate the data

	# this makes the instances of this class DataMapper resources
	include DataMapper::Resource

	has 1, :user, :through => Resource

	# this block describes what resources our model will have
	property :id, Serial #Serial means that it will be auto-incremented for every record
	property :message, Text
	property :created_at, DateTime
	property :poster_fullname, String
	property :poster_username, String

end

# Jorja, maybe not cheat? <%= user.first(:id => peep.user).full_name %> (<%= user.first(:id => peep.user).username %>)