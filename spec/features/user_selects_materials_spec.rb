require 'rails_helper'

feature 'User can select materials' do
  scenario 'successfully' do
    visit root_path

    click_on 'Cadastrar materiais'

    select 'Pregos', from: 'Material'
    fill_in 'Quantidade', with: 1000
    select 5, from: 'Desejo de trocar'
  end
end
