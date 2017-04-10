require 'rails_helper'

feature 'User views all registered wishes' do
  scenario 'through home page' do
    visit root_path
    wish1 = create(:wish)
    wish2 = create(:wish, product: 'Areia', volume: 50.0)

    click_on 'Meus desejos'

    expect(page).to have_content wish1.product
    expect(page).to have_content wish1.volume
    expect(page).to have_content wish1.wish
    expect(page).to have_content wish2.product
    expect(page).to have_content wish2.volume
    expect(page).to have_content wish2.wish
  end
end
