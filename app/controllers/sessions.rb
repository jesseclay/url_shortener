post '/logout' do
  session.clear
  redirect to('/')
end