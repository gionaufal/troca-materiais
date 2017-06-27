require 'rails_helper'

feature 'User accepts matches' do
  scenario 'clicking on the notification' do
    user1 = create(:user)
    user2 = create(:user)

    wish1 = create(:wish, product: 'Pregos', user: user1)
    create(:material, product: 'Pregos', user: user2)

    wish2 = create(:wish, product: 'Tinta preta', user: user2)
    create(:material, product: 'Tinta preta', user: user1)

    login_as(user1)

    visit user_path(user1)

    within '.wishes' do
      click_on user2.name
    end

    within '.my_wishes' do
      click_on 'Propor troca'
    end

    select wish1.product, from: 'Material que deseja receber'
    select wish2.product, from: 'Material que deseja trocar'

    click_on 'Enviar proposta'

    logout

    login_as user2

    visit root_path

    click_on 'Notificações: 1'

    click_on 'Nova proposta de'
    expect(page).to have_link 'Aceitar proposta'
    expect(page).to have_link 'Recusar proposta'
  end
end
