require 'rails_helper'

feature 'User views other users' do
  scenario 'via url' do
    user = create(:user, email: 'test@test.com')
    user2 = create(:user, email: 'email2@test.com')

    login_as(user)

    visit user_path(user2)

    expect(page).to have_content 'Materiais que deseja trocar'
    expect(page).to have_content 'Materiais que deseja receber'
  end

  scenario 'and sees user\'s materials' do
    user = create(:user, email: 'test@test.com')
    user2 = create(:user, email: 'email2@test.com')
    wish = create(:wish, user: user2)
    material = create(:material, user: user2)

    login_as(user)

    visit user_path(user2)

    expect(page).to have_content wish.product
    expect(page).to have_content material.product
  end

  scenario 'via search' do
   skip
  end

  scenario 'via proximity' do
   skip
  end

  scenario 'with corresponding interests' do
   skip
  end
end
