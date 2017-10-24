class ItemsController < Sinatra::Base
  get '/' do
    items = Item.all
    json items
  end

  post '/' do
    raw_input_validation = Item::FormSchema.call(params)

    if raw_input_validation.success?
      data_validation = Item::Schema.call(raw_input_validation.output)
      if data_validation.success?
        item = Item.create(data_validation.output)
        status 201
        body item.to_json
      else
        status 422
        json data_validation.errors
      end
    else
      status 422
      json raw_input_validation.errors
    end
      json item
  end

  get '/:id' do
    if params[:id].match?(/\d+/)
      item = Item.find_by(id: params[:id]) || halt(404)
      status 200
      json item
    else
      status 400
      {message: "..."}.to_json
    end
  end
end
