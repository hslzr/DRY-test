require_relative 'config/application.rb'

get '/' do
  {message: "Well, hello there"}.to_json
end

post '/items' do
  params.to_json
end
