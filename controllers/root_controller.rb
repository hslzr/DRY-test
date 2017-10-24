class RootController < Sinatra::Base
  get '/' do
    available_controllers = Dir.glob('./controllers/*.rb').flat_map do |fn|
      fn.scan(/(\w+)_controller/).flatten
    end
    status 201
    {available_controllers: available_controllers}.to_json
  end
end
