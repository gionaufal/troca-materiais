require 'rails_helper'

feature 'User can select materials' do
  scenario 'successfully' do
    visit root_path

    user = create(:user)
    login_as(user)

    click_on 'Cadastrar materiais que tenho e quero trocar'

    fill_in 'Produto', with: 'Pregos'
    fill_in 'Quantidade', with: '10'
    select 5, from: 'Desejo de trocar'

    click_on 'Cadastrar'

    expect(page).to have_content 'Pregos'
    expect(page).to have_content 'Quantidade: 10 kg'
    expect(page).to have_content 'Desejo de trocar: 5'
  end

  scenario 'and must fill all fields' do
    visit root_path

    click_on 'Cadastrar materiais que tenho e quero trocar'

    fill_in 'Produto', with: 'Pregos'

    click_on 'Cadastrar'

    expect(page).to have_content 'Todos os campos são obrigatórios'
  end
end
