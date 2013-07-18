helpers do
  # This will return the current user, if they exist
  # Replace with code that works with your application
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  # Returns true if current_user exists, false otherwise
  def logged_in?
    !current_user.nil?
  end
end


post '/create_user' do
  user = User.new(user_name: params[:user_name],
                  email: params[:email], 
                  first_name: params[:first_name], 
                  last_name: params[:last_name] )
  user.password = params[:password]

  if user.save
    @user_success = true 
  else
    @user_success = false
  end

  erb :index
end

post '/login' do
  user = User.authenticate(params[:email], params[:password])

  if user
    session[:user_id] = user.id
    @user_login_success = true
  else
    session[:user_id] = nil
    @user_login_success = false
  end

  erb :index
end


get '/users/:id' do
  user = User.find_by_id(params[:id])
  @user_name = user.user_name
  @all_urls = user.urls
  if user == current_user
    # @clicks = user.urls.clicks
    @full_name = user.first_name + " " + user.last_name
  end
  erb :profile_page
end
