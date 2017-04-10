require 'rails_helper'

feature 'User views all registered products' do
  scenario 'through the home page' do
    visit root_path
    material1 = create(:material, product: 'Pregos')
    material2 = create(:material, product: 'Ripas de madeira', volume: '10 kg')

    click_on 'Meus produtos'

    expect(page).to have_content material1.product
    expect(page).to have_content material1.volume
    expect(page).to have_content material1.wish
    expect(page).to have_content material2.product
    expect(page).to have_content material2.volume
    expect(page).to have_content material2.wish
  end
end
