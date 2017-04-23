require 'rails_helper'

feature 'User views other users' do
  scenario 'via url' do
    user = create(:user, email: 'test@test.com')
    user2 = create(:user, email: 'email2@test.com')

    login_as(user)

    visit user2

    expect(page).to have_content 'Materiais que deseja trocar'
    expect(page).to have_content 'Materiais que deseja receber'
  end

  scenario 'via search' do
  end

  scenario 'via proximity' do
  end

  scenario 'with corresponding interests' do
  end
end
