require 'rails_helper'

feature 'User can sign up' do
  scenario 'successfully' do
    visit root_path

    within('.right') do
      click_on 'Criar conta'
    end

    user = build(:user)

    fill_in 'Nome',                  with: user.name
    fill_in 'Endereço',              with: user.address
    fill_in 'Cidade',                with: user.city
    fill_in 'Estado',                with: user.uf
    fill_in 'CEP',                   with: user.zipcode
    fill_in 'Email',                 with: user.email
    fill_in 'Senha',                 with: user.password
    fill_in 'Confirme sua senha',    with: user.password

    click_on 'Cadastrar'

    binding.pry
    expect(current_path).to eq(root_path)
    expect(page)
      .to have_content 'Bem vindo! Você realizou seu registro com sucesso'
  end

  scenario 'must fill all fields' do
    visit root_path

    within('.right') do
      click_on 'Criar conta'
    end

    user = build(:user)

    fill_in 'Email',                 with: user.email
    fill_in 'Senha',                 with: user.password
    fill_in 'Confirme sua senha',    with: user.password

    click_on 'Cadastrar'

    expect(page).to have_content 'não pode ficar em branco'
  end

end
