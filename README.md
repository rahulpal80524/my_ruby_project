# my_ruby_project
Create Ruby on rails project

1. rails new myapp --database=postgresql

2. # Gemfile
gem 'devise'
gem 'will_paginate', '~> 3.3'
gem 'faker'
gem 'factory_bot_rails'
gem 'rspec-rails'


3. bundle install


4. rails generate devise:install
    rails generate devise:views
     rails active_storage:install (if need)

5. rails generate devise User

    rails g rspec:install (if need)

    rails db:create    
    rails db:migrate

6. rails generate scaffold Post title:string content:text user:references   (or)
    rails generate scaffold Product name:string description:text price:float 
user:references


rails db:migrate

/home/spr05/work/myproject/db/seeds.rb (add this code in file)
require 'faker'

users = []

# Create 10 users
10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
  users << user
end

# Loop through each user and create 15 products for each
users.each do |user|
  15.times do
    Product.create(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph,
      price: Faker::Commerce.price(range: 0..100.0, as_string: true),
      user_id: user.id
    )
  end
end




rails db:seed




7. rails db:create db:migrate (if and problem add username and password in database.yml file)


8. default: &default
 adapter: postgresql
 encoding: unicode
 host: localhost
 username: postgres2
 password: postgres2
 # For details on connection pooling, see Rails configuration guide
 # https://guides.rubyonrails.org/configuring.html#database-pooling
 pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
 timeout: 5000
 min_messages: warning





9. rails generate rspec:install






/home/spr05/work/my_ruby_project/spec/models/user_spec.rb

require 'rails_helper'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "is not valid without an email" do
    user = FactoryBot.build(:user, email: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without a password" do
    user = FactoryBot.build(:user, password: nil)
    expect(user).to_not be_valid
  end
end


/home/spr05/work/my_ruby_project/spec/models/product_spec.rb

require 'rails_helper'

# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


RSpec.describe Product, type: :model do
  it "is valid with valid attributes" do
    product = FactoryBot.build(:product)
    expect(product).to be_valid
  end

  it "is not valid without a name" do
    product = FactoryBot.build(:product, name: nil)
    expect(product).to_not be_valid
  end

  it "is not valid without a description" do
    product = FactoryBot.build(:product, description: nil)
    expect(product).to_not be_valid
  end

  it "is not valid without a price" do
    product = FactoryBot.build(:product, price: nil)
    expect(product).to_not be_valid
  end
end


bundle exec rspec




# gem 'will_paginate-bootstrap'
# app/assets/stylesheets/application.css 
# @import 'will_paginate';
#index file 
<div class="pagination">
  <%= will_paginate @products %>
</div>
