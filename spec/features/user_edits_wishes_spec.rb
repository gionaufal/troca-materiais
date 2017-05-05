require 'rails_helper'

feature 'User edits wishes' do
  scenario 'should see link to edit' do
    user = create(:user)

    create(:wish, user: user)
    create(:wish, product: 'Areia', volume: 50.0, user: user)

    visit user_path(user)

    expect(page).to have_link('Editar', count: 2)
  end

  scenario 'successfully edits wish' do
    user = create(:user)

    wish1 = create(:wish, user: user)
    wish2 = create(:wish, product: 'Areia', volume: 50.0, user: user)

    visit user_path(user)
    find(:xpath, "(//a[text()='Editar'])[1]").click

    fill_in 'Volume', with: '100.0'
    click_on 'Atualizar'

    expect(page).to     have_content wish1.product
    expect(page).to     have_content wish2.product
    expect(page).to     have_content 'Volume: 100.0 kg'
    expect(page).not_to have_content '50.0'
  end
end
