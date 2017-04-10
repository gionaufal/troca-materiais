require 'rails_helper'

feature 'User registers wishes' do
  scenario 'successfully' do
    visit root_path

    click_on 'Cadastrar materiais que desejo receber'

    fill_in 'Produto', with: 'Areia'
    fill_in 'Quantidade', with: '100 kg'
    select 5, from: 'Desejo de receber'

    click_on 'Cadastrar desejo'

    expect(page).to have_content 'Areia'
    expect(page).to have_content '100.0 kg'
    expect(page).to have_content 'Desejo de receber: 5'
  end

  scenario 'must fill all fields' do
    visit root_path

    click_on 'Cadastrar materiais que desejo receber'

    click_on 'Cadastrar desejo'

    expect(page).to have_content 'Todos os campos são obrigatórios'
  end
end
