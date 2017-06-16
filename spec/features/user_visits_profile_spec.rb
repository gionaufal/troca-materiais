require 'rails_helper'

feature 'User visits profile' do
  scenario 'via home' do
    user = create(:user)

    wish = create(:wish, user: user)
    material = create(:material, user: user)

    login_as(user)

    visit root_path

    within 'ul.right' do
      click_on 'Meu perfil'
    end

    expect(page).to have_content 'Meus desejos'
    expect(page).to have_content wish.product
    expect(page).to have_content 'Meus materiais'
    expect(page).to have_content material.product
  end
end
