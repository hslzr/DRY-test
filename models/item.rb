class Item < ActiveRecord::Base
  FormSchema = Dry::Validation.Form do
    required(:name).filled
    required(:price).filled(:float?, gt?: 0)
  end
end
