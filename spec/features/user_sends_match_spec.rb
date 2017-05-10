require 'rails_helper'

feature 'User sends match message' do
  scenario 'successfully' do
    user1 = create(:user, name: 'Nome1', email: 'email1@test.com')
    user2 = create(:user, name: 'Nome2', email: 'email2@test.com')

    wish1 = create(:wish, product: 'Pregos', user: user1)
    create(:material, product: 'Pregos', user: user2)

    wish2 = create(:wish, product: 'Tinta preta', user: user2)
    material2 = create(:material, product: 'Tinta preta', user: user1)

    material3 = create(:material, product: 'Ferragens', user: user1)

    login_as user1

    visit user_path user1

    click_on 'Enviar proposta de troca'

    select wish1.product, from: 'Quero trocar'
    select material2.product, from: 'Quero receber'

    click_on 'Enviar'


  end
end
