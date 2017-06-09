FactoryGirl.define do
  factory :user do
    email { Faker::Internet::email }
    password { Faker::Internet::password }
    name { Faker::StarWars.character }
    city 'Sao Paulo'
    uf 'SP'
    address 'Av Paulista, 1512'
    zipcode '01310-200'
  end
end
