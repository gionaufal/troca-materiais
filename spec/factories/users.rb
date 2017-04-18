FactoryGirl.define do
  factory :user do
    email 'gio@gio.com'
    password 'senha123'
    name 'Giovanni Naufal'
    city 'Sao Paulo'
    uf 'SP'
    address 'Av Paulista, 1512'
    zipcode '01310-200'
  end
end
