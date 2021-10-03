class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/bakeries' do
    "Hello World"
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do 
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: {baked_goods: {include: :bakery}})
  end

get '/baked_goods/by_price' do 
  bakedgoods = BakedGood.all.order(:price)
  bakedgoods.to_json
end

get '/baked_goods/most_expensive' do
  #and then return one which I cant figure out so whatever
  bakedgood = BakedGood.all.order(:price)

  bakedgood.to_json
end


end
