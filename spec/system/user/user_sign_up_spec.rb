require 'rails_helper'

describe 'User sign up' do
  context 'authentication' do
    it 'create new account' do
      visit root_path
      click_on 'Entrar'
      find(:css, '#register_user').click
      fill_in 'Nome', with: 'João'
      fill_in 'E-mail', with: 'joao@email.com'
      fill_in 'Senha', with: '123456'
      fill_in 'Confirme sua senha', with: '123456'
      click_on 'Cadastrar'
      page.save_page
      expect(page).to have_content 'Você realizou seu registro com sucesso'
    end

    it 'fields are mandatory' do
      User.create!(name: 'Erika', email: 'erika@email.com', password: '123456')

      visit root_path
      click_on 'Entrar'
      find(:css, '#register_user').click
      fill_in 'Nome', with: ''
      fill_in 'E-mail', with: ''
      fill_in 'Senha', with: ''
      fill_in 'Confirme sua senha', with: ''
      click_on 'Cadastrar'

      expect(page).to have_content 'Não foi possível salvar usuário'
      expect(page).to have_content 'Nome não pode ficar em branco'
      expect(page).to have_content 'E-mail não pode ficar em branco'
      expect(page).to have_content 'Senha não pode ficar em branco'
    end
  end
end