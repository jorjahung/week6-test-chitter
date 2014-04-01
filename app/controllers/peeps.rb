get '/peeps/new' do
	if session[:user_id]
	erb :"peeps/new"
	else
	erb :"sessions/new"
	end
end

post '/peeps' do
	message = params['message']
	user = User.first(:username => current_user.username)
	poster_username = user.username
	poster_fullname = user.full_name
	peep = Peep.create(message: message, 
										 user: user, 
										 poster_username: poster_username, 
										 poster_fullname: poster_fullname)
	redirect to ('/')
end

get '/peeps/:username' do
	@user = User.first(:username => params[:username])
	@peeps = @user ? @user.peeps : []
	erb :index
end