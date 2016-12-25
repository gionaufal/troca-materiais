require 'rails_helper'

feature 'User access home page' do
  scenario 'successfully' do
    visit root_path
    expect(page).to have_content 'Bem vindo à Troca Materiais'
  end
end
