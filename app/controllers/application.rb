get '/' do
	@peeps = Peep.all
	@users = User.all

	erb :index
end