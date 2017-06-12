require 'rails_helper'

feature 'User edits wishes' do
  scenario 'should see link to edit' do
    user = create(:user)

    login_as user

    create(:wish, user: user)
    create(:wish, product: 'Areia', volume: 50, user: user)

    visit user_path(user)

    expect(page).to have_link('Editar', count: 2)
  end

  scenario 'successfully edits wish' do
    user = create(:user)

    login_as user

    wish1 = create(:wish, user: user)
    wish2 = create(:wish, product: 'Areia', volume: 50.0, user: user)

    visit user_path(user)
    find(:xpath, "(//a[text()='Editar'])[2]").click

    fill_in 'Quantidade', with: '100'
    click_on 'Atualizar'

    expect(page).to     have_content wish1.product
    expect(page).to     have_content wish2.product
    expect(page).to     have_content 'Quantidade: 100 kg'
    expect(page).not_to have_content '50'
  end
end
