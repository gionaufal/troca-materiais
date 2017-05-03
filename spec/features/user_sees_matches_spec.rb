require 'rails_helper'

feature 'User sees corresponding matches' do
  scenario 'in their own profile page' do
    user1 = create(:user, name: 'Nome1', email: 'email1@test.com')
    user2 = create(:user, name: 'Nome2', email: 'email2@test.com')
    user3 = create(:user, name: 'Nome3', email: 'email3@test.com')
    user4 = create(:user, name: 'Nome4', email: 'email4@test.com')
    create(:user, name: 'Nome5', email: 'email5@test.com')

    wish1 = create(:wish, product: 'Pregos', user: user1)
    create(:material, product: 'Pregos', user: user2)

    wish2 = create(:wish, product: 'Tinta preta', user: user1)
    create(:material, product: 'Tinta preta', user: user3)

    wish3 = create(:wish, product: 'Ripas de madeira', user: user1)

    create(:material, product: 'Ferragens', user: user4)

    login_as(user1)

    visit user_path(user1)
    expect(page).to have_content 'Correspondências'
    within('.matches') do
      expect(page).to     have_content(wish1.product)
      expect(page).to     have_content(wish2.product)
      expect(page).not_to have_content(wish3.product)
    end
  end
end
