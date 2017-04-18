require 'rails_helper'

feature 'User logs in' do
  scenario 'successfully' do
    visit root_path

    within('.right') do
      click_on 'Entrar'
    end

    user = create(:user)

    fill_in 'Email',   with: user.email
    fill_in 'Senha',   with: user.password

    click_on 'Log in'

    expect(current_path).to eq(root_path)
    expect(page).to have_content 'Login efetuado com sucesso'
  end

  scenario 'must fill all fields' do

    visit root_path

    within('.right') do
      click_on 'Entrar'
    end

    user = create(:user)

    fill_in 'Email',   with: user.email

    click_on 'Log in'

    expect(page).to have_content 'Email ou senha inválidos'
  end
end
