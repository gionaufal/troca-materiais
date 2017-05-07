require 'rails_helper'

feature 'User edits materials' do
  scenario 'should see link to edit' do
    user = create(:user)

    create(:material, user: user)
    create(:material, product: 'Areia', volume: 50.0, user: user)

    visit user_path(user)

    expect(page).to have_link('Editar', count: 2)
  end

  scenario 'successfully edits material' do
    user = create(:user)

    login_as user

    material1 = create(:material, user: user)
    material2 = create(:material, product: 'Areia', volume: 50.0, user: user)

    visit user_path(user)
    find(:xpath, "(//a[text()='Editar'])[2]").click

    fill_in 'Quantidade', with: '100'
    click_on 'Atualizar'

    expect(page).to     have_content material1.product
    expect(page).to     have_content material2.product
    expect(page).to     have_content 'Quantidade: 100 kg'
    expect(page).not_to have_content '50'
  end
end
