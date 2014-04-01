module SessionHelpers

	def add_peep(message)    
    fill_in "message", :with => message
    click_button 'Add peep'
  end

	def sign_in(email, password)
		visit "/sessions/new"
		fill_in "email", :with => email
		fill_in "password", :with => password
		click_button "Sign in"
	end

	def sign_up(email = "ecomba@makersacademy.com",
							username = "ecomba",
							full_name = "Enrique Comba Riepenhausen",
  						password = "s3cr3t",
              password_confirmation = "s3cr3t")
	  visit '/users/new'
	  fill_in :email, :with => email
	  fill_in :password, :with => password
	  fill_in :username, :with => username
	  fill_in :full_name, :with => full_name
	  fill_in :password_confirmation, :with => password_confirmation
	  click_button "Sign up"
	end
	

end