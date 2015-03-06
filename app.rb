require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }

get('/') do

  erb(:index)
end


get('/brands') do
  @brands = Brand.all().order('name')
  erb(:brands)
end

post('/brands') do
  name = params['brand_name']
  Brand.create({:name => name})
  redirect back
end

patch('/brands') do
  brand_id = params['brand_id']
  brand = Brand.find(brand_id)
  new_name = params['new_name']
  brand.update({:name => new_name})
  redirect back
end

delete('/brands') do
  brand_id = params['brand_id']
  brand = Brand.find(brand_id)
  brand.stores.destroy
  brand.destroy
  redirect back
end



get('/brand/:id') do
  brand_id = params['id']
  @brand = Brand.find(brand_id)
  @stores = Store.all().order('name')
  erb(:brand)
end

patch('/brand/:id') do
  brand_id = params['id']
  brand = Brand.find(brand_id)
  if params['store_ids'] != nil
    store_ids = params['store_ids']
    store_ids.each do |v_id|
      store = Store.find(v_id)
      brand.stores << store
    end
  end
  if params['new_store_name'] != ""
    name = params['new_store_name']
    store = Store.create({:name => name})
    brand.stores << store
  end
  redirect back
end

delete('/brand/:id') do
  brand_id = params['id']
  brand = Brand.find(brand_id)
  store_ids = params['store_ids']
  store_ids.each do |v_id|
    store = Store.find(v_id)
    brand.stores.delete(store)
  end
  redirect back
end



get('/stores') do
  @stores = Store.all.order('name')
  erb(:stores)
end

post('/stores') do
  name = params['store_name']
  Store.create({:name => name})
  redirect back
end

patch('/stores') do
  store_id = params['store_id']
  store = Store.find(store_id)
  new_name = params['new_name']
  store.update({:name => new_name})
  redirect back
end

delete('/stores') do
  store_id = params['store_id']
  store = Store.find(store_id)
  store.brands.destroy
  store.destroy
  redirect back
end
