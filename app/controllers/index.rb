get '/' do
  @all_urls = Url.all

  erb :index
end

post '/urls' do
  new_url = Url.create(full_url: params[:full_url])
  @all_urls = Url.all
  if new_url.invalid?
    @bad_url = true
  else
    @short = new_url.id
  end
  erb :index
end

get '/:id' do
  puts "HELLO REDIRECT METHOD!"
  url = Url.find(params[:id])
  url.update_attribute(:clicks, url.clicks + 1)
  redirect url.full_url
end
